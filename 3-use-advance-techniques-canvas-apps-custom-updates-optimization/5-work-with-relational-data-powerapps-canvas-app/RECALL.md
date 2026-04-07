# Recall: Working with Relational Data in Power Apps Canvas Apps

> **Source files:** 1-relational-data.md, 2-work-with-relationships.md, 3-exercise.md, 4-cds-for-apps.md

---

## Keywords

| Term | Definition |
|------|-----------|
| Parent table | A table holding one record per logical entity (e.g., one trip or one receipt). |
| Child table | A table with multiple records linked to a single parent via a foreign key column. |
| Foreign key | A column in a child table that stores the ID of the related parent record. |
| `Filter` function | Returns a subset of records from a table where a logical condition is true. |
| `LookUp` function | Returns the first matching record (or a specified field) from a table based on a condition. |
| `ForAll` function | Executes a formula for every record in a table, enabling bulk write operations. |
| `Collect` function | Adds one or more records to a collection without clearing existing data. |
| `ClearCollect` function | Clears a collection and then populates it with new records. |
| Collection | An in-memory, temporary data store within a Power Apps session. |
| Dot notation | Dataverse feature allowing direct navigation to related record fields using `.` syntax. |
| Dataverse Lookup column | A column type that defines a relationship at the table level within Microsoft Dataverse. |
| One-to-many relationship | A relationship where one parent record is associated with multiple child records. |

---

## Main Ideas

- Storing all data in a single flat table creates redundancy; splitting into parent and child tables eliminates repeated data.
- A child table references its parent via a foreign key column (e.g., `TripID`, `CustomerID`, `ReceiptHeaderID`).
- Power Apps can relate data across different sources (e.g., Dynamics 365 and Microsoft Lists) using a consistent reference pattern.
- Use `Filter(ChildTable, ForeignKeyColumn = ParentGallery.Selected.ID)` to display child records for a selected parent.
- Use `LookUp(ParentTable, ID = ThisItem.ForeignKey, DesiredField)` inside a Gallery to resolve a foreign key to a human-readable value.
- Calling `LookUp` inside a Gallery triggers one data source query **per row**, which degrades performance with large datasets.
- Performance best practice: load parent records into an in-memory collection once, then perform `LookUp` against the collection.
- `ForAll` combined with `Collect` writes one related child record per iteration, enabling bulk insert of line items linked to a header.
- Use `Last(Collection).ID + 1` with an `If(IsEmpty(...))` guard to auto-increment IDs in collections.
- In Microsoft Dataverse, relationships are defined at the **table level** and made available to all apps using those tables.
- Dataverse dot notation (e.g., `ThisItem.Customer.CustomerName`) replaces manual `LookUp` calls, reducing formula complexity.
- Collections are temporary (in-memory only); use `Patch` with Dataverse or SharePoint for persistent relational writes.

---

## Mini Quiz

### Q1 — Single Choice

A developer displays a list of invoices in Gallery2. They want to show only invoices belonging to the customer selected in Gallery1.

Which formula should be set on Gallery2's **Items** property?

- A. `LookUp(InvoiceTable, CustomerID = Gallery1.Selected.ID)`
- B. `Filter(InvoiceTable, CustomerID = Gallery1.Selected.ID)`
- C. `ForAll(InvoiceTable, CustomerID = Gallery1.Selected.ID)`
- D. `Collect(InvoiceTable, Gallery1.Selected.ID)`

<details>
<summary>Answer</summary>

**Correct answer:** B. `Filter(InvoiceTable, CustomerID = Gallery1.Selected.ID)`

**Explanation:** `Filter` returns all matching records from a table, making it the correct function to display a subset of child records linked to a selected parent. `LookUp` returns only the first match and is used for resolving a single value.

</details>

---

### Q2 — Fill-in-the-Blank

To replace a numeric `CustomerID` field in a gallery row with the actual customer name, you set the label's **Text** property to `___(CustomerTable, ID = ThisItem.CustomerID, ___)`.

<details>
<summary>Answer</summary>

**Answer:** `LookUp`, `CustomerName`

**Explanation:** `LookUp` accepts a source table, a match condition, and an optional result column. It returns the value of `CustomerName` from the first row in `CustomerTable` where `ID` equals `ThisItem.CustomerID`.

</details>

---

### Q3 — Single Choice

A gallery displays 500 invoice records. Each row calls `LookUp(CustomerTable, ...)` to show the customer name. What is the likely consequence?

- A. The app will throw a delegation warning and show only 500 records.
- B. The gallery will fail to render because `LookUp` is not supported inside galleries.
- C. One data source query per row is triggered, causing high network traffic and slow performance.
- D. Power Apps caches `LookUp` results automatically, so there is no performance impact.

<details>
<summary>Answer</summary>

**Correct answer:** C. One data source query per row is triggered, causing high network traffic and slow performance.

**Explanation:** `LookUp` inside a gallery executes a separate data source call for every record displayed. The recommended fix is to load the parent records into an in-memory collection once and run lookups against that collection instead.

</details>

---

### Q4 — Fill-in-the-Blank

In the shopping cart exercise, after creating a receipt header, the formula uses `___` to iterate over every item in `colCart` and write a corresponding `ReceiptLineItems` record.

<details>
<summary>Answer</summary>

**Answer:** `ForAll`

**Explanation:** `ForAll` executes a formula once for each record in a table or collection, making it the correct function for bulk-inserting child records (one per cart item) linked to the same receipt header.

</details>

---

### Q5 — Single Choice

A developer migrates their app's data to Microsoft Dataverse and configures a relationship between `CustomerTable` and `InvoiceTable`. What immediate benefit does this provide in Power Apps formulas?

- A. The `Filter` function is no longer needed to show related child records.
- B. Dot notation can be used to navigate to related fields without writing `LookUp` calls.
- C. Collections are automatically persisted to Dataverse on app close.
- D. The gallery's `Items` property is automatically set to the related table.

<details>
<summary>Answer</summary>

**Correct answer:** B. Dot notation can be used to navigate to related fields without writing `LookUp` calls.

**Explanation:** Dataverse defines relationships at the table level, enabling dot notation (e.g., `ThisItem.Customer.CustomerName`) to traverse to related records directly, removing the manual overhead of `LookUp` functions.

</details>

---

### Q6 — Fill-in-the-Blank

Collections in Power Apps store data ___ (temporarily / permanently). For persistent relational writes, use the `___` function with Dataverse or SharePoint.

<details>
<summary>Answer</summary>

**Answer:** temporarily, `Patch`

**Explanation:** Collections exist only in memory for the duration of the app session and are lost when the app closes. `Patch` is the function used to create or update records in a persistent data source like Dataverse or SharePoint.

</details>

---
