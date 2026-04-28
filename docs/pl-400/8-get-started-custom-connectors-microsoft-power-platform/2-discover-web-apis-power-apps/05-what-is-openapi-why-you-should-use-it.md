# What is OpenAPI and why you should use it

- 5 minutes

OpenAPI defines a standard and programming language-agnostic interface description for web APIs. It allows both humans and computers to discover and understand the capabilities of a service without having to access source code or other documentation, or inspect network traffic.

Using an OpenAPI document describing a web API, the consumer can understand and communicate with the web API with minimal effort.

A custom connector can be created for any web API as long as it's properly described by an OpenAPI document. That means the VanArsdel fusion development team isn't limited to creating custom connectors for their Power Apps applications from web APIs hosted in [Azure API Management](https://learn.microsoft.com/en-us/azure/api-management/api-management-key-concepts).

## What does an OpenAPI document do?

The OpenAPI document specifies a contract of the surface area of the web API. It abstracts the actual implementation specifics away from the consumer of the API. That means you can quickly build your application by knowing what methods to call and what they return without having to worry about how those methods are invoked.

In the previous unit, you used [Azure API Management](https://learn.microsoft.com/en-us/azure/api-management/api-management-key-concepts) to create a custom connector. By doing so, you also created a dependency on Azure API Management. In other words, if any change occurs on Azure API Management, your custom connector must be updated to reflect the change.

With the OpenAPI document, you don't have to know where the API is located or whether it's running, because the document contains all the information you need.

Power Apps lets you instantly create a custom connector with this OpenAPI document.

Once you create the custom connector from the OpenAPI document, you can see it on your Power Apps page.

## Why use an OpenAPI document for custom connectors?

There are many advantages of using the OpenAPI document for your custom connector creation. The following two benefits are the most crucial for citizen developers:

- **Remove dependencies**: With an OpenAPI document you can create a custom connector by yourself, without having to wait for somebody to create one for you from API Management. Plus, it's becoming more common for professional development teams to include OpenAPI document generation capabilities within the web API itself. This means you can download the OpenAPI document by visiting a URL and then create the custom connector with it.
- **Increase agility**: The cadence of your Power App development increases when your web API development team can hand you an OpenAPI document. You don't need to rely on them for anything further to create and use a custom connector.

The OpenAPI document doesn't have to know the actual implementation of the web API, as long as the contract remains the same.

## A custom connector from an OpenAPI document or Azure API Management

To create a custom connector, you can use either Azure API Management or an OpenAPI document. Which one should you choose?

| Connector | Azure API Management | OpenAPI document |
| --- | --- | --- |
| API Control | Centralized | Distributed |
| API Structure Layer | Complex | Simple |
| Extra Security Layer | Yes | No |
| Usage Control | Yes | No |
| Extra Cost | Yes | No |
| Architectural Complexity | Higher | Lower |
