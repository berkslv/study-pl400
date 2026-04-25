# Introduction to the Microsoft Dataverse Web API

## Web API vs. the Organization Service

The Web API and the organization service are the two main ways to interact with data and metadata in Microsoft Dataverse. Use the organization service when writing plug-ins or workflow extensions using the SDK for .NET.

All data operations go through the underlying organization service. The Web API allows you to perform the same operations as the organization service but in a RESTful style.

**Decision criteria:**
- Use the **Organization Service** (via SDK assemblies in `Microsoft.CrmSdk.CoreAssemblies` NuGet package) for plug-ins and workflow extensions.
- Use the **Dataverse Service Client Assemblies** (`Microsoft.PowerPlatform.Dataverse.Client`) for Windows applications.
- Use the **Web API** for cross-platform RESTful access.

## OData (Open Data Protocol) 4.0

Dataverse Web API is implemented as an OData (OASIS Open Data Protocol) service.

- Provides cross-platform compatibility and simple implementation against a common, predefined protocol.
- Dataverse doesn't provide specific .NET tooling for the Web API — use community libraries conforming to the OData protocol: https://www.odata.org/libraries/
- Supports CRUD operations via standard HTTP methods: **GET**, **POST**, **PATCH**, **DELETE**.
- Perform other operations exposed through the Dataverse Event Framework by invoking an OData *function* or *action* with the same name as its corresponding organization service message.

## REST

OData protocol is a set of RESTful (**RE**presentational **S**tate **T**ransfer) APIs. REST consists of six guiding principles that restrict how a service processes and responds to requests to ensure non-functional properties (performance, scalability, simplicity, reliability, etc.) are met.

## FetchXML

FetchXML is a robust query language for complex querying of Dataverse data. It can be used to compose query criteria when running queries with the Dataverse Web API.
