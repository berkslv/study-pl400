# Recall: Discover Web APIs and Custom Connectors in Power Apps

> **Source files:** 01-introduction.md, 02-what-are-custom-connectors.md, 03-create-custom-connector-visual-studio.md, 04-create-custom-connector-with-api-management.md, 05-what-is-openapi-why-you-should-use-it.md, 06-create-custom-connector-with-openapi.md, 07-test-use-custom-connector.md, 08-test-custom-connector.md, 09-use-custom-connector-power-apps.md

---

## Keywords

| Term | Definition |
|------|-----------|
| Custom Connector | A wrapper around a web API that enables Power Apps to communicate with it. |
| Connector | Knows the web API's host and operation details, but does not hold credentials. |
| Connection | Holds credentials and references a connector to facilitate actual communication with the web API. |
| Connected Services | Visual Studio toolset that connects to services like Power Platform and auto-generates custom connectors. |
| Dev Tunnel | Ad-hoc connection between a locally running web API and Power Platform for real-time testing. |
| Azure API Management | Azure service to centrally control, administer, and expose web APIs with policies. |
| OpenAPI Document | Language-agnostic contract describing a web API's surface area, endpoints, and return types. |
| ClearCollect | Power Apps formula function that clears a collection and populates it with data from a connector call. |
| Canvas App | Low-code Power Apps app type where developers place UI controls and bind them to data sources. |
| Subscription Key | API Management credential required by Power Apps to access hosted web APIs. |

---

## Main Ideas

- Power Apps has 1,000+ prebuilt connectors; custom connectors fill the gap for organization-specific web APIs.
- Three ways to create a custom connector: (1) Visual Studio Connected Services, (2) Azure API Management export, (3) import an OpenAPI document.
- **Connector vs. Connection**: the connector stores host/operation metadata; the connection stores credentials. Both are required before a Power App can call an API.
- Visual Studio Connected Services (VS 2022) auto-generates a custom connector and configures a dev tunnel for local debugging in real-time.
- Dev tunnel type must be set to **Persistent** and **Public** for Power Platform integration during local development.
- Azure API Management exports a custom connector directly to a selected Power Platform environment via **Export > Power Apps and Power Automate**.
- A subscription key from API Management is required when creating the connection to the exported connector.
- OpenAPI document advantages over API Management: no extra cost, lower architectural complexity, removes dependency on API Management, increases citizen developer agility.
- OpenAPI document disadvantages vs. API Management: no centralized API control, no extra security/usage control layer.
- Testing a custom connector uses the built-in **4. Test** tab in Power Apps Studio; select an operation and click **Test operation**.
- In a canvas app, bind a button's `OnSelect` to `ClearCollect(collection, Connector.Operation())` to populate a collection from the API.
- `pac connector list` retrieves connector IDs; `pac canvas create` generates a `.msapp` canvas app from a connector's operations.

---

## Mini Quiz

### Q1 — Single Choice

A citizen developer wants to create a custom connector without relying on Azure API Management or waiting for the pro-dev team to do anything beyond sharing a file.

Which approach should they use?

- A. Export the API from Azure API Management
- B. Add Power Platform as a Connected Service in Visual Studio
- C. Import an OpenAPI document in Power Apps
- D. Create a new blank connector manually in Power Apps Studio

<details>
<summary>Answer</summary>

**Correct answer:** C. Import an OpenAPI document in Power Apps

**Explanation:** An OpenAPI document removes the dependency on Azure API Management and allows the citizen developer to create the connector independently, as long as the pro-dev team provides the document.

</details>

---

### Q2 — Fill-in-the-Blank

A custom connector stores the web API's host and operation details, while a ___ stores the credentials needed to communicate with that API.

<details>
<summary>Answer</summary>

**Answer:** connection

**Explanation:** The connector knows the API surface (host, operations), while the connection holds credentials and references the connector to enable actual API calls.

</details>

---

### Q3 — Single Choice

When using Visual Studio Connected Services to create a custom connector for local development, which dev tunnel settings are required?

- A. Tunnel Type: Temporary, Access: Private
- B. Tunnel Type: Persistent, Access: Public
- C. Tunnel Type: Persistent, Access: Private
- D. Tunnel Type: Temporary, Access: Public

<details>
<summary>Answer</summary>

**Correct answer:** B. Tunnel Type: Persistent, Access: Public

**Explanation:** The exercise specifies selecting Tunnel Type: Persistent and Access: Public when configuring the dev tunnel for Power Platform integration.

</details>

---

### Q4 — Fill-in-the-Blank

To export a web API from Azure API Management as a custom connector, navigate to the **APIs** blade, select the three dots next to the API, choose **Export**, and then select the ___ panel.

<details>
<summary>Answer</summary>

**Answer:** Power Apps and Power Automate

**Explanation:** The export wizard in Azure API Management presents a "Power Apps and Power Automate" panel that publishes the connector directly to the selected Power Platform environment.

</details>

---

### Q5 — Single Choice

Which of the following is a key advantage Azure API Management has over an OpenAPI document when creating custom connectors?

- A. Lower architectural complexity
- B. No extra cost
- C. Centralized API control with extra security layer
- D. Faster citizen developer agility

<details>
<summary>Answer</summary>

**Correct answer:** C. Centralized API control with extra security layer

**Explanation:** The comparison table shows Azure API Management provides centralized API control, an extra security layer, and usage control — advantages the OpenAPI document approach does not offer.

</details>

---

### Q6 — Fill-in-the-Blank

In a Power Apps canvas app, the formula `___(warehouses, InventoryManagement.getapiwarehouselocations())` clears the `warehouses` collection and populates it with the API response.

<details>
<summary>Answer</summary>

**Answer:** ClearCollect

**Explanation:** `ClearCollect` is the Power Apps function that clears a named collection and fills it with data returned by the specified connector operation.

</details>

---

### Q7 — Single Choice

After creating a custom connector in Power Apps, what is the correct sequence before using it in a canvas app?

- A. Test the connector → Create a connection → Add to canvas app
- B. Create a connection → Test the connector → Add to canvas app
- C. Add to canvas app → Create a connection → Test the connector
- D. Test the connector → Add to canvas app → Create a connection

<details>
<summary>Answer</summary>

**Correct answer:** A. Test the connector → Create a connection → Add to canvas app

**Explanation:** The module flow creates the connector, then tests it via the built-in Test tab, then creates a connection (with credentials), and finally uses the connection inside the canvas app.

</details>

---
