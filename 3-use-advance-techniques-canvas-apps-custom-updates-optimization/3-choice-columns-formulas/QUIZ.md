# Quiz: Choice Columns and Power Fx Formulas in Canvas Apps

> **Source material:** 1-introduction.md, 2-filter.md, 3-set-values.md, 4-exercise.md, 5-check.md, 6-summary.md
> **Total questions:** 25
> **Question types:** Multiple choice (single), Multiple choice (multi-select), Fill-in-the-blank

---

## Questions

### Question 1 — Single Choice

You are building a canvas app connected to a Microsoft Dataverse table. A user selects "Preferred Customer" from a choice column named **Category**. You want to understand how this selection is physically persisted.

How does Dataverse store the value of a choice column?

- A. As the display label text (e.g., "Preferred Customer")
- B. As a GUID reference to a metadata record
- C. As a numeric (integer) value
- D. As a JSON object containing both the label and value

<details>
<summary>Answer</summary>

**Correct answer:** C. As a numeric (integer) value

**Explanation:** Dataverse stores only the numeric value for a single choice column, not the text label. For multiple choices (multi-select), a comma-separated list of numeric values is stored.

</details>

---

### Question 2 — Single Choice

A maker writes the following Power Fx formula in a gallery's **Items** property to filter accounts by category:

```
Filter(Accounts, 'Preferred Customer')
```

When the app is tested, an error appears. What is the most likely cause?

- A. The `Filter()` function cannot be used with choice columns
- B. Using only the column value string (instead of the full `table.column` syntax) causes an **'Incompatible types for comparison'** error
- C. The `Accounts` table is not delegable to Dataverse
- D. The `'Preferred Customer'` value must be wrapped in the `Choices()` function first

<details>
<summary>Answer</summary>

**Correct answer:** B. Using only the column value string (instead of the full `table.column` syntax) causes an **'Incompatible types for comparison'** error

**Explanation:** When filtering on a choice column, you must use the fully qualified reference such as `'Category (Accounts)'.'Preferred Customer'`, not just `'Preferred Customer'`. The shortened form is treated as text, not as an option set value, causing a type mismatch error.

</details>

---

### Question 3 — Single Choice

A maker wants to populate a combo box control with all available values from the **Category** choice column on the **Accounts** table so that users can select filtering criteria.

Which Power Fx function should be used in the combo box's **Items** property?

- A. `Select(Accounts.Category)`
- B. `LookUp(Accounts, Category)`
- C. `Choices(Accounts.Category)`
- D. `Filter(Accounts, Category)`

<details>
<summary>Answer</summary>

**Correct answer:** C. `Choices(Accounts.Category)`

**Explanation:** The `Choices()` function returns a table of possible values for a choice column by reading the column's metadata. It is the correct way to populate dropdowns and combo boxes for choice columns.

</details>

---

### Question 4 — Single Choice

A maker adds a **Category** choice column to an **Edit form** in a canvas app. The column is configured as a single choice. Power Apps automatically configures the field.

What control type does Power Apps automatically use for a single choice column added to an Edit form?

- A. A text input control
- B. A combo box control
- C. A dropdown control
- D. A radio button group

<details>
<summary>Answer</summary>

**Correct answer:** B. A combo box control

**Explanation:** When you add an Edit form, Power Apps sets up both single and multiple choice columns with a combo box by default. It also automatically uses the `Choices()` function for the Items property and binds the current row value.

</details>

---

### Question 5 — Single Choice

A maker is creating a new choice column on a Dataverse table and wants to allow users to select more than one value from the list (e.g., selecting multiple sales channels).

At what point must the maker enable multiple selection for a choices column?

- A. Before saving the canvas app
- B. After the column is created, by editing it in the Dataverse designer
- C. Before creating the column, because this option cannot be changed after column creation
- D. During the first publish of the solution

<details>
<summary>Answer</summary>

**Correct answer:** C. Before creating the column, because this option cannot be changed after column creation

**Explanation:** The **"Selecting multiple choices is allowed"** checkbox must be checked before the column is created. Once saved, this setting is locked and cannot be modified.

</details>

---

### Question 6 — Single Choice

You are creating a new **Choice** column on a Dataverse table. You want this list of values to be reusable across other tables in the same environment.

What is the default and recommended setting for the **"Sync with global choice?"** option?

- A. No — local choices are preferred for performance reasons
- B. Yes — global choice is recommended so the list can be reused across tables
- C. No — global choices require additional licensing
- D. Yes — but only if the table is part of a managed solution

<details>
<summary>Answer</summary>

**Correct answer:** B. Yes — global choice is recommended so the list can be reused across tables

**Explanation:** When creating a new Choice column, the **"Sync with global choice?"** setting defaults to **Yes**, which is the recommended option. Global choices can be used in multiple columns across multiple tables, promoting consistency and reuse.

</details>

---

### Question 7 — Single Choice

A maker is building a canvas app gallery and uses a combo box named **ComboBoxCategory** to let users select multiple account categories. The gallery should show all rows when no category is selected in the combo box.

Which formula correctly implements this behavior in the gallery's **Items** property?

- A. `Filter(Accounts, Category = ComboBoxCategory.Selected)`
- B. `Filter(Accounts, Category in ComboBoxCategory.SelectedItems)`
- C. `Filter(Accounts, Category in ComboBoxCategory.SelectedItems || IsEmpty(ComboBoxCategory.SelectedItems))`
- D. `Filter(Accounts, IsEmpty(ComboBoxCategory.SelectedItems), Category in ComboBoxCategory.SelectedItems)`

<details>
<summary>Answer</summary>

**Correct answer:** C. `Filter(Accounts, Category in ComboBoxCategory.SelectedItems || IsEmpty(ComboBoxCategory.SelectedItems))`

**Explanation:** Using the `in` operator filters rows matching any selected value. Adding `|| IsEmpty(ComboBoxCategory.SelectedItems)` ensures all rows are shown when no selection is made, preventing an empty gallery.

</details>

---

### Question 8 — Single Choice

A maker adds a filter on a **choices** (multi-select) column in a canvas app gallery formula. After saving, a yellow triangle warning appears next to the formula.

What is the most likely cause of this warning?

- A. The `Filter()` function does not support choices columns at all
- B. Filtering on a choices (multi-select) column triggers a delegation warning because of how multi-select values are stored
- C. The combo box control is not compatible with choices columns
- D. The gallery is missing an `IsEmpty` check for the SelectedItems property

<details>
<summary>Answer</summary>

**Correct answer:** B. Filtering on a choices (multi-select) column triggers a delegation warning because of how multi-select values are stored

**Explanation:** Multiple choices values are stored as a comma-separated list of numbers in Dataverse. This storage format makes server-side filtering (delegation) impractical, causing Power Apps to issue a delegation warning.

</details>

---

### Question 9 — Single Choice

A maker wants to avoid the delegation warning that appears when filtering on a choices (multi-select) column, while still supporting the filtering use case.

What is the recommended workaround?

- A. Use a text column instead of a choices column
- B. Load the entire table into a collection and filter locally
- C. Create a Dataverse table view that filters the choices column, and reference the view in the `Filter()` function
- D. Use the `LookUp()` function instead of `Filter()`

<details>
<summary>Answer</summary>

**Correct answer:** C. Create a Dataverse table view that filters the choices column, and reference the view in the `Filter()` function

**Explanation:** A Dataverse table view performs the filtering server-side and eliminates the delegation warning. You then reference the view in your `Filter()` formula (e.g., `Filter(Accounts, 'Accounts (Views)'.'Monday Delivery')`).

</details>

---

### Question 10 — Single Choice

A maker has a **Make VIP** button inside a gallery. When clicked, it should update the **Category** choice column of the current row to **Preferred Customer** without using a form. The Choice set name is **Category**.

Which formula correctly implements this using `Patch()`?

- A. `Patch(Accounts, ThisItem, {Category: 'Preferred Customer'})`
- B. `Patch(Accounts, ThisItem, {Category: 'Category (Accounts)'.'Preferred Customer'})`
- C. `SubmitForm(EditForm1)`
- D. `Update(Accounts, ThisItem, {Category: Category.Preferred})`

<details>
<summary>Answer</summary>

**Correct answer:** B. `Patch(Accounts, ThisItem, {Category: 'Category (Accounts)'.'Preferred Customer'})`

**Explanation:** When using `Patch()` to update a choice column, you must use the fully qualified `table.column.value` reference. Using just the value string causes an `'OptionSetValue'` error.

</details>

---

### Question 11 — Single Choice

A maker uses `Patch()` to update a choice column on the **Products** table but receives an `'OptionSetValue'` error. The column is named **Customer Type** and is synced with a global choice named **Category**.

How should the Patch formula be corrected?

- A. Use `Patch(Products, ThisItem, {'Customer Type': 'Preferred'})`
- B. Use `Patch(Products, ThisItem, {'Customer Type': Category.Preferred})`
- C. Use `Patch(Products, ThisItem, {'Customer Type': Choices(Products.'Customer Type').Preferred})`
- D. Use `SubmitForm()` instead, as `Patch()` cannot be used with global choice sets

<details>
<summary>Answer</summary>

**Correct answer:** B. Use `Patch(Products, ThisItem, {'Customer Type': Category.Preferred})`

**Explanation:** When using `Patch()` with a global Choice set, the value must be prefixed with the Choice set name (e.g., `Category.Preferred`). You can find the Choice set name in the column's **Sync this choice with** field in the Dataverse column editor.

</details>

---

### Question 12 — Single Choice

A maker adds a **Sales channels** choices column to a form in a canvas app and wants to clear all selected values for a product row without using the form's edit mode.

Which formula correctly clears the **Sales channels** choice column using `Patch()`?

- A. `Patch(Products, ThisItem, {'Sales channels': ""})`
- B. `Patch(Products, ThisItem, {'Sales channels': Empty()})`
- C. `Patch(Products, ThisItem, {'Sales channels': Blank()})`
- D. `Reset(Products, ThisItem, {'Sales channels'})`

<details>
<summary>Answer</summary>

**Correct answer:** C. `Patch(Products, ThisItem, {'Sales channels': Blank()})`

**Explanation:** To clear the value of a choice column using `Patch()`, set the column value to `Blank()`. This removes any stored selection from the record.

</details>

---

### Question 13 — Single Choice

A maker wants to display the selected values of a multiple choices column named **Preferred Delivery** in a gallery label as a readable, comma-separated string.

Which formula correctly achieves this?

- A. `ThisItem.'Preferred Delivery'`
- B. `Text(ThisItem.'Preferred Delivery')`
- C. `Join(ThisItem.'Preferred Delivery', ", ")`
- D. `Concat(ThisItem.'Preferred Delivery', Text(Value), ", ")`

<details>
<summary>Answer</summary>

**Correct answer:** D. `Concat(ThisItem.'Preferred Delivery', Text(Value), ", ")`

**Explanation:** A multiple choices column returns a single-column table with a `Value` column. The `Concat()` function iterates over the table and builds a comma-separated string from the `Value` column of each row.

</details>

---

### Question 14 — Single Choice

A maker notices that new choice values they added in Dataverse do not appear in the Power Apps formula editor's autocomplete suggestions.

What should the maker do to resolve this?

- A. Close and reopen the browser tab running Power Apps Studio
- B. Add a new data source connection in the app
- C. Select the ellipsis (**...**) next to the table in the data panel, then select **Refresh**
- D. Republish the Dataverse table from the solution explorer

<details>
<summary>Answer</summary>

**Correct answer:** C. Select the ellipsis (**...**) next to the table in the data panel, then select **Refresh**

**Explanation:** If new or changed choices don't immediately appear in the Power Apps editor, you can refresh the table by selecting the ellipsis next to the table in the data panel and choosing **Refresh**. Repeat until the new values appear.

</details>

---

### Question 15 — Single Choice

A maker wants a choice column on an Edit form to be visible but not editable by the user.

How should the maker configure the choice control to make it read-only?

- A. Delete the control and replace it with a label
- B. Set the control's **DisplayMode** property to `DisplayMode.View`
- C. Set the control's **Visible** property to `false`
- D. Remove the control from the form and re-add it as a Display form field

<details>
<summary>Answer</summary>

**Correct answer:** B. Set the control's **DisplayMode** property to `DisplayMode.View`

**Explanation:** To display a choice column on an Edit form without allowing edits, set the control's **DisplayMode** to `DisplayMode.View`. You may first need to unlock the property on the Advanced tab of the Properties pane.

</details>

---

### Question 16 — Multi-Select

A maker is deciding between using a **Choice** column and a **Lookup** column for a field on a Dataverse table. They want to understand the key differences.

Which two statements correctly describe how Choice columns differ from Lookup columns? (Select **two**.)

- A. Choice column values are stored as table references, not numeric values
- B. Choice column lists can only be modified by app makers, not end users
- C. Choice columns support an inactive/retired state for individual values
- D. Choice columns are treated as solution components with full ALM support
- E. Choice columns support built-in dependent (cascading) column configurations

<details>
<summary>Answer</summary>

**Correct answers:** B and D

**Explanation:** Choice column values are stored as integers and the list is defined by the maker — end users cannot modify the options. Choice columns are solution components with full ALM support, meaning they are managed and transported through solutions. Lookup columns, by contrast, store table references and support inactive states and dependent columns.

</details>

---

### Question 17 — Multi-Select

A maker is configuring a canvas app gallery to filter records using a combo box named **ComboBoxCategory** that lists choice values. Which three steps are required to correctly implement this filter? (Select **three**.)

- A. Set the combo box **Items** property to `Choices(Accounts.Category)`
- B. Set the combo box **Items** property to `Filter(Accounts, Category)`
- C. Use the `in` operator in the gallery **Items** formula to match SelectedItems
- D. Set the gallery **Items** property to `Filter(Accounts, Category = ComboBoxCategory.Selected)`
- E. Optionally add `|| IsEmpty(ComboBoxCategory.SelectedItems)` to show all rows when nothing is selected
- F. Use `LookUp()` instead of `Filter()` for choice column matching

<details>
<summary>Answer</summary>

**Correct answers:** A, C, and E

**Explanation:** The `Choices()` function correctly populates the combo box with available choice values. The `in` operator checks whether the row's category matches any selected item. Adding `|| IsEmpty(ComboBoxCategory.SelectedItems)` ensures all rows appear when no filter is applied — a common UX requirement.

</details>

---

### Question 18 — Multi-Select

A maker is building an app that stores product delivery methods using a **choices** (multi-select) column. Which two statements about this column type are correct? (Select **two**.)

- A. The **"Selecting multiple choices is allowed"** option can be enabled or disabled after column creation
- B. Multiple selected values are stored as a comma-separated list of numeric values in Dataverse
- C. You can use `Concat()` with the `Value` column to display selected values as a readable string
- D. Multiple choices columns are displayed with a text input control when added to an Edit form
- E. Filtering on a multiple choices column is fully delegable to Dataverse without any warnings

<details>
<summary>Answer</summary>

**Correct answers:** B and C

**Explanation:** Dataverse stores multiple selections as a comma-separated list of integers. To display them in a label, use `Concat(ThisItem.'Column Name', Text(Value), ", ")`. The multi-select option cannot be changed after column creation, filtering on choices columns triggers delegation warnings, and Edit forms use a combo box (not a text input) for choices columns.

</details>

---

### Question 19 — Multi-Select

A maker is deciding between a **local** and a **global** choice list for a new column. Which two statements correctly describe the difference? (Select **two**.)

- A. A local choice list can be used across multiple tables in the same environment
- B. A global choice list can be reused in multiple columns across different tables
- C. When **Sync with global choice?** is set to **Yes**, the **Sync this choice with** field becomes mandatory
- D. Local choices support localization automatically; global choices require manual localization handling
- E. Global choices cannot be created from within the column creation experience

<details>
<summary>Answer</summary>

**Correct answers:** B and C

**Explanation:** Global choices can be shared across multiple columns in different tables, promoting consistency. When you select **Yes** for **Sync with global choice?**, the **Sync this choice with** field becomes mandatory and you must select or create a global choice set. Local choices are limited to the column and table where they are defined.

</details>

---

### Question 20 — Multi-Select

A maker is using the `Patch()` function to update choice and choices columns in a canvas app. Which two formulas are valid uses of `Patch()` with choice columns? (Select **two**.)

- A. `Patch(Products, ThisItem, {'Product visibility': Self.Selected.Value})`
- B. `Patch(Products, ThisItem, {'Sales channels': "Wholesale, Retail"})`
- C. `Patch(Products, ThisItem, {'Sales channels': Blank()})`
- D. `Patch(Products, ThisItem, {'Product visibility': 'Public'})`
- E. `Patch(Products, ThisItem, {'Product visibility': Choices(Products.'Product visibility')})`

<details>
<summary>Answer</summary>

**Correct answers:** A and C

**Explanation:** `Self.Selected.Value` correctly passes a choice value from a dropdown's selected item into `Patch()`. Setting a choices column to `Blank()` correctly clears all selected values. Passing a plain text string like `"Wholesale, Retail"` or `'Public'` without the Choice set prefix causes an `'OptionSetValue'` error.

</details>

---

### Question 21 — Fill-in-the-Blank

To display the value of a **single choice** column named **Category** in a label inside a gallery, you set the label's **Text** property to ___.

<details>
<summary>Answer</summary>

**Answer:** `ThisItem.Category`

**Explanation:** A single choice column can be referenced directly by name in a label's Text property. Power Apps automatically displays the text label associated with the stored numeric value.

</details>

---

### Question 22 — Fill-in-the-Blank

When a **choices** (multi-select) column is added to a gallery item, the column property returns a single-column ___ with a `Value` column, where each row represents one selected value.

<details>
<summary>Answer</summary>

**Answer:** Table

**Explanation:** A multiple choices column on a record is of type Table — a single-column table with a `Value` column. You use functions like `Concat()` to iterate over this table and produce a display string.

</details>

---

### Question 23 — Fill-in-the-Blank

When filtering on a **choices** (multi-select) column triggers a delegation warning, the recommended workaround is to create a Dataverse table ___ that performs the filtering, and then reference it inside the `Filter()` formula.

<details>
<summary>Answer</summary>

**Answer:** View

**Explanation:** A Dataverse table view can be configured to filter on a choices column server-side. By referencing the view (e.g., `'Accounts (Views)'.'Monday Delivery'`) inside a `Filter()` formula, you avoid the delegation warning.

</details>

---

### Question 24 — Fill-in-the-Blank

When using the `Patch()` function to update a column that uses a global Choice set, you must prefix the value with the ___ name; otherwise, Power Apps raises an `'OptionSetValue'` error.

<details>
<summary>Answer</summary>

**Answer:** Choice set (or global choice set)

**Explanation:** For example, if the global choice set is named `Category`, the Patch formula should reference the value as `Category.Preferred`. You can find the Choice set name in the column's **Sync this choice with** field in the Dataverse column editor.

</details>

---

### Question 25 — Fill-in-the-Blank

In an Edit form, to make a choice column field visible but not editable, you set the control's ___ property to `DisplayMode.View`.

<details>
<summary>Answer</summary>

**Answer:** DisplayMode

**Explanation:** Setting **DisplayMode** to `DisplayMode.View` renders the choice control in a read-only state on the form. You may first need to unlock the property via the **Advanced** tab in the Properties pane by selecting **Unlock to change properties**.

</details>
