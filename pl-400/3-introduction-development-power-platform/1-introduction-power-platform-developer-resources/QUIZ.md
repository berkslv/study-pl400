# Quiz: Power Platform Developer Resources — Components, Dataverse, Azure Integration & Environments

> **Source material:** 1-introduction.md, 2-dataverse.md, 3-azure.md, 4-environments.md, 5-exercise.md, 6-check.md, 7-summary.md
> **Total questions:** 25
> **Question types:** Multiple choice (single), Multiple choice (multi-select), Fill-in-the-blank

---

## Questions

### Question 1 — Single Choice

Your organization wants to build an app that gives makers complete control over screen layout, navigation, and pixel-perfect design. The app must connect to external services via connectors.

Which type of Power Apps application best fits this requirement?

- A. Model-driven application
- B. Canvas application
- C. Power Pages website
- D. Copilot Studio copilot

<details>
<summary>Answer</summary>

**Correct answer:** B. Canvas application

**Explanation:** Canvas applications give makers complete control over pixel-perfect screen contents and navigation between multiple screens, and they use connectors to work with data and services.

</details>

---

### Question 2 — Single Choice

A developer needs to implement custom server-side business logic that runs automatically whenever a record is created or updated in Dataverse. The logic must be treated as a single unit of work within a transaction.

Which extensibility approach should the developer use?

- A. A Power Automate cloud flow triggered by a record creation event
- B. A JavaScript client API script on the model-driven form
- C. A synchronous Dataverse plug-in
- D. A Power Apps Component Framework (PCF) control

<details>
<summary>Answer</summary>

**Correct answer:** C. A synchronous Dataverse plug-in

**Explanation:** Plug-ins are event-handler-like constructs that run as server-side code. Synchronous plug-ins allow any Dataverse modifications to be treated as a single unit of work in a transaction, making them the right choice for transactional server-side business logic.

</details>

---

### Question 3 — Single Choice

A Power Platform developer needs to surface data from an on-premises SQL database inside Dataverse so makers can use it in model-driven apps. The data must not be physically copied into Dataverse.

Which Dataverse feature should the developer implement?

- A. Custom API
- B. Dataverse plug-in
- C. Virtual table
- D. Dataverse solution

<details>
<summary>Answer</summary>

**Correct answer:** C. Virtual table

**Explanation:** Virtual tables map data from an external data source so that it appears to exist in Dataverse without replicating the data. Developers create data providers using code to facilitate connecting to external data sources.

</details>

---

### Question 4 — Single Choice

Your team builds Power Platform solutions that must move apps and customizations from a development environment to a test environment, and then to production. You need a mechanism that packages all relevant components — tables, flows, web resources, and choices — for transport.

Which Power Platform construct should you use?

- A. Power Platform environments
- B. Dataverse solutions
- C. Common Data Model schemas
- D. Power Platform build tools

<details>
<summary>Answer</summary>

**Correct answer:** B. Dataverse solutions

**Explanation:** Dataverse solutions are containers for apps and components such as tables, site maps, processes, web resources, choices, and flows. Solutions are used to transport apps and components from one environment to another and are the primary mechanism for implementing ALM in Power Platform.

</details>

---

### Question 5 — Single Choice

A company has an existing REST API managed through Azure API Management. They want to make that API available for use inside Power Apps and Power Automate without rebuilding it.

What is the most direct approach?

- A. Re-implement the API as a Dataverse plug-in
- B. Export the API definition from Azure API Management directly to Power Platform as a custom connector
- C. Register the API as a virtual table in Dataverse
- D. Use Azure Event Grid to route API calls to Power Platform

<details>
<summary>Answer</summary>

**Correct answer:** B. Export the API definition from Azure API Management directly to Power Platform as a custom connector

**Explanation:** Azure API Management can export API definitions directly to Microsoft Power Platform. When exported, the API is configured as a custom connector available in Power Apps and Power Automate.

</details>

---

### Question 6 — Single Choice

A developer wants to automate a workflow that requires functionality not available in Power Automate, specifically the Enterprise Integration Pack and SOAP connectors.

Which Azure service should complement the Power Platform solution?

- A. Azure Event Grid
- B. Azure Service Bus
- C. Azure Logic Apps
- D. Azure Functions

<details>
<summary>Answer</summary>

**Correct answer:** C. Azure Logic Apps

**Explanation:** Logic Apps can complement a Microsoft Power Platform solution when automation requires support not available in Power Automate — for example, the Enterprise Integration Pack or SOAP connectors. Power Automate is itself built on Logic Apps.

</details>

---

### Question 7 — Single Choice

Your organization configures Dataverse to automatically publish events to an external messaging service whenever data is modified. The consuming application must be able to process messages at its own pace without losing events.

Which Azure service is the most appropriate choice for this integration pattern?

- A. Azure Event Grid
- B. Azure Service Bus
- C. Azure Functions
- D. Azure AI Services

<details>
<summary>Answer</summary>

**Correct answer:** B. Azure Service Bus

**Explanation:** Azure Service Bus stores messages until the consuming party is ready to receive them, enabling decoupled, asynchronous integration. Dataverse can publish events to Service Bus queues and topics automatically on data modifications or on-demand from custom logic.

</details>

---

### Question 8 — Single Choice

A developer needs to extend a model-driven Power Apps form with a custom interactive data visualization control that can be reused across multiple app types.

Which Power Platform extensibility mechanism should the developer use?

- A. HTML web resource embedded in the form
- B. Power Automate cloud flow
- C. Power Apps Component Framework (PCF) control
- D. Dataverse custom API

<details>
<summary>Answer</summary>

**Correct answer:** C. Power Apps Component Framework (PCF) control

**Explanation:** PCF allows developers to build custom visual controls that are used across all Power Apps types. HTML web resources are the predecessor to PCF and are more limited in reusability across app types.

</details>

---

### Question 9 — Single Choice

A developer is setting up a personal development environment in Power Platform to isolate their work from other team members.

Which environment type is most appropriate for this purpose?

- A. Trial
- B. Production
- C. Sandbox
- D. Developer

<details>
<summary>Answer</summary>

**Correct answer:** D. Developer

**Explanation:** Developer environments are primarily for a solo developer to isolate their work. Sandbox and production environments are typically used for team collaboration.

</details>

---

### Question 10 — Single Choice

A team wants to enforce granular access control in Dataverse so that specific users can only see certain columns in a table, even if they have read access to the table itself.

Which Dataverse security feature enables this?

- A. Manager hierarchy security
- B. Position hierarchy security
- C. Column-level security
- D. Role-based security with row-level granularity

<details>
<summary>Answer</summary>

**Correct answer:** C. Column-level security

**Explanation:** Dataverse has a column-level security feature to allow more granular control of security at the column level, beyond what row-level role-based security provides.

</details>

---

### Question 11 — Single Choice

A developer wants to build complex expressions and transformations in Power Automate workflows beyond the built-in actions.

Which extensibility feature should they use?

- A. Power Fx formulas
- B. Workflow definition functions
- C. Bot Framework Skills
- D. Custom API in Dataverse

<details>
<summary>Answer</summary>

**Correct answer:** B. Workflow definition functions

**Explanation:** One of the key developer extensibility points for Power Automate is the ability to use workflow definition functions to build complex expressions within cloud flows.

</details>

---

### Question 12 — Single Choice

An organization uses Dataverse and wants to continuously replicate table data and metadata changes to Azure for use in big data analytics with Azure Synapse. They want changes pushed automatically without manual intervention.

Which service supports this requirement?

- A. Azure Service Bus with Dataverse event publishing
- B. Azure Synapse Link for Dataverse
- C. Power BI REST API with scheduled data refresh
- D. Azure Data Factory pull-based pipeline

<details>
<summary>Answer</summary>

**Correct answer:** B. Azure Synapse Link for Dataverse

**Explanation:** Azure Synapse Link for Dataverse supports initial and incremental writes for table data and metadata. Any data or metadata changes in Dataverse are automatically pushed to the Azure Synapse metastore and Azure Data Lake — it is a push, not a pull, operation.

</details>

---

### Question 13 — Single Choice

A developer needs to add intelligent image recognition capabilities to a Power Platform solution. The built-in AI Builder service does not support the specific vision API required.

Which service should the developer use instead?

- A. Power BI custom visuals SDK
- B. Azure Cognitive Search
- C. Azure AI Services
- D. Azure Event Grid

<details>
<summary>Answer</summary>

**Correct answer:** C. Azure AI Services

**Explanation:** Azure AI Services is a family of AI and cognitive APIs. Developers can use Azure AI Services to augment Power Platform solutions when requirements are too complex for AI Builder or when a specific API is not offered by AI Builder. Vision is one of the five main pillars of Azure AI Services.

</details>

---

### Question 14 — Multi-Select

A developer is reviewing extensibility options for Power Pages websites. Which TWO of the following are valid developer extensibility points for Power Pages? (Select **two**.)

- A. Building Bot Framework Skills
- B. Custom web page templates built with HTML, CSS, and Liquid
- C. Creating custom visuals using the open-source Power BI SDK
- D. Using Visual Studio Code and the Power Platform CLI for metadata editing and CI/CD
- E. Embedding canvas applications in SharePoint

<details>
<summary>Answer</summary>

**Correct answer:** B. Custom web page templates built with HTML, CSS, and Liquid; D. Using Visual Studio Code and the Power Platform CLI for metadata editing and CI/CD

**Explanation:** Power Pages extensibility points include custom web page templates with HTML/CSS/Liquid, PCF code components for websites, the Web API for Dataverse integration, and VS Code with Power Platform CLI for metadata editing and CI/CD. Bot Framework Skills are for Copilot Studio, and embedding in SharePoint relates to canvas apps.

</details>

---

### Question 15 — Multi-Select

You are designing a solution that uses Dataverse security to manage data access across a hierarchy of business units and user roles. Which TWO security hierarchy models does Dataverse provide? (Select **two**.)

- A. Attribute hierarchy
- B. Manager hierarchy
- C. License hierarchy
- D. Position hierarchy
- E. Table hierarchy

<details>
<summary>Answer</summary>

**Correct answer:** B. Manager hierarchy; D. Position hierarchy

**Explanation:** Dataverse includes two security constructs for hierarchies: the manager hierarchy (manager must be in same or parent business unit as the report) and the position hierarchy (allows data access across business units).

</details>

---

### Question 16 — Multi-Select

A developer is exploring the key extensibility points available for Dataverse when custom code is required. Which THREE of the following are valid Dataverse developer extensibility points? (Select **three**.)

- A. Plug-ins for custom server-side business logic
- B. Custom API to expose new operations callable from code or Power Automate
- C. Power Fx formulas for complex canvas app logic
- D. Webhooks to integrate with external systems
- E. Bot Framework Composer for extending Copilot Studio bots

<details>
<summary>Answer</summary>

**Correct answer:** A. Plug-ins for custom server-side business logic; B. Custom API to expose new operations callable from code or Power Automate; D. Webhooks to integrate with external systems

**Explanation:** Dataverse extensibility points include plug-ins, custom APIs, webhooks (and Azure Service Bus) for external integration, and virtual tables. Power Fx is a canvas app extensibility mechanism, and Bot Framework Composer is for Copilot Studio.

</details>

---

### Question 17 — Multi-Select

Which TWO of the following methods can be used to create a new Power Platform environment? (Select **two**.)

- A. Power Platform CLI
- B. Power Apps Component Framework designer
- C. Power Platform admin portal
- D. Power BI REST API
- E. Common Data Model Library

<details>
<summary>Answer</summary>

**Correct answer:** A. Power Platform CLI; C. Power Platform admin portal

**Explanation:** Environments can be created manually via the Power Platform admin portal, using the Power Platform CLI, from PowerShell, or using the admin API. The PCF designer, Power BI REST API, and CDM Library are not used to create environments.

</details>

---

### Question 18 — Fill-in-the-Blank

Power Automate is a service for automating tasks and orchestrating activities across various services using ___. It is built on top of Azure ___, but offers unique integration with Microsoft Power Platform.

<details>
<summary>Answer</summary>

**Answer:** connectors; Logic Apps

**Explanation:** Connectors are the key component allowing Power Automate to access data and services. Power Automate is built on top of Azure Logic Apps while adding exclusive integration with Power Apps and Dataverse.

</details>

---

### Question 19 — Fill-in-the-Blank

In Dataverse, ___ are containers that hold apps and components such as tables, processes, and web resources. They serve as the primary mechanism for implementing ___ (ALM) in the Power Platform.

<details>
<summary>Answer</summary>

**Answer:** Solutions; Application Lifecycle Management

**Explanation:** Dataverse solutions are containers for apps and other components and are used to transport them between environments. They are the primary mechanism for ALM in the Power Platform, supported by Power Platform build tools integrated with Azure DevOps or GitHub.

</details>

---

### Question 20 — Fill-in-the-Blank

The Common Data Model is an open-sourced standard collection of ___ representing common business concepts. Its schema files are maintained as ___ files in a GitHub repository.

<details>
<summary>Answer</summary>

**Answer:** schemas (entities); JSON

**Explanation:** The Common Data Model is an extensible collection of schemas representing common business concepts such as Contacts, Leads, Accounts, and Products. The schemas are maintained as JSON files in the GitHub repository at github.com/microsoft/CDM/.

</details>

---

### Question 21 — Fill-in-the-Blank

To enable canvas apps to use PCF code components in a Power Platform environment, a developer must navigate to **Product → Features** in the environment settings and turn ___ the option **Allow publishing of canvas apps with ___**.

<details>
<summary>Answer</summary>

**Answer:** On; code components

**Explanation:** In the environment settings under Product → Features, developers must enable the "Power Apps component framework for canvas apps" section and set "Allow publishing of canvas apps with code components" to On before canvas apps can use PCF controls.

</details>

---

### Question 22 — Single Choice

A developer is coming from an Azure background and is starting a new Power Platform project. They tend to default to Azure components even when Power Platform natively supports the required functionality.

What is the recommended approach for building Power Platform solutions?

- A. Always use Azure services for reliability and scalability over Power Platform components
- B. Use only Power Platform components and avoid Azure services entirely
- C. Build solutions using Power Platform's rapid development capabilities and extend with Azure services only where needed
- D. Replace Power Automate entirely with Azure Logic Apps for all automation scenarios

<details>
<summary>Answer</summary>

**Correct answer:** C. Build solutions using Power Platform's rapid development capabilities and extend with Azure services only where needed

**Explanation:** The recommended combined approach is to build solutions using the rapid application development of Power Platform while still taking advantage of Azure services and custom code for deep customizations. Developers should first familiarize themselves with what Power Platform already does well before reaching for Azure components.

</details>

---

### Question 23 — Single Choice

A developer needs to give external business partners read and write access to Dataverse data through a public-facing website, while also allowing anonymous browsing of certain content.

Which Power Platform component is designed for this use case?

- A. Power Apps canvas application
- B. Power Pages
- C. Copilot Studio
- D. Power Automate portal

<details>
<summary>Answer</summary>

**Correct answer:** B. Power Pages

**Explanation:** Power Pages allows you to create external-facing business websites where users outside the organization can sign in with a wide variety of identities, create and view data from Dataverse, or browse content anonymously.

</details>

---

### Question 24 — Single Choice

A developer needs to provide read access to Dataverse table data for an experienced SQL developer on the team who wants to use familiar SQL tooling.

Which Dataverse capability supports this?

- A. Dataverse virtual tables with a SQL data provider
- B. The TDS endpoint that exposes a read-only SQL data connection to Dataverse table data
- C. Azure Synapse Link for Dataverse with write-back enabled
- D. The Dataverse REST API using OData queries formatted as SQL

<details>
<summary>Answer</summary>

**Correct answer:** B. The TDS endpoint that exposes a read-only SQL data connection to Dataverse table data

**Explanation:** Dataverse is built on top of Azure SQL Database and includes a SQL data connection (TDS endpoint) that provides read-only access to table data in the target Dataverse environment, allowing SQL developers to use familiar tools immediately.

</details>

---

### Question 25 — Single Choice

A developer wants to consolidate several Dataverse operations into a single reusable endpoint that can be called from a canvas app, Power Automate flow, or custom code.

Which Dataverse extensibility feature should they use?

- A. A Dataverse plug-in with a shared entry point
- B. A custom API defined in Dataverse
- C. A virtual table with a custom data provider
- D. A Power Automate cloud flow with an HTTP trigger

<details>
<summary>Answer</summary>

**Correct answer:** B. A custom API defined in Dataverse

**Explanation:** The custom API capability in Dataverse lets developers create their own APIs that consolidate one or more operations. A custom API can be called from code, Power Apps canvas apps, or Power Automate, making it the ideal choice for creating a reusable, centrally managed Dataverse endpoint.

</details>
