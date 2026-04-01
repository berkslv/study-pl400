# Sometimes you need something more than forms

- 6 minutes

When building canvas apps in Power Apps, you go to Galleries to display records from your data source and Forms to view, create, and edit an individual record, but sometimes forms are not enough. In those scenarios, Power Apps has functions for updating your tabular data sources directly.

## Directly create and edit a record

In this module, you will learn about using the **Patch** function to update your data sources without the use of forms directly.

Patch is most often used when you need to take action on the data without user interaction in a repetitive manner, or your app design doesn't allow for the use of forms. For example, if you want to update a logging data source every time a user clicks a button to navigate to another screen you could use the formula for the OnSelect property of the button.

```powerappsfl
Patch(LoggingTable, Defaults(LoggingTable), {WhoClicked:
User().FullName, WhenClicked: Now()}); Navigate(NextScreen,
ScreenTransition.Cover)
```

This formula would create a new record in the data source named **LoggingTable**. The WhoClicked column sets to the **FullName** property of the user who is signed in, and the WhenClicked column sets to the Date and Time of when they clicked the button. This would open the screen named **NextScreen** using the Cover screen transition.

## Delete a record

There are also functions available for deleting one or more records from your data source. Those functions are:

- **Remove and RemoveIf** - These functions are used to remove or delete records from the data source.
- **Clear** - Use the **Clear** function to remove all of the records from a collection.

For example, if you wanted to give the user the ability to delete a record from a Gallery control, add a Trash icon to the Gallery displaying the data source **CustomerOrders** and then set the **OnSelect** property of the icon to the following.

```powerappsfl
Remove(CustomerOrders, ThisItem)
```

This formula would delete the record for the item that was displaying the Trash icon from the **CustomerOrders** data source. There would be no confirmation, so you might consider implementing a check or pop-up dialog to confirm that the user truly wants to delete the record.

## Bulk changes to records

Patch and Remove are both functions that are used to affect one record. If you need to affect change on more than one record, there are two options:

- Use the **ForAll** function, which was covered in the previous module, to loop through a table of data and run a Patch or Remove function for each record in the table.
- Use the **Collect** function to write from one table to another. Each record of the source table is added as a separate record to the target table.

These topics are covered in other Power Apps learning paths and are not covered in this learning path.

## Collections are data sources

It's important to remember that these functions can use a collection as their target. Patch, Remove, and RemoveIf can all be used to modify both tabular data sources and collections. As you build more complex apps storing data in collections and working with those items is very common, these functions will be a big part of that manipulation.

The remainder of this module will refer to updating a data source. Remember that a data source can either be a tabular data source or a collection unless stated otherwise.

In the next unit, you will learn how to create and edit records.
