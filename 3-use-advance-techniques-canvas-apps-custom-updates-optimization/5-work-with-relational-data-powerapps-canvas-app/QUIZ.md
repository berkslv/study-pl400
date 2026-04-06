# Quiz: Working with Relational Data in Power Apps Canvas Apps

> **Source material:** 1-relational-data.md, 2-work-with-relationships.md, 3-exercise.md, 4-cds-for-apps.md, 5-knowledge-check.md, 6-summary.md
> **Total questions:** 22
> **Question types:** Multiple choice (single), Multiple choice (multi-select), Fill-in-the-blank

---

## Questions

### Question 1 — Single Choice

Your team is designing a travel expense app. A developer suggests storing every expense row with full trip details repeated on each row (destination, date, trip reason, expense type, expense amount). A colleague objects.

What is the main problem with storing all expense data in a single flat table?

- A. The table cannot store more than 1,000 rows.
- B. It creates redundant data because trip-level fields repeat on every expense row.
- C. Power Apps does not support tables with more than five columns.
- D. Single tables prevent the use of the Filter function.

<details>
<summary>Answer</summary>

**Correct answer:** B. It creates redundant data because trip-level fields repeat on every expense row.

**Explanation:** When all data is stored in one table, trip information such as destination, date, and trip reason is duplicated on every individual expense record. Using separate parent and child tables eliminates this redundancy by storing trip-level data once in the parent and referencing it from each expense row in the child.

</details>

---

### Question 2 — Single Choice

You are designing a data model with a parent Trips table and a child Expenses table. You need to link each expense row to its corresponding trip.

Which column in the child table establishes the relationship to the parent table?

- A. A column that stores the expense type.
- B. A column that stores the trip destination.
- C. A foreign key column that stores the parent record's ID (e.g., `TripID`).
- D. A column that stores the date of the trip.

<details>
<summary>Answer</summary>

**Correct answer:** C. A foreign key column that stores the parent record's ID (e.g., `TripID`).

**Explanation:** The foreign key column (such as `TripID`) in the child table stores the ID value of the corresponding parent record. This creates the logical relationship between the two tables and allows child records to be associated with their parent.

</details>

---

### Question 3 — Single Choice

You have a CustomerTable (parent) and an InvoiceTable (child). Gallery1 displays all customers. You add Gallery2 and want it to show only the invoices that belong to the customer selected in Gallery1.

Which formula should you set as the **Items** property of Gallery2?

- A. `LookUp(InvoiceTable, CustomerID, Gallery1.Selected.ID)`
- B. `Filter(CustomerTable, ID = Gallery1.Selected.CustomerID)`
- C. `Filter(InvoiceTable, CustomerID = Gallery1.Selected.ID)`
- D. `Search(InvoiceTable, Gallery1.Selected.CustomerName, "CustomerID")`

<details>
<summary>Answer</summary>

**Correct answer:** C. `Filter(InvoiceTable, CustomerID = Gallery1.Selected.ID)`

**Explanation:** The `Filter` function takes the child table as its source and applies a logical test comparing the child's `CustomerID` foreign key to the ID of the currently selected customer in Gallery1. This returns only the invoices belonging to that customer.

</details>

---

### Question 4 — Single Choice

Gallery3 is bound to InvoiceTable. The Body label currently shows a numeric `CustomerID`. You want it to display the customer's name instead.

Which formula should you set as the **Text** property of the Body label?

- A. `Filter(CustomerTable, ID = ThisItem.CustomerID)`
- B. `LookUp(CustomerTable, ID = ThisItem.CustomerID, CustomerName)`
- C. `LookUp(InvoiceTable, CustomerID = ThisItem.ID, CustomerName)`
- D. `Search(CustomerTable, ThisItem.CustomerID, "ID")`

<details>
<summary>Answer</summary>

**Correct answer:** B. `LookUp(CustomerTable, ID = ThisItem.CustomerID, CustomerName)`

**Explanation:** The `LookUp` function searches the parent CustomerTable for the record whose `ID` matches the child record's `CustomerID` foreign key, then returns the `CustomerName` column value. This replaces the numeric ID with a human-readable name.

</details>

---

### Question 5 — Single Choice

A canvas app has a Gallery bound to an InvoiceTable with 500 records. Each row uses `LookUp(CustomerTable, ID = ThisItem.CustomerID, CustomerName)` to resolve the customer name.

What performance concern does this create?

- A. The `LookUp` function is not supported inside a gallery control.
- B. LookUp automatically caches results, so there are no performance concerns.
- C. Each visible record in the gallery triggers a separate data source query, generating many network calls.
- D. The formula returns blank because `ThisItem` cannot be used inside `LookUp`.

<details>
<summary>Answer</summary>

**Correct answer:** C. Each visible record in the gallery triggers a separate data source query, generating many network calls.

**Explanation:** Using `LookUp` inside a gallery fires one data source query per visible record. With hundreds of records, this produces hundreds of round trips to the data source, significantly increasing network traffic and degrading app performance.

</details>

---

### Question 6 — Single Choice

You have identified a performance problem: `LookUp` inside a gallery is making one data source call per record. You want to resolve customer names efficiently without degrading performance.

What is the recommended approach?

- A. Use `Filter` instead of `LookUp` for every record.
- B. Load all parent records into an in-memory collection once, then run `LookUp` against the collection.
- C. Reduce the gallery's visible items count to zero.
- D. Replace the gallery with a data table control.

<details>
<summary>Answer</summary>

**Correct answer:** B. Load all parent records into an in-memory collection once, then run `LookUp` against the collection.

**Explanation:** Querying a local in-memory collection does not generate network traffic. By loading all parent records into a collection at app start (e.g., using `ClearCollect`), all subsequent `LookUp` calls resolve instantly from memory instead of making repeated calls to the data source.

</details>

---

### Question 7 — Single Choice

In the shopping cart exercise, Gallery1 shows available products. When a user taps a product, it should be added to the cart collection `colCart`.

Which formula should be set on Gallery1's **OnSelect** property?

- A. `ClearCollect(colCart, ThisItem)`
- B. `Remove(colCart, ThisItem)`
- C. `Collect(colCart, ThisItem)`
- D. `ForAll(colCart, ThisItem)`

<details>
<summary>Answer</summary>

**Correct answer:** C. `Collect(colCart, ThisItem)`

**Explanation:** The `Collect` function appends the tapped item (`ThisItem`) to the `colCart` collection without clearing existing entries. `ClearCollect` would remove any previously added cart items before adding the new one, which is not the desired behavior for a shopping cart.

</details>

---

### Question 8 — Single Choice

During checkout in the shopping cart app, you need to create one ReceiptLineItems record for every item currently in `colCart`.

Which function should you use to iterate over `colCart` and write a record to ReceiptLineItems for each item?

- A. `Filter`
- B. `LookUp`
- C. `If`
- D. `ForAll`

<details>
<summary>Answer</summary>

**Correct answer:** D. `ForAll`

**Explanation:** `ForAll` iterates over every record in a table or collection and executes a formula for each one. In the checkout button's `OnSelect`, `ForAll(colCart, Collect(ReceiptLineItems, {...}))` creates one ReceiptLineItems record per cart item, linking it to the new receipt via `ReceiptHeaderID`.

</details>

---

### Question 9 — Single Choice

After a successful checkout in the shopping cart app, the cart should be emptied so the user can begin a new shopping session.

Which function call accomplishes this at the end of the Check Out button's **OnSelect** formula?

- A. `Remove(colCart)`
- B. `Reset(colCart)`
- C. `ClearCollect(colCart)`
- D. `Clear(colCart)`

<details>
<summary>Answer</summary>

**Correct answer:** D. `Clear(colCart)`

**Explanation:** The `Clear` function removes all records from a collection without deleting the collection itself. `ClearCollect` would also clear the collection but is designed to immediately repopulate it, which is not appropriate here. `Remove` only deletes specific records, and `Reset` is for input controls.

</details>

---

### Question 10 — Single Choice

On the Order History screen, Gallery4 should display only the line items that belong to the receipt selected in Gallery3.

Which formula correctly sets Gallery4's **Items** property?

- A. `LookUp(ReceiptLineItems, ReceiptHeaderID, Gallery3.Selected.ID)`
- B. `Filter(ReceiptHeader, ID = Gallery3.Selected.ID)`
- C. `Filter(ReceiptLineItems, ReceiptHeaderID = Gallery3.Selected.ID)`
- D. `Search(ReceiptLineItems, Gallery3.Selected.Name, "ReceiptHeaderID")`

<details>
<summary>Answer</summary>

**Correct answer:** C. `Filter(ReceiptLineItems, ReceiptHeaderID = Gallery3.Selected.ID)`

**Explanation:** This `Filter` formula returns only the ReceiptLineItems records whose `ReceiptHeaderID` foreign key matches the ID of the receipt currently selected in Gallery3, implementing the parent-to-child drill-down pattern.

</details>

---

### Question 11 — Single Choice

You are building an app that uses Microsoft Dataverse as its data source. A Dataverse relationship has been configured between the Invoices table and the Customers table.

How does this Dataverse relationship change the way you access the customer name from within an Invoices gallery?

- A. You must still use `LookUp(CustomerTable, ID = ThisItem.CustomerID, CustomerName)`.
- B. You can use dot (.) notation to navigate directly to the related record, such as `ThisItem.Customer.CustomerName`.
- C. You must use the `Filter` function to retrieve the customer name.
- D. Dataverse relationships are only available at the tenant level and cannot be used in canvas apps.

<details>
<summary>Answer</summary>

**Correct answer:** B. You can use dot (.) notation to navigate directly to the related record, such as `ThisItem.Customer.CustomerName`.

**Explanation:** When a relationship is defined at the Dataverse table level, Power Apps exposes the related data through dot notation. This eliminates the need for manual `LookUp` calls, reduces app complexity, and avoids extra per-record network calls.

</details>

---

### Question 12 — Single Choice

A developer wants to configure a Dataverse relationship between two tables so that all canvas apps connecting to those tables can use the relationship automatically.

Where should the relationship be configured?

- A. In the canvas app's OnStart property.
- B. In the tenant-level Power Platform admin center.
- C. In the Data section of Power Apps Studio or the Dataverse maker portal.
- D. In each individual gallery's Items formula.

<details>
<summary>Answer</summary>

**Correct answer:** C. In the Data section of Power Apps Studio or the Dataverse maker portal.

**Explanation:** Dataverse relationships are defined at the table level in the Data section of Power Apps Studio or in the Dataverse maker portal. Once configured, the relationship is automatically available to all apps that connect to those Dataverse tables.

</details>

---

### Question 13 — Multi-Select

You are working with data stored in non-Dataverse sources (e.g., SharePoint lists). You need to display related child records and resolve foreign key IDs to human-readable names.

Which **two** Power Apps functions are primarily used to work with these relationships? (Select **two**.)

- A. Patch
- B. Filter
- C. Search
- D. LookUp
- E. ForAll

<details>
<summary>Answer</summary>

**Correct answer:** B. Filter, D. LookUp

**Explanation:** `Filter` is used to retrieve child records that match a selected parent record (top-down). `LookUp` is used to resolve a foreign key ID to a human-readable value from the parent table (bottom-up). These two functions are the primary tools for relational data in non-Dataverse sources.

</details>

---

### Question 14 — Multi-Select

In the shopping cart exercise, three in-memory collections are used to model the relational data structure.

Which **three** collections are created in this exercise? (Select **three**.)

- A. colCart
- B. Products
- C. Orders
- D. ReceiptHeader
- E. ReceiptLineItems
- F. Invoices

<details>
<summary>Answer</summary>

**Correct answer:** B. Products, D. ReceiptHeader, E. ReceiptLineItems

**Explanation:** The exercise creates three persistent collections: `Products` (reference data), `ReceiptHeader` (one record per checkout), and `ReceiptLineItems` (one record per cart item with foreign keys to both ReceiptHeader and Products). `colCart` is a temporary working collection, not one of the three main relational tables.

</details>

---

### Question 15 — Multi-Select

Your organization is evaluating Microsoft Dataverse as the data source for a new canvas app. A team member asks about the advantages of using Dataverse relationships compared to manual `LookUp` calls.

Which **three** benefits does Dataverse dot notation provide? (Select **three**.)

- A. Relationships are enforced at the data layer, not just the app layer.
- B. Dot notation automatically generates UI forms for each related table.
- C. Related data is accessible without writing numerous `LookUp` functions.
- D. App logic is simpler and easier to maintain.
- E. Dataverse relationships eliminate the need for a data source connection entirely.

<details>
<summary>Answer</summary>

**Correct answer:** A. Relationships are enforced at the data layer, not just the app layer. C. Related data is accessible without writing numerous `LookUp` functions. D. App logic is simpler and easier to maintain.

**Explanation:** Dataverse relationships provide a structured foundation enforced at the data layer, expose related data through dot notation (removing the need for manual `LookUp` calls), and reduce app complexity making apps easier to build and maintain. They do not generate UI forms automatically or remove the need for a data source connection.

</details>

---

### Question 16 — Multi-Select

In the shopping cart exercise, the ReceiptLineItems collection has two foreign key fields that link it to other collections.

Which **two** foreign key fields does ReceiptLineItems contain? (Select **two**.)

- A. `CustomerID`
- B. `ProductID`
- C. `CategoryID`
- D. `ReceiptHeaderID`
- E. `OrderID`

<details>
<summary>Answer</summary>

**Correct answer:** B. `ProductID`, D. `ReceiptHeaderID`

**Explanation:** Each ReceiptLineItems record contains `ProductID` (referencing the Products collection) and `ReceiptHeaderID` (referencing the ReceiptHeader collection). These two foreign keys implement the many-to-one relationships between line items, products, and receipts.

</details>

---

### Question 17 — Fill-in-the-Blank

In a parent-child data model, the child table contains a ___ column that stores the ID of the associated parent record, creating the link between the two tables.

<details>
<summary>Answer</summary>

**Answer:** foreign key

**Explanation:** The foreign key column (for example, `TripID` or `CustomerID`) in the child table holds the primary key value of the corresponding parent record, establishing the one-to-many relationship between the parent and child tables.

</details>

---

### Question 18 — Fill-in-the-Blank

To display only the invoices for the customer currently selected in Gallery1, you set Gallery2's **Items** property to:

`Filter(InvoiceTable, CustomerID = ___)`

<details>
<summary>Answer</summary>

**Answer:** `Gallery1.Selected.ID`

**Explanation:** `Gallery1.Selected` refers to the currently highlighted record in Gallery1, and `.ID` retrieves that record's primary key. The `Filter` function compares each InvoiceTable row's `CustomerID` foreign key against this value to return only the matching child records.

</details>

---

### Question 19 — Fill-in-the-Blank

When a Dataverse relationship is configured between Invoices and Customers tables, the manual formula `LookUp(CustomerTable, ID = ThisItem.CustomerID, CustomerName)` can be replaced with the simpler dot notation expression: `___`

<details>
<summary>Answer</summary>

**Answer:** `ThisItem.Customer.CustomerName`

**Explanation:** Dataverse dot notation lets you traverse from the current record to the related parent record directly. Instead of writing a `LookUp` call with a logical test, you simply chain property names using dots, which is less code and avoids per-record data source queries.

</details>

---

### Question 20 — Fill-in-the-Blank

In the shopping cart exercise, the Check Out button uses the `___` function to iterate over every item in `colCart` and write a corresponding ReceiptLineItems record for each one.

<details>
<summary>Answer</summary>

**Answer:** `ForAll`

**Explanation:** `ForAll(colCart, Collect(ReceiptLineItems, {...}))` loops through each record in `colCart` and executes the `Collect` formula once per record, creating one ReceiptLineItems entry per cart item and linking it to the new ReceiptHeader via the `ReceiptHeaderID` foreign key.

</details>

---

### Question 21 — Single Choice

You are explaining the difference between collections and persistent data sources to a new Power Apps developer. They ask what happens to collections when the app is closed.

Which statement correctly describes collections in Power Apps?

- A. Collections persist across app sessions and are stored in Dataverse automatically.
- B. Collections are stored in SharePoint and can be retrieved by reopening the app.
- C. Collections only store data temporarily in memory; data is lost when the app closes.
- D. Collections automatically synchronize with Microsoft Lists when the app is published.

<details>
<summary>Answer</summary>

**Correct answer:** C. Collections only store data temporarily in memory; data is lost when the app closes.

**Explanation:** Collections are in-memory data stores that exist only for the duration of the current app session. For a persistent solution, the `Patch` function should be used to write data to a permanent data source such as Dataverse or SharePoint.

</details>

---

### Question 22 — Single Choice

A Power Apps developer wants to use customer data stored in Dynamics 365 CRM alongside sales region data stored in Microsoft Lists. They want to reference the customer ID from Dynamics 365 within the Microsoft Lists data.

Which statement best describes Power Apps' support for this scenario?

- A. Power Apps only supports relationships between tables in the same data source.
- B. Power Apps requires Dataverse to establish any cross-source data relationships.
- C. Power Apps supports relationships between different data sources using the same approach as same-source relationships, referencing the shared ID field.
- D. Cross-source relationships require a custom connector and cannot use the Filter or LookUp functions.

<details>
<summary>Answer</summary>

**Correct answer:** C. Power Apps supports relationships between different data sources using the same approach as same-source relationships, referencing the shared ID field.

**Explanation:** Power Apps offers the flexibility to establish relationships between data from distinct sources. For example, a customer ID from Dynamics 365 can be referenced in a Microsoft Lists column and related using the same `Filter` and `LookUp` patterns used for same-source relationships.

</details>
