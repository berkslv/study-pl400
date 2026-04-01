# Delete records from data sources and collections

- 8 minutes

In this unit, we're going to cover the concept of deleting a record from a tabular data source or collection. Unlike creating and editing records, which have multiple controls and functions, for deleting records there are only a few options including the **Remove**, **RemoveIf**, and **Clear** functions. We most often add these functions to the **OnSelect** property of a button or icon control to delete a record.

## Delete a record

To delete a record from your data source, use the **Remove** function. Use the **Remove** function to specify the data source and the record that you want to delete. The most common way to specify this record is to use the **LookUp** function to retrieve the record from the data source. Another option is if you're using a Gallery and you want to delete the current record, the **ThisItem** operator points to the record.

For example, you could use the following formula to delete a record.

```powerappsfl
Remove(CustomerOrders, LookUp(CustomerOrders, ID = 1))
```

This formula deletes the record where the ID equals 1 from the data source **CustomerOrders**.

### Remove doesn't ask to confirm

Remove doesn't prompt for any confirmation before deleting the specified record. If you would like to confirm that the user wanted to remove the record, you need to create confirmation functionality, such as a pop-up dialogue box with buttons.

## Delete based on a condition

If you want to delete more than one record from your data source, you can use **RemoveIf**. The RemoveIf function allows you to provide a data source to delete from and a condition for selecting the records to delete. This is the same logic that is used by the Filter function.

For example, you could use the following formula to delete all of the records where the Status equals Expired from the **CustomerOrders** data source.

```powerappsfl
RemoveIf(CustomerOrders, Status = "Expired")
```

## Delete all of the records

It's also possible to delete all of the records in a data source. This is most common with *collections* where you can use the **Clear** function. If you want to delete all of the records from a *data source*, you can use **RemoveIf**.

### Delete all of the records in a collection

The **Clear** function deletes all the records of a *collection*. The columns of the collection remain. The only input you pass to the function is the collection name.

```powerappsfl
Clear(collectSelectedItems)
```

This formula deletes all of the records from the collectSelectedItems collection without changing the columns of the collection.

You typically see this type of formula when you want to clear out the collection without having to redefine it, like in the case of a reset button or selecting a new order. When working on collections, you also have the **ClearCollect** function.

The **ClearCollect** function deletes all the records from a collection and then adds a different set of records to the same collection. With a single function, ClearCollect offers the combination of **Clear** and then **Collect**.

All three functions have their place. One way to think about whether you want to use Clear and Collect versus ClearCollect is when the clearing of the collection happens, compared to when you want to add records back. Here are two examples to illustrate:

- **All at once** - For example, if you're reloading the items in a collection for a drop-down menu when a screen becomes visible, you would want to use **ClearCollect**. A single ClearCollect function in your formula removes the old records and immediately adds the new records.
- **Multi-step** - For example, if you're using collections to store user inputs like in a shopping cart you can use **Clear** and **Collect**. This is because the user might want to clear their shopping cart without adding a new record.

### Delete all of the records from a data source

It's possible to delete all of the records from a data source using **RemoveIf**. This isn't a common scenario. Again there's no confirmation before the formula processes unless you build such functionality. Finally, there's no undo or recycle bin in Power Apps.

> **Warning:** If you want to recover your data, you would need to go to your data source and use whatever recovery process is available for that data source, outside of Power Apps. Proceed with caution.

For example, you could use the following formula to delete all of the records from a data source.

```powerappsfl
RemoveIf(CustomerOrders, true)
```

This formula deletes all of the records from the **CustomerOrders** data source without changing the columns of the data source.

The reason this works is **RemoveIf** checks every record in the data source to see if the equation equals **true**. In this case, the equation is set to true, so every record is deleted.

> **Note:** Setting the equation portion to **true** also works with the **Filter** function. This can be a valuable setting if you are trying to troubleshoot formulas where you are not sure if Filter is returning data.
