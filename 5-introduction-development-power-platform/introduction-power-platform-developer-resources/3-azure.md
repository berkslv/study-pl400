# Extending Power Platform with Azure

- 10 minutes

Azure cloud services provide a wealth of functionality and enable Microsoft Power Platform developers to harness its capabilities through various extensibility points. This unit reviews a few Azure technologies in the context of how they play, or potentially play, a role in a Microsoft Power Platform focused implementation.

Developers should become familiar with the low-code capabilities of Microsoft Power Platform so they don't rebuild something that it already does well. If you're coming from an Azure developer background, it might be easy to start with an Azure component instead of a Microsoft Power Platform component. Using a combined approach, solutions are built using the rapid application development of Microsoft Power Platform but still take advantage of the deep customizations that is possible by including Azure services and custom code.

## Azure Functions

[Azure Functions](https://azure.microsoft.com/services/functions/) is a supported extensibility endpoint for Power Platform. Extracting custom logic into an Azure function enables you to offload complex logic outside of your transactional application, thus providing a much more stable and effective user experience. Azure Functions can also be used to build APIs that are exposed to Microsoft Power Platform as a custom connector. As a custom connector the Azure Function business logic can easily be invoked from apps and flows.

## API Management

[Azure API Management](https://azure.microsoft.com/services/api-management/) allows you to manage APIs across clouds and on-premises. In addition, API Management can export API definitions directly to Microsoft Power Platform. When exported, the API is configured as a custom connector available in Power Apps and Power Automate.

## Service Bus

[Azure Service Bus](https://azure.microsoft.com/services/service-bus/) is a reliable messaging-as-a-service (MaaS) framework that enables real-time, asynchronous messaging across systems. In specific use cases, this is a valuable feature that provides the ability to integrate with both cloud and on-premises systems in a serverless, distributed fashion.

Developers can configure Microsoft Dataverse to publish events to Azure Service Bus queues and topics. Events can be published automatically on Dataverse data modifications or on demand from developer's custom logic.

Azure Service Bus can store the message until the consuming party is ready to receive the messages allowing you to architect solutions that are less dependent.

## Event Grid

[Event Grid](https://azure.microsoft.com/services/event-grid/) is a fully managed single service for managing routing for all events from any source for any destination. It simplifies the development of event-based applications and the creation of serverless workflows. Event Grid can be used to route events between Microsoft Power Platform and other Azure services like Azure Functions.

## Logic Apps

[Logic Apps](https://azure.microsoft.com/services/logic-apps/) is a cloud service that helps you schedule, automate, and orchestrate tasks, business processes, and workflows when you need to integrate apps, data, systems, and services across enterprises or organizations.

Microsoft Power Platform has Power Automate service that is built on Logic Apps and includes integration with Power Apps and Dataverse. Developers familiar with Logic Apps will find Power Automate familiar as well.

Logic Apps can complement a Microsoft Power Platform solution when automation requires support not available in Power Automate, for example to use the Enterprise Integration Pack or SOAP connectors.

## AI Services

[Azure AI Services](https://azure.microsoft.com/products/ai-services) is a family of AI and cognitive APIs to help build intelligent apps. Microsoft Power Platform has the AI Builder service that implements a low code option for some of the APIs. AI Builder empowers a broader set of app builders to implement intelligent processing. Developers can help augment Microsoft Power Platform solutions with Azure AI Services when the solution requirements or usage becomes too complex for AI Builder or needs an API that AI Builder doesn't offer.

Azure AI Services includes APIs, SDKs, and services that are available to help developers add cognitive features to their applications. The catalog of services within Azure AI Services can be categorized into five main pillars:

- Vision
- Speech
- Language
- Web search
- Decision

## Azure Data Lake and Azure Synapse Analytics

Microsoft Power Platform data seamlessly supports [Azure Data Lake storage](https://azure.microsoft.com/services/storage/data-lake-storage/) with its Microsoft Dataverse and Common Data Model framework. Building on Microsoft Power Platform enables complex analytics scenarios where you can use industrialized big data tools such as Power BI, Azure HDInsight, or Azure Synapse.

The Azure Synapse Link for Dataverse service supports initial and incremental writes for table data and metadata. Any data or metadata changes in Dataverse are automatically pushed to the Azure Synapse metastore and Azure Data Lake, depending on the configuration, without any additional action. This is a push, rather than pull, operation.

## Azure SQL Database

Dataverse itself is built on top of [Azure SQL Database](https://azure.microsoft.com/services/sql-database/) engine and includes a SQL data connection that provides read-only access to the table data of the target Dataverse environment. Experienced SQL Server developers can use the familiar technology to be immediately more productive with Dataverse.

Power Apps and Power Automate can work with data in Azure SQL via the Azure SQL connector.

## Other Services

Azure includes many other services that can be used to extend Power Platform functionality when required. Examples of other frequently used services include:

- App Service for cloud apps for web and mobile
- Identity Management with Microsoft Entra ID and Microsoft Entra ID B2C
- Internet of Things for integration with Microsoft Power Platform solutions like Dynamics 365 Field Service
- DevOps with reliable tools for continuous delivery
- Developer Tools

Microsoft Power Platform developers should be familiar with Azure capabilities to help building and extending effective Microsoft Power Platform solutions.
