# Delegation overview

Before picking a data source in Power Apps, understanding delegation is key. Delegation helps Power Apps work better with data sources by reducing how much data gets moved around. Basically, when possible, it lets Power Apps hand over some data processing work to the source itself. This includes tasks like filtering, searching, and sorting.

Whether your data can be delegated depends on both the source and the function you're using. If you're dealing with lots of data and need the data source to do heavy lifting like filtering, it might be wise to shift or copy your data to a system that's delegation-friendly, like Microsoft Dataverse.

To do this, you can use the Data Integrator tool to transfer data into Dataverse from another source.

## Delegation in action

Here's an example to help you understand delegation. You have a list of 5,000 projects stored in SharePoint. The **ProjectStatus** column stores the values **Active** or **Inactive**. Half (2,500) of the records are set to each of these values. You could show the list in a gallery and filter it by using this formula.

```powerappsfl
Filter(SharePointList, ProjectStatus = "Active")
```

Because the **Filter** function is delegable to a SharePoint data source, Power Apps would send your formula to SharePoint. SharePoint would process all 5,000 records and return to Power Apps the 2,500 records for which **ProjectStatus** is set **Active**. Those records would all be available in your gallery. In this scenario, Power Apps didn't process any data, and only the matching records were sent from SharePoint to Power Apps, which is efficient.

## When delegation isn't available

Some functions can't be delegated to some data sources. An example of a nondelegable action is the **Search** function against the SharePoint data source. The **Search** function is similar to **Filter**, but you can use **Search** to check across multiple fields and to find partial matches. For example:

```powerappsfl
Search(SharePointList, "Rob", "FirstName", "LastName")
```

This would return all of the records where the string "rob" is in either the **FirstName** or the **LastName** column. In this example, Power Apps would return records for Robert Smith, Rob Jones, and Suzy Robinson.

The **Search** function doesn't work with SharePoint as a delegable action, which means Power Apps has to handle the records itself. Initially, all the records are sent from SharePoint to Power Apps. By default, SharePoint only sends the first 500 records, not the first 500 matching your formula but the first 500 in the entire data set.

For instance, if you use this formula in your gallery, SharePoint sends Power Apps the initial 500 records from the list, and then Power Apps performs the search locally. Imagine your list has 5,000 items; the remaining 4,500 records aren't processed or shown.

You can adjust the default limit of 500 records to a maximum of 2,000 in Power Apps Studio's advanced settings. However, even with this increase, if you had 5,000 items, 3,000 records would still not be processed or displayed.

## Consider delegation when choosing a data source

Delegation gets its own module because it's crucial when you're selecting a data source. Think about the specific functions you use, such as Search, and also the volume of data you're handling. These factors play a large role in picking the perfect data source for your app.

In the following unit, you learn more about how delegation works with various data sources.
