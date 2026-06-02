# Quiz: Get Started with Custom Connectors in Microsoft Power Platform

> **Source material:** 1-introduction.md, 2-demo.md, 3-explore.md, 4-build.md, 5-use.md, 6-use-power-automate.md, 7-check.md, 8-summary.md
> **Total questions:** 22
> **Question types:** Multiple choice (single), Multiple choice (multi-select), Fill-in-the-blank

---

## Questions

### Question 1 — Single Choice

Your organization uses an internal REST API hosted on a private network. You want to create a custom connector so Power Automate flows can call this API. What additional component is required to access the private API?

- A. Azure API Management
- B. An OAuth 2.0 identity provider
- C. The on-premises data gateway
- D. A certified connector submission

<details>
<summary>Answer</summary>

**Correct answer:** C. The on-premises data gateway

**Explanation:** Private APIs (those only available on an internal network) require the on-premises data gateway to allow Power Platform to access internal resources.

</details>

---

### Question 2 — Single Choice

A developer is building a custom connector and wants to describe the API by importing an existing specification file. The API publisher provides an OpenAPI definition file. Which version of OpenAPI is supported for import into custom connectors?

- A. Version 1.0 only
- B. Version 2.0 only
- C. Version 3.0 only
- D. Both version 2.0 and 3.0

<details>
<summary>Answer</summary>

**Correct answer:** B. Version 2.0 only

**Explanation:** When importing an OpenAPI definition into a custom connector, only version 2.0 is supported. Version 3.0 is not currently supported.

</details>

---

### Question 3 — Single Choice

A connector author has created a custom connector with 12 actions. Two of those actions are helper operations used internally by the connector's logic and should never appear in the action selection list for makers. Which visibility setting should be applied to these two actions?

- A. None
- B. Advanced
- C. Important
- D. Internal

<details>
<summary>Answer</summary>

**Correct answer:** D. Internal

**Explanation:** Setting an action's visibility to **Internal** hides it from the maker experience entirely. This is the appropriate setting for actions that support dynamic connector metadata or are not intended for direct use by makers.

</details>

---

### Question 4 — Single Choice

An organization wants to make their custom connector available as a prebuilt connector to all Microsoft Power Platform customers worldwide, not just their own environments. What must they do?

- A. Export the connector as a solution and publish it to Microsoft AppSource.
- B. Share the connector definition with all users in their tenant.
- C. Submit the connector for certification by Microsoft.
- D. Publish the OpenAPI definition to GitHub as open source.

<details>
<summary>Answer</summary>

**Correct answer:** C. Submit the connector for certification by Microsoft.

**Explanation:** Certifying a connector makes it available as a prebuilt connector in all customer environments. Certification requires that you own the API or have explicit permission from the API owner. Simply sharing as open source makes it available for import but does not make it a certified prebuilt connector.

</details>

---

### Question 5 — Single Choice

A maker is configuring request parameters for a custom connector action. One parameter named `toDate` is used infrequently, but when provided it must be a valid date. The maker wants the parameter to remain accessible without cluttering the main view. Which visibility setting is most appropriate?

- A. Internal
- B. Important
- C. Advanced
- D. None

<details>
<summary>Answer</summary>

**Correct answer:** C. Advanced

**Explanation:** Setting a parameter's visibility to **Advanced** keeps it available but not prioritized, so it won't clutter the main view. It appears only when the user expands advanced options.

</details>

---

### Question 6 — Single Choice

A custom connector is built in a development environment within a solution. The team needs to deploy it to a production environment with no additional manual configuration in the target environment. Which deployment option best meets this requirement?

- A. Download and import the OpenAPI definition file.
- B. Use the Power Platform Connectors CLI to download and import.
- C. Export and import the solution containing the custom connector.
- D. Re-create the connector manually in the production environment.

<details>
<summary>Answer</summary>

**Correct answer:** C. Export and import the solution containing the custom connector.

**Explanation:** Custom connectors created inside a solution can be exported and imported into another environment with no extra configuration required in the target. This option requires Microsoft Dataverse in both source and target environments and provides the most robust ALM capability.

</details>

---

### Question 7 — Single Choice

You are configuring a custom connector that calls an API secured by a token provided by the API publisher. This token must be included in every request. Which authentication type should you configure?

- A. Basic authentication
- B. OAuth 2.0
- C. No authentication
- D. API key

<details>
<summary>Answer</summary>

**Correct answer:** D. API key

**Explanation:** An API key is a token provided by the API publisher that must be included in each request. This differs from OAuth 2.0, which handles authorization through a full identity provider flow.

</details>

---

### Question 8 — Single Choice

A maker is looking for a custom connector action while building a Power Automate flow. What is the fastest way to locate custom connectors in the connector selection experience?

- A. Search for the connector name in the All tab.
- B. Browse the Standard tab and filter by category.
- C. Select the Custom tab, which shows only custom connectors.
- D. Open the connector reference documentation and copy the connector ID.

<details>
<summary>Answer</summary>

**Correct answer:** C. Select the Custom tab, which shows only custom connectors.

**Explanation:** Using the **Custom** tab filters the connector list to show only custom connectors in the environment, making it the fastest way to locate and select them when building apps or flows.

</details>

---

### Question 9 — Single Choice

During connector configuration, a developer notices a blue information icon next to the **GetInvoice** operation in the Definition tab. What does this icon most likely indicate?

- A. The operation uses an unsupported HTTP method.
- B. The operation is hidden from the maker experience.
- C. The operation is missing a required field such as a Summary.
- D. The operation has a conflicting parameter name.

<details>
<summary>Answer</summary>

**Correct answer:** C. The operation is missing a required field such as a Summary.

**Explanation:** In the custom connector Definition tab, a blue information icon on an operation indicates that something needs attention, such as a missing **Summary** or **Description** field.

</details>

---

### Question 10 — Single Choice

Your API is deployed as an Azure Function. You want to create a custom connector with the least amount of manual configuration. Which approach should you use?

- A. Manually create the connector in the maker portal.
- B. Import an OpenAPI definition downloaded from GitHub.
- C. Export the connector definition directly from Azure Functions.
- D. Import the connector from the Power Platform Connectors repository.

<details>
<summary>Answer</summary>

**Correct answer:** C. Export the connector definition directly from Azure Functions.

**Explanation:** If your API is built as an Azure App Service, Azure Functions, or managed by Azure API Management, you can export from those services and it will automatically create the initial custom connector definition, minimizing manual configuration.

</details>

---

### Question 11 — Single Choice

A custom connector has been certified and is now available as a prebuilt connector. A developer wants to extend it with two additional actions that the prebuilt version does not expose. What is the recommended approach?

- A. Modify the certified connector definition directly.
- B. Build a second custom connector that covers only the additional actions.
- C. Re-certify the connector with the new actions added.
- D. Use the Power Platform CLI to patch the prebuilt connector.

<details>
<summary>Answer</summary>

**Correct answer:** B. Build a second custom connector that covers only the additional actions.

**Explanation:** If a prebuilt connector doesn't expose all triggers and actions needed from an API, you can build a custom connector in addition to the available one to handle these extra requirements.

</details>

---

### Question 12 — Single Choice

Which of the following authentication types is **not** supported by custom connectors in Power Platform?

- A. Anonymous
- B. API key
- C. Cookie authentication
- D. OAuth 2.0

<details>
<summary>Answer</summary>

**Correct answer:** C. Cookie authentication

**Explanation:** Custom connectors support No authentication (anonymous), Basic authentication, OAuth 2.0, and API key. Cookie authentication is not a supported authentication type.

</details>

---

### Question 13 — Single Choice

A maker builds a custom connector outside of any solution and wants to reuse it in a second environment that does not have Microsoft Dataverse provisioned. Which deployment option is available?

- A. Export the solution and import it into the target environment.
- B. Download the OpenAPI definition and import it into the target environment.
- C. Use the certified connector catalog to push it to the target environment.
- D. Share the connector directly across environments from the maker portal.

<details>
<summary>Answer</summary>

**Correct answer:** B. Download the OpenAPI definition and import it into the target environment.

**Explanation:** When Dataverse is not available, the solution-based approach cannot be used. Downloading the OpenAPI definition and importing it into the target environment is the appropriate option, although some additional configuration in the target environment may still be required.

</details>

---

### Question 14 — Multi-Select

A team is designing a custom connector for an internal API. They want to ensure that makers can easily discover and use the connector's actions. Select **three** practices that improve the maker experience. (Select **three**.)

- A. Set all actions to Internal visibility.
- B. Provide a descriptive Summary for each action.
- C. Add a clear Description for each parameter.
- D. Use camel case for the Operation ID.
- E. Set the connector name to match the internal API endpoint URL.
- F. Set frequently used actions to Important visibility.

<details>
<summary>Answer</summary>

**Correct answer:** B, C, F

**Explanation:** A descriptive **Summary** helps makers find actions through search. A clear **Description** on each parameter serves as placeholder text and guides input. Setting key actions to **Important** visibility ensures they appear first in the list. Operation IDs use camel case for readability but are internal identifiers and do not directly improve the maker experience.

</details>

---

### Question 15 — Multi-Select

A solution architect is evaluating approaches to describe a custom connector's API. Which **two** approaches allow you to subsequently refine the connector definition manually in the maker portal? (Select **two**.)

- A. Import an OpenAPI definition file.
- B. Manually create the connector in the portal.
- C. Export the connector from Azure API Management (read-only export).
- D. Import from the Power Platform Connectors GitHub repository.
- E. Use only the swagger editor without saving.

<details>
<summary>Answer</summary>

**Correct answer:** A, B

**Explanation:** Both importing an OpenAPI definition and manually creating the connector in the portal allow you to continue editing and refining the connector definition afterward in the maker portal. The documentation explicitly notes that if you choose to import an OpenAPI definition, you can still manually manipulate your connector's definition in the portal.

</details>

---

### Question 16 — Multi-Select

Your organization is planning to use a custom connector across Power Apps, Power Automate, and Azure Logic Apps. Which **two** statements accurately describe how the connector must be deployed? (Select **two**.)

- A. A custom connector deployed in one Power Platform environment is automatically available in all other environments.
- B. To use a custom connector in Azure Logic Apps, you must recreate the connector in your Azure subscription.
- C. The first time a custom connector is used in an app or flow, the user is prompted to provide credentials or an API key.
- D. Custom connectors in Power Apps can be used without configuring them in the same environment.
- E. Certified connectors do not need to be deployed per environment.

<details>
<summary>Answer</summary>

**Correct answer:** B, C

**Explanation:** For Azure Logic Apps, you must recreate the connector in your Azure subscription using the downloaded OpenAPI file or CLI. The first time any user uses a custom connector, they are prompted to establish a connection by providing credentials or an API key, which can then be reused.

</details>

---

### Question 17 — Multi-Select

When reviewing the request parameters of a custom connector action, which **three** fields should a developer review and update to improve the maker experience? (Select **three**.)

- A. Name
- B. Summary
- C. Description
- D. Internal API endpoint
- E. Visibility
- F. Connector icon color

<details>
<summary>Answer</summary>

**Correct answer:** B, C, E

**Explanation:** The **Summary** makes the parameter human-readable, the **Description** provides placeholder text to guide makers, and the **Visibility** setting controls whether the parameter is shown by default, shown as advanced, or hidden. The **Name** must not be changed as it must match what the API expects.

</details>

---

### Question 18 — Fill-in-the-Blank

A connector is a ___ or a wrapper around an API that allows Power Automate, Power Apps, and Logic Apps to communicate with the underlying service.

<details>
<summary>Answer</summary>

**Answer:** proxy

**Explanation:** The documentation defines a connector as "a proxy, or a wrapper, around an API" that enables the Power Platform products to communicate with the underlying service.

</details>

---

### Question 19 — Fill-in-the-Blank

To access a private API (one available only on your internal network) through a custom connector, you need the ___ ___ ___ ___.

<details>
<summary>Answer</summary>

**Answer:** on-premises data gateway

**Explanation:** The introduction unit states that private APIs require the on-premises data gateway to access internal resources.

</details>

---

### Question 20 — Fill-in-the-Blank

The **Operation ID** in a custom connector must be unique, cannot contain ___, and using ___ case is recommended to improve readability.

<details>
<summary>Answer</summary>

**Answer:** spaces; camel

**Explanation:** The documentation states that the operation ID must be unique and cannot contain spaces, and recommends using camel case (e.g., GetInvoice) to improve readability, particularly for makers who use screen readers.

</details>

---

### Question 21 — Fill-in-the-Blank

When you want to submit a connector for certification, you must own the ___ or have explicit ___ from its owner to publish a connector.

<details>
<summary>Answer</summary>

**Answer:** API; permission

**Explanation:** The introduction states: "Certifying a connector requires that you own the API or have explicit permission to publish a connector from the API owner."

</details>

---

### Question 22 — Fill-in-the-Blank

The ___ option on an action causes it to appear first in the action list, while the ___ option causes it to appear but not be prioritized.

<details>
<summary>Answer</summary>

**Answer:** Important; Advanced

**Explanation:** Actions set to **Important** are shown first in the list. Actions set to **Advanced** are available but not prioritized, requiring the user to expand the view to see them.

</details>
