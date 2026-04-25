# Use FetchXML to Query Data

FetchXML is a query language developed by Microsoft for complex query operations against Microsoft Dataverse data. It provides more filtering options than OData connectors and supports labels for reference data (option set labels, lookup fields).

## Methods to Run FetchXML Queries

- Dataverse Web API
- Organization service
- Custom FetchXML filter on a lookup field in a model-driven app (via `addCustomFilter` Client API)

## Example FetchXML Queries

### Basic query (accountid and name from account table)

```xml
<fetch mapping='logical'>
   <entity name='account'>
      <attribute name='accountid'/>
      <attribute name='name'/>
   </entity>
</fetch>
```

### Query with filter (by state)

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

## Tools to Build FetchXML Queries

- **Advanced Find** — Includes a **Download FetchXML** function. Good starting point for simple queries.
- **FetchXML Builder** — Community tool for constructing FetchXML beyond Advanced Find's capabilities: aggregates, outer joins, "has no" queries, attributes from multi-level linked entities. Available at https://fetchxmlbuilder.com/

## More Resources

See [Use FetchXML to query data](https://learn.microsoft.com/en-us/power-apps/developer/common-data-service/use-fetchxml-construct-query/) for advanced topics: paging, hierarchical data queries, and more.
