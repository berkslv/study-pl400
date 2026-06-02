# Quiz: Custom Connectors and OpenAPI Extensions

> **Source material:** 1-introduction.md, 2-open-api-extensions.md, 3-dynamic-list-value-extension.md, 4-dynamic-schema.md, 5-exercise.md, 7-summary.md
> **Total questions:** 22
> **Question types:** Multiple choice (single), Multiple choice (multi-select), Fill-in-the-Blank

---

## Questions

### Question 1 — Single Choice

You are reviewing an OpenAPI definition for a custom connector and notice several properties prefixed with a specific pattern. Which naming pattern identifies Microsoft-specific OpenAPI extensions?

- A. `ms-x-<name>`
- B. `x-ms-<name>`
- C. `msext-<name>`
- D. `swagger-ms-<name>`

<details>
<summary>Answer</summary>

**Correct answer:** B. `x-ms-<name>`

**Explanation:** Microsoft OpenAPI extensions are identified by the `x-ms-<name>` pattern in OpenAPI definitions. For example, `x-ms-summary`, `x-ms-dynamic-values`, and `x-ms-capabilities` all follow this convention.

</details>

---

### Question 2 — Single Choice

A maker building a Power Automate flow needs to pass an internal numeric ID for Invoice Type but does not know which number maps to which invoice type. You want to present a friendly drop-down list populated from the API instead. Which extension should you configure on the parameter?

- A. `x-ms-capabilities`
- B. `x-ms-url-encoding`
- C. `x-ms-dynamic-values`
- D. `x-ms-dynamic-schema`

<details>
<summary>Answer</summary>

**Correct answer:** C. `x-ms-dynamic-values`

**Explanation:** The `x-ms-dynamic-values` extension populates a parameter's drop-down list by calling an API operation, allowing makers to select friendly labels instead of raw internal values.

</details>

---

### Question 3 — Single Choice

Your custom connector's underlying API uses chunking to handle large file uploads. You want flows using your connector to be able to transfer large messages. What is the minimum set of requirements for chunk transfer to work?

- A. Only the API must support chunking.
- B. Only the custom connector must enable the chunk transfer capability extension.
- C. The API must support chunking, the connector must enable the extension, and the maker must enable "Allow chunking" on the flow step.
- D. The API must support chunking and the maker must enable "Allow chunking"; no connector-level configuration is needed.

<details>
<summary>Answer</summary>

**Correct answer:** C. The API must support chunking, the connector must enable the extension, and the maker must enable "Allow chunking" on the flow step.

**Explanation:** All three conditions are required: the underlying API must support chunking, the custom connector definition must include `chunkTransfer: true` in the operation's `x-ms-capabilities`, and the maker must turn on the "Allow chunking" option on the flow step.

</details>

---

### Question 4 — Single Choice

You configure `testConnection` on your custom connector. A user attempts to create a connection by using an invalid API key. What is the expected result?

- A. The connection is created successfully but fails on the first action call.
- B. The connection creation fails immediately.
- C. The connector ignores the test and creates the connection anyway.
- D. The designer shows a warning but still saves the connection.

<details>
<summary>Answer</summary>

**Correct answer:** B. The connection creation fails immediately.

**Explanation:** When `testConnection` is configured, the specified operation is called during connection creation. If the operation does not return HTTP 200, the connection creation fails, preventing invalid connections from being saved.

</details>

---

### Question 5 — Single Choice

You want to configure the `testConnection` capability on a custom connector. At which level of the OpenAPI definition must you place the `x-ms-capabilities` extension for `testConnection`?

- A. Operation level
- B. Parameter level
- C. Connector (root) level
- D. Response level

<details>
<summary>Answer</summary>

**Correct answer:** C. Connector (root) level

**Explanation:** The `testConnection` option of the `x-ms-capabilities` extension is a connector-level setting, meaning it is defined at the root of the OpenAPI definition rather than on an individual operation.

</details>

---

### Question 6 — Single Choice

A custom connector action uses a path parameter called `country` in the URL `https://myapi.myservice.com/customers/{country}`. The API expects this parameter to be double URL-encoded due to special characters. Which extension should you add to the parameter?

- A. `x-ms-capabilities: double`
- B. `x-ms-dynamic-values: double`
- C. `x-ms-url-encoding: double`
- D. `x-ms-encoding: path`

<details>
<summary>Answer</summary>

**Correct answer:** C. `x-ms-url-encoding: double`

**Explanation:** The `x-ms-url-encoding` extension is applied to path parameters to configure single or double URL encoding. Setting it to `double` ensures the connector runtime double-encodes the value, which is required by some APIs to handle special characters correctly.

</details>

---

### Question 7 — Single Choice

Your team wants to add the `x-ms-dynamic-list` extension to a parameter but the custom connector designer does not expose it in the UI. How must this extension be configured?

- A. It can only be set by importing a new OpenAPI file from scratch.
- B. It must be configured by directly editing the OpenAPI definition via the Swagger editor, paconn CLI, or Power Platform CLI.
- C. It is automatically added when `x-ms-dynamic-values` is saved.
- D. It requires a support ticket to Microsoft to enable in the tenant.

<details>
<summary>Answer</summary>

**Correct answer:** B. It must be configured by directly editing the OpenAPI definition via the Swagger editor, paconn CLI, or Power Platform CLI.

**Explanation:** The custom connector designer only configures `x-ms-dynamic-values`. To add `x-ms-dynamic-list`, you must directly edit the OpenAPI definition using the built-in Swagger editor, the paconn CLI, or the Power Platform CLI.

</details>

---

### Question 8 — Single Choice

`x-ms-dynamic-list` is described as "Version 2" of the dynamic values capability. What specific limitation of `x-ms-dynamic-values` does `x-ms-dynamic-list` resolve?

- A. It adds support for multi-select drop-down lists.
- B. It allows the list to be filtered by user security roles.
- C. It resolves ambiguous references when a request has both a path parameter and a body parameter with the same name.
- D. It enables caching of the returned list values for better performance.

<details>
<summary>Answer</summary>

**Correct answer:** C. It resolves ambiguous references when a request has both a path parameter and a body parameter with the same name.

**Explanation:** `x-ms-dynamic-list` improves the schema for action parameters, allowing the runtime to differentiate between a path parameter and a body parameter that share the same name — a scenario that `x-ms-dynamic-values` cannot handle.

</details>

---

### Question 9 — Single Choice

You are designing a custom connector and want to support both older existing flows and newly created flows that use dynamic list values. What is the recommended approach?

- A. Use only `x-ms-dynamic-list` because it is the newer version.
- B. Use only `x-ms-dynamic-values` because it has broader support.
- C. Implement both `x-ms-dynamic-values` and `x-ms-dynamic-list` in the definition.
- D. Use `enum` values as a fallback for older flows.

<details>
<summary>Answer</summary>

**Correct answer:** C. Implement both `x-ms-dynamic-values` and `x-ms-dynamic-list` in the definition.

**Explanation:** Microsoft recommends implementing both extensions together when you need to support existing older flows (which rely on `x-ms-dynamic-values`) as well as newly created flows (which benefit from the improved `x-ms-dynamic-list`).

</details>

---

### Question 10 — Single Choice

A maker is building a flow using an **AddInvoice** action. When they select "Purchase Order" as the invoice type, an additional "Purchase Order Number" field appears. When they switch to "Non-Purchase Order," that field disappears. Which OpenAPI extension enables this behaviour?

- A. `x-ms-dynamic-values`
- B. `x-ms-capabilities`
- C. `x-ms-dynamic-schema` / `x-ms-dynamic-properties`
- D. `x-ms-url-encoding`

<details>
<summary>Answer</summary>

**Correct answer:** C. `x-ms-dynamic-schema` / `x-ms-dynamic-properties`

**Explanation:** Dynamic schema extensions (`x-ms-dynamic-schema` v1 and `x-ms-dynamic-properties` v2) call an API operation at design time to retrieve the list of parameters relevant to the current context, showing or hiding fields based on the selected invoice type.

</details>

---

### Question 11 — Single Choice

For dynamic schema to work on a custom connector, the underlying API must provide a specific operation. What must that operation return?

- A. An HTML form describing the parameters.
- B. A valid JSON schema object.
- C. A comma-separated list of field names.
- D. An OpenAPI YAML fragment.

<details>
<summary>Answer</summary>

**Correct answer:** B. A valid JSON schema object.

**Explanation:** The operation used by dynamic schema must return a valid JSON schema. The runtime uses this schema to determine which parameters to display, including their types, summaries, descriptions, visibility, and required status.

</details>

---

### Question 12 — Single Choice

In a dynamic schema JSON response, which property indicates that a parameter should always be visible to the maker without requiring any additional action?

- A. `"x-ms-visibility": "advanced"`
- B. `"required": true`
- C. `"x-ms-visibility": "important"`
- D. `"x-ms-summary": "visible"`

<details>
<summary>Answer</summary>

**Correct answer:** C. `"x-ms-visibility": "important"`

**Explanation:** Setting `"x-ms-visibility": "important"` in the dynamic schema response marks a parameter as always visible in the Power Automate designer. Using `"advanced"` means the parameter is hidden until the maker takes an action to reveal it.

</details>

---

### Question 13 — Single Choice

You need to configure dynamic schema extensions on a custom connector but the designer does not support editing these values through the UI. Which approach is NOT a valid way to make these changes?

- A. Use the built-in Swagger editor.
- B. Use the paconn CLI to download and edit the JSON definition.
- C. Use the Power Platform CLI to download and edit the definition in a solution.
- D. Edit the values in the custom connector's Test tab.

<details>
<summary>Answer</summary>

**Correct answer:** D. Edit the values in the custom connector's Test tab.

**Explanation:** The Test tab is used for running operations against the API, not for editing the OpenAPI definition. Valid methods for configuring dynamic schema extensions are the Swagger editor, the paconn CLI, and the Power Platform CLI.

</details>

---

### Question 14 — Single Choice

When you want the `testConnection` operation to be available for validation only and not appear as a usable action for makers, what should you set on that operation?

- A. Set `x-ms-capabilities: hidden`
- B. Mark the operation as `internal` in the Visibility setting.
- C. Delete the operation from the Actions list after configuration.
- D. Set the `required` flag to `false` on all parameters.

<details>
<summary>Answer</summary>

**Correct answer:** B. Mark the operation as `internal` in the Visibility setting.

**Explanation:** Marking an operation as `internal` hides it from the connector's action list so makers cannot accidentally use it. This is the recommended approach for operations created specifically to support `testConnection`.

</details>

---

### Question 15 — Multi-Select

You are deciding between using `enum` (static values) and `x-ms-dynamic-values` for a parameter drop-down list. Which of the following are benefits of `x-ms-dynamic-values` over `enum`? (Select **three**.)

- A. The returned values always reflect the current valid values from the API.
- B. The API can filter the list based on security or user context.
- C. It requires no API support, making it easier to implement.
- D. A user-friendly label can be displayed alongside the underlying value.
- E. Static definitions never need updating when the API adds new values.

<details>
<summary>Answer</summary>

**Correct answer:** A, B, D

**Explanation:** `x-ms-dynamic-values` returns live values from the API (A), supports per-user security filtering (B), and can show a friendly label in addition to the internal value (D). Option C is incorrect because dynamic values *does* require API support. Option E describes a disadvantage of `enum`, not a benefit of dynamic values.

</details>

---

### Question 16 — Multi-Select

A colleague asks which tools can be used to edit the OpenAPI definition of a custom connector in order to add Microsoft OpenAPI extensions. Which of the following are valid methods? (Select **three**.)

- A. Built-in Swagger editor in the custom connector designer.
- B. Microsoft Power Platform Connectors CLI (paconn).
- C. The Power Apps Studio formula bar.
- D. Microsoft Power Platform CLI.
- E. Exporting the connector as a managed solution and editing it inside Dataverse.

<details>
<summary>Answer</summary>

**Correct answer:** A, B, D

**Explanation:** The built-in Swagger editor (A), the paconn CLI (B), and the Power Platform CLI (D) are all documented ways to edit OpenAPI extension settings for custom connectors. The Power Apps formula bar (C) and managed solution editing (E) are not valid methods for this purpose.

</details>

---

### Question 17 — Multi-Select

In the Swagger editor for custom connectors, which of the following YAML best practices are specifically called out in the documentation? (Select **two**.)

- A. Indentation is part of the YAML specification and must be observed carefully.
- B. All YAML keys must be enclosed in double quotes.
- C. Open braces `{` must always be matched with a closing brace `}`.
- D. Comments starting with `#` are required for each section.

<details>
<summary>Answer</summary>

**Correct answer:** A, C

**Explanation:** The documentation explicitly highlights that indentation matters in YAML (A) and that open braces or brackets must always be closed (C). YAML keys do not require double quotes (B) and comment usage is not mentioned as a requirement (D).

</details>

---

### Question 18 — Multi-Select

You are configuring an action that uses `x-ms-dynamic-properties`. Which of the following statements about this extension are correct? (Select **two**.)

- A. It is the Version 2 dynamic schema extension.
- B. It can receive parameters from the action card to dynamically adjust the schema.
- C. It is configured through the custom connector designer UI without editing YAML.
- D. It replaces `x-ms-dynamic-values` for populating drop-down lists.

<details>
<summary>Answer</summary>

**Correct answer:** A, B

**Explanation:** `x-ms-dynamic-properties` is Version 2 of the dynamic schema capability (A), and it accepts parameters (such as `typeId`) passed from the action card to retrieve the correct schema (B). It must be configured by directly editing the OpenAPI definition (C is incorrect), and it is a dynamic *schema* extension, not a replacement for `x-ms-dynamic-values` which handles drop-down lists (D is incorrect).

</details>

---

### Question 19 — Fill-in-the-Blank

The `x-ms-capabilities` extension is used at the operation level to enable ___, and at the connector level to enable ___.

<details>
<summary>Answer</summary>

**Answer:** `chunkTransfer` (chunk transfer); `testConnection` (test connection)

**Explanation:** The two documented capability options are `chunkTransfer`, configured at the operation level to allow large message chunking, and `testConnection`, configured at the connector (root) level to validate credentials when a connection is created.

</details>

---

### Question 20 — Fill-in-the-Blank

When you need to add the `x-ms-dynamic-list` extension to a parameter, you cannot use the custom connector designer because it only configures ___. You must edit the OpenAPI definition directly.

<details>
<summary>Answer</summary>

**Answer:** `x-ms-dynamic-values`

**Explanation:** The custom connector designer UI only exposes configuration for `x-ms-dynamic-values`. To add the newer `x-ms-dynamic-list` extension, you must directly edit the OpenAPI definition via the Swagger editor or a CLI tool.

</details>

---

### Question 21 — Fill-in-the-Blank

By default, path parameters in a custom connector are ___ URL-encoded. To make them ___ URL-encoded, you add `x-ms-url-encoding: double` to the parameter definition.

<details>
<summary>Answer</summary>

**Answer:** single; double

**Explanation:** Path parameters are single URL-encoded by default. When the underlying API expects double encoding (to handle characters like `@`, `/`, or `\`), you configure `x-ms-url-encoding: double` on the parameter.

</details>

---

### Question 22 — Fill-in-the-Blank

In a dynamic schema API response, the ___ array lists which parameters are mandatory, and the `x-ms-visibility` property value of ___ causes a parameter to be hidden until the maker takes action to reveal it.

<details>
<summary>Answer</summary>

**Answer:** `required`; `advanced`

**Explanation:** The `required` array in the JSON schema response defines which parameters must be provided. Setting `x-ms-visibility` to `"advanced"` hides the parameter by default, requiring the maker to expand advanced settings to see it, whereas `"important"` keeps it always visible.

</details>
