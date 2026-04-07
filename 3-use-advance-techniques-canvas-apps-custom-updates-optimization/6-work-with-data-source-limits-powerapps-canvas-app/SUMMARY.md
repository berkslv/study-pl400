# Summary: Working with Data Source Limits in Power Apps Canvas Apps

> **Source files:** 1-delegation-overview.md, 2-functions-predicates-data-source.md, 3-delegation-warnings-limits-functions.md

---

## Delegation Overview

- **Delegation** allows Power Apps to offload data processing (filtering, searching, sorting) to the data source instead of pulling all records locally.
- When a function is delegable, the data source processes the formula across all records and returns only matching results — no data movement overhead.
- When a function is **not** delegable, Power Apps retrieves only the first **500 records** (default) from the data source and processes the formula locally — remaining records are ignored.
- The default non-delegation limit can be raised to a maximum of **2,000 records** in Advanced settings.
- If large data volumes require non-delegable operations, consider migrating data to **Microsoft Dataverse** (delegation-friendly) using the **Data Integrator** tool.

### Delegation Example (Delegable — SharePoint + Filter)

```powerappsfl
Filter(SharePointList, ProjectStatus = "Active")
```

- `Filter` is delegable to SharePoint → SharePoint processes all 5,000 records and returns 2,500 matching records to Power Apps.

### Non-Delegation Example (Non-Delegable — SharePoint + Search)

```powerappsfl
Search(SharePointList, "Rob", "FirstName", "LastName")
```

- `Search` is **not** delegable to SharePoint → Power Apps retrieves only the first 500 records from SharePoint and searches locally; remaining records are not processed.

---

## Factors That Determine Delegation

- Delegation depends on **three combined factors**: the function used, the predicate used, and the data source.
- Each data source has its own set of delegable and non-delegable functions — always verify against the specific data source documentation before building.

### Dataverse-Specific Notes

- Numbers with arithmetic expressions (e.g., `Filter(table, field + 10 > 100)`) are **not** delegable.
- `Language` and `TimeZone` are **not** delegable.
- `Trim[Ends]` and `Len` are **not** supported; `Left`, `Mid`, `Right`, `Upper`, `Lower`, `Replace`, `Substitute` are supported.
- `DateTime` is delegable **except** `Now()` and `Today()`.
- Blank comparisons are supported: e.g., `Filter(TableName, MyCol = Blank())`.
- Aggregate functions are limited to **50,000 records**; use `Filter` first to reduce the set if needed.

### Predicates

- `Filter` and `LookUp` require a **predicate** (the evaluation expression, e.g., `=`, `IsBlank`).
- Not all data sources support all predicates.

```powerappsfl
// Delegable to Salesforce
Filter(SalesforceCustomers, Name = "Contoso")

// NOT delegable to Salesforce — IsBlank predicate unsupported
Filter(SalesforceCustomers, IsBlank(Name))
```

### Column Types

- **Complex columns** (e.g., SharePoint lookup columns) are **not** delegable — Power Apps processes them locally only.

---

## Delegation Warnings

- Power Apps displays a **squiggly underline** and **yellow warning triangle** on any non-delegable formula in the Maker portal.
- The warning appears regardless of data source size (even small data sources trigger it).
- Only the **first field** causing delegation failure is underlined — if multiple fields cause the issue, only the first is marked. To troubleshoot, rearrange the formula to verify which element is the true cause.
- Delegation warnings are **only visible in the Maker portal** — end users running the app receive no notification that partial data may be shown.

---

## Adjusting the Non-Delegation Record Limit

Default: **500 records**. Adjustable range: **1 to 2,000**.

1. In the Maker portal, select **Settings** from the top menu (or click the three ellipses if Settings isn't visible).
2. Under **App settings**, stay on the **General** tab and scroll to **Data row limit**.
3. Set the value between **1** and **2,000**.
4. Select **Close** (lower right) to save and return to the Maker portal.

**Use cases for adjusting the limit:**
- **Increase**: When your data never exceeds a known bound under 2,000 (e.g., a customer list capped at 1,000 — set limit to 1,000 and bypass delegation concerns).
- **Decrease**: Set to 1 or 10 during testing to quickly verify whether a non-delegable function is causing issues (if only 1 record appears in a gallery, a non-delegable function is present).

---

## Non-Delegable Functions

These functions are **never** delegable — adding them to a formula can make a previously delegable formula non-delegable:

- `First`, `FirstN`, `Last`, `LastN`
- `Choices`
- `Concat`
- `Collect`, `ClearCollect` *(no delegation warning shown, but still not delegable)*
- `CountIf`, `RemoveIf`, `UpdateIf`
- `GroupBy`, `Ungroup`

---

## Partially Delegable Functions (Table Shaping)

These functions can delegate their **arguments**, but their **output** is still subject to the non-delegation record limit:

- `AddColumns`
- `DropColumns`
- `ShowColumns`
- `RenameColumns`

### Join Pattern with AddColumns + LookUp

```powerappsfl
AddColumns( Products, "Supplier Name", LookUp( Suppliers, Suppliers.ID = Product.SupplierID ).Name )
```

- `LookUp` is delegable and can search across a large `Suppliers` dataset, but `AddColumns` constrains the result to the initial record segment of `Products`.
- `LookUp` issues a **separate query per record** in `Products` — increases network activity.
- **Optimization**: If `Suppliers` is small and stable, cache it at app start using `Collect` in `OnVisible`, then perform `LookUp` against the local collection to reduce network calls.

---

## References

- [Dataverse connector and delegable functions](https://learn.microsoft.com/en-us/connectors/commondataserviceforapps/)
