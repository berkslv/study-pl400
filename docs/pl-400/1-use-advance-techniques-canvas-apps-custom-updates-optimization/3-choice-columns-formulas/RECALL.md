# Recall: Choice Columns and Formulas in Canvas Apps

> **Source files:** 1-introduction.md, 2-filter.md, 3-set-values.md

---

## Keywords

| Term | Definition |
|------|-----------|
| Choice column | A Dataverse column type where users select from a predefined, maker-managed list of values. |
| Global choice | A reusable choice list shared across multiple columns and tables in Dataverse. |
| Local choice | A choice list scoped to a single column and table where it is created. |
| `Choices()` function | A Power Fx function that returns the available option set values for a choice column. |
| `Concat()` function | A Power Fx function used to combine multiple-choice table values into a comma-separated text string. |
| `Patch()` function | A Power Fx function used to create or update specific fields in a Dataverse record. |
| `in` operator | A Power Fx operator that checks whether a value exists within a collection or table. |
| Delegation | A Power Apps limitation where filtering on multi-select (choices) columns cannot be fully processed server-side. |
| OptionSetValue error | An error thrown when `Patch()` is used on a choice column without prefixing the value with the Choice set name. |
| `Filter()` function | A Power Fx function that returns table rows matching specified criteria. |

---

## Main Ideas

- Choice columns store data as numeric values (integers), not text; the display label is derived from metadata.
- Single-choice column values are referenced directly (e.g., `ThisItem.Category`); multi-choice values are a single-column Table and require `Concat()` to display as text.
- When comparing a choice column value, use the full `'ChoiceSet'.'Value'` syntax (e.g., `'Category (Accounts)'.'Preferred Customer'`); using only the value string causes an **Incompatible types for comparison** error.
- The `Choices(Table.Column)` function populates dropdowns and combo boxes with the valid option set values for a choice column.
- Filtering on a **choices** (multi-select) column always triggers a delegation warning because the data is stored as a comma-separated string in Dataverse.
- To work around delegation on choices columns, use a pre-filtered Dataverse table view inside `Filter()`.
- The `in` operator combined with `ComboBox.SelectedItems` enables filtering gallery rows by any of multiple selected choice values.
- Adding `|| IsEmpty(ComboBox.SelectedItems)` to a gallery filter shows all rows when no option is selected.
- Edit forms automatically configure choice columns as dropdown (single) or combo box (multiple) controls and use `Choices()` for their Items property.
- `Patch()` requires the Choice set name as a prefix (e.g., `'Category (Accounts)'.'Preferred Customer'`); omitting it causes an `OptionSetValue` error.
- To clear a choice column value with `Patch()`, set the field to `Blank()`.
- The **"Selecting multiple choices is allowed"** option must be enabled before the column is created; it cannot be changed afterward.
- Global choice is the recommended default (`Sync with global choice? = Yes`) so the same list can be reused across tables.
- Choice columns are solution components with full ALM support; lookup columns are treated as reference data.

---

## Mini Quiz

### Q1 — Single Choice

A maker wants to display all selected delivery days from a multi-select choices column called `Preferred Delivery` in a label. The data is stored as a table of values.

Which formula correctly displays the selections as a comma-separated string?

- A. `ThisItem.'Preferred Delivery'`
- B. `Concat(ThisItem.'Preferred Delivery', Value, ", ")`
- C. `Concat(ThisItem.'Preferred Delivery', Text(Value), ", ")`
- D. `Join(ThisItem.'Preferred Delivery', ", ")`

<details>
<summary>Answer</summary>

**Correct answer:** C. `Concat(ThisItem.'Preferred Delivery', Text(Value), ", ")`

**Explanation:** Multi-choice columns return a single-column Table with a `Value` column. `Concat()` iterates over that table and `Text(Value)` converts each numeric value to its display label.

</details>

---

### Q2 — Fill-in-the-Blank

To populate a combo box with the valid option set values for the `Category` column on the `Accounts` table, set the combo box **Items** property to `___`.

<details>
<summary>Answer</summary>

**Answer:** `Choices(Accounts.Category)`

**Explanation:** The `Choices()` function reads the choice column metadata and returns the list of available values for use in dropdowns and combo boxes.

</details>

---

### Q3 — Single Choice

A developer uses `Patch()` to set a choice column and receives an `OptionSetValue` error.

What is the most likely cause?

- A. The `Patch()` function does not support choice columns.
- B. The value was referenced without prefixing it with the Choice set name.
- C. The column must be updated through an Edit form only.
- D. The table connection needs to be refreshed in the data panel.

<details>
<summary>Answer</summary>

**Correct answer:** B. The value was referenced without prefixing it with the Choice set name.

**Explanation:** When using `Patch()` on a choice column, the value must be prefixed with the Choice set name (e.g., `'Category (Accounts)'.'Preferred Customer'`). Omitting the prefix causes the `OptionSetValue` error.

</details>

---

### Q4 — Fill-in-the-Blank

Filtering a **choices** (multi-select) column in a `Filter()` formula always triggers a ___ warning because the values are stored as a comma-separated list in Dataverse.

<details>
<summary>Answer</summary>

**Answer:** delegation

**Explanation:** Multi-select choices columns cannot be fully evaluated server-side; Power Apps falls back to client-side filtering and issues a delegation warning.

</details>

---

### Q5 — Single Choice

A gallery should show all account rows when no category is selected in the combo box, and filter by selected categories otherwise. Which formula implements this correctly?

- A. `Filter(Accounts, Category in ComboBoxCategory.SelectedItems)`
- B. `Filter(Accounts, Category = ComboBoxCategory.Selected.Value)`
- C. `Filter(Accounts, Category in ComboBoxCategory.SelectedItems || IsEmpty(ComboBoxCategory.SelectedItems))`
- D. `Filter(Accounts, IsEmpty(ComboBoxCategory.SelectedItems))`

<details>
<summary>Answer</summary>

**Correct answer:** C. `Filter(Accounts, Category in ComboBoxCategory.SelectedItems || IsEmpty(ComboBoxCategory.SelectedItems))`

**Explanation:** The `in` operator filters by any selected value, and the `|| IsEmpty(...)` condition returns all rows when the combo box has no selections.

</details>

---

### Q6 — Fill-in-the-Blank

To clear the value of a choice column named `Sales channels` on the `Products` table using `Patch()`, the formula is: `Patch(Products, ThisItem, {'Sales channels': ___})`.

<details>
<summary>Answer</summary>

**Answer:** `Blank()`

**Explanation:** Setting a choice column field to `Blank()` in a `Patch()` call removes any previously stored choice value from the record.

</details>

---

### Q7 — Single Choice

A maker wants to create a choice list that will be reused across multiple tables. Which configuration should they choose when creating the column?

- A. Set **Sync with global choice?** to **No** and define choices locally.
- B. Set **Sync with global choice?** to **Yes** and link to an existing or new global choice set.
- C. Create a lookup column instead, since choice columns cannot be shared.
- D. Use a text column and validate values in the app formula.

<details>
<summary>Answer</summary>

**Correct answer:** B. Set **Sync with global choice?** to **Yes** and link to an existing or new global choice set.

**Explanation:** The global choice option (default: Yes) allows the same choice list to be referenced across multiple columns and tables, avoiding duplication and ensuring consistency.

</details>

---
