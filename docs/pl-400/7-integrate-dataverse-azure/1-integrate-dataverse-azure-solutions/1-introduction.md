# Microsoft Dataverse Azure Solutions overview

Because Microsoft Dataverse is part of the robust Microsoft Power Platform, it provides numerous capabilities to facilitate integration with Microsoft Azure solutions. This lesson covers some of the standard integration practices regarding Azure solutions and how they pertain to Dataverse.

## Comparing Azure's integration solutions

Azure has various other solutions that you can integrate with Dataverse. The following sections provide a summary of each solution. However, this module limits further education in future lessons to the solutions with pre-configured utilities within Dataverse that help streamline your integrations, such as:

- Microsoft Azure Service Bus
- Microsoft Azure Event Hubs
- Microsoft Azure Logic Apps

### Logic Apps

Azure Logic Apps provides a robust visual interface in which you can orchestrate complex integrations across your various environments. It has many of the same capabilities as Microsoft Power Automate workflows, so if you're familiar with preparing workflows in that context, you should be able to recognize their similarities. Both let you use pre-built and custom-built connectors, which you can use to connect to whichever system is needed. Most importantly, Logic Apps comes with a Microsoft Dataverse connector that allows you to trigger actions based on various Dataverse events (such as a row being created or updated).

### Azure Service Bus

Azure Service Bus is Microsoft's cloud messaging as a service (MaaS) platform. Messages are sent to and received from queues for point-to-point communications. Service Bus also provides a publish-subscribe mechanism that uses its Topics feature, which isn't covered in this module.

### Azure API Management

You can use Azure API Management to manage custom APIs you build for use with the Power Platform. The logic in your APIs can work with your own internal data, external services, or the Dataverse API. You can export your API definition from the Azure API Management portal to create a Power Platform custom connector.

### Event Grid

Microsoft Azure Event Grid is an event-driven, publish-subscribe framework that allows you to handle various events. While Dataverse doesn't provide out-of-the-box capabilities to integrate with an Event Grid instance as it does with Service Bus or Event Hubs, it's a viable item to consider when you need event-driven integrations.

### Event Hubs

Azure Event Hubs is Microsoft's version of Apache Kafka and provides a real-time data ingestion service that supports millions of events per second. This service is good for large data streams that need to be ingested in real-time (which might occur when trying to capture items like application telemetry within a business application) but aren't as common in most business application integration scenarios. Technically, Event Hubs isn't as much of an integration solution as an analytics solution, given that their predominant applications are with "big data." Dataverse lets you publish events to an event hub.

## Choose the right Azure integration solution

If you're struggling to figure out which Azure integration solution best suits your needs, consider the information in the following table.

| IF YOU WANT TO... | USE THIS |
| --- | --- |
| Create workflows and orchestrate business processes to connect hundreds of services in the cloud and on-premises. | Logic Apps |
| Connect on-premises and cloud-based applications and services to implement messaging workflows. | Service Bus |
| Publish your APIs for internal and external developers to use when connecting to backend systems that are hosted anywhere. | API Management |
| Connect supported Azure and third-party services by using a fully managed event-routing service with a publish-subscribe model that simplifies event-based app development. | Event Grid |
| Continuously ingest data in real time from up to hundreds of thousands of sources and stream a million events per second. | Event Hubs |

For in-depth guidance on Azure's broader Integration Services framework, refer to the Azure Integration Services whitepaper.

Another article to reference is: [Choose between Azure messaging services - Event Grid, Event Hubs, and Service Bus](https://learn.microsoft.com/en-us/azure/event-grid/compare-messaging-services)
