# Filter Dataverse choice columns with Power Fx formulas

When you have a Dataverse table with a choice column, you'll often want to filter data using that choice column. The most common filtering scenarios are:

- Filter the table rows for display in a gallery.
- Have a dropdown menu or combo box control with the list of choice values, and then let the user select one or more. Then, use the selected values to filter the table rows shown in the gallery.

For example, if you have a **Category** choice column on the Accounts table, you can use the following logic to filter only preferred customers:

```powerappsfl
Filter(
  Accounts,
  Category = 'Category (Accounts)'.'Preferred Customer'
)
```

> **Important:** Use the full `table.column` string (e.g., `'Category (Accounts)'.'Preferred Customer'`), not just the column string `'Preferred Customer'`. Using only the column string causes an **'Incompatible types for comparison'** error because `'Category (Accounts)'` is an option set (table), not a text value. You can also write it as `[@Category].'Preferred Customer'`.

## Filtering with a combo box

Frequently, you use a dropdown or combo box to filter a gallery so users can select which categories of items to display. In this example, a combo box allows users to make multiple selections of account categories.

First, add a combo box to the screen and set the **Items** property using the `Choices` function:

```powerappsfl
Choices(Accounts.Category)
```

The `Choices()` function prepares a list of values for your user to select from by using the metadata for the choice column `Accounts.Category`.

Next, modify the **Items** formula for the gallery to include the combo box **SelectedItems** property:

```powerappsfl
Filter(Accounts, Category in ComboBoxCategory.SelectedItems)
```

Using the **in** operator allows the formula to filter on any of the selected categories.

This formula will only show rows in the gallery when at least one category is selected. If you want to show all rows when no categories are selected, add an `IsEmpty` check:

```powerappsfl
Filter(
  Accounts,
  Category in ComboBoxCategory.SelectedItems
  || IsEmpty(ComboBoxCategory.SelectedItems)
)
```

## Filter choices columns

Filtering table rows on a **choices** (multi-select) column is complicated by how the data is stored in Dataverse as a comma-separated list. As a result, any filter that involves a choices column receives a [delegation](https://learn.microsoft.com/en-us/power-apps/maker/canvas-apps/delegation-overview/) warning.

One approach to avoid the delegation issue is to create a Dataverse table view that filters the choices values and then use the view in your `Filter()` function criteria. This approach avoids the delegation warning, but won't allow the app user to provide filter criteria values.

You can use a Dataverse view named **Monday Delivery** with the following `Filter()` function:

```powerappsfl
Filter(
  Accounts,
  'Accounts (Views)'.'Monday Delivery'
)
```

You can still include user-entered criteria for other columns. For example, the following `Filter()` function adds the **Category** choice column, filtered on the value selected from a dropdown list:

```powerappsfl
Filter(
  Accounts,
  'Accounts (Views)'.'Monday Delivery',
  Category = Dropdown1.Selected.Value
)
```

Because of their standardized list of values, choice and choices columns are useful in providing consistent ways to filter table rows.
