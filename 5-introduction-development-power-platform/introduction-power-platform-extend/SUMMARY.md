# Summary: Extending Microsoft Power Platform with Code

> **Source files:** 01-introduction.md, 02-extensibility.md, 03-service-extensibility.md, 04-exercise.md, 05-configure-code.md

---

## Extensibility Philosophy

- Power Platform extensibility points allow custom code where low-code approaches are insufficient.
- Writing code should be considered an **exception** — prefer configuration and no-code/low-code first.
- Avoid rebuilding capabilities the platform already provides (e.g., multi-currency pricing in Dynamics 365 Sales, column-level security in Dataverse).
- Extensibility points are deliberately implemented at various levels: UI, business logic, and service/data layers.

---

## User Experience Extensibility

### Power Apps Component Framework (PCF)

- Code components are implemented using **HTML**, **CSS**, and **TypeScript**; React is a popular (not required) UI framework.
- Components can be used in both **canvas apps** and **model-driven apps** like any out-of-the-box control.
- Created using the **Power Platform CLI** (`pac`), initialized from a `column` or `dataset` template.
- A **manifest file** describes component resources and exposes **properties** that app makers can statically set or bind to data columns.
- Features are enabled in the manifest; enabling a feature allows the component to invoke its native API:

```xml
<feature-usage>
  <uses-feature name="Device.captureAudio" required="true" />
  <uses-feature name="Device.captureImage" required="true" />
  <uses-feature name="Device.captureVideo" required="true" />
  <uses-feature name="Device.getBarcodeValue" required="true" />
  <uses-feature name="Device.getCurrentPosition" required="true" />
  <uses-feature name="Device.pickFile" required="true" />
  <uses-feature name="Utility" required="true" />
  <uses-feature name="WebAPI" required="true" />
</feature-usage>
```

- Components implement the `StandardControl` interface:

```typescript
export class FirstControl implements ComponentFramework.StandardControl<IInputs, IOutputs> {}
```

- Required `StandardControl` interface methods:
  - **init** — Initialize component instance; kick off remote calls and other setup.
  - **updateView** — Called when any value in the property bag changes (column values, datasets, container size, offline status, metadata, etc.).
  - **destroy** — Cleanup when component is removed from the DOM; release memory.
  - **getOutputs** *(optional)* — Called before new data is received; returns objects for bound properties.

- PCF controls **replace** HTML web resources; PCF components are reusable and extensible unlike monolithic HTML web resources.

### Client Scripting

- Uses **JavaScript** in **model-driven apps only** to implement business rules programmatically.
- Use as an alternative when declarative business rules cannot meet requirements.
- Triggered by form events:
  - Form load
  - Column value change
  - Form save
  - Command bar button press
- Direct DOM manipulation is **not allowed**; use the provided **object model** (Xrm API) to interact with form components — this insulates logic from layout or HTML changes.
- Example handling form load and column change:

```javascript
var Sdk = window.Sdk || {};
(function () {
    var myUniqueId = "_myUniqueId";
    var currentUserName = Xrm.Utility.getGlobalContext().userSettings.userName;
    var message = currentUserName + ": Your JavaScript code in action!";

    this.formOnLoad = function (executionContext) {
        var formContext = executionContext.getFormContext();
        formContext.ui.setFormNotification(message, "INFO", myUniqueId);
        window.setTimeout(function () { formContext.ui.clearFormNotification(myUniqueId); }, 5000);
    }

    this.attributeOnChange = function (executionContext) {
        var formContext = executionContext.getFormContext();
        var accountName = formContext.getAttribute("name").getValue();
        if (accountName.toLowerCase().search("contoso") != -1) {
            formContext.getAttribute("websiteurl").setValue("https://www.contoso.com");
            formContext.getAttribute("telephone1").setValue("425-555-0100");
            formContext.getAttribute("description").setValue("Website URL, Phone and Description set using custom script.");
        }
    }

    this.formOnSave = function () {
        Xrm.Navigation.openAlertDialog({ text: "Record saved." });
    }
}).call(Sdk);
```

---

## Dataverse Extensibility

### Architecture

- Dataverse uses a **message-driven architecture** — all data access (API or app) is processed as a message through the **event pipeline**.
- No mechanism exists to modify Dataverse data directly and bypass system or registered custom logic.

### Dataverse APIs

| API | Description |
|---|---|
| **Web API** | OData v4 RESTful endpoint; use with any language supporting HTTP + OAuth 2.0. |
| **Organization Service** | .NET SDK with typed class generators; `IOrganizationService` interface. |

- Inside a plugin, the Organization Service is available **without authentication**:

```csharp
public void Execute(IServiceProvider serviceProvider)
{
    IPluginExecutionContext pluginContext = serviceProvider.Get<IPluginExecutionContext>();
    IOrganizationServiceFactory factory = serviceProvider.Get<IOrganizationServiceFactory>();
    IOrganizationService orgService = serviceProvider.GetOrganizationService(pluginContext.UserId);

    Entity newAccount = new Entity("account");                  
    newAccount["name"] = "Fourth Coffee";
    Guid accountid = orgService.Create(newAccount);
}
```

- Outside plugins (ASP.NET portal, Azure Function, console app), use `ServiceClient`:

```csharp
ServiceClient serviceClient =
    new ServiceClient("Url=https://yourenv.crm.dynamics.com;AuthType=OAuth;AppId=;RedirectUri=http://localhost;LoginPrompt=Always");

Entity newAccount = new Entity("account");                  
newAccount["name"] = "Fourth Coffee";
Guid accountid = serviceClient.Create(newAccount);
```

- `ServiceClient` supports .NET 4.6.2, 4.7.2, 4.8, .NET Core 3.0, 3.1, 5.0, 6.0.
- Both APIs support **FetchXML** — a proprietary query language for complex queries across related tables.

### Event Pipeline Stages

1. Pre-Validation
2. Pre-Operation
3. Main Operation *(only custom API plugins can register here)*
4. Post-Operation

- Each stage except Main Operation can have a plugin attached for custom logic.

### Plugins

- Plugins are **.NET classes** implementing the `IPlugin` interface from the Dataverse SDK.
- Only one method required — `Execute`:

```csharp
public sealed class MyFirstPlugin : IPlugin
{
    public void Execute(IServiceProvider serviceProvider)
    {
        //Business Logic 
    }
}
```

- Services available from `IServiceProvider`:
  - **IPluginExecutionContext** — Message being processed and requestor info.
  - **ITracingService** — Write to Tracelog for diagnostics.
  - **IOrganizationServiceFactory** — Retrieve `OrganizationService` to access data.

- Retrieve execution context:

```csharp
IPluginExecutionContext context = (IPluginExecutionContext)
    serviceProvider.GetService(typeof(IPluginExecutionContext));
```

- Use `context.InputParameters` to read the originating message; `context.OutputParameters` to write return values.
- Plugins must be **registered** to a specific message using the **Plugin Registration Tool**.

### Custom APIs

- Provide a **code-first** way to define new Dataverse messages extending web services.
- Custom messages can be invoked like system messages but execute custom business logic.
- Enables centralizing logic (e.g., a `findcustomer` API avoids duplicate logic in each caller).
- Steps to define a Custom API:
  1. Create a custom API record (via maker portal, code, or Dataverse solutions).
  2. Define the unique name, request parameters, and response parameters.
  3. Create a plugin and register it on the **Main Operation** stage.

> Custom API plugin registration is the **only** scenario where a plugin runs on the Main Operation stage.

- Invoke a Custom API via the Organization Service:

```csharp
var req = new OrganizationRequest("fabrikam_findcustomer")
{
    ["CustomerName"] = "Contoso",
    ["CustomerAddress"] = "1 Redmond Way"
};

var resp = serviceClient.Execute(req);
```

- Custom APIs can also trigger automation in Power Automate, Azure integrations, or asynchronous plugins.

---

## Exercise: Create a Custom API (End-to-End)

### Task 1: Create the Plugin Project

1. Install [Power Platform CLI](https://aka.ms/PowerAppsCLI/).
2. Create a folder and initialize a plugin class library:

```
md CustomAPILab
cd CustomAPILab
pac plugin init
```

3. Open the project: `start CustomAPILab.csproj`
4. Rename `Plugin1.cs` → `MatchPlugin.cs`.
5. Install NuGet package: `System.Text.RegularExpressions`.
6. Add using statement:

```csharp
using System.Text.RegularExpressions;
```

7. Read input parameters inside `ExecuteDataversePlugin`:

```csharp
string input = (string)context.InputParameters["StringIn"];
string pattern = (string)context.InputParameters["Pattern"];
```

8. Get tracing service and log input:

```csharp
ITracingService tracingService = (ITracingService)localPluginContext.ServiceProvider.GetService(typeof(ITracingService));
tracingService.Trace("Provided input: " + input);
```

9. Execute regex and set output parameter:

```csharp
var result = Regex.Match(input, pattern);
tracingService.Trace("Matching result: " + result.Success);
context.OutputParameters["Matched"] = result.Success;
```

10. Build the solution (**Build > Build Solution**).

### Task 2: Register the Plugin

1. Launch Plugin Registration Tool: `pac tool prt`
2. Create a new connection using Office 365 credentials.
3. **Register | Register New Assembly** → browse to `CustomAPILab\bin\Debug\net462\CustomAPILab.dll`.
4. Select **Register Selected Plugins**.

### Task 3: Create the Custom API in the Maker Portal

1. Navigate to [Power Apps maker portal](https://make.powerapps.com/).
2. Create a new solution: **+ New Solution** → "Custom API Lab", Publisher: CDS Default Publisher.
3. Add **Custom API**: Unique Name `contoso_match`, Binding Type `Global`, Plugin Type = registered plugin.
4. Add **Custom API Request Parameter** `StringIn` (Type: String).
5. Add **Custom API Request Parameter** `Pattern` (Type: String).
6. Add **Custom API Response Property** `Matched` (Type: Boolean).

### Task 4: Use Custom API from Power Automate

1. In the solution, create an **Instant Cloud Flow** named "String match" triggered by **Manually trigger a flow**.
2. Add step: **Perform an unbound action** → Action Name: `contoso_match`.
3. Set `StringIn` to an email address; set `Pattern` to email regex:

```
^\w+@[a-zA-Z_]+?\.[a-zA-Z]{2,3}$
```

4. Save, test manually, and inspect the **Perform an unbound action** output for results.

---

## When to Configure vs. When to Code

### Business Rules vs. Client Script

- **Business rules**: Easy for non-developers, deployable via solutions — prefer these first.
- **Client script** preferred when:
  - Complex nested logic better expressed with `switch` or `if` blocks.
  - Dynamic values not accessible via business rules (e.g., form notifications, filtering choice values).

### Workflows / Power Automate Flows vs. Plugins

| Capability | Power Automate Flow | Workflow | Plugin |
|---|---|---|---|
| Synchronous or Asynchronous | Asynchronous | Either | Either |
| Access External Data | Yes (connectors) | No | Yes (APIs, some security restrictions) |
| Maintenance | Makers | Business Users | Developers |
| Can Run As | Current user or flow owner | Current user or workflow owner | Any licensed user, system, or current user |
| Can Run On Demand | Yes | Yes | No |
| Can Nest Child Processes | Yes | Yes | Yes |
| Execution Stage | After | Before/After | Before/After |
| Triggers | Create, Column Change, Delete, On Demand, Scheduled | Create, Column Change, Delete, On Demand | Create, Column Change, Delete, other messages including custom |

### Power Pages (Portals) vs. Custom Sites

- **Power Pages**: Out-of-the-box portal functionality; developers assist with complex layouts (Liquid templating) or JavaScript extensions.
- **Custom portal** (ASP.NET): Required only for highly specialized scenarios; needs skilled developers; higher cost.

### Decision Factors

- Skills and resources available.
- Organizational maturity in application lifecycle management.
- Complexity of requirements.
- Small compromises in business constraints can reduce a complex development project to a simple configuration.

---

## References

- [Power Apps Community Plan](https://powerapps.microsoft.com/communityplan/)
- [Power Platform CLI download](https://aka.ms/PowerAppsCLI/)
- [Power Apps maker portal](https://make.powerapps.com/)
- [React (UI framework)](https://reactjs.org/)
