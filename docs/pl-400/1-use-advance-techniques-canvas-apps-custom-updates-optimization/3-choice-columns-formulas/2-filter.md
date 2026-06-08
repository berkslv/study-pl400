# Filter Dataverse choice columns with Power Fx formulas

Completed

- 4 minutes

When you have a Dataverse table with a choice column, youÔÇÖll often want to filter data using that choice column. The most common filtering scenarios are:

- Filter the table rows for display in a gallery.
- Have a dropdown menu or combo box control with the list of choice values, and then let the user select one or more. Then, you can use the selected values to filter the table rows that you show in the gallery.

For example, if you have a **Category** choice column on the Accounts table, you can use the following logic to filter only preferred customers:

```powerappsfl
Filter(
  Accounts,
  Category = 'Category (Accounts)'.'Preferred Customer'
)
```

Be sure to use the full table.column string, and not just the column string, 'Preferred Customer' (like the image below), because it's an invalid comparison. If you forget to add the table to the string, you see the 'Incompatible types for comparison' error. Since the 'Category (Accounts)' is a table (or option set) itself, you can't compare the table value with a text value. Therefore, you need to use the fully qualified reference: `'Category (Accounts)'.'Preferred Customer'` (also displayed as `[@Category].'Preferred Customer')`.

[![Screenshot of the invalid Power Fx formula of: Filter ( Accounts, Category = &quot;Preferred Customer&quot; ).](media/invalid.png)](media/invalid.png#lightbox)

Frequently, you use a dropdown or combo box to filter a gallery so users can select which categories of items to display. In the following example, you'll use a combo box to allow users to make multiple selections of account categories to show in the gallery.

[![Screenshot of a partial account information form, showing a dropdown list with multiple categories selected: Standard and Preferred Customer.](media/categories.png)](media/categories.png#lightbox)

First, add a combo box to the screen, and then set the **Items** property by using the [Choices function](/en-us/power-apps/maker/canvas-apps/functions/function-choices/?azure-portal=true).

[![Screenshot of the following expression as a formula for the Items property: Choices(Accounts.Category).](media/choices.png)](media/choices.png#lightbox)

The Choices() function prepares a list of values for your user to select from by using the metadata for the choice column **Accounts.Category**.

Next, you modify the **Items** formula for the gallery to include using the combo box **SelectedItems** property.

`Filter(Accounts, Category in ComboBoxCategory.SelectedItems)`

Using the **in** operator allows the formula to filter on any of the selected categories.

This formula will only show rows in the gallery when at least one category is selected. If you want to show all rows when no categories are selected, you could add an **IsEmpty** check to your formula.

```powerappsfl
Filter(
  Accounts, Category in ComboBoxCategory.SelectedItems
  || IsEmpty(ComboBoxCategory.SelectedItems)
)
```

## Filter choices columns

Filtering table rows on a choices column is complicated by how the data is stored in Dataverse as a comma-separated list. As a result, any filter that you compose that involves a choices column receives a [delegation](/en-us/power-apps/maker/canvas-apps/delegation-overview/?azure-portal=true) warning, as illustrated in the following example.

[![Screenshot of the formula Filter(Accounts,Text(Dropdown1.Selected.Value in 'Preferred Delivery').](media/filter.png)](media/filter.png#lightbox)

One approach that you could take to avoid the delegation issue is to create a Dataverse table view that filters the choices values and then use the view in your Filter() function criteria. This approach would help you avoid the delegation warning, but it won't allow the app user to provide the filter criteria values. The following screenshot shows an example of a Dataverse view filter for the **Preferred Delivery** choices column.

[![Screenshot of the Dataverse view edit filter criteria that shows filtering on the Preferred Delivery choices column.](media/edit.png)](media/edit.png#lightbox)

You could use this Dataverse view named **Monday Delivery** by using the following Filter() function:

```powerappsfl
Filter(
  Accounts,
  'Accounts (Views)'.'Monday Delivery'
)
```

Additionally, you can still include user-entered criteria for columns other than the Category. For example, the following Filter() function shows the addition of the **Category** choice column, which is filtered on the value that the user selected from the dropdown list.

```powerappsfl
Filter(
  Accounts,
  'Accounts (Views)'.'Monday Delivery',
  Category = Dropdown1.Selected.Value
)
```

Because of their standardized list of values, choice and choices columns are useful in providing consistent ways to filter table rows.
