# Summary: Custom Connectors OpenAPI Extensions in Microsoft Power Platform

> **Source files:** 1-introduction.md, 2-open-api-extensions.md, 3-dynamic-list-value-extension.md, 4-dynamic-schema.md, 5-exercise.md

---

## OpenAPI Extensions Overview

- Custom connectors use OpenAPI (Swagger) definitions to describe authentication, actions, triggers, and parameters.
- Microsoft-specific extensions follow the pattern `x-ms-<name>`.
- Extensions covered: `x-ms-capabilities`, `x-ms-url-encoding`, `x-ms-dynamic-values`, `x-ms-dynamic-list`, `x-ms-dynamic-schema`, `x-ms-dynamic-properties`.
- Primary use case: make connectors easier for makers (e.g., drop-down lists instead of raw ID values).
- Some extensions require API support (e.g., dynamic schema requires an API operation to return schema).

---

## Configuring Extensions

Four approaches to configure OpenAPI extensions:

- **Import OpenAPI** – Import an OpenAPI file that already contains the extensions.
- **Microsoft Power Platform Connectors CLI (`paconn`)** – Download, edit JSON, re-upload. Best for editing `API Properties` file.
- **Microsoft Power Platform CLI** – Same as above for solution-based connectors.
- **Built-in Swagger Editor** – Quickest method; toggle via **Swagger Editor** switch in the custom connector designer.

### Swagger Editor Tips

- Indentation is syntactically significant in YAML.
- Braces `{}` and brackets `[]` must be balanced.
- `Ctrl+F` to find, `Ctrl+Z` to undo.
- Make small, focused changes; editor validates syntax in real time.
- Reference examples in the [Microsoft Power Platform Connector GitHub repository](https://github.com/microsoft/PowerPlatformConnectors/).

---

## x-ms-capabilities

Two configurable options:

| Capability | Scope |
|---|---|
| `chunkTransfer` | Operation level |
| `testConnection` | Connector level |

### Chunk Transfer

- Enables transfer of large messages by splitting them into smaller chunks.
- Requirements: API must support chunking; extension must be enabled on the action; maker must enable **Allow chunking** on the flow step.
- Add to the operation definition:

```json
{chunkTransfer: true}
```

### Test Connection

- Validates connection configuration (host URL, API key, etc.) at connection creation time.
- Requires a connector operation that returns HTTP 200. Can be an existing operation or a dedicated one (mark it `internal` to hide from makers).
- Static parameters can be passed (e.g., `$top: 1` to limit results).

```yaml
x-ms-capabilities:
  testConnection:
    operationId: ListInvoices
    parameters: {}
```

```json
"x-ms-capabilities": {
  "testConnection": {
    "operationId": "ListInvoices",
    "parameters": {}
  }
}
```

---

## x-ms-url-encoding (Path Encoding)

- Applies to path parameters in the request URL.
- Default: single URL-encoding.
- Use `double` encoding when the API expects it (e.g., parameters containing `@`, `/`, `\`).
- Connector user does not need to manually encode the parameter.

```yaml
x-ms-url-encoding: double
```

---

## Dynamic List of Values (x-ms-dynamic-values / x-ms-dynamic-list)

### Static Alternative: `enum`

- Configure via the designer by selecting **Static** in **Dropdown type** and providing comma-separated values.
- Limitation: must manually update the connector when the API adds new allowable values.

### x-ms-dynamic-values (Version 1)

- Retrieves the list of values from the API at runtime.
- Benefits:
  - User-friendly labels in addition to raw values.
  - Values always reflect current API state.
  - API can filter list per user/connection.
  - Supports dependent options (e.g., country → state cascading lists).
- Requires an API operation returning an array of valid values.
- Configurable in the designer: set **Dropdown type** to **Dynamic**, specify **Operation ID**, **Value**, and **Value display name**.

```yaml
x-ms-dynamic-values:
  operationId: ListInvoiceTypes
  value-path: typeId
  value-title: name
```

### x-ms-dynamic-list (Version 2)

- Improved schema; resolves ambiguous parameter references (e.g., path parameter `id` vs. body parameter `id`).
- Must be configured directly in the OpenAPI definition (designer only configures `x-ms-dynamic-values`).
- **Recommendation:** implement both extensions to support old and new flows.

```yaml
x-ms-dynamic-values:
  operationId: ListInvoiceTypes
  value-path: typeId
  value-title: name
x-ms-dynamic-list:
  operationId: ListInvoiceTypes
  itemValuePath: typeId
  itemTitlePath: name
```

---

## Dynamic Schema (x-ms-dynamic-schema / x-ms-dynamic-properties)

- Allows the set of visible parameters for an action to vary at runtime based on another parameter value.
- Common use cases:
  - Parameters vary by type/category (e.g., invoice type).
  - Record state determines editable fields.
  - Security trimming of parameters.
  - Single action serving multiple object types (accounts, contacts, orders).

### API Requirements

- The API must expose an operation that returns a valid JSON schema.
- That operation can accept parameters (constants or values collected from the action card).
- Example schema response:

```json
{
  "type": "object",
  "properties": {
    "amount": {
      "type": "number",
      "x-ms-summary": "Amount",
      "description": "Invoice amount"
    },
    "purchaseOrder": {
      "type": "string",
      "x-ms-summary": "Purchase Order",
      "description": "Purchase order number",
      "x-ms-visibility": "important"
    }
  },
  "required": ["amount"]
}
```

- `type` is required; identifies parameter data type.
- `x-ms-summary` and `description` appear in the Power Automate designer.
- `x-ms-visibility: "important"` — always shown; `"advanced"` — hidden until user expands.
- `required` array lists mandatory parameters.

### Configuration

| Extension | Version | Designer Support |
|---|---|---|
| `x-ms-dynamic-schema` | v1 | No — must edit OpenAPI directly |
| `x-ms-dynamic-properties` | v2 | No — must edit OpenAPI directly |

- To support older flows: implement both versions.
- To support new flows only: use `x-ms-dynamic-properties`.

```yaml
x-ms-dynamic-properties:
  operationId: GetInvoiceSchema
  parameters:
    typeId: {parameterReference: typeId}
```

---

## Exercise: Implementing Extensions on Contoso Invoicing Connector

Steps performed across 5 tasks:

1. Import `ContosoInvoicingExtensions_1_0_0_0.zip` solution into Power Apps, publish customizations.
2. **Test Connection** – Add `x-ms-capabilities.testConnection` in Swagger Editor; verify invalid key fails and valid key succeeds.
3. **Dynamic Values** – On `AddInvoice` action, set `typeId` parameter to **Dynamic**, bind to `ListInvoiceTypes` operation.
4. **Dynamic Schema** – Replace static `$ref: '#/definitions/Invoice'` with `x-ms-dynamic-properties` referencing `GetInvoiceSchema`; mark `GetInvoiceSchema` action as `internal`.
5. **Test in Power Automate** – Create instant cloud flow, use `AddInvoice`; verify **Purchase Order** field appears/disappears when invoice type changes.

---

## References

- [Complete list of custom connector supported extensions](https://learn.microsoft.com/en-us/connectors/custom-connectors/openapi-extensions/)
- [Contoso Invoicing test site](https://contosoinvoicingtest.azurewebsites.net/)
- [Microsoft Power Platform Connector GitHub repository](https://github.com/microsoft/PowerPlatformConnectors/)
- [Power Apps community plan](https://powerapps.microsoft.com/communityplan/)
- [Power Apps maker portal](https://make.powerapps.com/)
- [Power Automate](https://flow.microsoft.com/)
- [YAML specification](https://yaml.org/)
