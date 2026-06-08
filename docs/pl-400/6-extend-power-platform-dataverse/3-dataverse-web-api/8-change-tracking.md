# Track entity data changes with change tracking and the Web API

Completed

- 15 minutes

Commonly, organizations need to synchronize data across multiple systems. Microsoft Dataverse provides a feature to efficiently manage this scenario, called *change tracking*. With change tracking enabled, you can build applications to query for these changes.

## Enable change tracking for a table

You can enable change tracking on a table by setting the **Track changes** flag on the table settings in the Power Apps maker portal, found under the **Advanced options &gt; For this table** section.

## Delta links

According to the OData 4.0 documentation, *delta links* are "opaque, service-generated links that the client uses to retrieve subsequent changes to a result." Microsoft has built this standard into change tracking in Dataverse to provide a common, standard method for interfacing with change data as it occurs over time. For more information on delta links, see [OData Version 4.0 - Delta Links](https://docs.oasis-open.org/odata/odata/v4.0/cs01/part1-protocol/odata-v4.0-cs01-part1-protocol.html#_Toc365046305).

After you issue a change tracking request, your response contains a delta link, which you then pass to your next request to get changes that have occurred since the initial request. It's up to your app to maintain the delta link, similarly to how you might have done tracking with date/time stamps in the past.

## Retrieve changes in tables by using the Web API

After you've enabled change tracking on a table, you can retrieve its changes through the Web API by adding `odata.track-changes` as a preference header in your web request. The following example requests changes from the account table for a specific set of fields (**name**, **account number**, **telephone1**, and **fax**).

```odata
GET [Organization URI]/org1/api/data/v9.2/accounts?$select=name,accountnumber,telephone1,fax HTTP/1.1
Prefer: odata.track-changes
Cache-Control: no-cache
OData-Version: 4.0
Content-Type: application/json
```

On the initial request, you receive the entire set of data that applies to the query because a delta hasn't been applied. However, the response shows an `@odata.deltaLink` value. This link contains a **deltatoken** parameter, which is intended to be passed into your subsequent request when you want to see what changes have been applied since this query was run. Think of this process as similar to how you would handle paging in OData.

The following example is a response to the preceding account request:

```odata
{
          "@odata.context":"[Organization URI]/data/v9.2/$metadata#accounts(name,telephone1,fax)/$delta",
          "@odata.deltaLink":"[Organization URI]/api/data/v9.2/accounts?$select=name,telephone1,fax&$deltatoken=919042%2108%2f22%2f2017%2008%3a10%3a44",
"value":
    [
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

In this scenario, consider that some time has passed, and you now want to see if any other changes have been applied. You can use the `@odata.deltaLink` parameter to run your query (or extract its **deltatoken** if you're managing connection strings differently), and see what changes have happened since your last request.

The following example shows how you would retrieve changes since that last request by running the returned `@odata.deltaLink`:

```odata
GET [Organization URI]/api/data/v9.2/accounts?$select=name,accountnumber,telephone1,fax&$deltatoken=919042%2108%2f22%2f2017%2008%3a10%3a44
```

In this scenario, imagine that a new account was created and another one was deleted. Your response would then look similar to the following example:

```odata
{
          "@odata.context":"[Organization URI]/data/v9.2/$metadata#accounts(name,telephone1,fax)/$delta",
          "@odata.deltaLink":"[Organization URI]/api/data/v9.2/accounts?$select=name,telephone1,fax&$deltatoken=919058%2108%2f22%2f2017%2008%3a21%3a20",
"value":
    [
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

As shown in the example, another delta link was provided, which you can then use the next time you need to see what changes have occurred.

## Retrieve the number of changes in a delta

You can also retrieve the number of changes made in a given delta by adding the `$count` parameter to your request.

```odata
GET [Organization URI]/api/data/v9.2/accounts/$count?$deltatoken=919042%2108%2f22%2f2017%2008%3a10%3a44
```
