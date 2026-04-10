# Quiz: Working with Data Source Limits (Delegation) in Power Apps Canvas Apps

> **Source material:** 1-delegation-overview.md, 2-functions-predicates-data-source.md, 3-delegation-warnings-limits-functions.md, 4-knowledge-check.md, 5-summary.md, SUMMARY.md
> **Total questions:** 22
> **Question types:** Multiple choice (single), Multiple choice (multi-select), Fill-in-the-blank

---

## Questions

### Question 1 — Single Choice

You are building a Power Apps canvas app connected to a SharePoint list with 10,000 records. You want to display only records where `Status = "Approved"` in a gallery. You use the `Filter` function.

What happens when the `Filter` function is delegated to SharePoint?

- A. Power Apps retrieves the first 500 records from SharePoint and filters them locally.
- B. SharePoint returns all 10,000 records to Power Apps, which then filters them.
- C. SharePoint processes the formula across all 10,000 records and returns only matching records to Power Apps.
- D. Power Apps retrieves a maximum of 2,000 records and filters them locally.

<details>
<summary>Answer</summary>

**Correct answer:** C. SharePoint processes the formula across all 10,000 records and returns only matching records to Power Apps.

**Explanation:** When a function is delegable, the data source processes the formula against all records and returns only the matching results. This reduces data movement between the data source and Power Apps.

</details>

---

### Question 2 — Single Choice

A maker is building a canvas app connected to a SharePoint list containing 5,000 employee records. They use the following formula in a gallery:

```
Search(SharePointList, "Taylor", "FirstName", "LastName")
```

What is the result of this formula?

- A. SharePoint processes the search across all 5,000 records and returns all matches.
- B. Power Apps retrieves only 500 records from SharePoint and searches them locally; the remaining 4,500 records are not processed.
- C. Power Apps retrieves all 5,000 records and searches them locally.
- D. Power Apps generates a runtime error because `Search` is not supported with SharePoint.

<details>
<summary>Answer</summary>

**Correct answer:** B. Power Apps retrieves only 500 records from SharePoint and searches them locally; the remaining 4,500 records are not processed.

**Explanation:** The `Search` function is not delegable to SharePoint. When delegation is not available, Power Apps retrieves only the first 500 records (by default) and processes the formula locally, leaving the remaining records unprocessed.

</details>

---

### Question 3 — Single Choice

A Power Apps canvas app is connected to a Salesforce data source. A maker writes the following formula to filter customers:

```
Filter(SalesforceCustomers, IsBlank(Name))
```

What is the behavior of this formula?

- A. It is delegated to Salesforce, which processes all records and returns those with a blank Name.
- B. It is not delegated because Salesforce does not support the `IsBlank` predicate, so only the first 500 records are retrieved and filtered locally.
- C. It returns a delegation error and the formula cannot be saved.
- D. It is delegated because `Filter` is always delegable regardless of the predicate used.

<details>
<summary>Answer</summary>

**Correct answer:** B. It is not delegated because Salesforce does not support the `IsBlank` predicate, so only the first 500 records are retrieved and filtered locally.

**Explanation:** Delegation depends on the function, the predicate, and the data source together. Salesforce does not support the `IsBlank` predicate, making this formula non-delegable even though `Filter` itself can be delegable for other predicates.

</details>

---

### Question 4 — Single Choice

You are creating a Power Apps canvas app and you notice a squiggly underline and a yellow warning triangle on part of your formula. Your data source only has 50 records.

What does this visual indicator mean?

- A. The formula contains a syntax error and will not run.
- B. The formula is not delegated to the data source; however, since the data source is small, all records are still returned.
- C. The formula is not delegated and Power Apps is warning you that you may not see all of your data.
- D. The warning only appears when the data source has more than 500 records.

<details>
<summary>Answer</summary>

**Correct answer:** C. The formula is not delegated and Power Apps is warning you that you may not see all of your data.

**Explanation:** Power Apps displays the delegation warning regardless of the size of the data source. The warning always appears when the formula is not delegated, even if the data source is small and delegation is not technically causing a problem.

</details>

---

### Question 5 — Single Choice

A maker is troubleshooting a non-delegable formula that uses both `FirstName` and `LastName` fields. They notice only `FirstName` has the squiggly underline.

What is the most likely reason only `FirstName` is underlined?

- A. `LastName` is stored in a delegable column type, so it doesn't trigger a warning.
- B. Power Apps only underlines the first field that causes the delegation issue, even if multiple fields are problematic.
- C. `LastName` is already excluded from the search, so it is not evaluated.
- D. The delegation warning only applies to the first column defined in the data source schema.

<details>
<summary>Answer</summary>

**Correct answer:** B. Power Apps only underlines the first field that causes the delegation issue, even if multiple fields are problematic.

**Explanation:** The delegation warning indicator only highlights the first element causing the delegation issue. This can be misleading — the real problem may be the function itself (e.g., `Search`), not the difference between the two fields. Rearranging the formula can help confirm the true cause.

</details>

---

### Question 6 — Single Choice

An app is running in production and a user reports they are not seeing all expected records in the gallery. As the app maker, you know the gallery uses a non-delegable function.

What notification does the user receive about the partial data being shown?

- A. A yellow banner appears at the top of the screen notifying the user that only partial records are shown.
- B. The gallery displays a message below the last record indicating more records exist.
- C. The user receives no notification; they may not be aware they are viewing partial data.
- D. Power Apps automatically retrieves all records when running in production, unlike in the Maker portal.

<details>
<summary>Answer</summary>

**Correct answer:** C. The user receives no notification; they may not be aware they are viewing partial data.

**Explanation:** Delegation warnings are only visible in the Maker portal during app building. When users run the app, they receive no indication that a non-delegable function is limiting the records displayed.

</details>

---

### Question 7 — Single Choice

You need to increase the number of records returned by non-delegable queries in your Power Apps canvas app. Where do you configure this setting?

- A. In the formula bar, by adding a `RecordLimit` parameter to the non-delegable function.
- B. In the data source connector settings on the Power Platform admin center.
- C. In **Settings > App settings > General tab > Data row limit** in the Maker portal.
- D. In the gallery control's `Items` property by adding a `Top` parameter.

<details>
<summary>Answer</summary>

**Correct answer:** C. In **Settings > App settings > General tab > Data row limit** in the Maker portal.

**Explanation:** The data row limit for non-delegable queries is configured under Settings in the Maker portal. Navigate to App settings, stay on the General tab, and scroll to the Data row limit setting, where you can set a value between 1 and 2,000.

</details>

---

### Question 8 — Single Choice

A maker is testing a canvas app and suspects a non-delegable function is limiting the gallery results. They want a quick way to confirm this.

What is the most effective approach?

- A. Increase the data row limit to 2,000 and verify all records appear.
- B. Lower the data row limit to 1 and check whether the gallery shows only one record.
- C. Delete the formula and re-enter it to clear any cached warnings.
- D. Publish the app and ask end users to report how many records they see.

<details>
<summary>Answer</summary>

**Correct answer:** B. Lower the data row limit to 1 and check whether the gallery shows only one record.

**Explanation:** Setting the data row limit to 1 or 10 is a testing technique — if only one record appears in the gallery, it confirms that a non-delegable function is limiting the results. This speeds up troubleshooting significantly.

</details>

---

### Question 9 — Single Choice

Your organization stores product data in a large external database. You need to run complex non-delegable operations on this data within a Power Apps canvas app. Which approach is recommended to handle large data volumes with non-delegable functions?

- A. Increase the data row limit to 2,000 and accept that some records may be missing.
- B. Use the `Search` function, which is always delegable to all data sources.
- C. Migrate the data to Microsoft Dataverse using the Data Integrator tool, which offers better delegation support.
- D. Use `First` and `Last` functions to manually page through the records.

<details>
<summary>Answer</summary>

**Correct answer:** C. Migrate the data to Microsoft Dataverse using the Data Integrator tool, which offers better delegation support.

**Explanation:** When large data volumes require non-delegable operations, the recommended approach is to move the data to Microsoft Dataverse, which is delegation-friendly. The Data Integrator tool can be used to transfer data into Dataverse from another source.

</details>

---

### Question 10 — Single Choice

You are using Microsoft Dataverse as your data source. You write the following formula to filter products:

```
Filter(Products, Price + 10 > 100)
```

What is the delegation behavior of this formula?

- A. It is fully delegable because `Filter` is always delegable to Dataverse.
- B. It is not delegable because arithmetic expressions within filter predicates are not supported for delegation in Dataverse.
- C. It is delegable because Dataverse supports all numeric comparisons.
- D. It is delegable only if the `Price` column is of type Currency.

<details>
<summary>Answer</summary>

**Correct answer:** B. It is not delegable because arithmetic expressions within filter predicates are not supported for delegation in Dataverse.

**Explanation:** In Dataverse, numbers with arithmetic expressions (such as `field + 10 > 100`) are not delegable. The formula will be processed locally using only the first 500 records (default limit).

</details>

---

### Question 11 — Single Choice

A maker uses the following formula to join product data with supplier information:

```
AddColumns(Products, "Supplier Name", LookUp(Suppliers, Suppliers.ID = Product.SupplierID).Name)
```

The `Suppliers` table has 50,000 records. What is a potential performance concern with this formula?

- A. `AddColumns` is not delegable, so it will generate an error when the data exceeds 2,000 records.
- B. `LookUp` issues a separate query to the data source for each record in `Products`, which increases network activity.
- C. `AddColumns` sends all columns from `Products` to Dataverse, increasing payload size.
- D. `LookUp` cannot be delegated when used inside `AddColumns`.

<details>
<summary>Answer</summary>

**Correct answer:** B. `LookUp` issues a separate query to the data source for each record in `Products`, which increases network activity.

**Explanation:** When `LookUp` is used inside `AddColumns`, it executes a separate data source query for each record in the initial segment of `Products`. This results in significant network overhead, especially if `Products` has many records.

</details>

---

### Question 12 — Single Choice

A maker wants to optimize the formula from the previous question to reduce network calls. The `Suppliers` table is small (fewer than 200 records) and rarely changes.

What is the recommended optimization?

- A. Replace `LookUp` with `Filter` to reduce the number of queries.
- B. Use `First` to limit the number of records retrieved from `Suppliers`.
- C. Cache the `Suppliers` data in a collection at app start using `Collect` in `OnVisible`, then use `LookUp` against the local collection.
- D. Increase the data row limit to 2,000 to ensure all suppliers are retrieved.

<details>
<summary>Answer</summary>

**Correct answer:** C. Cache the `Suppliers` data in a collection at app start using `Collect` in `OnVisible`, then use `LookUp` against the local collection.

**Explanation:** When the referenced table is small and stable, caching it in a local collection during app initialization (using `Collect` in the `OnVisible` property of the opening screen) allows subsequent `LookUp` operations to run against the local collection, eliminating repeated network queries.

</details>

---

### Question 13 — Single Choice

A maker combines a delegable `Filter` function with a non-delegable `CountIf` function in the same formula. What is the impact on delegation?

- A. The delegable portion (`Filter`) still processes at the data source; only `CountIf` runs locally.
- B. Adding a non-delegable function to the formula can make the previously delegable function non-delegable, reducing the data returned.
- C. Power Apps prevents saving the formula because delegable and non-delegable functions cannot be combined.
- D. The formula delegates to the data source because `Filter` takes precedence over `CountIf`.

<details>
<summary>Answer</summary>

**Correct answer:** B. Adding a non-delegable function to the formula can make the previously delegable function non-delegable, reducing the data returned.

**Explanation:** Non-delegable functions can contaminate formulas that otherwise would be delegable. When a non-delegable function is added to a formula, the entire formula or the affected portion may fall back to local processing with only the first 500 records (or the configured limit).

</details>

---

### Question 14 — Multi-Select

You are reviewing a Power Apps canvas app formula for delegation issues. Which of the following functions are **never** delegable and will always trigger local processing? (Select **three**.)

- A. `Filter`
- B. `First`
- C. `GroupBy`
- D. `LookUp`
- E. `CountIf`
- F. `AddColumns`

<details>
<summary>Answer</summary>

**Correct answers:** B. `First`, C. `GroupBy`, E. `CountIf`

**Explanation:** `First`, `GroupBy`, and `CountIf` are all non-delegable functions — they always process locally against the retrieved record limit. `Filter` and `LookUp` are delegable to many data sources, and `AddColumns` is partially delegable (its arguments can be delegated, but its output is subject to the record limit).

</details>

---

### Question 15 — Multi-Select

A maker is reviewing which functions are classified as partially delegable table shaping functions in Power Apps. Which of the following belong to this category? (Select **two**.)

- A. `Filter`
- B. `AddColumns`
- C. `Collect`
- D. `RenameColumns`
- E. `GroupBy`

<details>
<summary>Answer</summary>

**Correct answers:** B. `AddColumns`, D. `RenameColumns`

**Explanation:** `AddColumns`, `DropColumns`, `ShowColumns`, and `RenameColumns` are partially delegable table shaping functions — their arguments can be delegated to the data source, but their output is constrained by the non-delegation record limit. `Filter` is fully delegable to many sources, while `Collect` and `GroupBy` are not delegable.

</details>

---

### Question 16 — Multi-Select

A solutions architect is evaluating delegation support for a new canvas app. Which of the following factors combine to determine whether a formula will be delegated? (Select **three**.)

- A. The function used in the formula
- B. The number of app screens
- C. The predicate used in the formula
- D. The data source the formula targets
- E. The user's Power Apps license

<details>
<summary>Answer</summary>

**Correct answers:** A. The function used in the formula, C. The predicate used in the formula, D. The data source the formula targets

**Explanation:** Delegation is determined by the combination of three factors: the function (e.g., `Filter`, `Search`), the predicate (e.g., `=`, `IsBlank`), and the data source (e.g., SharePoint, Dataverse, Salesforce). The number of screens and user license do not affect delegation.

</details>

---

### Question 17 — Multi-Select

A maker needs to configure the Data row limit for non-delegable queries. Which of the following are valid reasons to adjust this setting? (Select **two**.)

- A. Increase the limit so Power Apps retrieves more records when non-delegable functions are used and the full dataset is within the new limit.
- B. Increase the limit to make non-delegable functions behave like delegable functions across all records.
- C. Lower the limit to 1 or 10 during testing to quickly confirm whether a non-delegable function is causing data issues.
- D. Lower the limit to improve performance when using fully delegable formulas.

<details>
<summary>Answer</summary>

**Correct answers:** A. Increase the limit so Power Apps retrieves more records when non-delegable functions are used and the full dataset is within the new limit., C. Lower the limit to 1 or 10 during testing to quickly confirm whether a non-delegable function is causing data issues.

**Explanation:** Increasing the limit is useful when your dataset is known to be under 2,000 records and you want all records retrieved. Lowering the limit to 1 or 10 is a debugging technique to quickly verify whether a non-delegable function is limiting results. Raising the limit does not make non-delegable functions truly delegable, and adjusting the limit has no effect on fully delegable formulas.

</details>

---

### Question 18 — Fill-in-the-Blank

When a formula cannot be delegated to a data source, Power Apps retrieves the first ___ records by default. This limit can be increased to a maximum of ___ records in the App settings.

<details>
<summary>Answer</summary>

**Answer:** 500; 2,000

**Explanation:** The default non-delegation record limit is 500. It can be adjusted in Settings > App settings > General > Data row limit to any value between 1 and 2,000.

</details>

---

### Question 19 — Fill-in-the-Blank

Power Apps indicates that a formula is not delegated by displaying a ___ underline and a ___ warning triangle on the non-delegable portion of the formula in the Maker portal.

<details>
<summary>Answer</summary>

**Answer:** squiggly; yellow

**Explanation:** In the Power Apps Maker portal, non-delegable formulas are visually flagged with a squiggly underline and a yellow warning triangle. These indicators are only visible to the app maker, not to end users.

</details>

---

### Question 20 — Fill-in-the-Blank

SharePoint ___ columns are an example of a complex column type that is not delegable, meaning Power Apps can only process them ___.

<details>
<summary>Answer</summary>

**Answer:** lookup; locally

**Explanation:** SharePoint lookup columns are complex column types that cannot be delegated. When a formula references them, Power Apps must process the data locally, limited to the configured record limit.

</details>

---

### Question 21 — Fill-in-the-Blank

To transfer data from an external system into Microsoft Dataverse so that delegation-friendly functions can be used, a maker can use the ___ tool.

<details>
<summary>Answer</summary>

**Answer:** Data Integrator

**Explanation:** The Data Integrator tool allows makers to migrate data from external sources into Microsoft Dataverse. Since Dataverse offers broader delegation support, this migration can resolve delegation limitations when working with large datasets.

</details>

---

### Question 22 — Fill-in-the-Blank

In Dataverse, aggregate functions are limited to a collection of ___ records. To use an aggregate function on a larger dataset, use the ___ function first to reduce the record set to within this limit.

<details>
<summary>Answer</summary>

**Answer:** 50,000; Filter

**Explanation:** Dataverse aggregate functions can process up to 50,000 records. If the dataset is larger, use the `Filter` function to select a subset of 50,000 or fewer records before applying the aggregate function.

</details>
