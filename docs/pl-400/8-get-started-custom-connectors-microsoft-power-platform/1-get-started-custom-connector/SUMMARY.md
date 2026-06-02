# Summary: Getting Started with Custom Connectors in Microsoft Power Platform

> **Source files:** 1-introduction.md, 2-demo.md, 3-explore.md, 4-build.md, 5-use.md, 6-use-power-automate.md

---

## What Is a Custom Connector

- A connector is a proxy/wrapper around an API that allows Power Automate, Power Apps, and Azure Logic Apps to communicate with an underlying service.
- Connectors provide actions (controlled operations) and triggers (automation start events).
- When no prebuilt connector exists for an API, you create a custom connector.
- If a prebuilt connector exists but doesn't expose all needed triggers/actions, you can build a custom connector alongside it.
- After definition, a custom connector is available in that environment like any built-in connector.
- Custom connectors are only available in environments where their definition exists — not globally to all Microsoft customers.

---

## Custom Connector Lifecycle

### 1. Identify or Build the API
- Check the [connector reference](https://learn.microsoft.com/en-us/connectors/connector-reference/) before creating a new one.
- Public REST APIs are usable directly; private/internal APIs require the [on-premises data gateway](https://learn.microsoft.com/en-us/power-automate/gateway-reference/).
- Developers can build APIs using Azure Functions, Azure App Services, or manage them with Azure API Management.

### 2. Describe the API (Connector Definition Methods)
- **Manually create in the portal** — use API documentation and examples; good for simple APIs.
- **Import OpenAPI definition** — supports OpenAPI 2.0 (not 3.0); best if publisher provides one.
- **Import from GitHub** — import from the [Power Platform Connectors repository](https://github.com/Microsoft/PowerPlatformConnectors).
- **Export from Azure** — export from Azure App Service, Azure Functions, or Azure API Management to auto-generate the connector definition.

### 3. Certify and Share (Optional)
- Share connector definition as open source on GitHub for other customers to import.
- Certifying makes it available as a prebuilt connector globally; requires API ownership or explicit permission.
- See [Certification process](https://learn.microsoft.com/en-us/connectors/custom-connectors/certification-submission/).
- Internal-facing connectors do not need certification.

---

## Authentication Options

- **No authentication** — default; for APIs allowing anonymous access.
- **Basic authentication** — user and password sent with each request.
- **OAuth 2.0** — industry-standard authorization; prebuilt configurations available for Microsoft Entra ID, GitHub, Azure DevOps, Dropbox, Slack, Stripe, and more.
- **API key** — token provided by the API publisher; included in each request.

---

## Connector Configuration Options

### General Information
- Connector name: max 30 characters; use Description for elaboration.
- Icon background color helps visually identify the connector in the maker experience.

### Action and Trigger Naming
- **Operation ID**: must be unique, no spaces; use camelCase (e.g., `GetInvoice`) for readability and accessibility.
- **Summary**: shown in action/trigger lists; make it descriptive to aid search.
- **Description**: shown on the action card in the designer.

### Visibility Options (Actions and Parameters)
| Value | Behavior |
|-------|----------|
| `None` | Default; displays normally |
| `Advanced` | Available but not prioritized |
| `Internal` | Hidden from makers |
| `Important` | Prioritized; shown first |

- Use `Internal` to hide support/metadata operations or operations not yet ready for users.
- Use `Important` for frequently used actions among many.

### Request Configuration
- Defines parameters/data passed into the operation when action invokes the API.
- Can be imported from OpenAPI or via sample import.
- Key parameter fields to review: **Name** (must match API expectation), **Summary** (user-friendly label), **Description** (placeholder text), **Default value**, **Is required**, **Visibility**, **Type and Format**, **Dropdown type** (static or dynamic list).

### Response Configuration
- Defines expected return data from the API.
- Multiple responses can be defined per HTTP status code; a default response is a catch-all.
- Response items appear in the **Dynamic content** panel when building flows/apps.

### Other Settings
- **Triggers**: configure for polling or webhook events to allow connector to trigger Power Automate flows.
- **References**: reusable parameters; typically created on import or handcrafted with the swagger editor.
- **Policies**: use prebuilt policy templates to modify action/trigger behavior.

### Validation
- A Validation section shows errors at the bottom of the definition screen; resolve before finalizing.

---

## Deploying Custom Connectors to Other Environments

- Custom connector must be present in each environment where it will be used.
- Three deployment options:

| Option | Description | Requirement |
|--------|-------------|-------------|
| **Download and import** | Download OpenAPI definition; import into target environment | Manual extra config needed in target |
| **Solutions** | Export/import solution containing connector | Requires Microsoft Dataverse in both environments; supports ALM and build automation |
| **Command line (CLI)** | Use [Power Platform Connectors CLI](https://learn.microsoft.com/en-us/connectors/custom-connectors/paconn-cli/) | Automates download/import; also used for certification/open source prep |

- For **Azure Logic Apps**: recreate connector in Azure subscription by importing the OpenAPI file during custom connection creation.

---

## Exercise: Create a Custom Connector (Contoso Invoicing)

1. Review the API at `https://contosoinvoicingtest.azurewebsites.net/` — note operations, download OpenAPI (swagger.json), save API key, and download logo.
2. In Power Apps maker portal, create a new solution (**Contoso invoicing**).
3. Inside the solution, select **+ New > Automation > Custom connector**; set name, upload logo, set icon background color `#175497`, enter host `contosoinvoicingtest.azurewebsites.net`.
4. Import the OpenAPI definition: ellipsis → **Update from OpenAPI file** → select swagger.json.
5. On the **Definition** tab: add missing Summary to **GetInvoice**, add missing Description to **PayInvoice**, delete unused **NewInvoice** operations, set **GetInvoiceSchema** visibility to **Internal**.
6. Select **Update connector**.
7. On the **Test** tab: create a new connection using the API key, refresh, then test **ListInvoiceTypes**.

---

## Exercise: Use a Custom Connector in Power Automate

1. Open the **Contoso invoicing** solution; create a new Instant cloud flow named **Email invoice list**.
2. Add a new step → **Custom** tab → **Contoso invoicing** connector → **List invoices** action.
3. Name the connection **Invoice connection**, paste the API key, and select **Create**.
4. Leave **List Invoices** fields blank to retrieve all invoices.
5. Run **Flow checker**, then **Save**.
6. Test the flow: **Run** → **Continue** → **Run flow** → verify run history succeeds.
7. Open the **List Invoices** action in the copilot designer → **Outputs** section → **Show raw outputs** to inspect invoice data.

---

## References

- [Azure API Management](https://aka.ms/apimrocks/)
- [Azure App Services](https://azure.microsoft.com/services/app-service/api/)
- [Azure Functions](https://azure.microsoft.com/services/functions/)
- [Certification process](https://learn.microsoft.com/en-us/connectors/custom-connectors/certification-submission/)
- [Connector reference](https://learn.microsoft.com/en-us/connectors/connector-reference/)
- [Instructions on submitting your connector to Microsoft](https://learn.microsoft.com/en-us/connectors/custom-connectors/certification-submission/#title)
- [Microsoft Power Platform CLI](https://learn.microsoft.com/en-us/power-platform/developer/cli/reference/connector/)
- [Microsoft Power Platform Connectors CLI](https://learn.microsoft.com/en-us/connectors/custom-connectors/paconn-cli/)
- [OAuth 2.0](https://oauth.net/2/)
- [On-premises data gateway](https://learn.microsoft.com/en-us/power-automate/gateway-reference/)
- [OpenAPI specification](https://swagger.io/resources/open-api/)
- [Power Apps Community Plan](https://powerapps.microsoft.com/communityplan/)
- [Power Platform Connectors repository (GitHub)](https://github.com/Microsoft/PowerPlatformConnectors)
