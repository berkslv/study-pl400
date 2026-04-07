# Recall: Reduce Complexity with Dataverse Table Relationships in Canvas Apps

> **Source files:** 1-introduction.md, 2-one-to-many-relationships.md, 3-many-to-many-relationships.md, 4-exercise.md

---

## Keywords

| Term | Definition |
|------|-----------|
| One-to-many (1:N) relationship | A relationship where one parent row can be associated with many child rows via a lookup column. |
| Many-to-one (N:1) relationship | The same physical 1:N relationship viewed from the child side pointing toward the parent. |
| Many-to-many (N:N) relationship | A symmetrical relationship using a hidden intersect table to map rows on both sides. |
| Intersect table | A hidden Dataverse table that stores the associations between two tables in a many-to-many relationship. |
| Dot notation | Power Fx syntax to traverse relationships directly (e.g., `ThisItem.Location.Address`) without `LookUp()`. |
| `Relate()` | Power Fx function that establishes a relationship between two rows in a 1:N or N:N relationship. |
| `Unrelate()` | Power Fx function that removes an association between two rows; sets the lookup column to null in 1:N. |
| Polymorphic lookup | A multi-table lookup column that can point to rows from more than one table. |
| `IsType` / `AsType` | Power Fx functions used to identify and cast a polymorphic lookup to a specific table type. |
| Parental behavior | A relationship behavior type that automatically deletes child records when the parent record is deleted. |
| `Choices()` | Power Fx function that returns valid lookup values for a column; used to populate dropdowns in forms. |
| `Concat()` | Power Fx function used to build a delimited string from a related table (e.g., comma-separated features). |

---

## Main Ideas

- Dataverse supports two relationship types: **one-to-many (1:N/N:1)** and **many-to-many (N:N)**; both can be navigated in canvas apps using dot notation.
- In a 1:N relationship, the **lookup column lives on the child (related) table** and points to the parent (primary) row.
- Dot notation (`FilterLocation_1.Selected.Desks`) is equivalent to `Filter()` but is shorter and more readable.
- Multi-level dot notation traversal is supported (e.g., `ThisItem.Desk.Location.'Primary Contact'.'Full Name'`).
- The `Patch()` function sets a lookup column by passing a **record** from the primary table as the column value.
- `Relate()` and `Unrelate()` can be used as alternatives to `Patch()` for establishing or removing 1:N links; `Unrelate()` nulls the lookup column, risking orphaned rows.
- Many-to-many relationships are **symmetrical**: navigation works from either side (`ThisItem.'Desk Features'` or `ThisItem.Desks`).
- The N:N intersect table **cannot store extra columns**; if additional data about the association is needed, create a custom intersect table with two 1:N relationships instead.
- When using `Concat()` to show N:N related rows in a gallery label, each desk row triggers a **separate network call** — display features only after a user selects a specific row to minimize performance impact.
- Many-to-many fields in auto-generated forms may contain errors; the **Update** property on the data card must be cleared and relationship creation handled manually using `Relate()` in the submit button's `OnSelect`.
- **Relationship behaviors** (Reference, Parental, etc.) control what happens to child rows when the parent is deleted; use *Parental* to auto-delete children and avoid orphaned records.
- Many-to-many relationships support row-level security, runtime row additions, and row deactivation — advantages over a **Choices column**, which is best for static, rarely-changed lists.

---

## Mini Quiz

### Q1 — Single Choice

A developer wants to display a desk's location address inside a gallery where `ThisItem` is a Desk row. Which formula is the most concise?

- A. `LookUp(Locations, Location = ThisItem.Location).Address`
- B. `Filter(Locations, Location = ThisItem.Location).Address`
- C. `ThisItem.Location.Address`
- D. `First(Locations).Address`

<details>
<summary>Answer</summary>

**Correct answer:** C. `ThisItem.Location.Address`

**Explanation:** Dot notation navigates the many-to-one relationship from the child (Desk) directly to the parent (Location) and its property, making it shorter and equivalent to the `LookUp()` approach.

</details>

---

### Q2 — Fill-in-the-Blank

To establish a many-to-many relationship between a desk record and a desk feature record in Power Fx, you use the `___()` function, and to remove the association you use the `___()` function.

<details>
<summary>Answer</summary>

**Answer:** `Relate`, `Unrelate`

**Explanation:** `Relate()` links the two rows through the intersect table, and `Unrelate()` removes that link. For N:N relationships, the order of parameters does not matter because the relationship is symmetrical.

</details>

---

### Q3 — Single Choice

You need to store how many chairs each desk has in relation to a desk feature. You currently have a many-to-many relationship between Desk and Desk Feature. What should you do?

- A. Add a column directly to the hidden intersect table.
- B. Use a Choices column on the Desk table instead.
- C. Create a custom intersect table with 1:N relationships to both Desk and Desk Feature, and add the extra column there.
- D. Add a column to the Desk Feature table.

<details>
<summary>Answer</summary>

**Correct answer:** C. Create a custom intersect table with 1:N relationships to both Desk and Desk Feature, and add the extra column there.

**Explanation:** The built-in N:N intersect table cannot have custom columns. A custom intersect table (sometimes called a junction or bridge table) with two 1:N relationships allows you to store additional relationship data.

</details>

---

### Q4 — Fill-in-the-Blank

When a form auto-generates fields for a many-to-many column, you must clear the `___` property on the data card to prevent form submission errors, and handle relationship creation manually using `Relate()` in the submit button's `___` property.

<details>
<summary>Answer</summary>

**Answer:** `Update`, `OnSelect`

**Explanation:** The auto-generated `Update` property on the data card causes errors for N:N fields. Clearing it and calling `Relate()` in `OnSelect` after `SubmitForm()` is the correct pattern.

</details>

---

### Q5 — Single Choice

A canvas app deletes a Location record, and all associated Desk records become orphaned (their Location lookup is set to null). Which relationship behavior should be configured to automatically delete the Desk records when the Location is deleted?

- A. Reference
- B. Restrict
- C. Parental
- D. Custom

<details>
<summary>Answer</summary>

**Correct answer:** C. Parental

**Explanation:** The Parental behavior type automatically deletes all child (Desk) records when the parent (Location) record is deleted, preventing orphaned rows.

</details>

---

### Q6 — Fill-in-the-Blank

To show a comma-separated list of desk feature names for a desk row in a gallery label, use the formula: `___(ThisItem.'Desk Features', Name, ",")`.

<details>
<summary>Answer</summary>

**Answer:** `Concat`

**Explanation:** `Concat()` iterates over the related Desk Features rows and concatenates the `Name` column values with the specified delimiter.

</details>

---

### Q7 — Single Choice

A developer uses `Unrelate(FilterLocation_1.Selected.Desks, ThisItem)` in a canvas app. What is a potential side effect?

- A. The Desk record is permanently deleted from Dataverse.
- B. The Location record is deleted.
- C. The lookup column on the Desk record is set to null, potentially creating an orphaned row.
- D. The intersect table is dropped.

<details>
<summary>Answer</summary>

**Correct answer:** C. The lookup column on the Desk record is set to null, potentially creating an orphaned row.

**Explanation:** `Unrelate()` on a 1:N relationship sets the lookup column on the child record to Nothing (null). If the app cannot display rows without a primary association, the row becomes orphaned.

</details>

---
