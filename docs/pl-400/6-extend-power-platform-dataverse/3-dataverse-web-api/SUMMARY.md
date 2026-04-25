# Summary: Microsoft Dataverse Web API

> **Source files:** 1-introduction.md, 2-insomnia.md, 3-authenticate.md, 4-odata.md, 5-fetch-xml.md, 6-power-automate.md, 7-impersonate.md, 8-change-tracking.md

---

## Web API Overview

- The Web API and the Organization Service are the two main ways to interact with data and metadata in Dataverse.
- All data operations go through the underlying organization service; the Web API exposes the same operations in a RESTful style.
- Dataverse Web API is implemented as an **OData (OASIS Open Data Protocol) 4.0** service.
- OData provides cross-platform compatibility against a common, predefined protocol.
- Dataverse does not provide specific .NET tooling for the Web API; use community OData libraries: https://www.odata.org/libraries/
- Supports CRUD via standard HTTP methods: **GET**, **POST**, **PATCH**, **DELETE**.
- Event Framework operations are invoked via OData *functions* or *actions* with the same name as the corresponding organization service message.

### Decision Criteria: Which API to Use

| Scenario | Recommended API |
|----------|----------------|
| Plug-ins / workflow extensions | Organization Service (`Microsoft.CrmSdk.CoreAssemblies`) |
| Windows applications | Dataverse Service Client (`Microsoft.PowerPlatform.Dataverse.Client`) |
| Cross-platform RESTful access | Web API |

---

## Authentication with OAuth 2.0

- Dataverse uses **OAuth 2.0** as its authentication standard.
- **Authentication** (identity verification) is handled by **Microsoft Entra ID** (formerly Azure Active Directory).
- **Authorization** is at the Entra ID tenant level; detailed permissions are managed via Dataverse security roles assigned to the signed-in user.

### Register App in Entra ID

- Register via Azure portal: **App Registrations > New Registration**.
- Account type options:
  - **Single tenant** — Users/guests in your directory. Use for internal apps.
  - **Multitenant (Entra ID)** — Work/school accounts. Use for business/educational customers.
  - **Multitenant + personal accounts** — Work, school, or personal Microsoft accounts (Xbox, Skype, etc.).
- For web apps, specify a Redirect URI under **Authentication > Web**.

### Delegated Access (on behalf of signed-in user)

- Go to **API permissions** and grant **user_impersonation** delegated access to Dynamics CRM (Dataverse).

### S2S (Service-to-Service) Authentication

- Create a Dataverse Application User in each environment via the [Power Platform admin center](https://admin.powerplatform.microsoft.com/).
- Associate with the Entra ID app or managed identity.
- Assign appropriate Dataverse security roles.

### MSAL Authentication Code Sample

```csharp
class OAuthMessageHandler : DelegatingHandler
{
  private AuthenticationHeaderValue authHeader;
  public OAuthMessageHandler(string serviceUrl, string clientId, string redirectUrl, string username, string password, HttpMessageHandler innerHandler)
  : base(innerHandler)
  {
    var clientApplication = PublicClientApplicationBuilder.Create(clientId)
      .WithAuthority(AadAuthorityAudience.AzureAdMultipleOrgs)
      .WithRedirectUri(redirectUrl)
      .Build();
    var scope = serviceUrl + "//.default";
    string[] scopes = { scope };
    AuthenticationResult authBuilderResult;
    if (username != string.Empty && password != string.Empty)
    {
      var securePassword = new SecureString();
      foreach (char ch in password) securePassword.AppendChar(ch);
      authBuilderResult = clientApplication.AcquireTokenByUsernamePassword(scopes, username, securePassword).ExecuteAsync().Result;
    }
    else
    {
      authBuilderResult = clientApplication.AcquireTokenInteractive(scopes).ExecuteAsync().Result;
    }
    authHeader = new AuthenticationHeaderValue("Bearer", authBuilderResult.AccessToken);
  }
  protected override Task<HttpResponseMessage> SendAsync(HttpRequestMessage request, System.Threading.CancellationToken cancellationToken)
  {
    request.Headers.Authorization = authHeader;
    return base.SendAsync(request, cancellationToken);
  }
}
```

```csharp
static HttpClient GetHttpClient(string url, string clientId, string redirectUrl, string version = "v9.2")
{
  HttpMessageHandler messageHandler = new OAuthMessageHandler(url, clientId, redirectUrl, "", "",
    new HttpClientHandler());
  HttpClient httpClient = new HttpClient(messageHandler)
  {
    BaseAddress = new Uri(string.Format("{0}/api/data/{1}/", url, version)),
    Timeout = new TimeSpan(0, 2, 0) // 2 minutes
  };
  return httpClient;
}
```

---

## OData CRUD Operations

### Create (POST)

```odata
POST [Organization URI]/api/data/v9.2/accounts HTTP/1.1
Content-Type: application/json; charset=utf-8
OData-MaxVersion: 4.0
OData-Version: 4.0
Accept: application/json

{
    "name": "Sample Account",
    "creditonhold": false,
    "address1_latitude": 47.639583,
    "description": "This is the description of the sample account",
    "revenue": 5000000,
    "accountcategorycode": 1
}
```

### Retrieve (GET)

```odata
GET [Organization URI]/api/data/v9.2/accounts(00000000-0000-0000-0000-000000000001)
```

### Update (PATCH / PUT)

- **PATCH** — Update multiple attribute values; supports **upsert** when an ID is provided.
- **PUT** — Update a single attribute value; cannot be used with navigation properties (lookups).
- Use `Prefer: return=representation` header with PATCH to retrieve updated data in the response; combine with `$select` to control returned fields.

```odata
PATCH [Organization URI]/api/data/v9.2/accounts(00000000-0000-0000-0000-000000000001) HTTP/1.1
Content-Type: application/json
OData-MaxVersion: 4.0
OData-Version: 4.0

{
    "name": "Updated Sample Account ",
    "creditonhold": true,
    "revenue": 6000000
}
```

```odata
PUT [Organization URI]/api/data/v9.2/accounts(00000000-0000-0000-0000-000000000001)/name HTTP/1.1
Content-Type: application/json
OData-MaxVersion: 4.0
OData-Version: 4.0

{"value": "Updated Sample Account Name"}
```

### Delete (DELETE)

```odata
DELETE [Organization URI]/api/data/v9.2/accounts(00000000-0000-0000-0000-000000000001) HTTP/1.1
Content-Type: application/json
OData-MaxVersion: 4.0
OData-Version: 4.0
```

---

## FetchXML Queries

- FetchXML is a Microsoft-developed query language for complex querying of Dataverse data.
- Provides more filtering options than OData and supports labels for reference data (option set labels, lookup fields).
- Can be used with: Dataverse Web API, Organization Service, or `addCustomFilter` Client API in model-driven apps.

### Basic Query

```xml
<fetch mapping='logical'>
   <entity name='account'>
      <attribute name='accountid'/>
      <attribute name='name'/>
   </entity>
</fetch>
```

### Query with Filter

```xml
<fetch mapping='logical'>
   <entity name='account'>
      <attribute name='accountid'/>
      <attribute name='name'/>
      <filter type='and'>
        <condition attribute='address1_stateorprovince' operator='eq' value='WA' />
      </filter>
   </entity>
</fetch>
```

### Tools for Building FetchXML

- **Advanced Find** — Includes a **Download FetchXML** function; good for simple queries.
- **FetchXML Builder** — Community tool for aggregates, outer joins, "has no" queries, multi-level linked entity attributes: https://fetchxmlbuilder.com/

---

## Invoking Actions via the Web API

- *Actions* are reusable operations with observable side effects (e.g., creating or updating rows).
- Pre-built actions exist in Dataverse; custom actions are created via the **Custom API** feature.
- Actions are invoked with a **POST** operation against the action name as the URL segment.

### Unbound vs. Bound Actions

| Type | Description | Analogy |
|------|-------------|---------|
| **Unbound** | Not tied to a specific table; generic logic | SQL stored procedure |
| **Bound** | Tied to a specific table row; row ID required in URI | SQL trigger (can also be called on demand) |

### Unbound Action Example

```odata
POST [Organization URI]/api/data/v9.2/WinOpportunity HTTP/1.1
Accept: application/json
Content-Type: application/json; charset=utf-8
OData-MaxVersion: 4.0
OData-Version: 4.0

{
 "Status": 3,
 "OpportunityClose": {
  "subject": "Won Opportunity",
  "opportunityid@odata.bind": "[Organization URI]/api/data/v9.2/opportunities(b3828ac8-917a-e511-80d2-00155d2a68d2)"
 }
}
```

### Bound Action Example

```odata
POST [Organization URI]/api/data/v9.2/contacts(94d8c461-a27a-e511-80d2-00155d2a68d2)/Microsoft.Dynamics.CRM.contoso_AddNoteToContact HTTP/1.1
Accept: application/json
Content-Type: application/json; charset=utf-8
OData-MaxVersion: 4.0
OData-Version: 4.0

{
 "NoteTitle": "New Note Title",
 "NoteText": "This is the text of the note"
}
```

---

## User Impersonation

- Runs logic with all appropriate roles and object-based security of the **impersonated user**.
- Useful for integrations where the integration account is a system account but the request was invoked by a specific user.
- Add the **`CallerObjectId`** header with the target user's **Microsoft Entra ID object ID**:

```
CallerObjectId: <Entra ID Object ID of the user to impersonate>
```

- Use the **Microsoft Entra Graph API** to query for user object IDs.

### Auditing Impersonated Operations

- `createdby` — The impersonated user (record owner).
- `createdonbehalfby` — The actual user who made the API call.

```odata
GET [Organization URI]/api/data/v9.2/accounts(00000000-0000-0000-000000000003)?$select=name&$expand=createdby($select=fullname),createdonbehalfby($select=fullname),owninguser($select=fullname) HTTP/1.1
Accept: application/json
OData-MaxVersion: 4.0
OData-Version: 4.0
```

---

## Change Tracking

- Enables efficient data synchronization across systems by tracking changes to table data over time.
- Enable per table in Power Apps maker portal: **Table settings > Advanced options > For this table > Track changes**.

### Delta Links

- *Delta links* are opaque, service-generated links (per OData 4.0) used to retrieve subsequent changes.
- Each change tracking response contains a delta link; pass it to the next request to get changes since the previous request.
- Your app must persist the delta link between requests (similar to tracking with date/time stamps).

### Initial Request

```odata
GET [Organization URI]/org1/api/data/v9.2/accounts?$select=name,accountnumber,telephone1,fax HTTP/1.1
Prefer: odata.track-changes
Cache-Control: no-cache
OData-Version: 4.0
Content-Type: application/json
```

Response includes `@odata.deltaLink`; deleted records appear with `"reason":"deleted"`.

### Subsequent Request (using delta link)

```odata
GET [Organization URI]/api/data/v9.2/accounts?$select=name,accountnumber,telephone1,fax&$deltatoken=919042%2108%2f22%2f2017%2008%3a10%3a44
```

### Count Changes in a Delta

```odata
GET [Organization URI]/api/data/v9.2/accounts/$count?$deltatoken=919042%2108%2f22%2f2017%2008%3a10%3a44
```

---

## Testing with Insomnia

- Insomnia is a tool for composing ad-hoc Web API queries and verifying operations without writing code.
- Requires an app registered in Microsoft Entra ID.
- Find your Web API endpoint version via **Developer Resources** in the maker portal.

### Insomnia Environment Variables

```json
{
    "url": "https://[ORG NAME].api.crm.dynamics.com",
    "clientid": "51f81489-12ee-4a9e-aaae-a2591f45987d",
    "version": "9.2",
    "webapiurl": "{{url}}/api/data/v{{version}}/",
    "callback": "https://callbackurl",
    "authurl": "https://login.microsoftonline.com/common/oauth2/authorize?resource={{url}}"
}
```

### Generate Token (OAuth 2.0 — Implicit Grant)

- **Auth tab > OAuth 2.0**; set Grant Type to **Implicit**, provide `{{authurl}}`, `{{clientid}}`, `{{callback}}`.
- Select **Fetch Token** and sign in with Entra ID credentials.

### Test Connection

- `GET {{webapiurl}}WhoAmI` — A successful response returns data from `WhoAmIResponse` ComplexType.

---

## References

- [FetchXML Builder](https://fetchxmlbuilder.com/)
- [Insomnia Installation](https://docs.insomnia.rest/insomnia/install/)
- [Microsoft Identity Platform Authentication Libraries (MSAL)](https://learn.microsoft.com/en-us/azure/active-directory/develop/reference-v2-libraries/)
- [OData Community Libraries](https://www.odata.org/libraries/)
- [Perform Operations Using the Web API](https://learn.microsoft.com/en-us/power-apps/developer/common-data-service/webapi/perform-operations-web-api/)
- [Power Platform Admin Center](https://admin.powerplatform.microsoft.com/)
- [Retrieve a Table Row Using the Web API](https://learn.microsoft.com/en-us/power-apps/developer/common-data-service/webapi/retrieve-entity-using-web-api/)
- [Use FetchXML to Query Data](https://learn.microsoft.com/en-us/power-apps/developer/common-data-service/use-fetchxml-construct-query/)
- [Use Web API Actions](https://learn.microsoft.com/en-us/power-apps/developer/common-data-service/webapi/use-web-api-actions/)
- [Web API Action Reference](https://learn.microsoft.com/en-us/dynamics365/customer-engagement/web-api/actions?view=dynamics-ce-odata-9)
