# Recall: Get Started with Custom Connectors in Microsoft Power Platform

> **Source files:** 1-introduction.md, 2-demo.md, 3-explore.md, 4-build.md, 5-use.md, 6-use-power-automate.md, 7-check.md

---

## Keywords

| Term | Definition |
|------|-----------|
| Custom Connector | A user-defined proxy around a REST API enabling Power Apps, Power Automate, and Logic Apps to communicate with it. |
| OpenAPI | A specification (v2.0 supported, v3.0 not) for describing REST APIs; importable to define custom connector actions. |
| Operation ID | A unique, space-free internal identifier for a connector action or trigger (camel case recommended). |
| Action Visibility | A setting (None, Advanced, Internal, Important) controlling how an action appears in the maker experience. |
| API Key | A token provided by the API publisher that must be included in each request as an authentication method. |
| OAuth 2.0 | Industry-standard authorization protocol supported by custom connectors with prebuilt identity-provider configurations. |
| On-Premises Data Gateway | Required component to connect custom connectors to private (internal network) APIs. |
| Connector Certification | Process to make a custom connector available as a prebuilt connector across all customer environments. |
| Policy | A connector setting that changes the behavior of actions and triggers using prebuilt templates. |
| ALM (Application Lifecycle Management) | Deployment capability enabled by solutions for exporting/importing connectors across environments with automation support. |
| Power Platform Connectors CLI | Command-line interface for downloading, importing, and managing custom connector definitions programmatically. |

---

## Main Ideas

- A connector is a proxy/wrapper around an API; custom connectors are created when no prebuilt connector exists or the prebuilt one lacks needed triggers/actions.
- Custom connectors support public (internet-facing) and private (internal) REST APIs; private APIs require the on-premises data gateway.
- Connector definition can be created by: manually building in the portal, importing an OpenAPI 2.0 definition, importing from GitHub (Power Platform Connectors repo), or exporting from Azure (App Service, Functions, API Management).
- OpenAPI version 2.0 is supported for import; version 3.0 is **not** currently supported.
- Supported authentication types: No authentication (anonymous), Basic authentication, OAuth 2.0, API key. Cookie authentication is **not** supported.
- Connector name is limited to **30 characters**; Operation IDs must be unique and cannot contain spaces.
- Action visibility options: **None** (default, displays normally), **Advanced** (available but deprioritized), **Internal** (hidden from users), **Important** (shown first in list).
- Response definitions can vary by HTTP status code; a default response acts as a catch-all.
- To use a custom connector in another environment, deploy it via: download/import of OpenAPI file, solution export/import (requires Dataverse), or Power Platform Connectors CLI.
- Solutions provide the most robust ALM capability including build automation; solution-based connectors require no extra configuration after import.
- For Azure Logic Apps, recreate the custom connector in your Azure subscription using the downloaded OpenAPI file.
- To make a connector available to all Microsoft customers as a prebuilt connector, submit it for certification (requires API ownership or explicit permission).
- Sharing a connector definition as open source on GitHub makes it importable by other customers but does not make it a certified/prebuilt connector.

---

## Mini Quiz

### Q1 — Single Choice

You need to connect a Power Automate flow to an internal corporate REST API not accessible from the internet.

What is required to create a custom connector for this API?

- A. An OAuth 2.0 identity provider registration
- B. An on-premises data gateway
- C. An Azure API Management instance
- D. A certified connector submission

<details>
<summary>Answer</summary>

**Correct answer:** B. An on-premises data gateway

**Explanation:** Private APIs (only accessible on the internal network) require the on-premises data gateway so that the custom connector can reach them.

</details>

---

### Q2 — Fill-in-the-Blank

OpenAPI version ___ is supported for import into custom connectors, while version ___ is currently **not** supported.

<details>
<summary>Answer</summary>

**Answer:** 2.0 ; 3.0

**Explanation:** The documentation explicitly states that importing OpenAPI version 2.0 is supported, but version 3.0 is not currently supported.

</details>

---

### Q3 — Single Choice

You imported an OpenAPI definition containing 10 actions. Two of those actions are used only internally to support dynamic connector metadata and should not appear in any maker's action list.

What visibility setting should you apply to those two actions?

- A. Advanced
- B. None
- C. Important
- D. Internal

<details>
<summary>Answer</summary>

**Correct answer:** D. Internal

**Explanation:** The **Internal** visibility option hides actions from the maker experience entirely, making it ideal for support operations that end users should not access directly.

</details>

---

### Q4 — Fill-in-the-Blank

To make a custom connector available as a prebuilt connector across all customer environments, you must submit it for ___.

<details>
<summary>Answer</summary>

**Answer:** certification

**Explanation:** Certification is the process that promotes a custom connector to a prebuilt connector visible in all customer environments; it requires owning the API or having explicit permission from the API owner.

</details>

---

### Q5 — Single Choice

You have a custom connector built in a development environment and need to promote it to a test environment with full ALM support and no extra configuration after import.

Which deployment method should you use?

- A. Download and import the OpenAPI definition file manually
- B. Use the Power Platform Connectors CLI to upload the swagger.json
- C. Export the connector inside a solution and import the solution into the target environment
- D. Recreate the connector manually in the test environment

<details>
<summary>Answer</summary>

**Correct answer:** C. Export the connector inside a solution and import the solution into the target environment

**Explanation:** Solutions provide the most robust ALM capability; after a solution is imported, no extra connector configuration is required, and the approach supports build automation tooling.

</details>

---

### Q6 — Single Choice

Which of the following authentication types is **not** supported by custom connectors?

- A. API Key
- B. OAuth 2.0
- C. Cookie Authentication
- D. Basic Authentication

<details>
<summary>Answer</summary>

**Correct answer:** C. Cookie Authentication

**Explanation:** Custom connectors support anonymous (no auth), basic authentication, OAuth 2.0, and API key. Cookie authentication is not a supported option.

</details>

---

### Q7 — Fill-in-the-Blank

The connector name in a custom connector is limited to ___ characters, and the Operation ID must be unique and cannot contain ___.

<details>
<summary>Answer</summary>

**Answer:** 30 ; spaces

**Explanation:** The documentation states the name is limited to 30 characters. Operation IDs must be unique and space-free; camel case (e.g., GetInvoice) is recommended for readability.

</details>

---
