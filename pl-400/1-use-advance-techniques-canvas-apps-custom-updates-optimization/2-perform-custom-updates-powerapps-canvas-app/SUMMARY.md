# Summary: Perform Custom Updates in a Power Apps Canvas App

> **Source files:** README.md, 1-more-than-forms.md, 2-patch-function.md, 3-deleting-records.md, 4a-exercise-patch.md, 5-summary.md

---

## When to Use Direct Data Functions Instead of Forms

- Use direct data functions (Patch, Remove, etc.) when Form controls are insufficient or not suitable for the app design.
- Common scenarios: logging user actions without user interaction, bulk background updates, gallery-based delete buttons.
- Target data sources can be **tabular data sources** (Dataverse, SharePoint) or **collections** — all functions described here work on both unless stated otherwise.

---

## Patch Function — Creating and Editing Records

### Syntax Overview

- `Patch(DataSource, BaseRecord, ChangeRecord)` — the three parts are: data source name, record to create/update, columns and values to write.

### Create a New Record

- Use `Defaults(DataSource)` as the second argument to signal that a new record should be created.
- `Defaults` returns a record with all default column values; columns without defaults are absent.
- Do **not** specify the primary key (ID) — the data source assigns it automatically.

```powerappsfl
Patch(CustomerOrders, Defaults(CustomerOrders), {Region: "Americas", Country: "Canada"})
```

### Edit an Existing Record

- Use `LookUp(DataSource, condition)` as the second argument to identify the record to edit.
- Alternatively, use `ThisItem` inside a Gallery to reference the currently displayed record.
- Only specified columns are changed; unspecified columns retain their existing values.

```powerappsfl
Patch(CustomerOrders, LookUp(CustomerOrders, ID = 1), {Region: "Asia", Country: "China"})
```

### Value Sources for Patch Columns

- **Hardcoded value** — a literal string or number:

```powerappsfl
Patch(CustomerOrders, Default(CustomerOrders), {Status: "Pending"})
```

- **Variable reference** — a `Set` variable:

```powerappsfl
Set(varStatus, "Under Review")
Patch(CustomerOrders, Default(CustomerOrders), {Status: varStatus})
```

- **Control property reference** — reads from a UI control:

```powerappsfl
Patch(CustomerOrders, Default(CustomerOrders), {Status: Dropdown1.Selected.Value})
```

- **Formula output** — result of a function call:

```powerappsfl
Patch(CustomerOrders, Default(CustomerOrders), {Owner: User().FullName})
```

### Patch Troubleshooting Rules

- All **required** columns in the data source must be included.
- Optional columns can be included or omitted freely.
- Column names are **case-sensitive** and must be spelled exactly as defined.
- Values must match the **data type** of the target column (e.g., a number column cannot receive a string value).

### Practical Example — Class Sign-In

Data source `TrainingClassSignIn` has columns: `TrainingClass`, `FirstName`, `LastName`, `EmailAddress`, `SignInStatus`.

```powerappsfl
Patch(TrainingClassSignIn, Defaults(TrainingClassSignIn), {
    TrainingClass: TrainingClassDD.Selected.Value,
    FirstName: FirstNameInput.Text,
    LastName: LastNameInput.Text,
    EmailAddress: EmailAddressInput.Text,
    SignInStatus: "Attended"
})
```

### Logging Navigation Example

```powerappsfl
Patch(LoggingTable, Defaults(LoggingTable), {WhoClicked: User().FullName, WhenClicked: Now()});
Navigate(NextScreen, ScreenTransition.Cover)
```

---

## Delete Functions — Removing Records

### Remove — Delete a Single Record

- Deletes one specified record from a data source or collection.
- Specify the record via `LookUp` or `ThisItem` (in a Gallery context).
- **No confirmation prompt** — deletion is immediate with no undo or recycle bin.

```powerappsfl
Remove(CustomerOrders, LookUp(CustomerOrders, ID = 1))
```

```powerappsfl
Remove(CustomerOrders, ThisItem)
```

- If confirmation is needed, implement a pop-up dialogue with confirm/cancel buttons before calling Remove.

### RemoveIf — Delete Records Matching a Condition

- Deletes all records where the condition evaluates to `true` — same logic as the `Filter` function.

```powerappsfl
RemoveIf(CustomerOrders, Status = "Expired")
```

- To delete **all** records from a data source, pass `true` as the condition:

```powerappsfl
RemoveIf(CustomerOrders, true)
```

> **Warning:** Deleting all records from a data source is irreversible in Power Apps. Recovery must be performed directly on the data source outside of Power Apps.

### Clear — Delete All Records from a Collection

- Removes all records from a collection but **preserves the collection's column structure**.
- Only applicable to **collections**, not tabular data sources.

```powerappsfl
Clear(collectSelectedItems)
```

### ClearCollect — Clear Then Repopulate a Collection

- Combines `Clear` and `Collect` into a single atomic operation: removes all existing records and immediately adds a new set.
- Use **ClearCollect** when the clear and reload happen together (e.g., refreshing a dropdown source on screen load).
- Use separate **Clear** + **Collect** when the clear and reload happen at different times (e.g., a reset button in a shopping cart where no new items are added immediately).

---

## Bulk Changes Across Multiple Records

- **ForAll** — loops through a table and executes `Patch` or `Remove` for each record.
- **Collect** — writes all records from a source table into a target table, adding each as a new record.

---

## Exercise — Using Patch with a Gallery

1. Sign in to [Power Apps](https://make.powerapps.com/).
2. Create a new **Blank canvas app** named "Patch Exercise."
3. Insert a **Button** control. Set its **Text** to "Collect" and its **OnSelect** to:

    ```powerappsfl
    ClearCollect(CityPopulations,
        {City:"London", Country:"United Kingdom", Population:8615000},
        {City:"Berlin", Country:"Germany", Population:3562000},
        {City:"Madrid", Country:"Spain", Population:3165000},
        {City:"Rome", Country:"Italy", Population:2874000},
        {City:"Paris", Country:"France", Population:2273000},
        {City:"Hamburg", Country:"Germany", Population:1760000},
        {City:"Barcelona", Country:"Spain", Population:1602000},
        {City:"Munich", Country:"Germany", Population:1494000},
        {City:"Milan", Country:"Italy", Population:1344000})
    ```

4. Hold **Alt** and click the button to create the `CityPopulations` collection.
5. Insert a **Vertical Gallery**, set the data source to `CityPopulations`, and configure layout to **Title, subtitle, and body** with **Population** mapped to the Body field.
6. Insert three **Text input** controls; rename them `tiCountry`, `tiCity`, and `tiPopulation`.
7. Insert a second **Button**, set **Text** to "Patch Country" and **OnSelect** to:

    ```powerappsfl
    Patch(CityPopulations, Defaults(CityPopulations), {
        Country: tiCountry.Text,
        City: tiCity.Text,
        Population: Value(tiPopulation.Text)
    })
    ```

    > Note: Use `Value()` to convert the text input string to a number for the Population column.

8. Enter **Preview** mode, fill in the text inputs, and click **Patch Country** to see the new record appear at the bottom of the gallery.
9. The **Copilot** icon in the formula bar can explain any formula; explanations can be added as code comments using `//`.

---

## References

- [Patch function in Power Apps](https://learn.microsoft.com/en-us/power-apps/maker/canvas-apps/functions/function-patch/)
- [Perform custom updates in a Power Apps canvas app (module)](https://learn.microsoft.com/en-us/training/modules/perform-custom-updates-powerapps-canvas-app/)
