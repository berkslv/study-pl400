# What are custom connectors

- 5 minutes

There are hundreds of prebuilt connectors available to connect Power Apps to Microsoft and non-Microsoft services. However, you might want to communicate with a service that isn't available as a prebuilt connector, for example the VanArsdel inventory management web API. [Custom connectors](https://learn.microsoft.com/en-us/connectors/custom-connectors/) bridge this gap by allowing you to create a connector with its own actions, including invoking a web API hosted in Azure API Management from a Power Apps application.

## Connected Services in Visual Studio

Developers can also use [connected services](https://learn.microsoft.com/en-us/visualstudio/azure/overview-connected-services) within Visual Studio to create custom connectors. This is a collection of tools that help you connect to services like Microsoft Power Platform. The integration allows you to:

- Connect to a Power Platform environment
- Automatically generate a custom connector for your Power Platform environment
- Configure a dev tunnel to locally connect to your custom connector

[Dev tunnels](https://learn.microsoft.com/en-us/aspnet/core/test/dev-tunnels) create an ad-hoc connection between your web API running locally and your Power Apps. You can use them to locally test and debug your web API in the context of the Power Platform in real-time.

## Web APIs behind Azure API Management

Kiana and their team built the web APIs for the inventory management system and iterated on them over time. The system is complex and consists of many different APIs. Kiana's team could use [Azure API Management](https://learn.microsoft.com/en-us/azure/api-management/api-management-key-concepts) to control and administer the web APIs from a central place.

Kiana's team often uses Azure API Management's ability to expose specific web APIs publicly, but not others, by setting various policies.

## Creating a custom connector

You can create a custom connector by either adding Power Platform as a connected service in Visual Studio or by exporting it from Azure API Management. Both options allow the Power Apps app developer to use the custom connector, and thus the web API, without having to know the web API's address or how it works.

Once the custom connector is generated, you can see it on the Power Apps page.

## Connector vs. connection

A custom connector is a wrapper around a web API. It allows Power Apps to communicate with the web API. However, the custom connector itself does nothing unless you create a connection for it.

- The **connector** knows the web API's host and operation details.
- The **connection** knows the credentials and has a reference to the **connector** to facilitate communication with the web API.
