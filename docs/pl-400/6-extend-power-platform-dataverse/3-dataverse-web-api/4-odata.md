# Use OData to query data

Completed

- 15 minutes

OData is a protocol for querying RESTful APIs. This lesson explores a few ways of performing CRUD operations against Microsoft Dataverse data.

## Create a row

To create rows, use the HTTP POST method.

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

## Retrieve rows

To retrieve rows, use the HTTP GET method.

The following sample retrieves an account with the ID **00000000-0000-0000-0000-000000000001**:

```odata
GET [Organization URI]/api/data/v9.2/accounts(00000000-0000-0000-0000-000000000001)
```

Other methods are available for querying data by using standard OData query syntax. For more information on this process, see [Retrieve a table row using the Web API](/en-us/power-apps/developer/common-data-service/webapi/retrieve-entity-using-web-api/?azure-portal=true).

## Update rows

Depending on what you are trying to accomplish, you can choose between one of two methods for updating rows:

- If you're performing an update of multiple attribute values, use the HTTP PATCH method. PATCH methods provide upsert capability if you provide an ID value as part of your request, a beneficial feature when you're synchronizing data between systems.
- If you're updating a single attribute value, use the HTTP PUT method. You can't use this method with navigation properties like lookups because that requires a reference to be removed as well.

The following example updates an account table row:

```odata
PATCH [Organization URI]/api/data/v9.2/accounts(00000000-0000-0000-0000-000000000001) HTTP/1.1
Content-Type: application/json
OData-MaxVersion: 4.0
OData-Version: 4.0

{
    "name": "Updated Sample Account ",
    "creditonhold": true,
    "address1_latitude": 47.639583,
    "description": "This is the updated description of the sample account",
    "revenue": 6000000,
    "accountcategorycode": 2
}
```

If you want to retrieve data from the table that you're updating, you can use the return=representation request header. If you want to control which properties are returned, you can add a `$select` query to your PATCH URL. In the following example, the header has been added and the `$select` has been amended to only include the name, creditonhold, and address1 attributes.

### Request

```odata
PATCH [Organization URI]/api/data/v9.2/accounts(00000000-0000-0000-0000-000000000001)?$select=name,creditonhold,address1_latitude,description,revenue,accountcategorycode,createdon HTTP/1.1
OData-MaxVersion: 4.0
OData-Version: 4.0
Accept: application/json
Content-Type: application/json; charset=utf-8
Prefer: return=representation

{"name":"Updated Sample Account"}
```

### Response

```odata
HTTP/1.1 200 OK
Content-Type: application/json; odata.metadata=minimal
Preference-Applied: return=representation
OData-Version: 4.0

{
    "@odata.context": "[Organization URI]/api/data/v9.2/$metadata#accounts/$entity",
    "@odata.etag": "W/"536537"",
    "accountid": "00000000-0000-0000-0000-000000000001",
    "accountcategorycode": 1,
    "description": "This is the description of the sample account",
    "address1_latitude": 47.63958,
    "creditonhold": false,
    "name": "Updated Sample Account",
    "createdon": "2023-09-28T23:14:00Z",
    "revenue": 5000000.0000,
    "_transactioncurrencyid_value": "048dddaa-6f7f-e611-80d3-00155db5e0b6"
}
```

The following code is a sample PUT request where an account's name for a given row is updated:

```odata
PUT [Organization URI]/api/data/v9.2/accounts(00000000-0000-0000-0000-000000000001)/name HTTP/1.1
Content-Type: application/json
OData-MaxVersion: 4.0
OData-Version: 4.0

{"value": "Updated Sample Account Name"}
```

## Delete rows

To delete rows, use the HTTP DELETE method. The operation is straightforward, where you provide the URI of the table row that you want to delete, as shown in the following request:

```odata
DELETE [Organization URI]/api/data/v9.2/accounts(00000000-0000-0000-0000-000000000001) HTTP/1.1
Content-Type: application/json
OData-MaxVersion: 4.0
OData-Version: 4.0
```

## More operations

Dataverse provides many other predefined operations that you can trigger through Web API requests. For a full inventory of the available capabilities, see [Perform operations using the Web API](/en-us/power-apps/developer/common-data-service/webapi/perform-operations-web-api/?azure-portal=true).
