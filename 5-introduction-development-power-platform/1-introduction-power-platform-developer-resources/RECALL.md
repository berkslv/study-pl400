# Recall: Power Platform Developer Resources — Overview

> **Source files:** 1-introduction.md, 2-dataverse.md, 3-azure.md, 4-environments.md, 5-exercise.md

---

## Keywords

| Term | Definition |
|------|-----------|
| Power Apps Component Framework (PCF) | Framework for building custom reusable code components usable across all Power Apps types. |
| Canvas Application | Power Apps type giving makers pixel-perfect UI control; uses connectors for data and services. |
| Model-Driven Application | Dataverse-based Power Apps type where UI is driven by data model and metadata. |
| Dataverse | Cloud-scale data store built on Azure technologies providing a unified API and built-in security model. |
| Plug-in | Server-side code construct in Dataverse that customizes or extends data processing; runs synchronously. |
| Custom API | Developer-created API in Dataverse that consolidates one or more operations callable from code, canvas apps, or flows. |
| Common Data Model (CDM) | Open-sourced collection of standard schemas representing common business concepts (e.g., Account, Contact). |
| Power Automate | Power Platform service built on Azure Logic Apps for automating tasks via cloud flows and desktop flows. |
| Dataverse Solutions | Container for apps and components (tables, flows, web resources) used to transport customizations between environments. |
| Azure Synapse Link for Dataverse | Service that automatically pushes Dataverse table data and metadata changes to Azure Data Lake/Synapse metastore. |
| Virtual Table | Dataverse construct that maps external data source records to appear as if they exist natively in Dataverse. |
| Power Platform Environment | Isolated container tied to a geographic location that manages an organization's data, apps, and automations. |

---

## Main Ideas

- Power Platform has five main components: Power Apps, Power Automate, Power BI, Power Pages, and Copilot Studio.
- Canvas apps use connectors for data; model-driven apps are built directly on Dataverse and can embed canvas apps.
- PCF (Power Apps Component Framework) is the primary mechanism for building custom visual controls across all Power Apps types.
- Dataverse is built on Azure SQL, Cosmos DB, and Azure Storage, and abstracts them behind a unified REST API.
- Dataverse's security model supports role-based access at the row level and column-level security for more granular control.
- Plug-ins are server-side code that run synchronously, allowing Dataverse modifications to be treated as a single transactional unit of work.
- Dataverse Solutions implement ALM (Application Lifecycle Management) and can be automated with Azure DevOps or GitHub via Power Platform build tools.
- Azure Functions can host custom logic exposed to Power Platform as a custom connector; API Management can export API definitions directly as custom connectors.
- Azure Service Bus enables asynchronous, reliable messaging; Dataverse can publish events to Service Bus queues/topics automatically on data modifications.
- Azure Synapse Link for Dataverse is a push (not pull) operation that syncs data and metadata changes automatically.
- Power Platform environments come in types: developer, trial, sandbox, and production — type determines features, not necessarily purpose.
- Environments are created per Entra ID tenant, tied to a geographic location, and can be created via admin portal, Power Platform CLI, PowerShell, or admin API.
- The Power Apps Developer Plan provides a free developer environment; a custom URL can be set at creation time.
- The Creator Kit showcases pre-built PCF components and is importable as a Dataverse solution.

---

## Mini Quiz

### Q1 — Single Choice

A developer needs to add a custom interactive control to both a model-driven app and a canvas app.

Which technology should they use?

- A. HTML web resources
- B. Power Apps Component Framework (PCF)
- C. JavaScript client API
- D. Power Fx formulas

<details>
<summary>Answer</summary>

**Correct answer:** B. Power Apps Component Framework (PCF)

**Explanation:** PCF code components can be used across all Power Apps types (canvas and model-driven), making it the correct choice for a reusable custom control. HTML web resources are specific to model-driven apps only.

</details>

---

### Q2 — Fill-in-the-Blank

Dataverse plug-ins run as ___ code and allow Dataverse modifications to be treated as a single unit of work in a ___.

<details>
<summary>Answer</summary>

**Answer:** server-side; transaction

**Explanation:** Plug-ins are a server-side construct in Dataverse. Synchronous processing by plug-ins ensures all modifications within the operation are committed or rolled back together as a single transactional unit.

</details>

---

### Q3 — Single Choice

A maker wants to expose an Azure Function as something that can be used directly inside Power Apps and Power Automate flows.

What must the developer create?

- A. A virtual table
- B. A Dataverse plug-in
- C. A custom connector
- D. An Azure Event Grid subscription

<details>
<summary>Answer</summary>

**Correct answer:** C. A custom connector

**Explanation:** Azure Functions can be exposed to Power Platform by building a custom connector. Azure API Management can also export API definitions directly as custom connectors available in Power Apps and Power Automate.

</details>

---

### Q4 — Fill-in-the-Blank

Dataverse Solutions are the mechanism for implementing ___ in Power Platform and can be automated with Azure DevOps or GitHub using Power Platform ___ tools.

<details>
<summary>Answer</summary>

**Answer:** Application Lifecycle Management (ALM); build

**Explanation:** Solutions transport apps and components between environments. Power Platform build tools integrate with Azure DevOps and GitHub to automate ALM operations.

</details>

---

### Q5 — Single Choice

You need to integrate data from an external system into a Dataverse app without physically copying or replicating the data.

Which Dataverse feature should you use?

- A. Dataverse Solutions
- B. Virtual Tables
- C. Custom API
- D. Azure Synapse Link

<details>
<summary>Answer</summary>

**Correct answer:** B. Virtual Tables

**Explanation:** Virtual tables map data in an external data source so it appears to exist within Dataverse without replicating the data. Developers create data providers in code to connect to those external sources.

</details>

---

### Q6 — Single Choice

Which statement about Power Platform environment types is correct?

- A. A production environment can only be used for production workloads.
- B. Environment type determines the purpose of the environment, not its features.
- C. Developer environments are designed for solo developer use to isolate their work.
- D. Sandbox environments cannot be used for collaboration.

<details>
<summary>Answer</summary>

**Correct answer:** C. Developer environments are designed for solo developer use to isolate their work.

**Explanation:** Developer environments are primarily for a solo developer to isolate their work. Importantly, environment type determines features and capabilities — not the purpose — so a production-type environment can technically be used for testing.

</details>

---

### Q7 — Fill-in-the-Blank

The Azure Synapse Link for Dataverse is a ___ operation (not pull) that automatically pushes table data and metadata changes to Azure ___ and Azure Data Lake.

<details>
<summary>Answer</summary>

**Answer:** push; Synapse metastore

**Explanation:** The Azure Synapse Link for Dataverse automatically pushes any data or metadata changes from Dataverse to the Azure Synapse metastore and Azure Data Lake without requiring any additional action from the developer.

</details>

---
