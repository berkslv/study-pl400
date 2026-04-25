# Exercise - Write your first plug-in

**Scenario:** Ensure phone numbers are stored in a consistent format. Create a plug-in that strips non-numeric characters on create/update, and another that reformats the phone number on retrieve/retrievemultiple.

## Exercise 1: Create/update plug-in

Strips all non-numeric characters from a phone number before saving to Dataverse.

### Task 1: Create a plug-in

1. Start Visual Studio 2022.
2. **File > New > Project** — select **Class Library (.NET Framework)**, then **Next**.
3. Enter **D365PackageProject** for Project Name, select **.NET Framework 4.6.2**, then **Create**.
4. Right-click the project > **Manage NuGet Packages**.
5. **Browse** tab — search for **microsoft.crmsdk.coreassemblies** and **Install**.
6. Accept license terms, close NuGet manager.
7. Delete **Class1.cs**.
8. Right-click project > **Add > Class** — name it **PreOperationFormatPhoneCreateUpdate**, then **Add**.
9. Add using statements:

```csharp
using Microsoft.Xrm.Sdk;
using System.Text.RegularExpressions;
```

10. Make the class `public` and implement `IPlugin`.
11. Implement the interface member (add `Execute` method stub).

### Task 2: Format a phone number

Replace the exception in `Execute` with:

```csharp
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

**Sign the assembly:**
1. Right-click project > **Properties** > **Signing** tab.
2. Check **Sign the assembly** > **New Key File**.
3. Enter **contoso.snk**, uncheck password protection, select **OK**.
4. Build the project — confirm build succeeds.

### Task 3: Register a plug-in and steps

1. Start the **Plug-in Registration Tool**.
2. **Create New Connection** > **Office 365** > Show Advanced > provide credentials > **Login**.
3. **Register > Register New Assembly** > **Browse** to `Bin\Debug\D365PackageProject.dll` > **Open**.
4. **Register Selected Plugins** > **OK**.
5. Expand the assembly, right-click the plug-in > **Register New Step**.
6. Message: **Create**, Primary Entity: **contact**, Stage: **PreOperation** > **Register New Step** > **Close**.
7. Right-click plug-in > **Register New Step** again.
8. Message: **Update**, Primary Entity: **contact**, Attributes: **Business Phone** only, Stage: **PreOperation** > **Register New Step**.

### Task 4: Test the plug-in

1. Go to Maker Portal — confirm correct environment.
2. Open **Fundraiser** app > **Dashboard** > open a contact.
3. Select **+ New** — enter First Name: **Test**, Last Name: **Contact**, Business Phone: **(123)-555-0100** > **Save**.
   - Business Phone should show only numeric values.
4. Change Business Phone to **001-123-555-0100** and wait.
   - Business Phone should again show only numeric values.

---

## Exercise 2: Create/Retrieve multiple plug-ins

Adds parentheses and dashes to phone numbers on retrieve.

### Task 1: Create a plug-in

1. Open the project from Exercise 1.
2. Right-click project > **Add > Class** — name it **PostOperationFormatPhoneOnRetrieveMultiple**, then **Add**.
3. Add using statement: `using Microsoft.Xrm.Sdk;`
4. Make the class `public`, implement `IPlugin`, and implement the interface member.

### Task 2: Format phone number for retrieve

```csharp
IPluginExecutionContext context =
    (IPluginExecutionContext)serviceProvider.GetService(typeof(IPluginExecutionContext));

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
else if (context.MessageName.Equals("RetrieveMultiple"))
{
    // see Task 3
}
```

### Task 3: Format phone number for retrieve multiple

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

Rebuild the project — confirm build succeeds.

### Task 4: Update plug-in assembly and register steps

1. Start Plug-in Registration Tool > **Create New Connection** > Login.
2. Select the assembly from Exercise 1 > **Update** > **Browse** to `D365PackageProject.dll` > **Open**.
3. Select all plug-ins > **Update Selected Plugins** > **OK**.
4. Right-click new plug-in > **Register New Step**:
   - Message: **Retrieve**, Primary Entity: **contact**, Stage: **PostOperation**, Mode: **Synchronous** > **Register New Step**.
5. Right-click plug-in > **Register New Step** again:
   - Message: **RetrieveMultiple**, Primary Entity: **contact**, Stage: **PostOperation**, Mode: **Synchronous** > **Register New Step**.

### Task 5: Test the plug-in

1. Go to Maker Portal > **Apps** > **Fundraiser** > **Edit**.
2. Add a **+ New page** > **Dataverse table** > **Existing table** > select **Contact** > **Add**.
3. Select **Play** > **Save and continue** > **Play** again.
4. Navigate to **Contacts** > **+ New** — create a contact with a 10-digit phone number > **Save**.
   - Phone number should display in `(###) ###-####` format.
5. Edit an existing contact's Business Phone > **Save** — new format should be applied.
