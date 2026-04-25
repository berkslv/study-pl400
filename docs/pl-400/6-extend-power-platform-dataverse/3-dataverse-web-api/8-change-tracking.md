# Track Entity Data Changes with Change Tracking and the Web API

Dataverse *change tracking* enables efficient data synchronization across multiple systems by tracking changes to table data over time.

## Enable Change Tracking for a Table

In the Power Apps maker portal, go to table settings and enable the **Track changes** flag under **Advanced options > For this table**.

## Delta Links

*Delta links* (per OData 4.0) are opaque, service-generated links used to retrieve subsequent changes to a result. Dataverse implements this standard to provide a common method for interfacing with change data.

- After each change tracking request, the response contains a **delta link**.
- Pass the delta link to your next request to get changes since the previous request.
- Your app must maintain the delta link (similar to tracking with date/time stamps).

## Retrieve Changes Using the Web API

Add `odata.track-changes` as a preference header. Initial request retrieves all matching data plus a delta link:

```odata
GET [Organization URI]/org1/api/data/v9.2/accounts?$select=name,accountnumber,telephone1,fax HTTP/1.1
Prefer: odata.track-changes
Cache-Control: no-cache
OData-Version: 4.0
Content-Type: application/json
```

**Initial response** (includes `@odata.deltaLink`):

```odata
{
  "@odata.context":"[Organization URI]/data/v9.2/$metadata#accounts(name,telephone1,fax)/$delta",
  "@odata.deltaLink":"[Organization URI]/api/data/v9.2/accounts?$select=name,telephone1,fax&$deltatoken=919042%2108%2f22%2f2017%2008%3a10%3a44",
  "value": [
    {
      "@odata.etag":"W/\"915244\"",
      "name":"Monte Orton",
      "telephone1":"555000",
      "fax":"10101",
      "accountid":"60c4e274-0d87-e711-80e5-00155db19e6d"
    },
    {
      "@odata.context":"[Organization URI]/api/data/v9.2/$metadata#accounts/$deletedEntity",
      "id":"2e451703-c686-e711-80e5-00155db19e6d",
      "reason":"deleted"
    }
  ]
}
```

**Subsequent request** (using delta link to get changes since last request):

```odata
GET [Organization URI]/api/data/v9.2/accounts?$select=name,accountnumber,telephone1,fax&$deltatoken=919042%2108%2f22%2f2017%2008%3a10%3a44
```

**Subsequent response** (new/deleted records + new delta link):

```odata
{
  "@odata.context":"[Organization URI]/data/v9.2/$metadata#accounts(name,telephone1,fax)/$delta",
  "@odata.deltaLink":"[Organization URI]/api/data/v9.2/accounts?$select=name,telephone1,fax&$deltatoken=919058%2108%2f22%2f2017%2008%3a21%3a20",
  "value": [
    {
      "@odata.etag":"W/\"915244\"",
      "name":"Monte Orton",
      "telephone1":"555000",
      "fax":"10101",
      "accountid":"60c4e274-0d87-e711-80e5-00155db19e6d"
    },
    {
      "@odata.context":"[Organization URI]/api/data/v9.1/$metadata#accounts/$deletedEntity",
      "id":"2e451703-c686-e711-80e5-00155db19e6d",
      "reason":"deleted"
    }
  ]
}
```

## Retrieve the Number of Changes in a Delta

Add the `$count` parameter to your request:

```odata
GET [Organization URI]/api/data/v9.2/accounts/$count?$deltatoken=919042%2108%2f22%2f2017%2008%3a10%3a44
```
