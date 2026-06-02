# Recall: Custom Connectors — OpenAPI Extensions

> **Source files:** 1-introduction.md, 2-open-api-extensions.md, 3-dynamic-list-value-extension.md, 4-dynamic-schema.md, 5-exercise.md

---

## Keywords

| Term | Definition |
|------|-----------|
| OpenAPI extension | A Microsoft-defined `x-ms-<name>` field added to an OpenAPI definition to enable custom connector features. |
| x-ms-capabilities | Connector/operation-level extension that declares supported features like `chunkTransfer` or `testConnection`. |
| chunkTransfer | Operation-level capability that splits large messages into chunks to bypass connector runtime size limits. |
| testConnection | Connector-level capability that runs a specified operation during connection creation to validate credentials. |
| x-ms-url-encoding | Path-parameter extension that enables double URL encoding for characters that would otherwise cause ambiguity. |
| x-ms-dynamic-values | Version 1 extension that fetches a drop-down list of parameter values from an API operation at design time. |
| x-ms-dynamic-list | Version 2 extension equivalent to `x-ms-dynamic-values`; resolves ambiguous path vs. body parameter references. |
| x-ms-dynamic-schema | Version 1 extension that retrieves a dynamic parameter schema from an API operation at runtime. |
| x-ms-dynamic-properties | Version 2 extension for dynamic schema; preferred for new flows. |
| enum | Static list of allowable parameter values embedded in the OpenAPI definition; requires manual update when API changes. |
| Swagger editor | Built-in YAML editor in the custom connector designer for directly editing OpenAPI definitions. |
| paconn | Microsoft Power Platform Connectors CLI tool used to download, edit, and upload connector API definitions. |

---

## Main Ideas

- All Microsoft OpenAPI extensions follow the pattern `x-ms-<name>` and are embedded in the connector's OpenAPI (Swagger) definition.
- Extensions can be added via: Import OpenAPI file, Power Platform Connectors CLI (`paconn`), Power Platform CLI (solution-based), or the built-in Swagger editor.
- `chunkTransfer` requires three things: API support for chunking, the extension enabled on the action, and the maker enabling **Allow chunking** on the flow step.
- `testConnection` requires an operation returning HTTP 200; the operation should be marked **internal** if created solely for testing.
- Path parameters are single URL-encoded by default; `x-ms-url-encoding: double` enables double encoding for APIs that require it.
- `x-ms-dynamic-values` / `x-ms-dynamic-list` turn a parameter into a drop-down populated by an API call; benefits include user-friendly labels, per-user filtering, and dependent (chained) lists.
- The designer only configures `x-ms-dynamic-values`; `x-ms-dynamic-list` must be added directly in the OpenAPI definition.
- For backward compatibility, implement both `x-ms-dynamic-values` and `x-ms-dynamic-list`; for new flows only, use `x-ms-dynamic-list` alone.
- `x-ms-dynamic-schema` / `x-ms-dynamic-properties` require the API to expose an operation that returns a valid JSON schema; the schema drives which parameters are visible on the action card.
- The dynamic schema JSON response supports `type`, `x-ms-summary`, `description`, `x-ms-visibility` (`important` | `advanced`), and a `required` array.
- Both dynamic schema versions (v1 and v2) can be configured simultaneously for backward compatibility; designer editing is not available — direct OpenAPI edits are required.
- YAML indentation is syntactically significant in the Swagger editor; mismatched indentation causes validation errors.

---

## Mini Quiz

### Q1 — Single Choice

A flow maker wants to transfer files larger than the connector runtime's message size limit using a custom connector.

Which three conditions must ALL be met?

- A. The API supports chunking, the extension is enabled on the action, and the maker enables **Allow chunking** on the flow step.
- B. The API supports chunking, the connector is published to AppSource, and the maker sets a timeout value.
- C. The connector uses OAuth 2.0, chunk transfer is enabled at connector level, and the maker selects a batch size.
- D. The API uses multipart/form-data, the connector enables chunking at connector level, and the flow uses a scope action.

<details>
<summary>Answer</summary>

**Correct answer:** A. The API supports chunking, the extension is enabled on the action, and the maker enables **Allow chunking** on the flow step.

**Explanation:** All three conditions are explicitly required: the underlying API must support chunking, `chunkTransfer: true` must be set at the operation level in the connector definition, and the maker must enable the **Allow chunking** option on the flow step.

</details>

---

### Q2 — Fill-in-the-Blank

To validate that an API key is correct at connection creation time, you configure the ___ extension at the ___ level of the connector definition.

<details>
<summary>Answer</summary>

**Answer:** `testConnection` / connector

**Explanation:** `testConnection` is a `x-ms-capabilities` option applied at the connector (root) level. It references an `operationId` that returns HTTP 200 on success; if the call fails, connection creation is rejected.

</details>

---

### Q3 — Single Choice

A developer needs to configure a drop-down list for a parameter but the API has both a path parameter and a body parameter with the same name `id`, causing an ambiguous reference.

Which extension resolves this?

- A. `x-ms-dynamic-values`
- B. `x-ms-dynamic-list`
- C. `x-ms-dynamic-schema`
- D. `x-ms-url-encoding`

<details>
<summary>Answer</summary>

**Correct answer:** B. `x-ms-dynamic-list`

**Explanation:** `x-ms-dynamic-list` (version 2) was specifically designed to resolve ambiguous references between path and body parameters that share the same name — a limitation of the older `x-ms-dynamic-values` extension.

</details>

---

### Q4 — Fill-in-the-Blank

The custom connector designer can configure `x-ms-dynamic-values` but NOT ___. To add the latter, a developer must edit the OpenAPI definition directly.

<details>
<summary>Answer</summary>

**Answer:** `x-ms-dynamic-list`

**Explanation:** The designer's **Dropdown type → Dynamic** setting only generates `x-ms-dynamic-values`. Adding `x-ms-dynamic-list` requires direct YAML or JSON editing via the Swagger editor or CLI.

</details>

---

### Q5 — Single Choice

You are implementing `x-ms-dynamic-properties` on a custom connector. What must the referenced API operation return?

- A. An array of key-value pairs representing allowed values.
- B. A valid JSON schema describing which parameters should be visible.
- C. An HTTP 200 response with an empty body to confirm availability.
- D. A list of operation IDs that are available for the selected type.

<details>
<summary>Answer</summary>

**Correct answer:** B. A valid JSON schema describing which parameters should be visible.

**Explanation:** Dynamic schema extensions require the API to return a valid JSON schema object. This schema defines property types, summaries, visibility (`important`/`advanced`), and required fields, which the connector runtime uses to dynamically render the action card.

</details>

---

### Q6 — Fill-in-the-Blank

By default, path parameters are ___ URL-encoded. Adding `x-ms-url-encoding: double` to a parameter enables ___ URL encoding.

<details>
<summary>Answer</summary>

**Answer:** single / double

**Explanation:** The `x-ms-url-encoding` extension is needed when the underlying API expects double encoding for characters like `@`, `/`, or `\` that would otherwise introduce ambiguity in the URL path.

</details>

---

### Q7 — Single Choice

A developer wants to hide a test-only operation from makers who use the connector in Power Automate.

What setting should be applied to that operation?

- A. Set `x-ms-visibility` to `advanced`.
- B. Mark the operation as `internal`.
- C. Remove the operation from the OpenAPI definition after testing.
- D. Set `x-ms-capabilities` to `hidden` on the operation.

<details>
<summary>Answer</summary>

**Correct answer:** B. Mark the operation as `internal`.

**Explanation:** Setting an operation's visibility to `internal` hides it from makers in the designer and flow editors while still allowing the connector runtime (and `testConnection`) to invoke it.

</details>

---
