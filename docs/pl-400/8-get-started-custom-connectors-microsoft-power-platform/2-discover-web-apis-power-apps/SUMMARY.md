# Summary: Discover Web APIs and Custom Connectors in Power Platform

> **Source files:** 01-introduction.md, 02-what-are-custom-connectors.md, 03-create-custom-connector-visual-studio.md, 04-create-custom-connector-with-api-management.md, 05-what-is-openapi-why-you-should-use-it.md, 06-create-custom-connector-with-openapi.md, 07-test-use-custom-connector.md, 08-test-custom-connector.md, 09-use-custom-connector-power-apps.md

---

## Custom Connectors — Concepts

- Power Apps has 1,000+ prebuilt connectors for Microsoft and non-Microsoft services.
- A **custom connector** is a wrapper around a web API that bridges Power Apps and APIs not covered by prebuilt connectors.
- **Connector** — knows the web API's host and operation details.
- **Connection** — knows the credentials and holds a reference to the connector to facilitate communication.
- A connector does nothing unless a **connection** is also created for it.
- Custom connectors can be created three ways: from Visual Studio (Connected Services), from Azure API Management (export), or from an OpenAPI document.

---

## Creating a Custom Connector from Visual Studio

- Requires Visual Studio 2022 with the ASP.NET and web development workload; sign-in required for dev tunnels.
- Uses the **Power Platform Connected Service** feature in Visual Studio 2022.
- Supports **dev tunnels** — ad-hoc connections between a locally running web API and Power Apps for real-time testing and debugging.
- Dev tunnel types: **Persistent** or **Temporary**; access can be set to **Public**.

### Steps — Add Power Platform as Connected Service

1. Open ASP.NET Core Web API project in Visual Studio.
2. Right-click **Connected Services** node → **Add > Microsoft Power Platform**.
3. Select Power Platform environment, solution, and enter a custom connector name (e.g., `InventoryLocations_Connector`).
4. Create a dev tunnel: name it, set type to **Persistent**, access to **Public**.
5. Select **OK** then **Finish**.

### Steps — Generate and Preview Canvas App via PAC CLI

1. Authenticate to your environment:
   ```powershell
   pac auth create --url https://yourenvironment.crm.dynamics.com
   ```
2. Retrieve the connector ID:
   ```powershell
   pac connector list
   ```
3. Generate a canvas app `.msapp` file from the connector:
   ```powershell
   pac canvas create --connector-id your connector id --msapp your file name.msapp
   ```
4. Open Power Apps, create a blank canvas app, then open the `.msapp` file via **... > Open**.
5. Add the custom connector as a data source and use the **GET** button to validate results.

> **Important:** The web API must remain running while building the Power App when using dev tunnels.

---

## Creating a Custom Connector from Azure API Management

- **Azure API Management** can centrally control, administer, expose, and restrict web APIs via policies.
- Natively supports exporting APIs directly as Power Apps custom connectors.
- Requires an **API subscription key** for Power Apps to access hosted APIs.

### Steps — Export API from API Management

1. In Azure API Management, go to **Subscriptions** → copy **Primary** or **Secondary key**.
2. Go to **APIs** blade, select the target API.
3. Select **...** → **Export** → **Power Apps and Power Automate**.
4. Choose the Power Apps environment, set a display name (e.g., `InventoryManager`), and select **Export**.

### Steps — Create a Connection

1. In Power Apps, go to **Data > Custom Connectors**, select **+** next to the connector.
2. Enter the API key in the **API Key** field and select **Create**.
3. Verify the connection appears under **Connections**.

---

## OpenAPI and Custom Connectors

- **OpenAPI** — a standard, language-agnostic interface description for web APIs; allows humans and computers to discover API capabilities without source code access.
- An OpenAPI document specifies the **contract** (surface area) of a web API, abstracting implementation details.
- Power Apps can create a custom connector directly from an OpenAPI document (`openapi.json`).
- Professional dev teams increasingly embed OpenAPI document generation directly into their web APIs (accessible via URL).

### Azure API Management vs. OpenAPI Document — Comparison

| Factor                | Azure API Management | OpenAPI Document |
|-----------------------|---------------------|-----------------|
| API Control           | Centralized          | Distributed      |
| API Structure Layer   | Complex              | Simple           |
| Extra Security Layer  | Yes                  | No               |
| Usage Control         | Yes                  | No               |
| Extra Cost            | Yes                  | No               |
| Architectural Complexity | Higher            | Lower            |

### Key Benefits of OpenAPI for Custom Connectors

- **Remove dependencies** — citizen developers can create connectors themselves without waiting for API Management configuration.
- **Increase agility** — dev team hands over the OpenAPI document; no further involvement needed to create and use the connector.

### Steps — Create Custom Connector from OpenAPI Document

1. In Power Apps, go to **Data > Custom Connectors** → **+ New custom connector** → **Import an OpenAPI file**.
2. Enter a connector name (e.g., `InventoryManager`), import `openapi.json`, and select **Continue**.
3. Select **Create connector**; confirmation message appears on success.
4. Select **+** next to the connector, enter the API key, and select **Create**.
5. Verify the connection appears under **Connections**.

---

## Testing a Custom Connector

- Power Apps Studio includes a built-in **Test** tab (step 4 in the connector wizard) for validating connectors.
- Testing covers both the **connection** and individual **API operations**.
- Power Apps shows example passing and failing test results.

### Steps — Test the Connector

1. Go to **Custom Connectors**, click the edit (pencil) icon.
2. Navigate to the **4. Test** tab; verify an active connection is shown.
3. Select an operation and click **Test operation**; confirm expected results.
4. If an error occurs, the web API may be down — engage the pro-dev team to investigate.

---

## Using a Custom Connector in a Canvas App

- Custom connectors appear as data sources searchable by name in Power Apps Studio.
- Connector methods map directly to API endpoints and are called as Power Apps functions.
- Results are stored in collections and bound to gallery controls for display.

### Steps — Add Connector and Call API

1. Create a blank canvas app (**Create > Canvas app from blank**).
2. Go to **Data > Add data**, search for the connector name (e.g., `InventoryManager`), and select the connection.
3. Add a **Button** control; set its **OnSelect** property to:
   ```powerappsfl
   ClearCollect(warehouses, InventoryManagement.getapiwarehouselocations())
   ```
4. Add a **Gallery > Vertical** control; bind it to the `warehouses` collection.
5. Hold **Alt** (Windows) or **Option** (Mac) and click the button to execute the API call and populate the gallery.

---

## References

- [Azure API Management](https://learn.microsoft.com/en-us/azure/api-management/api-management-key-concepts)
- [Connected Services in Visual Studio](https://learn.microsoft.com/en-us/visualstudio/azure/overview-connected-services)
- [Custom Connectors overview](https://learn.microsoft.com/en-us/connectors/custom-connectors/)
- [Dev Tunnels in ASP.NET Core](https://learn.microsoft.com/en-us/aspnet/core/test/dev-tunnels)
- [Power Platform Developer Environment](https://learn.microsoft.com/en-us/power-platform/developer/create-developer-environment)
- [Power Platform Tools for VS Code](https://marketplace.visualstudio.com/items?itemName=microsoft-IsvExpTools.powerplatform-vscode)
