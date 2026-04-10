# Work with relationships in Power Apps

- 10 minutes

Power Apps offers a rich set of functions and controls tailor-made for establishing and utilizing relationships within your apps. Relationships typically find two primary applications in most apps:

1. Storing data across multiple tables and using relationships to seamlessly connect this data.
2. Fetching information from the parent record when directly accessing the child record.

## Connecting a parent and child table in Power Apps

In this example, we walk through how to reference a parent and child relationship using the Power Apps `Filter` and `LookUp` functions.

**CustomerTable** (parent — one customer can have many invoices):

| ID | CustomerName | CustomerPhoneNumber |
| --- | --- | --- |
| 1 | Contoso | 513-555-1212 |
| 2 | Fabrikam | 206-555-1313 |
| 3 | Tailspin Toys | 404-555-1414 |

**InvoiceTable** (child):

| ID | InvoiceDate | InvoiceDescription | InvoiceAmount | CustomerID |
| --- | --- | --- | --- | --- |
| 1 | 5/16/2020 | Parts | 412.33 | 1 |
| 2 | 5/1/2020 | Service | 205.44 | 3 |
| 3 | 5/6/2020 | Travel | 132.98 | 1 |
| 4 | 5/31/2020 | Parts | 75.55 | 2 |

### Displaying customers in Gallery1

1. Insert a **Gallery** control onto your canvas.
2. Set the **Items** property to **CustomerTable**.

### Filtering invoices based on selected customer (Gallery2)

1. Insert a second **Gallery** control.
2. Set the **Items** property to:

```powerapps
Filter(InvoiceTable, CustomerID = Gallery1.Selected.ID)
```

| Formula Argument | Formula Input | Notes |
| --- | --- | --- |
| source | InvoiceTable | |
| logical_test | `CustomerID = Gallery1.Selected.ID` | `CustomerID` is from InvoiceTable; `Gallery1.Selected.ID` is the selected customer's ID |

Gallery2 now displays only invoices for the customer selected in Gallery1.

## Looking up information from the parent (bottom-up)

When examining a child record (e.g., an invoice), you can navigate up to the parent to retrieve related details like the customer name.

### Setup for Gallery3 (InvoiceTable)

1. Insert a **Gallery** control.
2. Set **Items** to **InvoiceTable**.
3. Set **Layout** to Title, Subtitle, and body.
4. Set **Title** to: `Text(ThisItem.InvoiceDate, DateTimeFormat.ShortDate)`
5. Set **Subtitle** to **InvoiceAmount**.
6. Set **Body** to **CustomerID**.

### Replace CustomerID with CustomerName using LookUp

Select the **Body** label in Gallery3 and set its **Text** property to:

```powerapps
LookUp(CustomerTable, ID = ThisItem.CustomerID, CustomerName)
```

| Formula Argument | Formula Input | Notes |
| --- | --- | --- |
| source | CustomerTable | |
| logical_test | `ID = ThisItem.CustomerID` | Matches parent record |
| result | `CustomerName` | Column returned for matching records |

Gallery3 now shows the customer name instead of the numeric ID.

## Performance Notes

Using `LookUp` inside a Gallery triggers a data source query **once per record**. If your InvoiceTable has hundreds of records, that means hundreds of separate data source calls — increasing network traffic and degrading performance.

**Better approach:** Use a collection or other means to query and store all customer records once, then perform lookups against the in-memory collection.

> For more information, see the blog post on [Performance considerations with Power Apps](https://powerapps.microsoft.com/blog/performance-considerations-with-powerapps/).
