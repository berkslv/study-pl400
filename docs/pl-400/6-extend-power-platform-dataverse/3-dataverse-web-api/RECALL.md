# Recall: Dataverse Web API

> **Source files:** 1-introduction.md, 2-insomnia.md, 3-authenticate.md, 4-odata.md, 5-fetch-xml.md, 6-power-automate.md, 7-impersonate.md, 8-change-tracking.md

---

## Keywords

| Term | Definition |
|------|-----------|
| Web API | RESTful interface to Dataverse that mirrors organization service capabilities using OData 4.0. |
| Organization Service | SDK-based interface for plug-ins and workflow extensions using `Microsoft.CrmSdk.CoreAssemblies`. |
| OData 4.0 | OASIS Open Data Protocol; the underlying standard implemented by the Dataverse Web API. |
| FetchXML | Microsoft XML query language for complex Dataverse queries; supports aggregates, outer joins, and option set labels. |
| OAuth 2.0 | Authentication standard used by Dataverse; access tokens are acquired via MSAL or other MSAL-compatible libraries. |
| Microsoft Entra ID | Microsoft's identity platform (formerly Azure AD) used to authenticate and register apps for Dataverse access. |
| S2S (Server-to-Server) | Non-interactive authentication pattern using a Dataverse Application User linked to an Entra ID app registration. |
| CallerObjectId | HTTP header used to impersonate another user; value is the target user's Entra ID object ID. |
| Delta Link | OData 4.0 opaque link returned by change tracking requests used to retrieve subsequent changes. |
| Bound Action | Dataverse action tied to a specific table row; requires row ID in the URI. |
| Unbound Action | Dataverse action not tied to any table; applies generic logic similar to a stored procedure. |
| Custom API | Feature for creating custom reusable Dataverse actions accessible via the Web API. |
| `createdonbehalfby` | Record field identifying the actual API caller when impersonation was used. |

---

## Main Ideas

- The Web API and Organization Service are the two main Dataverse interfaces; the Web API is preferred for cross-platform RESTful access, while the Organization Service is used for plug-ins and workflow extensions.
- Dataverse Web API is implemented as an OData 4.0 service; CRUD maps to HTTP GET, POST, PATCH/PUT, DELETE.
- PATCH supports upsert (create-or-update) when a row ID is provided; PUT updates only a single attribute and cannot be used with navigation properties.
- Use the `Prefer: return=representation` header with PATCH to receive updated data in the response.
- FetchXML provides richer query options than OData, including aggregates, outer joins, multi-level linked entities, and option set labels.
- FetchXML queries can be built using **Advanced Find** (with Download FetchXML) or the community **FetchXML Builder** tool.
- Dataverse uses OAuth 2.0; apps must be registered in Entra ID and granted `user_impersonation` delegated permission to Dynamics CRM for delegated access.
- For S2S authentication, create a Dataverse Application User in each environment via the Power Platform admin center and assign security roles.
- Impersonation is implemented via the `CallerObjectId` request header set to the target user's Entra ID object ID.
- `createdby` holds the impersonated user; `createdonbehalfby` holds the actual caller.
- Change tracking must be enabled per table; the `odata.track-changes` preference header activates it per request.
- Each change tracking response returns a new delta link; subsequent requests use the delta link to retrieve only changed/deleted records since the last sync.
- Dataverse actions (bound or unbound) are invoked via POST; custom actions are created with the Custom API feature.

---

## Mini Quiz

### Q1 — Single Choice

A developer needs to write a plug-in that runs server-side logic on record creation in Dataverse.

Which interface should they use?

- A. Dataverse Web API with OData
- B. Organization Service via `Microsoft.CrmSdk.CoreAssemblies`
- C. Dataverse Service Client (`Microsoft.PowerPlatform.Dataverse.Client`)
- D. FetchXML via HTTP GET

<details>
<summary>Answer</summary>

**Correct answer:** B. Organization Service via `Microsoft.CrmSdk.CoreAssemblies`

**Explanation:** The Organization Service is the correct choice for plug-ins and workflow extensions. The Web API is used for cross-platform RESTful access, not server-side plug-in development.

</details>

---

### Q2 — Fill-in-the-Blank

To update multiple fields on an existing Dataverse row and receive the updated record in the response, use the ___ HTTP method with the `Prefer: ___` header.

<details>
<summary>Answer</summary>

**Answer:** PATCH, return=representation

**Explanation:** PATCH updates multiple attributes and supports upsert. Adding `Prefer: return=representation` causes the response to include the updated record data.

</details>

---

### Q3 — Single Choice

A developer wants to synchronize Dataverse account records to an external system efficiently, retrieving only records changed since the last sync.

What is the correct approach?

- A. Poll with a scheduled OData GET using a date filter on `modifiedon`
- B. Use FetchXML with an outer join to find new records
- C. Enable change tracking on the table and use delta links from the `odata.track-changes` preference header
- D. Use the `CallerObjectId` header with each request

<details>
<summary>Answer</summary>

**Correct answer:** C. Enable change tracking on the table and use delta links from the `odata.track-changes` preference header

**Explanation:** Dataverse change tracking with delta links (OData 4.0) is the standard mechanism for efficient incremental synchronization. The delta link from each response is passed to the next request to get only changes since the last sync.

</details>

---

### Q4 — Fill-in-the-Blank

To impersonate another user in a Web API request, include the ___ header with the value of the target user's ___ object ID.

<details>
<summary>Answer</summary>

**Answer:** CallerObjectId, Microsoft Entra ID

**Explanation:** The `CallerObjectId` request header signals to Dataverse that the operation should run under the context of the specified user. The value must be the Entra ID (Azure AD) object ID of the user to impersonate.

</details>

---

### Q5 — Single Choice

A Dataverse action is associated with a specific contact record and requires the contact's GUID in the URI.

What type of action is this?

- A. Unbound action
- B. Custom API
- C. Bound action
- D. FetchXML filter action

<details>
<summary>Answer</summary>

**Correct answer:** C. Bound action

**Explanation:** Bound actions are tied to a specific table row and require the row ID in the URI. Unbound actions are not tied to any specific row and apply generic logic.

</details>

---

### Q6 — Fill-in-the-Blank

FetchXML is more powerful than basic OData queries because it supports ___, outer joins, and option set ___.

<details>
<summary>Answer</summary>

**Answer:** aggregates, labels

**Explanation:** FetchXML supports aggregates, outer joins, multi-level linked entity attributes, and returns option set labels — capabilities not available through standard OData connectors.

</details>

---

### Q7 — Single Choice

An integration app needs to access Dataverse without any user interaction (non-interactive/service account scenario).

Which authentication approach is correct?

- A. Delegated access with `user_impersonation` permission and interactive sign-in
- B. S2S authentication using a Dataverse Application User linked to an Entra ID app registration
- C. Basic authentication with username and password embedded in headers
- D. OAuth 2.0 implicit flow with a shared client secret

<details>
<summary>Answer</summary>

**Correct answer:** B. S2S authentication using a Dataverse Application User linked to an Entra ID app registration

**Explanation:** Server-to-Server (S2S) authentication is the correct pattern for non-interactive integrations. It requires creating a Dataverse Application User in each environment via the Power Platform admin center and assigning appropriate security roles.

</details>

---
