# Quiz: Discover Web APIs and Custom Connectors in Power Apps

> **Source material:** 01-introduction.md, 02-what-are-custom-connectors.md, 03-create-custom-connector-visual-studio.md, 04-create-custom-connector-with-api-management.md, 05-what-is-openapi-why-you-should-use-it.md, 06-create-custom-connector-with-openapi.md, 07-test-use-custom-connector.md, 08-test-custom-connector.md, 09-use-custom-connector-power-apps.md, 10-knowledge-check.md, 11-summary.md  
> **Total questions:** 22  
> **Question types:** Multiple choice (single), Multiple choice (multi-select), Fill-in-the-blank

---

## Questions

### Question 1 — Single Choice

Your organization has a proprietary inventory management web API that is not listed in the Power Apps connector gallery. A citizen developer needs to call this API from a canvas app.

What must be created to enable Power Apps to communicate with this custom web API?

- A. A new prebuilt connector from the Microsoft marketplace
- B. A custom connector that wraps the web API
- C. A direct HTTP call using a JavaScript code component
- D. An Azure Logic Apps workflow that proxies requests

<details>
<summary>Answer</summary>

**Correct answer:** B. A custom connector that wraps the web API

**Explanation:** Custom connectors bridge the gap between Power Apps and web APIs that are not available as prebuilt connectors. The custom connector acts as a wrapper around the web API, allowing Power Apps to communicate with it.

</details>

---

### Question 2 — Single Choice

A developer creates a custom connector for Power Apps but receives no data when testing it. After investigation, she realizes she never completed a required step after creating the connector.

What is the missing step?

- A. Publishing the connector to the Microsoft connector gallery
- B. Exporting the connector to Azure API Management
- C. Creating a connection for the custom connector
- D. Regenerating the OpenAPI document

<details>
<summary>Answer</summary>

**Correct answer:** C. Creating a connection for the custom connector

**Explanation:** A custom connector itself does nothing unless a connection is created for it. The connector knows the web API's host and operation details, while the connection holds the credentials and facilitates actual communication with the web API.

</details>

---

### Question 3 — Single Choice

A professional developer at VanArsdel wants to iteratively debug their ASP.NET Core web API in real time while a Power Apps citizen developer tests the canvas app against it — without deploying the API to Azure.

Which feature enables this local-to-Power-Platform connectivity?

- A. Azure API Management gateway
- B. Power Platform CLI connector export
- C. Dev tunnels
- D. OpenAPI document import

<details>
<summary>Answer</summary>

**Correct answer:** C. Dev tunnels

**Explanation:** Dev tunnels create an ad-hoc connection between a web API running locally and Power Apps. They allow developers to test and debug their web API in the context of the Power Platform in real time without a cloud deployment.

</details>

---

### Question 4 — Single Choice

Kiana's team manages multiple web APIs through a centralized service and wants to create a custom connector in Power Apps by exporting directly from that service.

Which export destination must she select in that service's API context menu?

- A. Azure Logic Apps
- B. Power Apps and Power Automate
- C. API Gateway
- D. Azure Service Bus

<details>
<summary>Answer</summary>

**Correct answer:** B. Power Apps and Power Automate

**Explanation:** In Azure API Management, selecting the three dots (`...`) next to an API and choosing **Export**, then selecting the **Power Apps and Power Automate** panel, generates a custom connector directly in the chosen Power Apps environment.

</details>

---

### Question 5 — Single Choice

A citizen developer needs to use an Azure API Management-hosted web API from Power Apps. After exporting the API as a custom connector, she attempts to use it but receives authentication errors.

What credential must she supply when creating the connection?

- A. An Azure Active Directory client secret
- B. A subscription key from Azure API Management
- C. A SAS token from Azure Storage
- D. A bearer token obtained via OAuth 2.0

<details>
<summary>Answer</summary>

**Correct answer:** B. A subscription key from Azure API Management

**Explanation:** To access a web API hosted in Azure API Management from Power Apps, a subscription key is required. The key is copied from the **Subscriptions** blade (Primary key or Secondary key) and entered in the API Key field when creating the connection.

</details>

---

### Question 6 — Single Choice

Maria needs to create a custom connector without waiting for the professional development team to configure anything in Azure. The dev team has indicated they can supply a single file that describes their API contract.

Which file should Maria request?

- A. A WSDL file
- B. A Swagger UI HTML page
- C. An OpenAPI document (openapi.json)
- D. A Postman collection export

<details>
<summary>Answer</summary>

**Correct answer:** C. An OpenAPI document (openapi.json)

**Explanation:** Power Apps supports importing an OpenAPI document to instantly create a custom connector. WSDL is not a supported import format for Power Apps custom connectors, and an OpenAPI document is the industry-standard contract format for REST APIs.

</details>

---

### Question 7 — Single Choice

A development team is evaluating whether to use Azure API Management or an OpenAPI document to create their Power Apps custom connector. They prioritize minimizing architectural complexity and avoiding additional costs.

Which option best meets these requirements?

- A. Azure API Management, because it provides centralized API control
- B. OpenAPI document, because it has lower architectural complexity and no extra cost
- C. Azure API Management, because it provides an extra security layer
- D. OpenAPI document, because it provides centralized API control

<details>
<summary>Answer</summary>

**Correct answer:** B. OpenAPI document, because it has lower architectural complexity and no extra cost

**Explanation:** The comparison table in the module shows that using an OpenAPI document has lower architectural complexity and no extra cost, whereas Azure API Management involves higher architectural complexity and additional cost.

</details>

---

### Question 8 — Single Choice

After creating a custom connector, a citizen developer wants to verify that the connector correctly calls the web API before building a canvas app with it.

Where in Power Apps can she perform this verification?

- A. The Power Apps formula bar
- B. The **4. Test** tab in the Custom Connectors editor
- C. The Azure API Management test console
- D. The Power Apps Monitor tool

<details>
<summary>Answer</summary>

**Correct answer:** B. The **4. Test** tab in the Custom Connectors editor

**Explanation:** Power Apps Studio provides a built-in **4. Test** tab within the custom connector editor. From there, you can select an operation and click **Test operation** to verify the connector works as expected using the existing active connection.

</details>

---

### Question 9 — Single Choice

A developer adds a Power Platform connected service to an ASP.NET Core Web API project in Visual Studio 2022. When configuring the dev tunnel, she sets the tunnel type to **Persistent** and access to **Public**.

What is the primary benefit of a **Persistent** tunnel type in this context?

- A. It encrypts traffic with a dedicated TLS certificate
- B. The tunnel URL remains stable across restarts, so the custom connector does not need to be re-created
- C. It limits access to users within the organization's Azure AD tenant
- D. It automatically publishes the API to Azure API Management

<details>
<summary>Answer</summary>

**Correct answer:** B. The tunnel URL remains stable across restarts, so the custom connector does not need to be re-created

**Explanation:** A Persistent dev tunnel retains the same tunnel URL between sessions. This means the custom connector created in Power Platform continues to point to the same URL without needing to be regenerated each time the developer restarts their local API.

</details>

---

### Question 10 — Single Choice

After adding the `InventoryManager` custom connector as a data source in a canvas app, a developer wants to populate a collection called `warehouses` with data from the `getapiwarehouselocations` endpoint when a button is pressed.

Which formula should she use in the button's **OnSelect** property?

- A. `Set(warehouses, InventoryManagement.getapiwarehouselocations())`
- B. `Collect(warehouses, InventoryManagement.getapiwarehouselocations())`
- C. `ClearCollect(warehouses, InventoryManagement.getapiwarehouselocations())`
- D. `UpdateContext({warehouses: InventoryManagement.getapiwarehouselocations()})`

<details>
<summary>Answer</summary>

**Correct answer:** C. `ClearCollect(warehouses, InventoryManagement.getapiwarehouselocations())`

**Explanation:** The module explicitly uses `ClearCollect(warehouses, InventoryManagement.getapiwarehouselocations())` in the button's **OnSelect** property. `ClearCollect` clears the collection first, then populates it with the API result, ensuring fresh data on each button press.

</details>

---

### Question 11 — Single Choice

Kiana's team already uses Azure API Management to expose certain web APIs publicly while restricting others using policies. A citizen developer wants to create a custom connector from one of those APIs.

What is the correct way to initiate the export?

- A. Go to the **Subscriptions** blade and select **Export to Power Apps**
- B. Go to the **APIs** blade, select the API, select the three dots (`...`), and choose **Export**
- C. Go to the **Products** blade and select **Create custom connector**
- D. Go to the **Policies** blade and download the OpenAPI definition

<details>
<summary>Answer</summary>

**Correct answer:** B. Go to the **APIs** blade, select the API, select the three dots (`...`), and choose **Export**

**Explanation:** The export workflow starts in the **APIs** blade of Azure API Management. After selecting the target API, clicking the three dots (`...`) reveals a context menu with the **Export** option, from which you choose the **Power Apps and Power Automate** destination.

</details>

---

### Question 12 — Single Choice

An OpenAPI document is described as a "programming language-agnostic interface description." What does this mean for citizen developers using Power Apps?

- A. They must learn the programming language used to build the web API
- B. They can understand and use the API without inspecting source code or network traffic
- C. They need to install language-specific SDKs to call the API
- D. They must convert the OpenAPI document to a WSDL file first

<details>
<summary>Answer</summary>

**Correct answer:** B. They can understand and use the API without inspecting source code or network traffic

**Explanation:** OpenAPI defines a standard, language-agnostic interface that allows both humans and computers to discover and understand a service's capabilities without accessing source code, documentation, or network traffic.

</details>

---

### Question 13 — Multi-Select

A Power Apps team is comparing Azure API Management and OpenAPI document approaches for creating custom connectors. (Select **three** characteristics that apply specifically to Azure API Management but NOT to using an OpenAPI document alone.)

- A. Centralized API control
- B. Extra security layer
- C. Lower architectural complexity
- D. Usage control
- E. No extra cost
- F. Extra cost

<details>
<summary>Answer</summary>

**Correct answer:** A. Centralized API control, B. Extra security layer, D. Usage control

**Explanation:** According to the module's comparison table, Azure API Management provides centralized API control, an extra security layer, and usage control — none of which are offered by the OpenAPI document approach alone. Azure API Management also involves extra cost and higher architectural complexity (the opposite of options C and E).

</details>

---

### Question 14 — Multi-Select

A developer is configuring the Power Platform connected service in Visual Studio 2022. Which **two** items must she create or configure in the connected service dialog before selecting **Finish**? (Select **two**.)

- A. A custom connector name (e.g., `InventoryLocations_Connector`)
- B. A public dev tunnel with a name and tunnel type
- C. An Azure API Management subscription key
- D. A Power Automate cloud flow
- E. An OpenAPI document file

<details>
<summary>Answer</summary>

**Correct answer:** A. A custom connector name, B. A public dev tunnel

**Explanation:** When adding Microsoft Power Platform as a connected service in Visual Studio, you must provide a custom connector name and configure a dev tunnel (name, tunnel type, and access level). The subscription key and OpenAPI document are not required for this Visual Studio workflow.

</details>

---

### Question 15 — Multi-Select

After exporting a custom connector from Azure API Management to Power Apps, a citizen developer needs to complete several steps before she can use it in a canvas app. Which **two** steps are required after the export? (Select **two**.)

- A. Create a connection using the API subscription key
- B. Re-export the connector from Visual Studio
- C. Add the custom connector as a data source in the canvas app
- D. Upload the connector to the Microsoft connector gallery
- E. Regenerate the OpenAPI document

<details>
<summary>Answer</summary>

**Correct answer:** A. Create a connection using the API subscription key, C. Add the custom connector as a data source in the canvas app

**Explanation:** After exporting the connector, you must (1) create a connection by providing the API key in the Custom Connectors screen, and (2) add the connector as a data source inside the canvas app. Neither re-exporting from Visual Studio nor gallery publishing is required.

</details>

---

### Question 16 — Multi-Select

The module describes three supported methods for creating a custom connector in Power Apps. Which **three** are explicitly supported? (Select **three**.)

- A. Visual Studio connected services (dev tunnel)
- B. Export from Azure API Management
- C. Import a WSDL file
- D. Import an OpenAPI file
- E. Generate from a Power Automate flow
- F. Clone from an existing prebuilt connector

<details>
<summary>Answer</summary>

**Correct answer:** A. Visual Studio connected services, B. Export from Azure API Management, D. Import an OpenAPI file

**Explanation:** The module explicitly identifies three creation paths: Visual Studio connected services (with dev tunnel), Azure API Management export, and OpenAPI document import. Importing a WSDL file is specifically called out as NOT a supported method.

</details>

---

### Question 17 — Fill-in-the-Blank

A custom connector is a ___ around a web API that allows Power Apps to communicate with it. The connector knows the host and operation details, while the ___ holds the credentials needed to communicate with the web API.

<details>
<summary>Answer</summary>

**Answer:** wrapper; connection

**Explanation:** The module defines a custom connector as "a wrapper around a web API." The connector stores host and operation details, whereas the connection stores credentials and references the connector to facilitate actual communication.

</details>

---

### Question 18 — Fill-in-the-Blank

When using the Power Platform connected service in Visual Studio, a ___ tunnel creates an ad-hoc connection between a locally running web API and Power Apps, enabling real-time debugging without a cloud deployment.

<details>
<summary>Answer</summary>

**Answer:** dev

**Explanation:** Dev tunnels create an ad-hoc connection between the web API running locally and Power Apps. Setting the tunnel type to **Persistent** keeps the tunnel URL stable across restarts.

</details>

---

### Question 19 — Fill-in-the-Blank

To generate a canvas app scaffold from an existing custom connector using the Power Platform CLI, the developer runs `pac canvas create --connector-id <id> --msapp ___`.

<details>
<summary>Answer</summary>

**Answer:** your file name.msapp (a `.msapp` file path/name)

**Explanation:** The `pac canvas create` command requires a `--msapp` parameter pointing to the output `.msapp` file that will be generated. This file can then be opened in Power Apps Studio to preview the scaffolded app.

</details>

---

### Question 20 — Fill-in-the-Blank

An OpenAPI document specifies a ___ of the surface area of the web API, abstracting implementation specifics away from the consumer so they can build applications without knowing how the methods are internally invoked.

<details>
<summary>Answer</summary>

**Answer:** contract

**Explanation:** The module states that "the OpenAPI document specifies a contract of the surface area of the web API." This contract describes inputs, outputs, and operations without revealing internal implementation details.

</details>

---

### Question 21 — Single Choice

Maria is building a canvas app and adds a Vertical Gallery control to display warehouse locations. She binds the gallery to the `warehouses` collection. After pressing the button that calls the API, the gallery still shows no items.

What is the most likely cause?

- A. The gallery control does not support collections as a data source
- B. She did not hold the **Alt** key (Windows) or **Option** key (Mac) while clicking the button in the studio
- C. The `ClearCollect` function is not compatible with custom connector responses
- D. She must publish the app before the gallery can display data

<details>
<summary>Answer</summary>

**Correct answer:** B. She did not hold the **Alt** key (Windows) or **Option** key (Mac) while clicking the button in the studio

**Explanation:** In Power Apps Studio, controls do not execute their `OnSelect` logic in design mode by default. You must hold **Alt** (Windows) or **Option** (Mac) while clicking a button to simulate a press and trigger the formula during authoring.

</details>

---

### Question 22 — Single Choice

A citizen developer wants to create a custom connector independently — without waiting for a professional developer to configure Azure API Management. The pro-dev team says they can expose a self-describing document from the API's own URL.

Which benefit of OpenAPI documents does this scenario illustrate?

- A. Extra security layer
- B. Centralized API control
- C. Removing dependencies on other teams or services
- D. Usage control through rate limiting

<details>
<summary>Answer</summary>

**Correct answer:** C. Removing dependencies on other teams or services

**Explanation:** The module highlights "Remove dependencies" as a key benefit of OpenAPI documents: citizen developers can create a custom connector themselves by downloading the OpenAPI document from the API's URL, without waiting for anyone to configure API Management or create the connector on their behalf.

</details>
