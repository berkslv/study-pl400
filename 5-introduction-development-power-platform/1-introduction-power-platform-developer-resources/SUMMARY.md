# Summary: Power Platform Developer Resources — Components, Dataverse, Azure Integration & Environments

> **Source files:** 1-introduction.md, 2-dataverse.md, 3-azure.md, 4-environments.md, 5-exercise.md

---

## Power Platform Core Components

- **Power Apps** — canvas and model-driven app types consumed on desktop and mobile.
  - **Canvas apps**: pixel-perfect, multi-screen, use connectors; embeddable in SharePoint, Teams, Power BI, Dynamics 365.
  - **Model-driven apps**: data-driven, built on Dataverse; can embed canvas apps for external data sources.
- **Power Automate** — automates tasks and orchestrates activities via connectors.
  - **Cloud flows**: triggered manually, by events (e.g. record created), or on schedule; built on Azure Logic Apps.
  - **Desktop flows**: automate repetitive interactive tasks on web or desktop.
- **Power BI** — business analytics with interactive data visualization; supports embedding, custom visuals, REST API, and Power Query connectors.
- **Power Pages** — external-facing business websites; supports anonymous browsing, Dataverse data, wide identity sign-in options.
- **Copilot Studio** — low-code chatbot/copilot builder built on Microsoft Bot Framework; supports Bot Framework Skills and Composer extensions.
- **Connectors** — proxy/wrapper around an API enabling Power Automate, Power Apps, and Azure Logic Apps to access data and services.
  - Hundreds of prebuilt connectors available; custom connectors can be built for any REST API.
  - Developers can implement code to transform request/response payloads beyond existing policy templates.

---

## Developer Extensibility Points by Component

### Power Apps
- Build custom visual controls using **Power Apps Component Framework (PCF)**.
- Implement client business logic using **JavaScript and the client API** (model-driven only).
- Build **custom connectors** using Azure Functions or Azure API Management.
- Build **HTML web resources**.
- Use **Power Fx** for canvas app logic (low-code, strong-typed, declarative, functional language).
- TypeScript is recommended for scripting; transpiled to JavaScript ("client script").
- HTML web resources are the predecessor to PCF and can display custom presentation logic in model-driven app forms.

### Power Automate
- Build custom connectors using Azure Functions and Azure API Management.
- Use **workflow definition functions** to build complex expressions.

### Power BI
- Embed Power BI in apps, websites, and portals.
- Create custom visuals using the open-source SDK.
- Use the **Power BI REST API** for data refresh, ALM automation, autoscaling, and more.
- Develop **Power Query custom connectors** for proprietary data sources.

### Power Pages
- Custom web page templates with HTML, CSS, and Liquid.
- Code components for websites via Power Apps Component Framework.
- Extend Dataverse integration with the **Web API**.
- Use Visual Studio Code and Power Platform CLI for metadata editing and CI/CD.

### Copilot Studio
- Build **Bot Framework Skills**.
- Extend bots with **Bot Framework Composer**.

### Dataverse (Platform Extensibility)
- Create **plug-ins** (event-handler-like constructs) for custom server-side business logic; synchronous plug-ins treat Dataverse modifications as a single unit of work in a transaction.
- Use **webhooks** and **Azure Service Bus** to integrate with external systems.
- Extend the Dataverse API with **custom APIs** that implement business logic; callable from code, canvas apps, or Power Automate.
- Use **virtual tables** to surface external data in Dataverse without replication; developers create data providers in code.
- Automate security tasks via the API.

---

## Dataverse

- Stores business data in **tables** (rows + columns); built on Azure SQL, Cosmos DB, and Azure Storage.
- Provides a unified API across relational, nonrelational, file, image, search, and data lake data types.
- **Built-in security model**: role-based security with row-level granularity; column-level security for finer control.
  - Security roles associate with users, teams, or business units.
  - **Manager hierarchy**: manager must be in same or parent business unit as report.
  - **Position hierarchy**: allows data access across business units.
- Includes visual designers to define tables, relationships, business rules, forms, views, and workflows.
- Provides a **REST-based API** for full programmatic access and custom code integration.
- **Virtual tables** map external data source records into Dataverse for real-time operations.
- First-party apps built on Dataverse: Dynamics 365 Sales, Service, Field Service, Customer Insights - Journeys.
- Plug-in development is an essential and common task for Power Platform developers.

### Dataverse Solutions
- Solutions are **containers** for apps and components (tables, site maps, processes, web resources, choices, flows, etc.).
- Used to transport apps/components between environments or apply customizations.
- Primary mechanism for **Application Lifecycle Management (ALM)** in Power Platform.
- **Power Platform build tools** integrate with Azure DevOps or GitHub to automate ALM operations.

---

## Common Data Model (CDM)

- Open-sourced, extensible collection of schemas representing common business concepts (Contacts, Leads, Accounts, Products, etc.).
- Maintained on [GitHub](https://github.com/microsoft/CDM/) as JSON schema files; includes a Visual Entity Navigator.
- Dataverse implements CDM standard entities (e.g., Account and Contact).
- Influenced by data schemas from Dynamics 365 across multiple business areas.
- **Layering approach**: core schema (Account, Contact) → function/industry-specific models → custom application schema.
- Developers use the **Common Data Model Library** to work with data stored in Azure Data Lake.

---

## Extending Power Platform with Azure

### Azure Functions
- Supported extensibility endpoint for Power Platform.
- Offloads complex logic outside transactional applications for improved stability.
- Can expose APIs to Power Platform as **custom connectors**, making logic callable from apps and flows.

### Azure API Management
- Manages APIs across clouds and on-premises.
- Can export API definitions directly to Power Platform as **custom connectors** available in Power Apps and Power Automate.

### Azure Service Bus
- Reliable messaging-as-a-service (MaaS) for real-time, asynchronous messaging.
- Dataverse can publish events to Service Bus **queues and topics** automatically on data modifications or on-demand from custom logic.
- Stores messages until the consuming party is ready (decoupled architecture).

### Azure Event Grid
- Fully managed event-routing service from any source to any destination.
- Routes events between Power Platform and Azure services like Azure Functions.
- Simplifies event-based applications and serverless workflows.

### Azure Logic Apps
- Power Automate is built on Logic Apps and includes Power Apps/Dataverse integration.
- Logic Apps complements Power Automate when requirements need the **Enterprise Integration Pack** or **SOAP connectors**.

### Azure AI Services
- Family of cognitive APIs; Power Platform equivalent is **AI Builder** (low-code subset).
- Five pillars: Vision, Speech, Language, Web Search, Decision.
- Use Azure AI Services directly when solution requirements exceed AI Builder's scope or require unsupported APIs.

### Azure Data Lake & Azure Synapse Analytics
- Power Platform/Dataverse supports Azure Data Lake with the Common Data Model framework.
- **Azure Synapse Link for Dataverse**: supports initial and incremental writes (push, not pull) for table data and metadata; changes automatically pushed to Azure Synapse metastore and Data Lake.

### Azure SQL Database
- Dataverse is built on top of Azure SQL; includes a SQL data connection for **read-only access** to Dataverse table data.
- Power Apps and Power Automate connect to Azure SQL via the **Azure SQL connector**.

### Other Azure Services
- **App Service**: cloud apps for web and mobile.
- **Microsoft Entra ID / Entra ID B2C**: identity management.
- **IoT**: integration with solutions like Dynamics 365 Field Service.
- **Azure DevOps**: reliable tools for continuous delivery.

---

## Power Platform Environments

- Containers for data, apps, automations, and other Power Platform components.
- Created within a **Microsoft Entra ID tenant**, tied to a geographic location; all resources route to data centers in that location.
- An organization can have multiple environments for different purposes (development, testing, production).
- **Environment types**: Developer, Trial, Sandbox, Production — type determines features/capabilities, not purpose.
  - Developer environments: isolated, primarily for solo developers.
  - Sandbox/Production environments: used for team collaboration.
- Creation methods: Power Platform admin portal, Power Platform CLI, PowerShell, admin API.
- Organization administrators can restrict who can create specific environment types.

### Environment Settings
- Configured via Power Platform admin portal → Environment Settings.
- Settings are categorized; search feature available for quick navigation.
- Common settings developers may configure:
  - `Product → Behavior → Release Channel`
  - `Product → Feature → Embedded Content`
  - `Product → Feature → Hosted RPA`
  - `Product → Feature → Power Apps component framework`
  - `Product → Feature → Create in Dataverse solutions`
  - `Product → Feature → TDS endpoint`
  - `Product → Languages`
  - `Product → Currencies`
  - `Users + permissions`
  - `Audit and logs → Audit Settings`

---

## Developer Environment Setup (Exercise Steps)

### Sign Up for Power Apps Developer Plan
1. Go to [Power Apps Developer Plan](https://powerapps.microsoft.com/developerplan/) and select **Try for free**.
2. Enter email, agree to terms, click **Start free**.
3. Select region and **Accept**.
4. Go to [Power Platform admin center](https://admin.powerplatform.microsoft.com/) → **Environments** to see the new environment.

### Create a Developer Environment
1. Select **+ New** environment.
2. Enter **Dev** for Name, select region, select **Developer** for Type, then **Next**.
3. Select language, currency, set **Deploy sample apps and data** to Yes, optionally set a custom URL, then **Save**.

### Configure Environment Settings
1. Wait for environment state to become **Ready**.
2. Open environment **Settings**.
3. Enable auditing: **Audit and logs → Audit settings → Start auditing → Save**.
4. Enable PCF for canvas apps: **Product → Features → Power Apps component framework for canvas apps → Allow publishing of canvas apps with code components → On → Save**.

### Import Creator Kit
1. Download **Creator Kit Core** from `https://aka.ms/creatorkitdownload`.
2. Download **Creator Kit Reference (MDA)** from `https://aka.ms/creatorkitreferencemda`.
3. In Power Apps maker portal, select the **Dev** environment → **Solutions → Import solution**.
4. Import `CreatorKitCore`, then repeat for `CreatorKitReferencesMDA`.
5. Launch **Creator Kit Reference App** to explore available PCF components (Basic → Icon, etc.).
6. Review component source code on [GitHub](https://github.com/microsoft/PowerApps-Samples/).

---

## References

- [Azure AI Services](https://azure.microsoft.com/products/ai-services)
- [Azure API Management](https://azure.microsoft.com/services/api-management/)
- [Azure Data Lake Storage](https://azure.microsoft.com/services/storage/data-lake-storage/)
- [Azure Event Grid](https://azure.microsoft.com/services/event-grid/)
- [Azure Functions](https://azure.microsoft.com/services/functions/)
- [Azure Logic Apps](https://azure.microsoft.com/services/logic-apps/)
- [Azure Service Bus](https://azure.microsoft.com/services/service-bus/)
- [Azure SQL Database](https://azure.microsoft.com/services/sql-database/)
- [Common Data Model on GitHub](https://github.com/microsoft/CDM/)
- [Creator Kit Core download](https://aka.ms/creatorkitdownload)
- [Creator Kit Reference (MDA) download](https://aka.ms/creatorkitreferencemda)
- [Power Apps Developer Plan](https://powerapps.microsoft.com/developerplan/)
- [Power Apps maker portal](https://make.powerapps.com/)
- [Power Platform admin center](https://admin.powerplatform.microsoft.com/)
- [PowerApps-Samples on GitHub](https://github.com/microsoft/PowerApps-Samples/)
