# Summary

Microsoft Dataverse provides a robust API to enable interaction with its underlying data and actions.

## Key Concepts Covered

- **Web API vs. Organization Service** — The Web API provides RESTful access performing the same operations as the organization service.
- **OData** — The underlying protocol for the Dataverse Web API, enabling standard CRUD operations via HTTP methods (GET, POST, PATCH, DELETE).
- **OAuth 2.0 Authentication** — Authenticate using Microsoft Entra ID; use MSAL libraries to acquire access tokens.
- **OData Queries** — Create, retrieve, update, and delete Dataverse rows using standard OData HTTP methods.
- **FetchXML** — XML-based query language for complex Dataverse queries with richer filtering than OData.
- **Actions** — Reusable operations (bound or unbound) invocable via Web API POST requests.
- **User Impersonation** — Run logic in the context of another user using the `CallerObjectId` header.
- **Change Tracking** — Track table data changes using delta links for efficient data synchronization across systems.
