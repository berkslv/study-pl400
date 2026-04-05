# Collections

In the previous units, you learned how global and context variables store single values. The third variable type, collections, allows you to store a table of data in memory.

Collections are useful when you need to temporarily store structured data for reuse within your app. This data can come from a data source, be created within the app, or be a combination of both.

## Using collections to increase performance

One common reason for using collections is to reduce repeated calls to the same data source. For example, if your app needs to reference a list of active projects multiple times, you can retrieve the data once and store it in a collection. To store a copy of the **Projects** table in a collection named **collectProjects**, use the following formula:

```
Collect(collectProjects, Projects)
```

This creates a collection named **collectProjects** that will have the same rows and columns as the **Projects** table from your data source. Here's a couple of considerations that you need to understand about using collections:

- The Collect function isn't delegable. This means by default only the first 500 records from the data source will be retrieved and stored in the collection. For more information about working with delegation, see [Work with data source limits (delegation limits) in a Power Apps canvas app](https://learn.microsoft.com/en-us/training/modules/work-with-data-source-limits-powerapps-canvas-app/).

- Collections aren't linked to the data source after you create them. This means changes to the data in the collection don't automatically save to the data source. This includes changes you have made to the data. If you want to update the data source based on your changes to the collection, you'll need to build formulas to do so, such as recollecting from the data source.

- Collections are temporary. When you close the app, the collection and all of its contents are removed. If you need to store collection data, you need to write it to a data source before closing the app.

## Using dynamic collections

Collections don't have to come from a data source. You can also create collections directly within your app. This is commonly done to populate drop-down controls, combo boxes, or to stage data before writing it to a data source.

The following formula creates a collection named **collectColors**:

```
Collect(collectColors, {Name: "Shane", FavoriteColor: "Orange"},
{Name: "Mary", FavoriteColor: "Blue"}, {Name: "Oscar", FavoriteColor:
"Yellow"})
```

| Name  | FavoriteColor |
|-------|---------------|
| Shane | Orange        |
| Mary  | Blue          |
| Oscar | Yellow        |

After creating a collection, you can reuse it throughout your app and apply standard table functions such as Filter, Sort, and CountRows.

One important limitation is that collections can't be used directly with the Form control, even though they store tabular data.

For more information about working with collections and the table data they store, see [Author a basic formula that uses tables and records in a Power Apps canvas app](https://learn.microsoft.com/en-us/training/modules/author-basic-formula-tables-records-powerapps/).

Additionally, collections store table data no differently than tabular data sources. The learning path [Work with data in a Power Apps canvas app](https://learn.microsoft.com/en-us/training/paths/work-with-data-in-a-canvas-app/) has many concepts that allow you to work with and extend the power of your collections.

In the final unit of this module, you'll learn about some additional variable concepts and how to apply them to your apps.
