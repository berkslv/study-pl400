# Use the Web API to impersonate another user

Completed

- 10 minutes

Occasionally, you might need to run logic for another user. Within the context of Microsoft Dataverse, your logic applies all appropriate roles and object-based security based on the user you're impersonating. This method can be especially effective when you're integrating external systems with a Dataverse solution where the integration account is a system account versus the user who actually invoked the request.

## Implement a Web API request with user impersonation

When calling any Web API method, you can provide a **CallerObjectId** in your message header to indicate that you want the message to run as that particular user. The value of this parameter is their Microsoft Entra ID object ID. The **Microsoft Entra Graph API** provides a method to query Microsoft Entra user data. For more information, see the [Microsoft Entra ID Graph API Reference](/en-us/previous-versions/azure/ad/graph/api/users-operations/?azure-portal=true).

## Determine the user who performed an operation

If you need to see the ID of the user who actually performed an operation for another user, you can query the record's `createdonbehalfby` value, which contains this detail. For example, if you want to see if an account row was created through user impersonation rather than by the actual user, you could query that account record to compare their `createdby` and `createdonbehalfby` values by using the following query:

```odata
GET [Organization URI]/api/data/v9.2/accounts(00000000-0000-0000-000000000003)?$select=name&$expand=createdby($select=fullname),createdonbehalfby($select=fullname),owninguser($select=fullname) HTTP/1.1
Accept: application/json
OData-MaxVersion: 4.0
OData-Version: 4.0
```

If an impersonating account created the record, you can expect a response similar to the following example:

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
    "@odata.etag": "W/"2632435"",
    "fullname": "Impersonated User",
    "azureactivedirectoryobjectid": "",
    "systemuserid": "75df116d-d9da-e711-a94b-000d3a34ed47",
    "ownerid": "75df116d-d9da-e711-a94b-000d3a34ed47"
  },
  "createdonbehalfby": {
    "@odata.etag": "W/"2632445"",
    "fullname": "Actual User",
    "azureactivedirectoryobjectid": "",
    "systemuserid": "278742b0-1e61-4fb5-84ef-c7de308c19e2",
    "ownerid": "278742b0-1e61-4fb5-84ef-c7de308c19e2"
  },
  "owninguser": {
    "@odata.etag": "W/"2632435"",
    "fullname": "Impersonated User",
    "azureactivedirectoryobjectid": ",
    "systemuserid": "75df116d-d9da-e711-a94b-000d3a34ed47",
    "ownerid": "75df116d-d9da-e711-a94b-000d3a34ed47"
  }
}
```
