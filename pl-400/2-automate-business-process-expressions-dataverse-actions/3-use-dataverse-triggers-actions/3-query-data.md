# Query data

The Dataverse connector has some actions designed to retrieve data from your tables. The two most common are:

- **Get a row by ID** - Retrieves a single row with the unique ID that you provide.
- **List rows** - Returns zero to many rows that match your filter criteria.

You also have **...from selected environment** variants of these actions, enabling you to use the same actions with an environment other than the one you're building in.

## Select columns

The **Select columns** option limits the columns that are returned from the action. You should set up the list of columns based on the data that you need in your subsequent flow steps. Providing a list of columns helps your flow be more efficient. Make sure that you use the table column *logical* name, which you can find on the **Advanced options** section of the column properties.

```
firstname,lastname
```

Specifying a list of columns limits the columns that show in dynamic content when you're setting up subsequent steps in the flow.

## Expand query

By default, when the retrieve data actions run, they only retrieve data from the primary table specified on the action. You can use the **Expand Query** option to provide an OData-style expression to include data from related tables. You can find this option under **Advanced parameters**.

```
primarycontactid($select=contactid,fullname)
```

While this expression includes data in the output of the actions, it doesn't include the data columns in the **Dynamic content** pane for selection. To use the related data, you need to use a workflow expression to access the data.

## Use the Get a row by ID action

Commonly, you would use the **Get a row by ID** action to retrieve extra Dataverse table data as part of flow logic. For example, if the addition of a new *Account* table row triggers your flow, you might use a **Get a row by ID** action to retrieve the email for the related primary contact.

Occasionally, you might want to use the **Get a row by ID** action again in your flow logic to ensure that you have the latest data. For example, if your flow paused for an approval step, a couple of days might pass since the last time you retrieved data. You might want to use the **Get a row by ID** action to get the latest data after the approval happens.

> **Note:** If the ID of the row might be null, complete a conditional check on the value before running the **Get a row by ID** step. The step fails if the row ID is null.

## Use the List rows action

The **List rows** action supports two styles for how you specify criteria: OData style expressions or Dataverse FetchXML.

### Retrieve more than 5,000 rows

By default, the action doesn't return more than 5,000 rows. You can turn on the **Pagination** feature from the **Settings** tab if you need to return more data. When you turn on pagination, you can specify a page size of up to 100,000 rows.

> **Warning:** Reaching 5,000 rows doesn't produce an error; you simply won't receive all data. Compose your criteria to produce the smallest possible results for your flow to process.

### Use OData style criteria

In the **Filter rows** property, you can provide an OData style filter to limit the rows returned. Use the column's logical name in expressions.

Simple equality filter:

```
firstname eq 'John'
```

Using a query function:

```
contains(firstname,'John')
```

Using logical operators with a range:

```
revenue lt 100000 and revenue gt 2000
```

Using parentheses for complex expressions:

```
(contains(name,'sample') or contains(name,'test')) and revenue gt 5000
```

Filtering on related data:

```
primarycontactid/fullname eq 'Susanna (sample)'
```

The **Sort by** property determines the order of rows' output. Provide a comma-separated list of logical column names. Append `asc` or `desc` to indicate direction.

The **Row count** property indicates how many rows to return.

> **Tip:** When testing your flow, set the **Row count** to 1 (or another small number) to speed up testing.

### Use FetchXML style criteria

FetchXML is a proprietary XML-based query language of Dataverse. You can compose FetchXML manually or use **Advanced find** from a Power Apps model-driven application to build your filter and then download the FetchXML.

FetchXML contains the equivalent of the **Select columns**, **Sort by**, **Expand Query**, and **Filter rows** features for the OData style criteria.

Example FetchXML filtering the Account table for active rows with a name containing "Contoso", also returning the primary contact's email:

```xml
<fetch>
  <entity name="account">
    <attribute name="name"/>
    <attribute name="address1_city"/>
    <attribute name="primarycontactid"/>
    <attribute name="telephone1"/>
    <attribute name="accountid"/>
    <order attribute="name" descending="false"/>
    <filter type="and">
      <condition attribute="statecode" operator="eq" value="0"/>
      <condition attribute="name" operator="like" value="%Contoso%"/>
    </filter>
    <link-entity alias="accountprimarycontactidcontactcontactid" name="contact" from="contactid" to="primarycontactid" link-type="outer" visible="false">
      <attribute name="emailaddress1"/>
    </link-entity>
  </entity>
</fetch>
```

> **Note:** Aggregation queries aren't supported when you're using the **List rows** action with FetchXML criteria.
