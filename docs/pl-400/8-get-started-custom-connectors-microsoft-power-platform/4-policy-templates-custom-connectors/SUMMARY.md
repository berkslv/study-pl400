# Summary: Policy Templates for Custom Connectors in Power Platform

> **Source files:** 1-introduction.md, 2-expressions-runtime.md, 3-policies-data-conversion.md, 4-configure-host-url-routing.md, 5-add-update-values.md, 6-exercise.md

---

## Policy Overview

- Policies modify the behavior of a custom connector **at runtime**.
- Configured via policy templates in the custom connector designer (maker portal) or directly in `apiProperties.json`.
- Policies are stored in `apiProperties.json` (separate from `apiDefinition.swagger.json`); importing a new API definition does not overwrite configured policies.
- Policies can be applied to **all actions and triggers** or scoped to **specific ones**.
- Policy execution order is configurable via the ellipsis (**...**) menu (move up/down) in the portal.
- Policies are exported with `paconn download` (four files: `apiDefinition.swagger.json`, `apiProperties.json`, `icon.png`, `settings.json`).
- Configured policies appear in the **policyTemplateInstances** section of `apiProperties.json`.
- Use `paconn update` to import modified `apiProperties.json` back to the environment.

### Common Use Cases

- **Set host URL** — Allow dynamic host URL per connection (e.g., dev/test/production).
- **Set header** — Promote connection parameter, query, or body data to the request header (e.g., correlation IDs).
- **Set query parameter** — Provide default query values when makers don't configure one.

---

## Expressions for Runtime Values

- Expressions are prefixed with `@` and evaluated at runtime.
- Expressions can access headers, query parameters, body data, and connection parameters.
- Use `{}` (braces) notation when a numeric result must be treated as a string.
- Use single quotation marks for string literals inside expressions; double quotes conflict with expression markup.
- Avoid null path errors — ensure every property in the path is non-null before accessing.

### Expression Reference

| Expression | Purpose |
|---|---|
| `@connectionParameters('paramName')` | Access a connection property value |
| `@body()` | Access the full request/response body |
| `@body().propertyName` | Access a specific property of the body |
| `@body().array[0].field` | Access array element property |
| `@headers('headerName')` | Access a request/response header value |
| `@queryParameters('paramName')` | Access a query string parameter |

### Numeric-to-string conversion example

```
@{connectionParameters('HostPortNumber')}
```

### Body array access examples

```
@body().invoices
@body().invoices[0].invoiceid
```

### Connection parameter in host URL template

```
https://@{connectionParameters('keyVaultName')}.vault.azure.net
```

---

## Connection Parameters in apiProperties.json

- Defined in the **connectionParameters** section of `apiProperties.json`.
- Build the connection dialog box displayed to users when creating a new connection.
- Configuring authentication (e.g., API Key) automatically adds the required properties.
- Additional fields (e.g., `hostUrl`, `billingCode`) can be manually added.

### API Key authentication auto-generated property

```json
"api_key": {
  "type": "securestring",
  "uiDefinition": {
    "displayName": "API Key",
    "description": "The API Key for your environment",
    "tooltip": "Provide your API Key",
    "constraints": {
      "tabIndex": 2,
      "clearText": false,
      "required": "true"
    }
  }
}
```

### Custom connection parameters example (hostUrl + billingCode + api_key)

```json
"properties": {
  "connectionParameters": {
    "hostUrl": {
      "type": "string",
      "uiDefinition": {
        "constraints": { "required": "true" },
        "description": "Specify your API URl e.g. https://test.contoso.com",
        "displayName": "API URL",
        "tooltip": "Specify your API URl e.g. https://test.contoso.com"
      }
    },
    "billingCode": {
      "type": "string",
      "uiDefinition": {
        "constraints": { "required": "true" },
        "description": "billing code",
        "displayName": "Billing Code",
        "tooltip": "Billing Code"
      }
    },
    "api_key": {
      "type": "securestring",
      "uiDefinition": {
        "displayName": "API Key",
        "description": "The API Key for your environment",
        "tooltip": "Provide your API Key",
        "constraints": {
          "tabIndex": 2,
          "clearText": false,
          "required": "true"
        }
      }
    }
  }
}
```

---

## Data Conversion Policy Templates

- Used to reshape data structures between the maker and the underlying API.
- Each policy runs against the **request** (input) or **response** (output); configure two templates if both are needed.
- **Target object or collection** parameter defines the starting data source — most commonly `@body()`.

### Available templates

| Template | Direction | Purpose |
|---|---|---|
| Convert an array to an object | Request or Response | Reshapes an array into an object |
| Convert an object to an array | Request or Response | Reshapes an object into an array |
| Convert delimited string into an array of objects | Response | Splits a delimited string into an array property |

### Important notes

- Apply each policy only to actions whose request/response structure matches the policy configuration.
- Different actions returning different shapes need separate policy template configurations (e.g., **Get Invoice** vs. **List Invoice**).
- After configuring response policy templates, **reimport sample data** on the action response so apps and flows can see the transformed schema.
- A misconfigured policy typically results in an **HTTP 500** error; remove the action from the operations list to isolate the cause.

---

## Host URL and Request Routing Policy Templates

### Set host URL

- Replaces the statically configured host URL for selected triggers/actions.
- Most common use: prompt the user for the host URL at connection creation.
- Supports partial URL construction; only require user to provide the variable segment.

```
https://@{connectionParameters('keyVaultName')}.vault.azure.net
```

- Also supports `@headers` and `@queryParameters` expressions in the URL template.

### Route request

- Modifies the **path** portion of the action URL (as opposed to Set Host URL which modifies the host).
- Used to map a connector action path to a different underlying API path.
- Supports parameter references and expressions in the path.

#### Example: multiple actions pointing to the same API path

1. Define **List Big Invoices** action with path `/ListBigInvoices` (non-existent on API).
2. Apply a **Route request** policy to redirect `/ListBigInvoices` → `/ListInvoices`.

#### Path with parameter reference example

```
/v2/me/taskgroups('{group_id}')/taskfolders
```

---

## Set Value Policy Templates

### Set property

- Adds or updates a property in the request or response body.
- Set **Parent object or collection path** to target nested collections.
- Supports constant string values or `@body()` expressions.
- Expression must be wrapped in braces: `{expression}`.
- **Only `@body` expressions** are supported in the value field; `@connectionParameters`, `@headers`, and `@queryParameters` are **not** supported.

```
@body().invoices          ← parent collection path
{@body().Prefix}          ← value expression referencing another body field
```

### Set query string parameter

- Adds or updates a query parameter on the request only (no **Run policy on** setting needed).
- **Action if parameter exists** options:
  - **Override** — replaces the existing value.
  - **Skip** — keeps the existing value (use for default values).
  - **Append** — appends the policy value to the existing value.
- Example: Microsoft Outlook connector sets `$top` to **50** using the **Skip** option.

### Set HTTP header

- Adds or updates a header value in the request, response, or failure.
- Same **action if value exists** options as Set query string parameter.
- Common uses: sender identification, ETag for change tracking, special API key headers.
- Example: Azure Cognitive Services connector sets `X-Ms-Sender` to `Microsoft Azure Logic Apps`.

---

## Exercise: Dynamic Host URL via Policy Template

### Prerequisites

- Test environment with Microsoft Dataverse provisioned.
- Python > 3.5 installed with `Add Python to Path` enabled.
- `paconn` installed via `pip install paconn`.

### Steps

1. Import the **ContosoInvoicingPolicyTemplates_1_0_0_2.zip** solution into Power Apps maker portal.
2. Publish all customizations.
3. Login to paconn: `paconn login` (device code flow).
4. Download the connector: `paconn download` → select environment and connector.
5. Open `apiProperties.json` and add `hostUrl` inside **connectionParameters** before `api_key`:

```json
"hostUrl": {
  "type": "string",
  "uiDefinition": {
    "constraints": { "required": "true" },
    "description": "Specify your API Url e.g. https://test.contoso.com",
    "displayName": "API URL",
    "tooltip": "Specify your API Url e.g. https://test.contoso.com"
  }
},
```

6. Upload changes: `paconn update --api-def apiDefinition.swagger.json --api-prop apiProperties.json --icon icon.png`
7. In the connector designer → **Definition** tab → **Policies** section → **+ New policy**.
8. Name: `Host URL Policy`, Template: **Set host URL**, URL Template: `@connectionParameters('hostUrl')` → **Update connector**.
9. Test: create a new connection providing the API URL and API Key, then run **ListInvoice > Test operation**.

---

## References

- [Microsoft Power Platform Connectors GitHub](https://github.com/Microsoft/PowerPlatformConnectors/)
- [Download Python](https://www.python.org/downloads/)
- [Power Apps maker portal](https://make.powerapps.com/)
- [Microsoft Device Login](https://microsoft.com/devicelogin/)
- [Contoso Invoicing Test](https://contosoinvoicingtest.azurewebsites.net/)
- [Community Plan](https://powerapps.microsoft.com/communityplan/)
