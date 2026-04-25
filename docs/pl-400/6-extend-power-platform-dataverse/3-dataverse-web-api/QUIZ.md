# Quiz: Microsoft Dataverse Web API

> **Source material:** 1-introduction.md, 2-insomnia.md, 3-authenticate.md, 4-odata.md, 5-fetch-xml.md, 6-power-automate.md, 7-impersonate.md, 8-change-tracking.md, 9-check.md, 10-summary.md
> **Total questions:** 25
> **Question types:** Multiple choice (single), Multiple choice (multi-select), Fill-in-the-blank

---

## Questions

### Question 1 — Single Choice

Your team is building a plug-in for Microsoft Dataverse that runs server-side logic on record creation. You need to choose the correct API approach for this plug-in.

Which API should you use for writing plug-ins and workflow extensions?

- A. Dataverse Web API
- B. Organization Service via `Microsoft.CrmSdk.CoreAssemblies`
- C. `Microsoft.PowerPlatform.Dataverse.Client` assemblies
- D. OData community libraries

<details>
<summary>Answer</summary>

**Correct answer:** B. Organization Service via `Microsoft.CrmSdk.CoreAssemblies`

**Explanation:** The Organization Service (using the SDK assemblies in the `Microsoft.CrmSdk.CoreAssemblies` NuGet package) is the correct choice for plug-ins and workflow extensions. The Web API is for cross-platform RESTful access, not server-side extensions.

</details>

---

### Question 2 — Single Choice

A developer wants to build a Windows desktop application that connects to Dataverse. They are not writing a plug-in or workflow extension.

Which library should the developer use?

- A. `Microsoft.CrmSdk.CoreAssemblies`
- B. OData community library from odata.org/libraries
- C. `Microsoft.PowerPlatform.Dataverse.Client`
- D. MSAL (Microsoft Authentication Library)

<details>
<summary>Answer</summary>

**Correct answer:** C. `Microsoft.PowerPlatform.Dataverse.Client`

**Explanation:** The Dataverse Service Client Assemblies (`Microsoft.PowerPlatform.Dataverse.Client`) are intended for Windows applications. The Organization Service assemblies are for plug-ins, and the Web API is for cross-platform RESTful access.

</details>

---

### Question 3 — Single Choice

You are connecting Insomnia to Microsoft Dataverse to test Web API calls. You need to find the correct version number of your Web API endpoint.

Where do you find the Web API endpoint and version?

- A. In the Azure portal under App Registrations
- B. In the Power Apps maker portal under Developer Resources
- C. In the Microsoft Entra ID admin center
- D. In the Power Platform admin center under Environments

<details>
<summary>Answer</summary>

**Correct answer:** B. In the Power Apps maker portal under Developer Resources

**Explanation:** The Web API endpoint version is found via your environment's Developer Resources in the maker portal, where you can note the endpoint URL and version number.

</details>

---

### Question 4 — Single Choice

When setting up Insomnia to test the Dataverse Web API, you configure OAuth 2.0 authentication. You need to select the correct grant type.

Which grant type should you select in Insomnia for connecting to Dataverse?

- A. Client Credentials
- B. Authorization Code
- C. Implicit
- D. Password

<details>
<summary>Answer</summary>

**Correct answer:** C. Implicit

**Explanation:** When generating an access token in Insomnia for Dataverse, you set the Grant Type to **Implicit** and provide the authorization URL, client ID, and redirect URL.

</details>

---

### Question 5 — Single Choice

After configuring Insomnia to connect to Dataverse, you want to verify that the connection is working correctly.

Which Web API call should you use to test the connection?

- A. `GET {{webapiurl}}accounts`
- B. `GET {{webapiurl}}WhoAmI`
- C. `POST {{webapiurl}}systemusers`
- D. `GET {{webapiurl}}$metadata`

<details>
<summary>Answer</summary>

**Correct answer:** B. `GET {{webapiurl}}WhoAmI`

**Explanation:** A successful connection to Dataverse is verified by calling the `WhoAmI` endpoint. A successful request returns data from the `WhoAmIResponse` ComplexType.

</details>

---

### Question 6 — Single Choice

Your organization needs to authenticate a background service to Dataverse without any user interaction. The service must run operations under a specific system account.

Which authentication pattern should you implement?

- A. Delegated access with `user_impersonation`
- B. Server-to-server (S2S) authentication with an Application User
- C. Interactive OAuth flow using MSAL
- D. Basic authentication with username and password

<details>
<summary>Answer</summary>

**Correct answer:** B. Server-to-server (S2S) authentication with an Application User

**Explanation:** For non-interactive background services, S2S authentication is used. You create a Dataverse Application User in each environment, associate it with the Entra ID app or managed identity, and assign appropriate security roles.

</details>

---

### Question 7 — Single Choice

A developer registers an app in Microsoft Entra ID to allow external business partners with work accounts to access Dataverse.

Which account type should be selected during app registration?

- A. Single tenant — All users and guests in your directory
- B. Multitenant (Entra ID) — All users with work/school accounts
- C. Multitenant + personal Microsoft accounts
- D. Personal Microsoft accounts only

<details>
<summary>Answer</summary>

**Correct answer:** B. Multitenant (Entra ID) — All users with work/school accounts

**Explanation:** For apps targeting business or educational customers with work/school accounts across different Entra ID tenants, the "Multitenant (Entra ID)" account type is the correct choice.

</details>

---

### Question 8 — Single Choice

You need to create a new account record in Dataverse using the Web API.

Which HTTP method should you use?

- A. GET
- B. PUT
- C. POST
- D. PATCH

<details>
<summary>Answer</summary>

**Correct answer:** C. POST

**Explanation:** Creating a new row in Dataverse via the Web API uses the HTTP POST method, as defined by the OData protocol's CRUD operation mapping.

</details>

---

### Question 9 — Single Choice

You send a PATCH request to update an account record and want to immediately receive the updated field values in the response body without making a separate GET request.

Which request header should you include?

- A. `Accept: application/json`
- B. `Prefer: return=representation`
- C. `OData-Version: 4.0`
- D. `Cache-Control: no-cache`

<details>
<summary>Answer</summary>

**Correct answer:** B. `Prefer: return=representation`

**Explanation:** The `Prefer: return=representation` header instructs Dataverse to return the updated entity data in the PATCH response. You can combine it with `$select` to control which fields are returned.

</details>

---

### Question 10 — Single Choice

A developer needs to update only a single attribute (the `name` field) on an account record using the Web API. The field is not a navigation property (lookup).

Which HTTP method is appropriate for updating a single attribute value?

- A. PATCH
- B. POST
- C. DELETE
- D. PUT

<details>
<summary>Answer</summary>

**Correct answer:** D. PUT

**Explanation:** PUT is used to update a single attribute value in Dataverse. PATCH updates multiple attributes and supports upsert, but PUT is specifically for single-attribute updates and cannot be used with navigation properties.

</details>

---

### Question 11 — Single Choice

You want to use PATCH to create a record if it does not exist, or update it if it does, using a known record ID.

What feature does PATCH support that enables this behavior?

- A. Merge
- B. Upsert
- C. Overwrite
- D. Replace

<details>
<summary>Answer</summary>

**Correct answer:** B. Upsert

**Explanation:** The PATCH method in the Dataverse Web API supports **upsert** behavior when a record ID is provided — it creates the record if it doesn't exist, or updates it if it does.

</details>

---

### Question 12 — Single Choice

Your team needs a query language that supports complex filtering, aggregates, outer joins, and labels for option set values when querying Dataverse data.

Which query language should you use?

- A. OData `$filter` expressions
- B. LINQ queries via the Organization Service
- C. FetchXML
- D. SQL pass-through queries

<details>
<summary>Answer</summary>

**Correct answer:** C. FetchXML

**Explanation:** FetchXML is Microsoft's XML-based query language for Dataverse that provides richer filtering options than OData, including support for aggregates, outer joins, "has no" queries, multi-level linked entity attributes, and option set labels.

</details>

---

### Question 13 — Single Choice

A developer wants to build a FetchXML query that uses aggregates and outer joins, which are beyond the capabilities of Advanced Find.

Which tool should they use to construct this query?

- A. Power Apps Formula Bar
- B. Advanced Find with Download FetchXML
- C. FetchXML Builder community tool
- D. OData query designer

<details>
<summary>Answer</summary>

**Correct answer:** C. FetchXML Builder community tool

**Explanation:** FetchXML Builder (available at fetchxmlbuilder.com) is a community tool designed for constructing FetchXML queries beyond Advanced Find's capabilities, including aggregates, outer joins, and attributes from multi-level linked entities.

</details>

---

### Question 14 — Single Choice

You are calling a Dataverse action via the Web API. The action must operate on a specific contact record and requires the contact's record ID to be part of the request URI.

What type of action is this?

- A. Unbound action
- B. Global action
- C. Bound action
- D. Composite action

<details>
<summary>Answer</summary>

**Correct answer:** C. Bound action

**Explanation:** A bound action is tied to a specific table row and requires the row ID in the URI. An unbound action is not tied to a specific table and operates generically (analogous to a SQL stored procedure).

</details>

---

### Question 15 — Single Choice

A developer is calling Dataverse actions from the Web API. They need to call a generic business logic action that is not tied to any specific record.

Which type of action should they use?

- A. Bound action
- B. Unbound action
- C. Custom API trigger
- D. Workflow action

<details>
<summary>Answer</summary>

**Correct answer:** B. Unbound action

**Explanation:** Unbound actions are not tied to a specific table or row and implement generic logic. They are analogous to SQL stored procedures, callable without a record context in the URI.

</details>

---

### Question 16 — Single Choice

Your integration service uses a system account to call the Dataverse Web API, but each request is actually initiated by a specific end user. You want Dataverse to apply that user's security roles to the operation.

Which HTTP header should you include in the Web API request?

- A. `MSCRMCallerId`
- B. `X-User-Context`
- C. `CallerObjectId`
- D. `ImpersonateAs`

<details>
<summary>Answer</summary>

**Correct answer:** C. `CallerObjectId`

**Explanation:** To impersonate a user in a Dataverse Web API request, you provide the `CallerObjectId` header containing the target user's Microsoft Entra ID object ID. Dataverse then applies that user's roles and security context to the operation.

</details>

---

### Question 17 — Single Choice

After an impersonation-based operation, you query an account record and find that `createdby` shows "Impersonated User" and `createdonbehalfby` shows "Actual User."

What does `createdonbehalfby` represent?

- A. The record owner
- B. The user whose security context was applied
- C. The actual user who made the API call
- D. The service principal that authenticated

<details>
<summary>Answer</summary>

**Correct answer:** C. The actual user who made the API call

**Explanation:** `createdonbehalfby` identifies the actual caller who made the API call (the "real" user or service account), while `createdby` reflects the impersonated user whose security context was applied to the operation.

</details>

---

### Question 18 — Single Choice

You want to synchronize Dataverse account data changes to an external system efficiently. On the first request you receive all matching records plus a link. On subsequent requests you only want records that changed since the last sync.

What preference header do you add to enable this behavior?

- A. `Prefer: odata.include-annotations`
- B. `Prefer: odata.track-changes`
- C. `Prefer: return=representation`
- D. `Cache-Control: no-cache`

<details>
<summary>Answer</summary>

**Correct answer:** B. `Prefer: odata.track-changes`

**Explanation:** Adding `Prefer: odata.track-changes` to a GET request enables change tracking. The initial response includes all matching data plus a `@odata.deltaLink`, which is passed to subsequent requests to retrieve only changes since the previous request.

</details>

---

### Question 19 — Single Choice

You are implementing change tracking in your Dataverse integration. You have received a delta link from the initial request and need to retrieve the total number of changed records without fetching full record data.

Which OData query parameter should you append to your delta link request?

- A. `$top=0`
- B. `$count`
- C. `$skip=0`
- D. `$select=count`

<details>
<summary>Answer</summary>

**Correct answer:** B. `$count`

**Explanation:** Appending the `$count` parameter to a delta link request retrieves the total number of changes in the delta without returning full record data. For example: `GET .../accounts/$count?$deltatoken=...`

</details>

---

### Question 20 — Multi-Select

You are designing a solution that uses the Dataverse Web API. (Select **three**.)

Which of the following statements about the Dataverse Web API are correct?

- A. The Web API is implemented as an OData 4.0 service
- B. The Web API is only available on Windows platforms
- C. CRUD operations use standard HTTP methods: GET, POST, PATCH, DELETE
- D. Dataverse provides specific .NET tooling dedicated to the Web API
- E. FetchXML can be used with the Web API for complex queries
- F. The Web API uses SOAP as its underlying protocol

<details>
<summary>Answer</summary>

**Correct answer:** A, C, E

**Explanation:** The Dataverse Web API is implemented as an OData 4.0 service (A), supports standard HTTP CRUD methods (C), and accepts FetchXML for complex queries (E). It is cross-platform (not Windows-only), Dataverse does not provide specific .NET tooling for it (community OData libraries are used), and it is RESTful, not SOAP-based.

</details>

---

### Question 21 — Multi-Select

A developer is registering an app in Microsoft Entra ID to access Dataverse on behalf of signed-in users. (Select **two**.)

Which steps are required to configure delegated access for the app?

- A. Create a Dataverse Application User in the Power Platform admin center
- B. Add `user_impersonation` delegated permission for Dynamics CRM in API permissions
- C. Generate a client secret under Certificates & Secrets
- D. Specify a Redirect URI under Authentication > Web
- E. Assign a Dataverse security role to the Entra ID app object
- F. Enable the `Track changes` flag on each Dataverse table

<details>
<summary>Answer</summary>

**Correct answer:** B, D

**Explanation:** For delegated access (on behalf of a signed-in user), you grant `user_impersonation` delegated permission for Dynamics CRM (Dataverse) in API permissions (B), and specify a Redirect URI under Authentication > Web for web apps (D). Creating an Application User and assigning security roles is required for S2S/non-interactive access, not delegated access.

</details>

---

### Question 22 — Multi-Select

Your team is evaluating query options for a new Dataverse integration. (Select **two**.)

Which of the following are valid methods for running FetchXML queries against Dataverse?

- A. Dataverse Web API
- B. Azure SQL pass-through
- C. Organization Service
- D. Power BI DirectQuery
- E. Logic Apps HTTP connector
- F. OData `$filter` expressions

<details>
<summary>Answer</summary>

**Correct answer:** A, C

**Explanation:** FetchXML queries can be run through the Dataverse Web API and through the Organization Service. Additionally, FetchXML can be used as a custom filter on lookup fields in model-driven apps via the `addCustomFilter` Client API, but that is not listed here. Azure SQL, Power BI DirectQuery, Logic Apps HTTP, and OData `$filter` are separate query mechanisms.

</details>

---

### Question 23 — Fill-in-the-Blank

The Dataverse Web API is implemented as an ___ service, which is a set of RESTful APIs based on the OASIS Open Data Protocol version ___.

<details>
<summary>Answer</summary>

**Answer:** OData; 4.0

**Explanation:** Microsoft Dataverse implements its Web API as an OData (Open Data Protocol) service conforming to OData version 4.0, providing cross-platform compatibility and standard HTTP-based CRUD operations.

</details>

---

### Question 24 — Fill-in-the-Blank

To impersonate a user in a Dataverse Web API request, you include the ___ header containing the target user's Microsoft ___ object ID.

<details>
<summary>Answer</summary>

**Answer:** CallerObjectId; Entra ID

**Explanation:** The `CallerObjectId` header is used to pass the Entra ID (formerly Azure Active Directory) object ID of the user to impersonate, causing Dataverse to apply that user's security roles and object-based security to the operation.

</details>

---

### Question 25 — Fill-in-the-Blank

When change tracking is enabled, each Web API change tracking response includes a ___ link. You pass this link to the next request to retrieve only the records that changed since the ___ request.

<details>
<summary>Answer</summary>

**Answer:** delta; previous

**Explanation:** Delta links are opaque, service-generated links defined by the OData 4.0 standard. After each change tracking response, the app must store the delta link and pass it in the next request to retrieve incremental changes since the previous sync.

</details>
