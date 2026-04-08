# Create, update, delete, and relate actions

You can use the Dataverse connector actions to create new rows, modify existing rows, and relate data together by using the defined relationships. When necessary, you can use the delete action to remove rows. The Dataverse actions also allow you to target a specified environment with additional **from selected environment** actions.

## Create new rows

Use the **Add a new row** action to create new rows in a Dataverse table. You need to choose a table name, and then the action dynamically shows you the top columns for that table. Required columns are indicated with a red asterisk next to the column name. You can't save the flow without providing input to each required column.

> **Note:** A required column is any column on the table that's set up as **Business Required**. If you mark other columns as **Business Required** in your table *after* you create a flow, you'll need to update your flow action the next time you update the column.

Only some columns automatically show on the action's **Parameters** tab. The remaining columns are in the **Advanced parameters**.

## Update rows

Use the **Update a row** action to update an existing data row. You can also use the action to *upsert* (update or insert): when the ID doesn't match an existing row, the action can create a new row instead.

The row ID is required on the **Update a row** action. If you're getting the row ID from another Dataverse connector trigger or action, the row ID should be named the same as the table with a column description of "Unique Identifier for the table". Don't use the OData ID column, which is different.

Unlike the **Add a new row** action that requires columns, the **Update a row** action doesn't require columns. However, you should only change values for columns when the data changes.

To clear an existing column value, change the column on the action to use an expression of `null`.

## Relate data

Two options are available for you to relate data rows together, depending on the type of relationship:

- **Using lookup columns** on the **Add a new row** or **Update a row** actions (for one-to-many relationships where the lookup column is on the row being added/updated).
- **Using the Relate rows action** to establish relationships separately (required for many-to-many relationships).

### Specify the ID for each row

When you relate data rows, you need to provide either the row's **GUID** or a **row URL**.

- **GUID** (e.g., `fd140aaf-4df4-11dd-bd17-0019b9312238`) - Select from dynamic content the column with the same name as your table and a description that says "Unique identifier for *tablename*".
- **Row URL** - Search in the dynamic content list for **OData ID**. You can manually compose a row URL by combining the table OData entity set name (usually the table's logical name + "s") with the GUID:

```
contoso_projects(fd140aaf-4df4-11dd-bd17-0019b9312238)
```

> **Tip:** To find the entity set name, add a Dataverse action, set the table, then switch to code view. The `EntityName` value is the entity set name.

### Use the Add or update a row action

When you use the **Add or update a row** action, you need to specify the row URL for the row to which you're building the relationship. You can set the primary contact on an account row by using either OData ID or row ID.

### Use the Relate rows action to establish a one-to-many relationship

1. Select the table on the **one** side of the relationship.
2. Provide the **Row ID** (GUID only, not a URL) for that table's row.
3. Pick which relationship you're establishing (tables can have multiple relationships).
4. Set the **Relate With** property to a row URL (OData ID from a previous step or a manually composed URL like `contoso_projects(fd140aaf-4df4-11dd-bd17-0019b9312238)`).

### Use the Relate rows action to establish a many-to-many relationship

- Determine which table to specify on the action by looking at the table properties for the relationship. The table that's in the **Relate** column on the list of relationships is the table name to use.
- For the **Relate With** option, use the row URL for the other table row.
