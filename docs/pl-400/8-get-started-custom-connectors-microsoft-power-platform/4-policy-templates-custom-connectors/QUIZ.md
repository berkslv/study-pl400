# Quiz: Policy Templates for Custom Connectors

> **Source material:** 1-introduction.md, 2-expressions-runtime.md, 3-policies-data-conversion.md, 4-configure-host-url-routing.md, 5-add-update-values.md, 6-exercise.md, 8-summary.md
> **Total questions:** 22
> **Question types:** Multiple choice (single), Multiple choice (multi-select), Fill-in-the-blank

---

## Questions

### Question 1 — Single Choice

You are building a custom connector that must work against a development, test, and production version of an API. Each environment has a different base URL. You want users to provide the URL when creating a connection.

Which policy template is best suited for this scenario?

- A. Route request
- B. Set host URL
- C. Set query string parameter
- D. Set HTTP header

<details>
<summary>Answer</summary>

**Correct answer:** B. Set host URL

**Explanation:** The **Set host URL** policy template allows the host URL to be dynamically configured at connection creation time, making it ideal for handling multiple environments (dev, test, production) with different base URLs.

</details>

---

### Question 2 — Single Choice

A developer exports a custom connector using the `paconn download` command. They want to inspect all configured policies on the connector.

In which file are the policies stored?

- A. `apiDefinition.swagger.json`
- B. `settings.json`
- C. `apiProperties.json`
- D. `icon.png`

<details>
<summary>Answer</summary>

**Correct answer:** C. `apiProperties.json`

**Explanation:** The `paconn download` command downloads four files. Configured policies are stored in the **policyTemplateInstances** section of `apiProperties.json`. The `apiDefinition.swagger.json` file holds the API definition, which is stored separately from policies.

</details>

---

### Question 3 — Single Choice

You configure a policy on a custom connector that applies to all actions and triggers. At runtime, one of the actions fails with an error.

What is the most likely cause of the failure?

- A. Policies cannot be applied to triggers, only to actions.
- B. A data path used in the policy parameters is not valid for all actions and triggers.
- C. The `apiDefinition.swagger.json` file was overwritten during the last import.
- D. The policy template requires the `paconn update` command to activate.

<details>
<summary>Answer</summary>

**Correct answer:** B. A data path used in the policy parameters is not valid for all actions and triggers.

**Explanation:** When configuring a policy to run on all actions and triggers, you must ensure that any data paths used in the policy parameters are valid for all of them; otherwise, runtime errors occur.

</details>

---

### Question 4 — Single Choice

You need to change the order in which two policies execute at runtime in the custom connector designer.

How do you reorder policies in the maker portal?

- A. Delete and recreate the policies in the desired order.
- B. Edit the `apiDefinition.swagger.json` file and reorder the policy entries.
- C. Select the ellipsis (**...**) next to each policy and use the move up/down options.
- D. Policies always execute in alphabetical order and cannot be reordered.

<details>
<summary>Answer</summary>

**Correct answer:** C. Select the ellipsis (**...**) next to each policy and use the move up/down options.

**Explanation:** In the list of configured policies, you can select the ellipsis (**...**) next to each policy and move it up or down to control the order in which policies are applied at runtime.

</details>

---

### Question 5 — Single Choice

You are writing a policy expression that must read a value named `HostUrl` from the connection properties of a custom connector.

Which expression syntax is correct?

- A. `@headers('HostUrl')`
- B. `@queryParameters('HostUrl')`
- C. `@body().HostUrl`
- D. `@connectionParameters('HostUrl')`

<details>
<summary>Answer</summary>

**Correct answer:** D. `@connectionParameters('HostUrl')`

**Explanation:** The `@connectionParameters('connectionParameterName')` expression is used to access values entered when a connection is set up for a custom connector, such as a host URL or API key.

</details>

---

### Question 6 — Single Choice

A policy template expression is expected to return a string value, but the source expression returns a numeric value.

Which notation automatically converts the numeric value to a string?

- A. Prefix the expression with `@@`
- B. Wrap the expression in braces: `@{expression}`
- C. Wrap the expression in double quotation marks: `"@expression"`
- D. Append `.toString()` to the expression

<details>
<summary>Answer</summary>

**Correct answer:** B. Wrap the expression in braces: `@{expression}`

**Explanation:** Using the `{}` (braces) notation around an expression that produces a numeric value automatically converts it to a string, which is required when string input is expected by the parameter.

</details>

---

### Question 7 — Single Choice

You have a response from a **List Invoice** action structured as `{ "invoices": [ { "invoiceid": "1234" } ] }`. You want to write an expression that returns the `invoiceid` from the first item in the invoices array.

Which expression is correct?

- A. `@body().invoices.invoiceid`
- B. `@body().invoices(0).invoiceid`
- C. `@body().invoices[0].invoiceid`
- D. `@response().invoices[0].invoiceid`

<details>
<summary>Answer</summary>

**Correct answer:** C. `@body().invoices[0].invoiceid`

**Explanation:** The `body()` function accesses the response body object. Array elements are accessed with square bracket notation (`[0]` for the first element), and object properties use dot notation.

</details>

---

### Question 8 — Single Choice

A custom connector's API returns a comma-separated list of usernames as a single string property. You want to make it easier for makers to use this data in Power Automate flows.

Which policy template should you apply on the response?

- A. Convert an array to an object
- B. Set property
- C. Convert delimited string into an array of objects
- D. Set HTTP header

<details>
<summary>Answer</summary>

**Correct answer:** C. Convert delimited string into an array of objects

**Explanation:** The **Convert delimited string into an array of objects** policy template transforms a delimited string into an array, making it much easier for apps and flows to work with the individual values.

</details>

---

### Question 9 — Single Choice

After configuring a response policy template that transforms the shape of data returned by an action, makers report that their apps do not see the new properties.

What step must you perform to make the transformed data visible to apps and flows?

- A. Redeploy the connector to a new environment.
- B. Reimport the sample data on the action response.
- C. Run `paconn download` and then `paconn update`.
- D. Remove and re-add the policy template.

<details>
<summary>Answer</summary>

**Correct answer:** B. Reimport the sample data on the action response.

**Explanation:** After configuring response policy templates, you must reimport the sample data on the action response so that apps and flows gain visibility to the transformed data structure.

</details>

---

### Question 10 — Single Choice

Your custom connector has a **List Invoices** action. You want to create a **List Big Invoices** action that shares the same API endpoint but sets a default value for a `fromAmount` parameter. When you try to add the action pointing to the same path, you receive an error.

Which policy template resolves this problem?

- A. Set host URL
- B. Set query string parameter
- C. Route request
- D. Set property

<details>
<summary>Answer</summary>

**Correct answer:** C. Route request

**Explanation:** The **Route request** policy template allows you to define a new action with a different path (e.g., `/ListBigInvoices`) and then route calls to the actual API path (`/ListInvoices`), resolving path conflicts between multiple actions that target the same endpoint.

</details>

---

### Question 11 — Single Choice

You are building a connector for the Azure Key Vault service. Instead of asking users for the full URL (`https://contosokv.vault.azure.net`), you want them to provide only their vault name (`contosokv`).

Which URL template in the **Set host URL** policy correctly builds the full URL from a connection parameter named `keyVaultName`?

- A. `https://connectionParameters('keyVaultName').vault.azure.net`
- B. `https://@connectionParameters('keyVaultName').vault.azure.net`
- C. `https://@{connectionParameters('keyVaultName')}.vault.azure.net`
- D. `https://{{keyVaultName}}.vault.azure.net`

<details>
<summary>Answer</summary>

**Correct answer:** C. `https://@{connectionParameters('keyVaultName')}.vault.azure.net`

**Explanation:** The `@{connectionParameters('keyVaultName')}` expression uses braces notation to embed the connection parameter value (a string) inline in the URL template, producing the full vault URL dynamically.

</details>

---

### Question 12 — Single Choice

A developer uses the **Set query string parameter** policy and wants existing query parameter values set by the maker to be preserved. Only when no value is provided by the maker should the policy's default value be used.

Which **action if the parameter exists** option should they select?

- A. Override
- B. Append
- C. Skip
- D. Merge

<details>
<summary>Answer</summary>

**Correct answer:** C. Skip

**Explanation:** The **Skip** option means the policy value is not applied if the parameter already has a value set by the maker, making it ideal for providing default values without overwriting intentional inputs.

</details>

---

### Question 13 — Single Choice

You want to set a custom HTTP header value on every request sent by your custom connector's actions, regardless of what value the maker may provide.

Which **action if the value exists** option should you use in the **Set HTTP header** policy template?

- A. Skip
- B. Append
- C. Override
- D. Ignore

<details>
<summary>Answer</summary>

**Correct answer:** C. Override

**Explanation:** **Override** replaces any existing header value, ensuring the policy always sets the header to the configured value regardless of what the maker may have provided.

</details>

---

### Question 14 — Single Choice

When writing policy template expressions that include string literals, which quotation mark style is required?

- A. Double quotation marks (`"`)
- B. Single quotation marks (`'`)
- C. Backticks (`` ` ``)
- D. Either single or double quotation marks

<details>
<summary>Answer</summary>

**Correct answer:** B. Single quotation marks (`'`)

**Explanation:** String literals in policy expressions must use single quotation marks. Double quotation marks conflict with the markup used around the expression and should be avoided.

</details>

---

### Question 15 — Single Choice

A developer wants to understand how certified connectors use a specific policy. They want to search for real-world examples of the **setHeader** policy.

What is the recommended approach?

- A. Review the Microsoft Power Platform admin center audit logs.
- B. Search the Microsoft Power Platform Connectors GitHub repository using the policy template name.
- C. Open each connector in the maker portal and inspect the Policies tab.
- D. Run `paconn list --policy setHeader` from the CLI.

<details>
<summary>Answer</summary>

**Correct answer:** B. Search the Microsoft Power Platform Connectors GitHub repository using the policy template name.

**Explanation:** The Microsoft Power Platform Connectors GitHub repository contains many certified and non-certified connectors. Searching by policy template name (e.g., **setHeader**) quickly reveals which connectors use that policy, providing practical examples.

</details>

---

### Question 16 — Multi-Select

You are designing a custom connector and want to use policy templates to simplify the maker experience. Which of the following are valid use cases for applying policy templates to a custom connector? (Select **three**.)

- A. Dynamically setting the host URL at connection creation time
- B. Compiling the connector's Swagger definition from source code
- C. Converting a comma-delimited string in the response to an array
- D. Setting a default value for a query parameter when the maker does not provide one
- E. Generating OAuth 2.0 tokens automatically
- F. Adding a required header value to every API request

<details>
<summary>Answer</summary>

**Correct answer:** A, C, D, F

**Explanation:** Policy templates support dynamic host URL configuration, data conversion (including delimited strings to arrays), setting default query parameter values, and setting HTTP headers. Compiling Swagger definitions and generating OAuth tokens are not policy template functions.

</details>

---

### Question 17 — Multi-Select

A custom connector developer exports the connector definition using `paconn download`. Which files are included in the download? (Select **four**.)

- A. `apiDefinition.swagger.json`
- B. `apiProperties.json`
- C. `connectionParameters.json`
- D. `icon.png`
- E. `settings.json`
- F. `policyTemplates.json`

<details>
<summary>Answer</summary>

**Correct answer:** A, B, D, E

**Explanation:** The `paconn download` command downloads exactly four files: `apiDefinition.swagger.json`, `apiProperties.json`, `icon.png`, and `settings.json`. There is no separate `connectionParameters.json` or `policyTemplates.json` file; connection parameters and policy template instances are embedded in `apiProperties.json`.

</details>

---

### Question 18 — Multi-Select

You are configuring a **Convert array to object** policy for a Microsoft Planner-style connector. In addition to the convert policy, which other policy templates might be needed to fully transform the request data? (Select **two**.)

- A. Set property
- B. Route request
- C. Set host URL
- D. Convert delimited string into an array of objects

<details>
<summary>Answer</summary>

**Correct answer:** A, D

**Explanation:** The Microsoft Planner connector example uses **Set property** to set fields like `previewPriority` and `@odata.type`, combined with **Convert array to object** to reshape the array. A **Convert delimited string** policy could precede the convert policy if the source data is a delimited string that first needs to become an array.

</details>

---

### Question 19 — Fill-in-the-Blank

Policy template configurations are stored in the **___** section of the `apiProperties.json` file and can be viewed and modified using the `paconn ___` command.

<details>
<summary>Answer</summary>

**Answer:** `policyTemplateInstances`; `download`

**Explanation:** All configured policy templates appear in the `policyTemplateInstances` section of `apiProperties.json`. The `paconn download` command retrieves the connector definition files, including this file, from the environment.

</details>

---

### Question 20 — Fill-in-the-Blank

To access the value of a query parameter named `recordCount` in a policy expression, you use the syntax `@___(  '___'  )`.

<details>
<summary>Answer</summary>

**Answer:** `queryParameters`; `recordCount`

**Explanation:** The `@queryParameters('queryParameterName')` expression is used to read query parameter values from the request at runtime inside policy template configurations.

</details>

---

### Question 21 — Fill-in-the-Blank

After importing an updated API definition through the maker portal, the previously configured ___ are **not** overwritten because they are stored separately from the API definition in the `___` file.

<details>
<summary>Answer</summary>

**Answer:** policies (policy templates); `apiProperties.json`

**Explanation:** Configuring a policy template modifies the connector's API properties, which are stored separately from the API definition. Importing an updated API definition does not overwrite the policies that have been configured.

</details>

---

### Question 22 — Fill-in-the-Blank

When a policy applied to all actions causes a runtime failure, the HTTP status code typically returned is ___, and you can isolate the cause by removing an action from the ___ list.

<details>
<summary>Answer</summary>

**Answer:** 500; operations

**Explanation:** A misconfigured policy typically causes an HTTP 500 error at runtime. To determine whether a specific policy is the cause, you can remove an action from the operations list and retest to isolate the problematic configuration.

</details>
