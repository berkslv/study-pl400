# Summary: Imperative Development Techniques in Power Apps Canvas Apps

> **Source files:** 1-imperative-vs-declarative.md, 2-variables.md, 3-global-variables.md, 4-contextual-variables.md, 5-collections.md, 6-additional-variables.md, 7-exercise-variables-collection.md, 8-knowledge-check.md

---

## Imperative vs. Declarative Development

- **Imperative**: Focuses on *how* to achieve a goal — defines each step; more control, more complexity; data is *pushed*.
- **Declarative**: Focuses on *what* result is wanted — simpler and more readable, but less control over execution; data is *pulled*.
- Imperative approach is used in languages like C#; declarative is used in low-code tools like Excel.
- Power Apps supports **both** paradigms; declarative formulas are the default, but imperative logic is enabled through **variables**.
- The key component of imperative logic in Power Apps is **variables**.

---

## Variables Overview

- Three types of variables in Power Apps: **Global**, **Context**, and **Collections**.
- No initialization, declaration, or explicit typing required — Power Apps infers type from the assigned value.
- Variables are **temporary**: scoped to the current user's current session; cleared when the app is closed.
- To persist data across sessions or share between users, write data to a **data source**.
- When in doubt, use a **global variable** — it has the most flexibility.
- **Scope decision rule**: choose variable type based on *where* the value needs to be accessed.

| Type | Created with | Scope | Stores |
|---|---|---|---|
| Global | `Set()` | Entire app | Single value or record |
| Context | `UpdateContext()` | Current screen only | Single value or record |
| Collection | `Collect()` / `ClearCollect()` | Entire app | Table of records |

---

## Global Variables

- Created and set with `Set(variableName, value)`.
- Accessible and updatable from any screen in the app.
- **Performance pattern — user info**: store `User().FullName` once in `OnStart` instead of calling it on every screen.

```powerappsfl
Set(varUserDisplayName, User().FullName)
```

Then reference in Label controls:

```powerappsfl
"Welcome " & varUserDisplayName
```

- **Performance pattern — status tracking**: run a complex query once in `OnVisible` and store the boolean result in a variable; bind multiple controls to that variable instead of repeating the formula.

```powerappsfl
Set(varOustandingExceeded, CountRows(Filter(InvoiceEntity, CustomerNumber =
ThisCustomersNumber And Status = "Outstanding")) > 3)
```

Set `Visible` of icon and button to `varOutstandingExceeded` — no additional formula needed.

- Reduces duplicate network traffic, reduces repeated processing on the app and data source.
- Use variables any time you're repeatedly retrieving information that won't change during a session.
- Global variables enhance performance by storing information to be referenced throughout the app.

---

## Context Variables

- Created with `UpdateContext({variableName: value})`.
- Scoped **only to the screen** where they are created — cannot be referenced on other screens.
- Same variable name can exist independently on multiple screens with different values (useful for reusable screen components, e.g., pop-up dialogs).
- Reusing variable names across screens is only recommended when intentionally reusing the same functionality independently.
- **Multiple context variables** can be declared in a single `UpdateContext` call (not possible with `Set`):

```powerappsfl
UpdateContext({varCount: 1, varActive: true, varName: User().FullName})
```

Equivalent with global variables (semicolon-separated `Set` calls):

```powerappsfl
Set(varCount, 1);Set(varActive, true);Set(varName, User().FullName)
```

- **Pop-up dialog pattern**: set `varShowPopUp` to `true` on button `OnSelect`; bind popup controls' `Visible` property to `varShowPopUp`.

```powerappsfl
UpdateContext({varShowPopUp: true})
```

- **Note**: storing `User()` in a context variable is better than inline use, but still calls the data source each time the page opens. Store user info in a **global variable** set `OnStart` for best performance.

---

## Collections

- Store a **table of data** in memory; available app-wide like global variables.
- Created with `Collect()` (appends) or `ClearCollect()` (clears then populates).
- **Loading from a data source**:

```powerappsfl
Collect(collectProjects, Projects)
```

- **Creating dynamically** (no data source required):

```powerappsfl
Collect(collectColors, {Name: "Shane", FavoriteColor: "Orange"},
{Name: "Mary", FavoriteColor: "Blue"}, {Name: "Oscar", FavoriteColor:
"Yellow"})
```

### Constraints and Limitations

- `Collect` is **not delegable**: only the first **500 records** from the data source are retrieved by default.
- Collections are **not linked** to the data source after creation — changes do not auto-save back; you must explicitly write changes to the data source.
- Collections are **temporary**: cleared when the app is closed; write to a data source before closing if persistence is needed.
- Collections **cannot be used directly with the Form control**, even though they store tabular data.

### Collection Use Cases

- Reduce repeated calls to the same data source (retrieve once, reuse throughout app).
- Populate drop-down controls, combo boxes.
- Stage data before writing it to a data source.
- Standard table functions apply: `Filter`, `Sort`, `CountRows`.
- Remove a record: `Remove(collectionName, ThisItem)`.

---

## Advanced Variable Concepts

### Self-Referencing Variables (Counter Pattern)

- Variables can reference themselves in formulas — applies to both global and context variables.

```powerappsfl
Set(varCounter, varCounter + 1)
```

| varCounter before | Button press | Formula result | varCounter after |
|---|---|---|---|
| 0 | 1st | 0 + 1 | 1 |
| 1 | 2nd | 1 + 1 | 2 |
| 2 | 3rd | 2 + 1 | 3 |

- **Default values when not explicitly initialized**:
  - Text variables: `""`
  - Number variables: `0`
  - Boolean variables: `false`

### Storing Records in Variables

- A global or context variable can store an **entire record**, not just a scalar value.
- Access individual fields via **dot (`.`) notation**:

```powerappsfl
Set(varUser, User())
```

```powerappsfl
varUser.Email
```

- User record fields: `Email`, `FullName`, `Image`.
- Use `LookUp` to retrieve and store a record from a tabular data source (e.g., Dataverse):

```powerappsfl
Set(varRecord, LookUp(TableName, ID = someID))
```

### Variables Do Not Auto-Update

- Variables only hold the value assigned at the time of the `Set` or `UpdateContext` call.
- They do **not** automatically reflect subsequent changes in the data source.
- To reflect new data, either: (a) the user closes and reopens the app (triggers `OnStart`), or (b) implement explicit logic to update the variable after the data changes.

---

## Exercise: Variables and Collections — Key Steps

1. Sign into Power Apps maker portal (`make.powerapps.com`), create a **Blank canvas app** (Tablet format).
2. Set `App.OnStart` to create a collection and a global variable:

```powerappsfl
ClearCollect(colCustomer,
{CustomerNumber: 7470, InvoiceNumber: "INV70817"},
{CustomerNumber: 4259, InvoiceNumber: "INV29595"},
{CustomerNumber: 8251, InvoiceNumber: "INV74302"},
{CustomerNumber: 2338, InvoiceNumber: "INV35115"},
{CustomerNumber: 1524, InvoiceNumber: "INV82337"},
{CustomerNumber: 1530, InvoiceNumber: "INV82338"}
);
Set(varUserDisplayName, User().FullName)
```

3. Run `OnStart` via the App object's ellipsis menu to populate the collection.
4. Add a **Vertical Gallery**, set `Items` to `colCustomer`; configure Layout as *Title and subtitle*.
5. Inside the gallery, add a **Trash icon**; initially set its `OnSelect` to `Remove(colCustomer, ThisItem)`.
6. Replace the `OnSelect` with a contextual variable to trigger a confirmation popup:

```powerappsfl
UpdateContext({varPopup: true})
```

7. Build the popup UI: two rectangles (background + foreground), a label, a Delete button, and a Cancel button.
8. Label `Text` formula:

```powerappsfl
varUserDisplayName & "
Please click Delete to confirm deletion of Invoice#" & " " & Gallery1.Selected.InvoiceNumber
```

9. Delete button `OnSelect`:

```powerappsfl
Remove(colCustomer, LookUp(colCustomer, CustomerNumber = Gallery1.Selected.CustomerNumber));
UpdateContext({varPopup: false})
```

10. Cancel button `OnSelect`: `UpdateContext({varPopup: false})`
11. Group all popup controls; set `Group1.Visible` to `varPopup`.

---

## References

- [Author a basic formula that uses tables and records in a Power Apps canvas app](https://learn.microsoft.com/en-us/training/modules/author-basic-formula-tables-records-powerapps/)
- [Work with data in a Power Apps canvas app (learning path)](https://learn.microsoft.com/en-us/training/paths/work-with-data-in-a-canvas-app/)
- [Work with data source limits (delegation limits) in a Power Apps canvas app](https://learn.microsoft.com/en-us/training/modules/work-with-data-source-limits-powerapps-canvas-app/)
