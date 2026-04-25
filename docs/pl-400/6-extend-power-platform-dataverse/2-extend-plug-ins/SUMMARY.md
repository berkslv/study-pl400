# Summary: Extending Dataverse with Plug-ins

> **Source files:** 1-introduction.md, 2-usage.md, 3-execution.md, 4-exercise.md

---

## What is a Plug-in

- A plug-in is imperative logic used only when declarative processes (business rules, flows, workflows) cannot meet requirements
- Implemented as a .NET assembly implementing the `IPlugin` interface from `Microsoft.CrmSdk.CoreAssemblies` NuGet package
- `IPlugin` exposes a single method `Execute` where custom logic is placed based on the event being handled
- Writing code is a last-resort method; quality areas (maintainability, upgradability, stability, performance) should factor into the approach decision

### Common Scenarios

- Canceling an event and displaying an error to the user
- Making changes to data in the operation
- Initiating other actions via the Organization Service to add automation

### Alternatives (prefer these first)

- Workflows
- Power Automate flows
- Calculated and rollup fields
- Custom actions
- Client scripting

### Key Considerations

- A well-written plug-in is the most efficient way to apply business logic to Dataverse; a poorly written one can significantly hurt performance
- Plug-ins can work with external services; Power Automate is approaching parity for such capabilities
- If synchronous logic is required, plug-ins may be needed — but on-demand workflows can also run synchronously

---

## Decision Matrix: Workflows vs. Plug-ins vs. Client Script

| Circumstance | Workflow | Plug-in | Client Script |
|---|---|---|---|
| Synchronous | Either | Either | Synchronous |
| Access External Data | No | Yes | Yes (with limitations) |
| Maintenance | Business Users | Developers | Developers |
| Can Run As | User | Any licensed user or current user | User |
| Can Run On Demand | Yes | No | No |
| Can Nest Child Processes | Yes | Yes | No |
| Execution Stage | Before/After | Before/After | Before/After |
| Triggers | Create, Field Change, Status Change, Assign to Owner, On Demand | Create, Field Change, Status Change, Assign to Owner, Delete, + many specialized triggers | Field Change or Form Load |

---

## Plug-in Execution Context

- Dataverse provides context data whenever a plug-in or custom workflow extension runs via `IWorkflowContext`
- Both `IPluginExecutionContext` and `IWorkflowContext` implement `IExecutionContext`

### Accessing IPluginExecutionContext

In plug-ins, accessed through `IServiceProvider`:

```csharp
public class SamplePlugin : IPlugin
{
    public void Execute(IServiceProvider serviceProvider)
    {
        IPluginExecutionContext context = (IPluginExecutionContext)
            serviceProvider.GetService(typeof(IPluginExecutionContext));
    }
}
```

In custom workflow extensions, accessed via `CodeActivityContext`:

```csharp
public class SampleWorkflowExtension : CodeActivity
{
    protected override void Execute(CodeActivityContext context)
    {
        IWorkflowContext workflowContext = context.GetExtension<IWorkflowContext>();
    }
}
```

### InputParameters

- Type: `Entity`; shows entity values presented to the plug-in **prior** to the operation

**Use case — validate and cancel:**
1. Register plug-in on Pre-Validation stage on Create/Update
2. Read values from `InputParameters` (retrieve `Target` on Create)
3. Throw `InvalidPluginExecutionException` if validation fails

**Use case — modify before save:**
1. Register plug-in on Pre-Operation stage on Create/Update
2. Edit values in `InputParameters` (retrieve `Target` on Create)

### OutputParameters

- Type: `Entity`; only available in the **PostOperation** stage (after the operation)

**Use case — modify returned values:**
1. Register plug-in on PostOperation stage on Create/Update
2. Edit values in `OutputParameters` (retrieve `Target` on Create)

### PreEntityImages and PostEntityImages

- Immutable snapshots of data before/after the operation
- Ideal for logging or custom auditing
- More efficient than using a `Retrieve` request inside a plug-in

### SharedVariables

- Pass data from a plug-in to a later step in the pipeline
- Useful for preventing infinite-recursion (runaway) plug-ins

**Pattern — limit run count to 5:**
1. Check if `RunCount` shared variable exists; if not, initialize to 0
2. If `RunCount > 5`, throw `InvalidPluginExecutionException`
3. Increment `RunCount` by 1 at end of plug-in

> **Note:** This is an extra safeguard. Build plug-ins to avoid recursion in the first place. Dataverse also provides its own safeguards, but they are more resource-intensive.

---

## Exercise: Writing Plug-ins (Phone Number Formatting)

**Scenario:** Ensure phone numbers are stored in a consistent format.

### Exercise 1: PreOperation Plug-in (Create/Update — Strip Non-Numeric Characters)

**Setup:**
1. Create a **Class Library (.NET Framework)** project named `D365PackageProject` targeting **.NET Framework 4.6.2**
2. Install NuGet package: `microsoft.crmsdk.coreassemblies`
3. Create class `PreOperationFormatPhoneCreateUpdate` implementing `IPlugin`

**Core logic in `Execute`:**

```csharp
using Microsoft.Xrm.Sdk;
using System.Text.RegularExpressions;

IPluginExecutionContext context =
    (IPluginExecutionContext)serviceProvider.GetService(typeof(IPluginExecutionContext));

if (!context.InputParameters.ContainsKey("Target"))
    throw new InvalidPluginExecutionException("No target found");

var entity = context.InputParameters["Target"] as Entity;

if (!entity.Attributes.Contains("telephone1"))
    return;

string phoneNumber = (string)entity["telephone1"];
var formattedNumber = Regex.Replace(phoneNumber, @"[^\d]", "");

entity["telephone1"] = formattedNumber;
```

**Assembly signing:**
1. Project Properties > Signing tab > Check **Sign the assembly** > New Key File named `contoso.snk`

**Registration steps:**
1. Open Plug-in Registration Tool > Create New Connection > Login
2. Register New Assembly > browse to `Bin\Debug\D365PackageProject.dll`
3. Register New Step: Message=**Create**, Entity=**contact**, Stage=**PreOperation**
4. Register New Step: Message=**Update**, Entity=**contact**, Attributes=**Business Phone only**, Stage=**PreOperation**

---

### Exercise 2: PostOperation Plug-in (Retrieve/RetrieveMultiple — Format for Display)

**Class:** `PostOperationFormatPhoneOnRetrieveMultiple` implementing `IPlugin`

**Logic for Retrieve:**

```csharp
if (context.MessageName.Equals("Retrieve"))
{
    if (!context.OutputParameters.Contains("BusinessEntity") && context.OutputParameters["BusinessEntity"] is Entity)
        throw new InvalidPluginExecutionException("No business entity found");

    var entity = (Entity)context.OutputParameters["BusinessEntity"];

    if (!entity.Attributes.Contains("telephone1"))
        return;

    if (!long.TryParse(entity["telephone1"].ToString(), out long phoneNumber))
        return;

    var formattedNumber = String.Format("{0:(###) ###-####}", phoneNumber);
    entity["telephone1"] = formattedNumber;
}
```

**Logic for RetrieveMultiple:**

```csharp
else if (context.MessageName.Equals("RetrieveMultiple"))
{
    if (!context.OutputParameters.Contains("BusinessEntityCollection") && context.OutputParameters["BusinessEntityCollection"] is EntityCollection)
        throw new InvalidPluginExecutionException("No business entity collection found");

    var entityCollection = (EntityCollection)context.OutputParameters["BusinessEntityCollection"];

    foreach (var entity in entityCollection.Entities)
    {
        if (entity.Attributes.Contains("telephone1") && entity["telephone1"] != null)
        {
            if (long.TryParse(entity["telephone1"].ToString(), out long phoneNumber))
            {
                var formattedNumber = String.Format("{0:(###) ###-####}", phoneNumber);
                entity["telephone1"] = formattedNumber;
            }
        }
    }
}
```

**Registration steps:**
1. Update existing assembly in Plug-in Registration Tool
2. Register New Step: Message=**Retrieve**, Entity=**contact**, Stage=**PostOperation**, Mode=**Synchronous**
3. Register New Step: Message=**RetrieveMultiple**, Entity=**contact**, Stage=**PostOperation**, Mode=**Synchronous**
