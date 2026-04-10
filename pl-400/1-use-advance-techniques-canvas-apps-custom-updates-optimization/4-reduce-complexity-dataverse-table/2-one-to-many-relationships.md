# Work with one-to-many relationships

One-to-many relationships are the most common Dataverse relationships that you will work with. This unit continues the scenario regarding the shared workspaces (*hot desking*) solution in Contoso. To help explain how to work with relationships in a canvas app, the ensuing examples will use the relationship between the Location and Desk tables.

## Navigate relationships with dot notation

If you want to allow a user to select a location and to have that location's desks show in a gallery underneath, you could use the `Filter()` function:

```powerfx
Filter(Desks, Location = FilterLocation_1.Selected)
```

Because you are working with a Dataverse one-to-many relationship, you can instead use the dot notation to reference the location's desks:

```powerfx
FilterLocation_1.Selected.Desks
```

Both formulas produce the same list of desks related to the selected location. Using dot notation is simpler and more concise than using the `Filter()` function.

You can also apply additional filters on top of the relationship navigation:

```powerfx
Filter(FilterLocation_1.Selected.Desks, Status = 'Status (Desks)'.Active)
```

### Navigate from child to parent

You can also use the relationship starting from the desk row. Instead of using `Lookup()` to retrieve the location record:

```powerfx
LookUp(Locations, Location = ThisItem.Location).Address
```

You can use dot notation:

```powerfx
ThisItem.Location.Address
```

You are not limited to one level of relationship navigation. For example, to show a primary contact's full name from the location:

```powerfx
ThisItem.Location.'Primary Contact'.'Full Name'
```

By using dot notation, you can quickly include related data regardless of which side of the relationship you are starting from.

## Add and update related rows

The simplest way to establish a one-to-many relationship is by using an edit form. When you add the lookup column to the form, it uses the `Choices()` function to present possible values to the user. The `Choices()` function result is a table, so you can add more filtering and sorting:

```powerfx
Filter(Choices([@Desks].contoso_Location), Status = 'Status (Locations)'.Active)
```

If you already have the lookup value you want to set (for example, when creating a desk record from the Location screen), you could set the **DefaultSelectedItems** property on the data card value and hide the form field.

### Patch a lookup column

If you are using the `Patch()` function to set a lookup column, set the value of the column to a record from the primary table:

```powerfx
Patch(Desks, ThisItem, {Location: FilterLocation_1.Selected})
```

### Use Relate and Unrelate

You can use the `Relate()` function to establish the relationship. The first parameter is the list of rows related to the primary row, and the second parameter is the row to be related:

```powerfx
Relate(FilterLocation_1.Selected.Desks, ThisItem)
```

Similarly, use `Unrelate()` to disassociate rows:

```powerfx
Unrelate(FilterLocation_1.Selected.Desks, ThisItem)
```

> **Note:** When using `Unrelate()`, the lookup column on the related record is set to **Nothing** (null). Avoid orphaned rows that the app cannot display without the primary association.
