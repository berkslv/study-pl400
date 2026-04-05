# Quiz: Performing Custom Updates in Power Apps Canvas Apps

> **Source material:** 1-more-than-forms.md, 2-patch-function.md, 3-deleting-records.md, 4-knowledge-check.md, 4a-exercise-patch.md, 5-summary.md
> **Total questions:** 22
> **Question types:** Multiple choice (single), Multiple choice (multi-select), Fill-in-the-Blank

---

## Questions

### Question 1 — Single Choice

You are building a canvas app that logs every button click to a SharePoint list, recording the user's name and timestamp automatically — without any form input from the user. Which function is best suited for this scenario?

- A. Submit
- B. Collect
- C. Patch
- D. Update

<details>
<summary>Answer</summary>

**Correct answer:** C. Patch

**Explanation:** The Patch function is used to create and edit records directly in a data source without requiring a Form control. It is ideal for automated, non-interactive data writes such as logging user activity.

</details>

---

### Question 2 — Single Choice

A developer wants to use the Patch function to create a brand-new record in a data source called `CustomerOrders`. Which of the following formulas correctly creates a new record?

- A. `Patch(CustomerOrders, ID = 0, {Region: "Americas"})`
- B. `Patch(CustomerOrders, LookUp(CustomerOrders, ID = 0), {Region: "Americas"})`
- C. `Patch(CustomerOrders, Defaults(CustomerOrders), {Region: "Americas"})`
- D. `Patch(CustomerOrders, NewRecord(CustomerOrders), {Region: "Americas"})`

<details>
<summary>Answer</summary>

**Correct answer:** C. `Patch(CustomerOrders, Defaults(CustomerOrders), {Region: "Americas"})`

**Explanation:** The `Defaults` function returns a record with default values for the data source and signals Patch to create a new record rather than update an existing one.

</details>

---

### Question 3 — Single Choice

A canvas app uses a Gallery to display customer records. A developer wants to update the record currently displayed in the Gallery row when a user selects an Edit button inside that row. Which second argument should the developer pass to Patch?

- A. `Defaults(CustomerOrders)`
- B. `LookUp(CustomerOrders, ID = 1)`
- C. `ThisRecord`
- D. `ThisItem`

<details>
<summary>Answer</summary>

**Correct answer:** D. `ThisItem`

**Explanation:** When a formula is inside a Gallery control and you want to reference the record displayed in the current row, `ThisItem` points to that record. It is a common alternative to `LookUp` when the record is already in scope via a Gallery.

</details>

---

### Question 4 — Single Choice

A developer writes the following formula to update a record in `CustomerOrders`:

```
Patch(CustomerOrders, LookUp(CustomerOrders, ID = 1), {region: "Asia", Country: "China"})
```

The formula runs without a Power Apps error, but the `Region` column in the data source is never updated. What is the most likely cause?

- A. The LookUp function cannot be used inside Patch.
- B. The column name `region` is not capitalized correctly — column names are case-sensitive.
- C. Patch cannot update more than one column at a time.
- D. The data source does not allow partial updates.

<details>
<summary>Answer</summary>

**Correct answer:** B. The column name `region` is not capitalized correctly — column names are case-sensitive.

**Explanation:** Power Apps column names in Patch formulas are case-sensitive. Writing `region` instead of `Region` means Power Apps does not match the column, so the value is silently ignored rather than written.

</details>

---

### Question 5 — Single Choice

You are passing a value to Patch from a Dropdown control named `Dropdown1`. Which of the following correctly references the selected value of that control?

- A. `{Status: Dropdown1.Value}`
- B. `{Status: Dropdown1.Text}`
- C. `{Status: Dropdown1.Selected.Value}`
- D. `{Status: Selected(Dropdown1)}`

<details>
<summary>Answer</summary>

**Correct answer:** C. `{Status: Dropdown1.Selected.Value}`

**Explanation:** A Dropdown control exposes its selected item through the `.Selected` property, which is a record. To access the display value of the selected item, you reference `.Selected.Value`.

</details>

---

### Question 6 — Single Choice

A developer writes a formula that sets the `Owner` column to the signed-in user's full name when creating a new record:

```
Patch(CustomerOrders, Defaults(CustomerOrders), {Owner: User().FullName})
```

Which category of value source does `User().FullName` represent?

- A. Hardcoded value
- B. Variable reference
- C. Control property reference
- D. Formula output

<details>
<summary>Answer</summary>

**Correct answer:** D. Formula output

**Explanation:** `User().FullName` is the result of calling the `User()` function, which retrieves information about the currently signed-in user from Microsoft Entra ID. This makes it a formula output, one of the four supported Patch value sources.

</details>

---

### Question 7 — Single Choice

A canvas app has a Gallery connected to `CustomerOrders`. A trash icon inside the Gallery has the following `OnSelect` formula:

```
Remove(CustomerOrders, ThisItem)
```

A user selects the trash icon. What happens next?

- A. A confirmation dialog appears asking the user to confirm deletion.
- B. The record is moved to Power Apps' built-in recycle bin.
- C. The record is immediately deleted without any confirmation prompt.
- D. The record is flagged as deleted and hidden from the Gallery until the app is refreshed.

<details>
<summary>Answer</summary>

**Correct answer:** C. The record is immediately deleted without any confirmation prompt.

**Explanation:** The Remove function deletes the specified record immediately without prompting the user. There is no built-in confirmation dialog; developers must implement their own confirmation mechanism (such as a pop-up dialog) if needed.

</details>

---

### Question 8 — Single Choice

You need to delete all records from the `CustomerOrders` data source where the `Status` column equals `"Expired"`. Which formula accomplishes this?

- A. `Remove(CustomerOrders, Status = "Expired")`
- B. `RemoveIf(CustomerOrders, Status = "Expired")`
- C. `Clear(CustomerOrders, Status = "Expired")`
- D. `Filter(CustomerOrders, Status = "Expired"); Remove(CustomerOrders)`

<details>
<summary>Answer</summary>

**Correct answer:** B. `RemoveIf(CustomerOrders, Status = "Expired")`

**Explanation:** The `RemoveIf` function accepts a data source and a condition, then deletes every record for which the condition evaluates to true. This is the correct approach for conditional bulk deletion.

</details>

---

### Question 9 — Single Choice

A developer uses the following formula to delete all records from a data source:

```
RemoveIf(CustomerOrders, true)
```

Why does setting the condition to `true` delete every record?

- A. `true` is a special keyword that tells RemoveIf to skip filtering.
- B. RemoveIf evaluates the condition for each record; since `true` always evaluates to true, every record is deleted.
- C. RemoveIf ignores the condition when `true` is passed and deletes all records by default.
- D. `true` tells RemoveIf to use the same logic as the Clear function.

<details>
<summary>Answer</summary>

**Correct answer:** B. RemoveIf evaluates the condition for each record; since `true` always evaluates to true, every record is deleted.

**Explanation:** RemoveIf checks the condition expression against every record in the data source. Because the literal value `true` always resolves to true, every record matches and is deleted. This same logic applies to the Filter function.

</details>

---

### Question 10 — Single Choice

You want to remove all records from a collection named `collectSelectedItems` without redefining the collection's columns. Which function should you use?

- A. `RemoveIf(collectSelectedItems, true)`
- B. `ClearCollect(collectSelectedItems)`
- C. `Clear(collectSelectedItems)`
- D. `Remove(collectSelectedItems, All)`

<details>
<summary>Answer</summary>

**Correct answer:** C. `Clear(collectSelectedItems)`

**Explanation:** The `Clear` function deletes all records from a collection while preserving its column structure. `RemoveIf` with `true` also works but is more appropriate for tabular data sources. `ClearCollect` requires a new set of records to add, not just clearing.

</details>

---

### Question 11 — Single Choice

A developer is building a shopping cart feature. Users can add items to a collection one at a time, and a "Clear Cart" button should empty the cart without adding any new records. Later, a separate action re-adds items. Which approach best fits this multi-step scenario?

- A. `ClearCollect` — because it combines clearing and collecting in one step.
- B. `Clear` followed by `Collect` — because the clearing and adding happen at different times.
- C. `RemoveIf` — because it supports conditional deletion on collections.
- D. `Defaults` — because it resets the collection to its default state.

<details>
<summary>Answer</summary>

**Correct answer:** B. `Clear` followed by `Collect` — because the clearing and adding happen at different times.

**Explanation:** When the clearing step and the step that adds new records happen at different points in time (different user actions), using `Clear` and `Collect` separately is more appropriate. `ClearCollect` is best when both steps happen simultaneously, such as reloading a drop-down on screen load.

</details>

---

### Question 12 — Single Choice

A user accidentally deletes all records from a data source using `RemoveIf(Orders, true)` inside a Power Apps canvas app. How can the records be recovered from within Power Apps?

- A. Use the Power Apps built-in recycle bin to restore deleted records.
- B. Press Ctrl+Z to undo the deletion.
- C. The records cannot be recovered from within Power Apps; recovery must happen through the data source itself.
- D. Use the `Restore` function to revert the data source to its previous state.

<details>
<summary>Answer</summary>

**Correct answer:** C. The records cannot be recovered from within Power Apps; recovery must happen through the data source itself.

**Explanation:** Power Apps has no built-in recycle bin, undo capability, or recovery mechanism for deleted data source records. Recovery must happen through the underlying data source (for example, point-in-time restore in Dataverse or a SharePoint recycle bin).

</details>

---

### Question 13 — Multi-Select

You are reviewing the Patch function implementation in a canvas app. Which of the following are valid sources for passing values to a Patch formula? (Select **four**.)

- A. Hardcoded literal value
- B. Global variable reference
- C. Control property reference
- D. Formula output (e.g., a function call)
- E. SQL stored procedure output
- F. SharePoint managed metadata picker

<details>
<summary>Answer</summary>

**Correct answer:** A, B, C, D

**Explanation:** The four supported value sources for Patch formulas are: hardcoded values (literals), variable references (such as a Set variable), control property references (such as `Dropdown1.Selected.Value`), and formula outputs (such as `User().FullName` or `Now()`). External service outputs like SQL stored procedures are not directly passed as Patch value sources.

</details>

---

### Question 14 — Multi-Select

Your team is auditing a canvas app that uses the Patch function. Which of the following guidelines should developers follow to avoid common Patch errors? (Select **three**.)

- A. Ensure all required columns in the data source are included in the Patch formula.
- B. Match the data type of each value to the column type in the data source.
- C. Always include the primary key column in the Patch formula to identify the record.
- D. Ensure column names in the formula are spelled and capitalized correctly.
- E. Use the Submit function instead of Patch when working with collections.

<details>
<summary>Answer</summary>

**Correct answer:** A, B, D

**Explanation:** Three key Patch best practices are: include all required columns, match data types (you cannot write a string to a number column), and use correct column name spelling and capitalization. The primary key is managed automatically by the data source when creating new records, and there is no Submit function for collections.

</details>

---

### Question 15 — Multi-Select

A developer needs to delete records from a Power Apps canvas app. Which of the following functions can be used to delete records from a data source or collection? (Select **three**.)

- A. Remove
- B. RemoveIf
- C. Clear
- D. Delete
- E. Patch
- F. Filter

<details>
<summary>Answer</summary>

**Correct answer:** A, B, C

**Explanation:** `Remove` deletes a single specified record, `RemoveIf` deletes records matching a condition, and `Clear` deletes all records from a collection. `Delete`, `Patch`, and `Filter` are not deletion functions — Patch creates or edits records, and Filter returns a filtered subset of records.

</details>

---

### Question 16 — Multi-Select

A canvas app developer wants to perform bulk record operations. Which of the following functions support operations across multiple records? (Select **two**.)

- A. Remove
- B. RemoveIf
- C. Patch (single-record form)
- D. ForAll
- E. LookUp

<details>
<summary>Answer</summary>

**Correct answer:** B, D

**Explanation:** `RemoveIf` applies a delete operation to all records matching a condition, and `ForAll` loops through an entire table to run Patch or Remove on each record. `Remove` in its basic form targets a single record, and `LookUp` retrieves a single record.

</details>

---

### Question 17 — Fill-in-the-Blank

To create a new record in a data source using the Patch function, you use the ___ function as the second argument to signal that a new record should be inserted rather than an existing one updated.

<details>
<summary>Answer</summary>

**Answer:** Defaults

**Explanation:** `Defaults(DataSourceName)` returns a record containing the default values for the data source. Passing it as the second argument to Patch tells the function to create a new record rather than update an existing one.

</details>

---

### Question 18 — Fill-in-the-Blank

The ___ function deletes all records from a collection while preserving the collection's column structure, whereas ___ first deletes all records and then immediately adds a new set of records in a single operation.

<details>
<summary>Answer</summary>

**Answer:** Clear; ClearCollect

**Explanation:** `Clear` empties a collection without redefining it. `ClearCollect` combines `Clear` and `Collect` into a single function call, which is useful when you want to reload a collection with a fresh set of records in one step, such as when a screen becomes visible.

</details>

---

### Question 19 — Fill-in-the-Blank

Power Apps does not provide any built-in ___, ___, or recycle bin when records are deleted from a data source. Developers must implement custom confirmation functionality if they need to protect users from accidental deletion.

<details>
<summary>Answer</summary>

**Answer:** confirmation (dialog); undo

**Explanation:** Neither Remove, RemoveIf, nor Clear prompts the user before deleting records, and there is no undo capability within Power Apps. Any protective mechanism — such as a confirmation pop-up — must be built by the developer.

</details>

---

### Question 20 — Fill-in-the-Blank

To delete all records from a data source named `Orders` using `RemoveIf`, you set the condition argument to ___, because RemoveIf evaluates that condition against every record and deletes those for which it resolves to that value.

<details>
<summary>Answer</summary>

**Answer:** true

**Explanation:** `RemoveIf(Orders, true)` evaluates `true` for every record, causing every record to be deleted. The same logic applies to the Filter function when you need to return all records regardless of any condition.

</details>

---

### Question 21 — Single Choice

A developer is designing a canvas app where clicking a "Next Screen" button should log who clicked the button and when, and then navigate to the next screen — all in a single formula. Which formula correctly achieves this?

- A. `Patch(LoggingTable, Defaults(LoggingTable), {WhoClicked: User().FullName, WhenClicked: Now()}); Navigate(NextScreen, ScreenTransition.Cover)`
- B. `Navigate(NextScreen, ScreenTransition.Cover); Patch(LoggingTable, Defaults(LoggingTable), {WhoClicked: User().FullName})`
- C. `Collect(LoggingTable, {WhoClicked: User().FullName}); Navigate(NextScreen)`
- D. `Patch(LoggingTable, LookUp(LoggingTable, ID = 0), {WhoClicked: User().FullName}); Navigate(NextScreen)`

<details>
<summary>Answer</summary>

**Correct answer:** A. `Patch(LoggingTable, Defaults(LoggingTable), {WhoClicked: User().FullName, WhenClicked: Now()}); Navigate(NextScreen, ScreenTransition.Cover)`

**Explanation:** Using `Defaults(LoggingTable)` creates a new log entry, `User().FullName` captures the signed-in user, and `Now()` captures the timestamp. Multiple statements separated by semicolons run sequentially in the `OnSelect` property, so logging happens before navigation.

</details>

---

### Question 22 — Single Choice

In the Patch exercise, a developer uses `Value(tiPopulation.Text)` when writing the Population field. Why is the `Value()` function necessary here?

- A. The `Value` function converts a text string into a number so it can be written to a numeric column in the data source.
- B. The `Value` function validates that the input is not empty before writing to the data source.
- C. Text input controls require the `Value` function to expose their content to Patch.
- D. The `Value` function formats the number with the correct locale-specific separators.

<details>
<summary>Answer</summary>

**Correct answer:** A. The `Value` function converts a text string into a number so it can be written to a numeric column in the data source.

**Explanation:** Text input controls always return a text string via their `.Text` property. Because the Population column in the data source is a number type, you must wrap the input with `Value()` to convert the string to a number. Writing a string to a number column would cause a type mismatch error.

</details>
