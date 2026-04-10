# Recall: Perform Custom Updates in a Power Apps Canvas App

> **Source files:** 1-more-than-forms.md, 2-patch-function.md, 3-deleting-records.md, 4a-exercise-patch.md

---

## Keywords

| Term | Definition |
|------|-----------|
| Patch | Power Apps function to create or edit a single record in a data source without using a Form control. |
| Defaults | Function that returns a record with default values for a data source, signaling Patch to create a new record. |
| LookUp | Function used to retrieve a specific record from a data source, commonly used as the record argument in Patch or Remove. |
| ThisItem | Operator referencing the current record in a Gallery control, used as a record argument in Patch or Remove. |
| Remove | Function that deletes a specific record from a data source or collection; does not prompt for confirmation. |
| RemoveIf | Function that deletes all records from a data source or collection that match a given condition. |
| Clear | Function that deletes all records from a collection while preserving its column structure. |
| ClearCollect | Function that clears all records from a collection and immediately replaces them with a new set of records. |
| ForAll | Function used to loop through a table and apply Patch or Remove to each record for bulk operations. |
| Collection | An in-memory data source in Power Apps that Patch, Remove, RemoveIf, Clear, and ClearCollect can all target. |

---

## Main Ideas

- `Patch` is used when a Form control is insufficient — e.g., logging data silently on button click or designing non-form UIs.
- To **create** a new record: `Patch(DataSource, Defaults(DataSource), {Col: Value, ...})` — `Defaults` signals a new record and no primary key is required.
- To **edit** an existing record: `Patch(DataSource, LookUp(DataSource, ID = value), {Col: NewValue, ...})` — existing column values are overwritten.
- Column names in Patch are **case-sensitive**; the value type must match the column's data type exactly.
- Values passed to Patch can come from four sources: hardcoded literals, variables (`Set`), control property references (e.g., `Dropdown1.Selected.Value`), or formula outputs (e.g., `User().FullName`).
- `Remove(DataSource, record)` deletes a single record with no confirmation dialog; confirmation logic must be built manually.
- `RemoveIf(DataSource, condition)` deletes all matching records; `RemoveIf(DataSource, true)` deletes every record in the data source.
- `Clear(collection)` removes all records from a collection but leaves the schema intact.
- `ClearCollect` combines `Clear` + `Collect` in one call — use it when clearing and reloading happen together (e.g., screen becoming visible).
- There is **no undo or recycle bin** in Power Apps; deleted data must be recovered from the external data source directly.
- For bulk updates across multiple records, use `ForAll` to loop Patch/Remove, or `Collect` to copy one table into another.
- Collections are valid data sources for all data-manipulation functions (Patch, Remove, RemoveIf, Clear, ClearCollect).

---

## Mini Quiz

### Q1 — Single Choice

You want to add a new record to the `Orders` data source when a button is selected, without using a Form control.

Which formula correctly creates a new record?

- A. `Patch(Orders, LookUp(Orders, ID = 0), {Status: "New"})`
- B. `Patch(Orders, Defaults(Orders), {Status: "New"})`
- C. `Remove(Orders, Defaults(Orders))`
- D. `Collect(Orders, LookUp(Orders, ID = 0))`

<details>
<summary>Answer</summary>

**Correct answer:** B. `Patch(Orders, Defaults(Orders), {Status: "New"})`

**Explanation:** Using `Defaults(DataSource)` as the second argument tells Patch to create a new record; `LookUp` is used only when editing an existing record.

</details>

---

### Q2 — Fill-in-the-Blank

To delete all records from the `TempLogs` data source where the `IsExpired` column equals `true`, you would use: `___(TempLogs, IsExpired = true)`.

<details>
<summary>Answer</summary>

**Answer:** `RemoveIf`

**Explanation:** `RemoveIf` accepts a data source and a condition, deleting every record where the condition evaluates to true.

</details>

---

### Q3 — Single Choice

A user clicks a Trash icon inside a Gallery bound to `CustomerOrders`. Which formula on the icon's `OnSelect` property deletes only the displayed record?

- A. `Clear(CustomerOrders)`
- B. `RemoveIf(CustomerOrders, true)`
- C. `Remove(CustomerOrders, ThisItem)`
- D. `Patch(CustomerOrders, ThisItem, {Deleted: true})`

<details>
<summary>Answer</summary>

**Correct answer:** C. `Remove(CustomerOrders, ThisItem)`

**Explanation:** `ThisItem` references the specific Gallery record the user interacted with; `Remove` then deletes only that record from the data source.

</details>

---

### Q4 — Fill-in-the-Blank

`___` deletes all records from a collection and immediately replaces them with a new set of records in a single function call.

<details>
<summary>Answer</summary>

**Answer:** `ClearCollect`

**Explanation:** `ClearCollect` combines `Clear` (remove existing records) and `Collect` (add new records) in one atomic operation, useful for refreshing a collection when a screen loads.

</details>

---

### Q5 — Single Choice

You need to set the `Owner` column of a new record to the currently signed-in user's full name. Which value source should you use?

- A. Hardcoded value: `"John Smith"`
- B. Variable reference: `Set(varOwner, "John Smith")`
- C. Formula output: `User().FullName`
- D. Control property reference: `TextInput1.Text`

<details>
<summary>Answer</summary>

**Correct answer:** C. Formula output: `User().FullName`

**Explanation:** `User().FullName` dynamically returns the full name of the currently authenticated user from Microsoft Entra ID, making it the correct choice for always capturing the signed-in user.

</details>

---

### Q6 — Fill-in-the-Blank

Column names in Patch formulas are ___-sensitive, and the value passed must match the column's ___ exactly.

<details>
<summary>Answer</summary>

**Answer:** case; data type

**Explanation:** Power Apps enforces both exact casing for column names and strict type matching — for example, a number column cannot accept a string value even if the string contains a number.

</details>

---

### Q7 — Single Choice

Which statement about `Remove` in Power Apps is correct?

- A. `Remove` asks the user to confirm before deleting.
- B. `Remove` can only be used on collections, not tabular data sources.
- C. `Remove` deletes a specified record immediately with no built-in confirmation.
- D. `Remove` moves deleted records to a recycle bin.

<details>
<summary>Answer</summary>

**Correct answer:** C. `Remove` deletes a specified record immediately with no built-in confirmation.

**Explanation:** Power Apps has no undo or recycle bin; `Remove` executes instantly. Developers must build their own confirmation UI (e.g., a pop-up dialog) if needed.

</details>

---
