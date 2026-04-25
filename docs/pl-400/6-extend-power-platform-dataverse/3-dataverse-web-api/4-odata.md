# Use OData to Query Data

OData is a protocol for querying RESTful APIs. CRUD operations against Microsoft Dataverse data use standard HTTP methods.

## Create a Row (POST)

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

## Retrieve Rows (GET)

Retrieve a specific row by ID:

```odata
GET [Organization URI]/api/data/v9.2/accounts(00000000-0000-0000-0000-000000000001)
```

Use standard OData query syntax for more complex filtering. See [Retrieve a table row using the Web API](https://learn.microsoft.com/en-us/power-apps/developer/common-data-service/webapi/retrieve-entity-using-web-api/).

## Update Rows

- **PATCH** — Update multiple attribute values. Supports **upsert** when an ID is provided.
- **PUT** — Update a single attribute value. Cannot be used with navigation properties (lookups).

### PATCH example

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

### PATCH with return=representation

Use the `Prefer: return=representation` header to retrieve updated data in the response. Add `$select` to control which fields are returned:

**Request:**

```odata
PATCH [Organization URI]/api/data/v9.2/accounts(00000000-0000-0000-0000-000000000001)?$select=name,creditonhold,address1_latitude,description,revenue,accountcategorycode,createdon HTTP/1.1
OData-MaxVersion: 4.0
OData-Version: 4.0
Accept: application/json
Content-Type: application/json; charset=utf-8
Prefer: return=representation

{"name":"Updated Sample Account"}
```

**Response:**

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

### PUT example (single attribute)

```odata
PUT [Organization URI]/api/data/v9.2/accounts(00000000-0000-0000-0000-000000000001)/name HTTP/1.1
Content-Type: application/json
OData-MaxVersion: 4.0
OData-Version: 4.0

{"value": "Updated Sample Account Name"}
```

## Delete Rows (DELETE)

```odata
DELETE [Organization URI]/api/data/v9.2/accounts(00000000-0000-0000-0000-000000000001) HTTP/1.1
Content-Type: application/json
OData-MaxVersion: 4.0
OData-Version: 4.0
```

## More Operations

See [Perform operations using the Web API](https://learn.microsoft.com/en-us/power-apps/developer/common-data-service/webapi/perform-operations-web-api/) for a full inventory of available capabilities.
