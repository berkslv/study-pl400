# Recall: Work with Data Source Limits in Power Apps Canvas Apps

> **Source files:** 1-delegation-overview.md, 2-functions-predicates-data-source.md, 3-delegation-warnings-limits-functions.md

---

## Keywords

| Term | Definition |
|------|-----------|
| Delegation | The process where Power Apps offloads data processing (filter, sort, search) to the data source instead of locally. |
| Delegable function | A function whose processing is handled entirely by the data source across all records. |
| Nondelegable function | A function that Power Apps must process locally, limited to the retrieved record set. |
| Data row limit | The configurable cap (1–2000, default 500) on records retrieved when delegation is not available. |
| Predicate | A comparison or condition expression (e.g., `=`, `IsBlank`) used within Filter or LookUp to evaluate rows. |
| Partial delegation | A category for table-shaping functions (AddColumns, etc.) whose arguments can delegate but whose output is record-limit bound. |
| Delegation warning | A yellow triangle and squiggly underline in Power Apps Studio indicating a nondelegable formula. |
| Microsoft Dataverse | A delegation-friendly data source recommended for large datasets requiring broad function support. |
| SharePoint lookup column | A complex column type that cannot be delegated, forcing local processing in Power Apps. |
| Collect / ClearCollect | Functions that cache data locally; they are nondelegable but produce no delegation warning. |

---

## Main Ideas

- Delegation allows Power Apps to send formula processing (Filter, Sort, LookUp) to the data source, returning only matching records rather than transferring the full dataset.
- When delegation is unavailable, Power Apps retrieves only the first **500 records** (default) from the data source and processes the formula locally; up to 2,000 can be configured.
- The **Search** function is not delegable to SharePoint; **Filter** with a simple equality predicate is delegable to SharePoint.
- Delegation support depends on three combined factors: the **data source**, the **function** used, and the **predicate** (condition type).
- Dataverse aggregate functions (`Sum`, `Average`, etc.) are limited to collections of **50,000 records**; use Filter first to reduce the set if needed.
- Some predicates are source-specific: for example, `IsBlank` is not supported as a delegable predicate in Salesforce.
- Complex column types (e.g., SharePoint lookup columns) are never delegable.
- Delegation warnings appear **only in Power Apps Studio** (maker portal); end users receive no warning when partial data is displayed.
- The squiggly underline highlights only the **first** field causing delegation issues, not every field in the formula.
- The data row limit can be **lowered to 1 or 10** to accelerate troubleshooting of nondelegable formulas.
- Notable nondelegable functions: `First`, `FirstN`, `Last`, `LastN`, `Choices`, `Concat`, `Collect`, `ClearCollect`, `CountIf`, `RemoveIf`, `UpdateIf`, `GroupBy`, `Ungroup`.
- Table-shaping functions (`AddColumns`, `DropColumns`, `ShowColumns`, `RenameColumns`) are **partially delegable**: inner arguments can delegate, but the output is still bound by the record limit.
- A common workaround for `AddColumns` + `LookUp` join patterns is to **cache the smaller dataset** using `Collect` on app start (`OnVisible`) to reduce repeated network queries.
- For apps requiring full delegation across large data, consider migrating data into **Microsoft Dataverse** using the Data Integrator tool.

---

## Mini Quiz

### Q1 — Single Choice

A canvas app queries a SharePoint list of 5,000 records using `Filter(SharePointList, Status = "Active")`.

How many records does Power Apps process locally?

- A. 500, because Filter is nondelegable to SharePoint
- B. 5,000, because all records are transferred first
- C. 0, because Filter is delegable to SharePoint and processing happens on the server
- D. 2,000, because that is the maximum row limit

<details>
<summary>Answer</summary>

**Correct answer:** C. 0, because Filter is delegable to SharePoint and processing happens on the server

**Explanation:** The Filter function with a simple equality predicate is delegable to SharePoint. SharePoint processes all 5,000 records and returns only matching rows to Power Apps, so no local processing occurs.

</details>

---

### Q2 — Single Choice

A maker uses `Search(SharePointList, "Rob", "FirstName", "LastName")` against a list of 5,000 items. The data row limit is set to the default.

How many records are searched for "Rob"?

- A. 5,000 — Search delegates to SharePoint
- B. 2,000 — the maximum allowed limit
- C. 500 — the default nondelegation limit retrieved locally
- D. 0 — Search is blocked entirely

<details>
<summary>Answer</summary>

**Correct answer:** C. 500 — the default nondelegation limit retrieved locally

**Explanation:** The Search function is not delegable to SharePoint. Power Apps retrieves only the first 500 records by default and searches them locally, leaving 4,500 records unprocessed.

</details>

---

### Q3 — Fill-in-the-Blank

When a formula cannot be delegated, Power Apps retrieves the first ___ records by default, and this value can be raised to a maximum of ___ in Advanced settings.

<details>
<summary>Answer</summary>

**Answer:** 500 ; 2000

**Explanation:** The default data row limit for nondelegable queries is 500. Makers can adjust this to any value between 1 and 2,000 under App settings > General > Data row limit.

</details>

---

### Q4 — Single Choice

A maker notices that `FirstName` is underlined with a squiggly line in a `Search` formula, but `LastName` is not.

What is the most likely explanation?

- A. LastName is a delegable column type; FirstName is not
- B. The delegation warning only highlights the first field causing the issue, not every field
- C. Power Apps detected that LastName contains no data
- D. The Search function is partially delegable for LastName only

<details>
<summary>Answer</summary>

**Correct answer:** B. The delegation warning only highlights the first field causing the issue, not every field

**Explanation:** Power Apps underlines only the first field that triggers the delegation issue. Both fields may contribute to the problem; the real cause is the nondelegable Search function itself.

</details>

---

### Q5 — Fill-in-the-Blank

The `Collect` and `ClearCollect` functions are ___ delegable, and unlike other nondelegable functions they do ___ produce a delegation warning.

<details>
<summary>Answer</summary>

**Answer:** not ; not

**Explanation:** Collect and ClearCollect are nondelegable functions. Uniquely, they do not display a delegation warning in Power Apps Studio, which can make them easy to overlook during app review.

</details>

---

### Q6 — Single Choice

A maker uses `AddColumns(Products, "Supplier Name", LookUp(Suppliers, Suppliers.ID = Product.SupplierID).Name)`. Both Products and Suppliers are delegable sources.

What is true about the overall formula?

- A. It is fully delegable because both data sources support delegation
- B. The LookUp argument delegates, but the AddColumns output is still bounded by the record limit
- C. AddColumns prevents any delegation, including the inner LookUp
- D. The formula raises a compilation error because AddColumns cannot accept LookUp

<details>
<summary>Answer</summary>

**Correct answer:** B. The LookUp argument delegates, but the AddColumns output is still bounded by the record limit

**Explanation:** AddColumns is a partially delegable table-shaping function. Its inner arguments (like LookUp) can delegate to the data source, but the final output of AddColumns is constrained to the nondelegation record limit.

</details>

---

### Q7 — Fill-in-the-Blank

To avoid repeated network queries when using `LookUp` inside `AddColumns`, a maker can ___ the smaller dataset into a local collection during app initialization using the `OnVisible` property of the opening screen.

<details>
<summary>Answer</summary>

**Answer:** Collect (cache)

**Explanation:** Calling Collect in OnVisible pre-loads the smaller dataset into a local collection. Subsequent LookUp calls against that collection eliminate repeated data source queries and reduce network activity.

</details>

---
