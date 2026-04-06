# Summary: Using Choice Columns and Power Fx Formulas in Canvas Apps

> **Source files:** 1-introduction.md, 2-filter.md, 3-set-values.md, 4-exercise.md

---

## Choice Columns in Microsoft Dataverse

- **Choice column**: A Dataverse column type where users select from a predefined, standardized list of values (not free-form text).
- Single-choice columns allow one selection; **choices** (multi-select) columns allow multiple values from the same list.
- Choice values are stored as **table column metadata** — only app makers can modify them, not end users.
- Numeric values are stored in Dataverse (not text); for multi-select, a comma-separated list of numbers is stored.
- **Local choice**: Only usable in the column/table where created.
- **Global choice**: Reusable across multiple columns and tables. Default and recommended (`Sync with global choice? = Yes`).
- When creating a global choice, the **Sync this choice with** field is mandatory.
- **"Selecting multiple choices is allowed"** must be checked **before** column creation — cannot be changed afterward.
- Each choice has a Label, Value (integer, auto-assigned), and optional Color (model-driven apps only). Only the label is usable in formulas.
- If new/changed choices don't appear in the editor, refresh the table via **ellipsis (…) > Refresh** in the data panel.

### Choice vs. Lookup Comparison

| Choice | Lookup / Many-to-Many |
|---|---|
| List modified by maker only. | List is table data; normal security applies. |
| Stored as whole number or comma-separated numbers. | Stored as table reference. |
| No built-in way to inactivate/retire a choice. | Supports inactive state; filterable in app. |
| Solution component with full ALM support. | Treated as reference data. |
| Only label, value, color; filter/sort on display label only. | Can add extra columns; filter/sort on any column. |
| Localization built in. | Handle localization yourself. |
| No built-in support for dependent choice columns. | Easier to model/implement dependent columns. |

> **Warning:** You cannot change a column's data type after creation. Plan choice vs. lookup carefully before creating the column.

---

## Displaying Choice Values

- **Single choice** — reference the column directly in the label's `Text` property:

```powerappsfl
ThisItem.Category
```

- **Multiple choices** — the property is a single-column Table with a `Value` column. Use `Concat` for display:

```powerappsfl
Concat(ThisItem.'Preferred Delivery', Text(Value), ", ")
```

- **Switch on choice value** — use the `table.column.value` syntax for comparisons:

```powerappsfl
Switch(
  ThisItem.Category,
  'Category (Accounts)'.'Preferred Customer', Green,
  'Category (Accounts)'.'Standard', Black
)
```

---

## Filtering with Choice Columns

- Filter table rows using the full `table.column.value` syntax — do **not** use just the value string:

```powerappsfl
Filter(
  Accounts,
  Category = 'Category (Accounts)'.'Preferred Customer'
)
```

> **Important:** Using only `'Preferred Customer'` (without the table prefix) causes an **'Incompatible types for comparison'** error. Alternatively, write as `[@Category].'Preferred Customer'`.

### Filtering with a Combo Box

- Set combo box **Items** to the choice list using the `Choices()` function:

```powerappsfl
Choices(Accounts.Category)
```

- Filter gallery using **in** operator against `ComboBox.SelectedItems`:

```powerappsfl
Filter(Accounts, Category in ComboBoxCategory.SelectedItems)
```

- Show all rows when no selection is made by adding an `IsEmpty` check:

```powerappsfl
Filter(
  Accounts,
  Category in ComboBoxCategory.SelectedItems
  || IsEmpty(ComboBoxCategory.SelectedItems)
)
```

### Filtering Multi-Select (Choices) Columns

- Filtering on a **choices** (multi-select) column triggers a **delegation warning** due to comma-separated storage.
- **Workaround:** Create a Dataverse table **view** that pre-filters the choices column, then reference the view in `Filter()`:

```powerappsfl
Filter(
  Accounts,
  'Accounts (Views)'.'Monday Delivery'
)
```

- You can combine the view-based filter with user-entered criteria for other columns:

```powerappsfl
Filter(
  Accounts,
  'Accounts (Views)'.'Monday Delivery',
  Category = Dropdown1.Selected.Value
)
```

---

## Setting Choice Values (Edit Form & Patch)

### Using Edit Form

- Adding a choice column to an **Edit form** automatically:
  - Sets up as a **dropdown** (single choice) or **combo box** (multiple choices).
  - Uses `Choices()` to populate selectable values.
  - Reads/writes the column value automatically.
  - Saves via `SubmitForm()` on a button.
- To make a choice column read-only on a form: set **DisplayMode** to `DisplayMode.View` (may require **Unlock to change properties** on the Advanced tab).

### Using Patch()

- Use `Patch()` to create or update choice column values without a form:

```powerappsfl
Patch(Accounts, ThisItem, {Category: 'Category (Accounts)'.'Preferred Customer'})
```

> **Important:** When using `Patch` with a global Choice set, prefix the value with the **Choice set name** (found in the column's **Sync this choice with** field), otherwise you get an `'OptionSetValue'` error.

```powerappsfl
Patch(Accounts, ThisItem, {'Customer Type': Category.Preferred})
```

- To **clear** a choice column value, set it to `Blank()`:

```powerappsfl
Patch(Products, ThisItem, {'Sales channels': Blank()})
```

---

## Exercise: Key Formulas Reference

- **Dropdown Items** (choice column list):

```powerappsfl
Choices(Products.'Product visibility')
```

- **Dropdown Default** (current row value):

```powerappsfl
ThisItem.'Product visibility'
```

- **Concat for multi-select display**:

```powerappsfl
Concat(ThisItem.'Sales channels', Text(Value), ",")
```

- **Switch for color-coding by choice**:

```powerappsfl
Switch(
  ThisItem.'Product visibility',
  chProductVisibility.Private, Color.Red,
  chProductVisibility.Public, Color.Green,
  chProductVisibility.Invite, Color.Blue,
  Color.Black
)
```

- **Gallery Items with search, filter by choice, and sort**:

```powerappsfl
SortByColumns(
    Search(
        Filter(
            [@Products],
            IsBlank('Visibility filter'.Selected)
            || 'Product visibility' = 'Visibility filter'.Selected.Value
        ),
        TextSearchBox1.Text,
        Name
    ),
    "contoso_name",
    If(
        SortDescending1,
        SortOrder.Descending,
        SortOrder.Ascending
    )
)
```

- **Patch on dropdown OnChange** (update choice from gallery):

```powerappsfl
Patch(Products, ThisItem, {'Product visibility': Self.Selected.Value})
```

- **Reset a filter dropdown**:

```powerappsfl
Reset('Visibility filter')
```

- **Show/hide reset icon based on filter selection**:

```powerappsfl
If(IsBlank('Visibility filter'), false, true)
```

---

## References

- [Canvas app delegation overview](https://learn.microsoft.com/en-us/power-apps/maker/canvas-apps/delegation-overview/)
- [Edit form control in Power Apps](https://learn.microsoft.com/en-us/power-apps/maker/canvas-apps/controls/control-form-detail/)
