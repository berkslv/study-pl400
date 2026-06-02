# Recall: Policy Templates for Custom Connectors

> **Source files:** 1-introduction.md, 2-expressions-runtime.md, 3-policies-data-conversion.md, 4-configure-host-url-routing.md, 5-add-update-values.md, 6-exercise.md

---

## Keywords

| Term | Definition |
|------|-----------|
| Policy template | A reusable configuration applied to a custom connector to modify its runtime behavior. |
| policyTemplateInstances | Section in `apiProperties.json` that stores all configured policies for a connector. |
| connectionParameters | Properties in `apiProperties.json` that define input fields shown when creating a new connection. |
| `@connectionParameters()` | Expression to access values entered by the user when creating a connector connection. |
| `@body()` | Expression to access the request or response body at runtime in policy configurations. |
| Set host URL | Policy template that replaces the static host URL with a dynamically built or user-supplied URL. |
| Route request | Policy template that redirects an action's path to a different endpoint on the same host. |
| Set property | Policy template that adds or updates a property in the request or response body. |
| Set query string parameter | Policy template that adds or updates a query parameter with Override, Skip, or Append behavior. |
| Set HTTP header | Policy template that adds or updates a value in the request, response, or failure header. |
| Convert delimited string into an array | Policy template that splits a delimited string from the response into an array of objects. |
| paconn | CLI tool (part of Microsoft Power Platform CLI) used to download and update connector definitions. |
| apiProperties.json | File storing connector policy configurations and connection parameters, separate from the API definition. |

---

## Main Ideas

- Policies modify custom connector behavior at runtime: data conversion, request routing, setting parameter values, etc.
- Policy templates are configured in the custom connector designer (portal) or directly in `apiProperties.json`.
- API properties are stored separately from the API definition; importing an updated API definition does **not** overwrite configured policies.
- Policy order matters: policies in the list are applied in sequence; use the ellipsis (`...`) menu to reorder.
- When a policy runs on all actions and triggers, all data paths used must be valid for every action, or runtime errors occur.
- Expressions are prefixed with `@` and evaluated at runtime; use `{}` notation to coerce numeric values to strings.
- Use single quotation marks for string literals in expressions; double quotation marks conflict with surrounding markup.
- `@body()`, `@headers('name')`, `@queryParameters('name')`, and `@connectionParameters('name')` are the four main expression sources.
- The **Run policy on** parameter determines whether a convert policy applies to the request or the response; configuring both requires two separate policy templates.
- After adding a response-transforming policy, reimport sample data on the action so apps and flows see the transformed schema.
- **Set host URL** supports fully dynamic URLs (user-supplied) or partially dynamic URLs (e.g., only the account name is collected, and the rest is static).
- **Route request** is useful when multiple actions need to share the same underlying API path but differ in behavior or defaults.
- **Set query string parameter** supports `Override`, `Skip` (default values), and `Append` modes.
- `paconn download` exports four files: `apiDefinition.swagger.json`, `apiProperties.json`, `icon.png`, `settings.json`.
- `paconn update` pushes local changes back to the environment.

---

## Mini Quiz

### Q1 — Single Choice

A developer wants to allow users to choose between a test and production API endpoint each time they create a connection.

Which policy template should be used?

- A. Route request
- B. Set HTTP header
- C. Set host URL
- D. Set property

<details>
<summary>Answer</summary>

**Correct answer:** C. Set host URL

**Explanation:** The **Set host URL** policy template lets a connection parameter (e.g., `hostUrl`) supply the base URL at connection creation time, enabling test vs. production scenarios.

</details>

---

### Q2 — Fill-in-the-Blank

Policy configurations are stored in the `___` file and are separate from the `___` file, so updating the API definition does not overwrite policies.

<details>
<summary>Answer</summary>

**Answer:** `apiProperties.json`; `apiDefinition.swagger.json`

**Explanation:** The introduction unit states that API properties are stored separately from the API definition, and importing an updated API definition does not overwrite configured policies.

</details>

---

### Q3 — Single Choice

A flow action response contains a comma-separated string of user names. A developer wants to split it into an array for easier consumption in Power Automate.

Which policy template is the best choice?

- A. Convert an array to an object
- B. Convert delimited string into an array of objects
- C. Set property
- D. Set query string parameter

<details>
<summary>Answer</summary>

**Correct answer:** B. Convert delimited string into an array of objects

**Explanation:** The **Convert delimited string into an array** policy template splits a delimited string from a response into a new array property, making it easier for apps and flows to consume.

</details>

---

### Q4 — Fill-in-the-Blank

To access the value of a connection parameter named `hostUrl` in a policy expression, you write `___`.

<details>
<summary>Answer</summary>

**Answer:** `@connectionParameters('hostUrl')`

**Explanation:** The `@connectionParameters('name')` expression retrieves the value the user entered for that connection property when setting up the connector.

</details>

---

### Q5 — Single Choice

A developer creates a **List Big Invoices** action that should call the same underlying API path as **List Invoices** (`/ListInvoices`). Defining both actions with the same path causes an error.

What is the recommended solution?

- A. Delete the original List Invoices action and redefine it.
- B. Set a different host URL for List Big Invoices.
- C. Define List Big Invoices with a dummy path and use a **Route request** policy to redirect it to `/ListInvoices`.
- D. Use a **Set property** policy to merge both actions into one.

<details>
<summary>Answer</summary>

**Correct answer:** C. Define List Big Invoices with a dummy path and use a **Route request** policy to redirect it to `/ListInvoices`.

**Explanation:** The **Route request** policy modifies the path portion of the URL, allowing a unique action path to redirect to an existing API endpoint.

</details>

---

### Q6 — Single Choice

The **Set query string parameter** policy is configured with `action if the parameter exists = Skip`. What is the effect when the maker already provides a value for that parameter?

- A. The policy overrides the maker's value with its own.
- B. The policy appends its value after the maker's value.
- C. The policy leaves the maker's existing value unchanged.
- D. The policy removes the parameter from the query string.

<details>
<summary>Answer</summary>

**Correct answer:** C. The policy leaves the maker's existing value unchanged.

**Explanation:** The **Skip** option means the policy does not replace an already-present value, making it useful for setting default values only when the maker omits the parameter.

</details>

---

### Q7 — Fill-in-the-Blank

You can view and reorder configured policies in the portal by selecting the `___` icon next to each policy in the list.

<details>
<summary>Answer</summary>

**Answer:** ellipsis (`...`)

**Explanation:** The introduction unit states that selecting the ellipsis next to a policy allows you to move it up or down, controlling the order policies are applied at runtime.

</details>

---
