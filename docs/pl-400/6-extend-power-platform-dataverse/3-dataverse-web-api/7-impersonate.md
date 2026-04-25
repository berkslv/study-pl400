# Use the Web API to Impersonate Another User

User impersonation in Dataverse runs logic with all appropriate roles and object-based security based on the impersonated user. Useful for integrations where the integration account is a system account but the actual request was invoked by a specific user.

## Implement a Web API Request with User Impersonation

Provide a **CallerObjectId** in the message header with the value of the target user's **Microsoft Entra ID object ID**:

```
CallerObjectId: <Entra ID Object ID of the user to impersonate>
```

Use the **Microsoft Entra Graph API** to query for user object IDs.

## Determine the User Who Performed an Operation

Query the record's `createdonbehalfby` field to see who actually performed an operation on behalf of another user. Compare `createdby` and `createdonbehalfby`:

```odata
GET [Organization URI]/api/data/v9.2/accounts(00000000-0000-0000-000000000003)?$select=name&$expand=createdby($select=fullname),createdonbehalfby($select=fullname),owninguser($select=fullname) HTTP/1.1
Accept: application/json
OData-MaxVersion: 4.0
OData-Version: 4.0
```

**Response when record was created via impersonation:**

```odata
HTTP/1.1 200 OK
Content-Type: application/json; odata.metadata=minimal
ETag: W/"506868"

{
  "@odata.context": "[Organization URI]/api/data/v9.2/$metadata#accounts(name,createdby(fullname,azureactivedirectoryobjectid),createdonbehalfby(fullname,azureactivedirectoryobjectid),owninguser(fullname,azureactivedirectoryobjectid))/$entity",
  "@odata.etag": "W/"2751197"",
  "name": "Sample Account created using impersonation",
  "accountid": "00000000-0000-0000-000000000003",
  "createdby": {
    "fullname": "Impersonated User",
    "systemuserid": "75df116d-d9da-e711-a94b-000d3a34ed47"
  },
  "createdonbehalfby": {
    "fullname": "Actual User",
    "systemuserid": "278742b0-1e61-4fb5-84ef-c7de308c19e2"
  },
  "owninguser": {
    "fullname": "Impersonated User",
    "systemuserid": "75df116d-d9da-e711-a94b-000d3a34ed47"
  }
}
```

- `createdby` — The impersonated user (record owner).
- `createdonbehalfby` — The actual user who made the API call.
