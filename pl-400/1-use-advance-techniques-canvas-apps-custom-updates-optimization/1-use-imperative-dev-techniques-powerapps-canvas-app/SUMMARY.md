# Summary: Imperative Development Techniques in Power Apps Canvas Apps

> **Source files:** 1-imperative-vs-declarative.md, 2-variables.md, 3-global-variables.md, 4-contextual-variables.md, 5-collections.md, 6-additional-variables.md, 6a-exercise-variables-collection.md

---

## Imperative vs. Declarative Development

- **Imperative**: Focuses on *how* to achieve a goal — defines each step of the process; more control, more complexity; used in languages like C#; pushes data.
- **Declarative**: Focuses on *what* result you want — simpler and easier to read, less control over execution; used in low-code tools like Excel; pulls data.
- Power Apps supports **both** paradigms; the key driver of imperative logic in Power Apps is **variables**.

---

## Variable Types Overview

- **Global variables** — created/set with `Set()`; accessible anywhere in the app.
- **Context variables** — created/set with `UpdateContext()`; scoped to the screen where they are created.
- **Collections** — store a table of data; created with `Collect()` or `ClearCollect()`; accessible app-wide like global variables.
- Variables do **not** need to be initialized, declared, or typed — Power Apps infers the type automatically from the assigned value.
- Variables are **temporary**: they exist only for the current user's current session. Closing the app destroys all variable data.
- If data must persist across sessions or be shared between users, it must be written to a data source.
- Default values when a variable is never explicitly set:
  - Text → `""`
  - Number → `0`
  - Boolean → `false`

---

## Global Variables

- Created and set with the `Set()` function; readable and writable from any screen in the app.
- Common use: store user identity once on app load, then reference throughout without repeated network calls.

```powerfx
// Set once in App.OnStart
Set(varUserDisplayName, User().FullName)

// Reference in a Label
"Welcome " & varUserDisplayName
```

- Store a Boolean status result once to avoid duplicated queries and network traffic:

```powerfx
// In Screen.OnVisible
Set(varOutstandingExceeded,
    CountRows(Filter(InvoiceEntity,
        CustomerNumber = ThisCustomersNumber
        And Status = "Outstanding")) > 3)

// Set Visible property of icon/button to:
varOutstandingExceeded
```

- Store a full record in a global variable; access individual fields via dot (`.`) notation:

```powerfx
Set(varUser, User())
// Access fields:
varUser.Email
varUser.FullName
varUser.Image
```

- Use `LookUp()` to retrieve and store a record from a tabular data source (e.g., Dataverse) in a variable.
- Multiple global variables must be set with separate `Set()` calls chained with `;`:

```powerfx
Set(varCount, 1);Set(varActive, true);Set(varName, User().FullName)
```

---

## Context Variables

- Created/set with `UpdateContext()`; **scoped to the screen** where they are defined.
- Same variable name on different screens holds independent values — safe to copy screen controls across screens.
- Reusing variable names across screens is generally **not recommended** (can be confusing), but acceptable for intentional screen-level isolation.
- Multiple context variables can be set in a **single** `UpdateContext()` call using a comma-separated record:

```powerfx
UpdateContext({varCount: 1, varActive: true, varName: User().FullName})
```

- Classic use case — show/hide a pop-up dialog:

```powerfx
// Trash icon OnSelect (open popup)
UpdateContext({varPopup: true})

// Cancel button OnSelect (close popup)
UpdateContext({varPopup: false})

// Group/popup Visible property
varPopup
```

> **Note:** Storing `User()` in a context variable is better than using `User()` inline, but calling `User()` every time a screen opens is still less performant than a single global variable set in `App.OnStart`. Use a global variable for user info.

---

## Collections

- Store a **table of data** (rows and columns) in memory; available app-wide.
- `Collect()` adds records to an existing collection; `ClearCollect()` clears it first then adds.
- Load an existing data source table into a collection:

```powerfx
Collect(collectProjects, Projects)
```

- Create a collection from inline records:

```powerfx
Collect(collectColors,
    {Name: "Shane", FavoriteColor: "Orange"},
    {Name: "Mary",  FavoriteColor: "Blue"},
    {Name: "Oscar", FavoriteColor: "Yellow"})
```

- Key constraints:
  - `Collect()` is **not delegable** — by default only the first **500 records** are retrieved from a data source.
  - Collections are **not linked** to the data source after creation; changes to collection data do not automatically save back.
  - Collections are **temporary** — destroyed when the app is closed; write data to a data source to persist it.
  - Collections **cannot** be used directly with the **Form** control.
- After creation, standard table functions (`Filter`, `Sort`, `CountRows`, `LookUp`, `Remove`) work on collections.
- Remove a record from a collection:

```powerfx
Remove(colCustomer, ThisItem)
// or with LookUp:
Remove(colCustomer, LookUp(colCustomer, CustomerNumber = Gallery1.Selected.CustomerNumber))
```

---

## Additional Variable Concepts

### Self-Referencing Variables (Counters / String Appending)

- A variable can reference itself in the formula used to set it:

```powerfx
// Counter button OnSelect
Set(varCounter, varCounter + 1)
```

| varCounter before | Button press | Formula result | varCounter after |
|---|---|---|---|
| 0 | 1st | 0 + 1 | 1 |
| 1 | 2nd | 1 + 1 | 2 |
| 2 | 3rd | 2 + 1 | 3 |

### Variables Do Not Auto-Update

- A variable stores a snapshot of the value at the time it was set.
- It will **not** automatically reflect changes to the underlying data source.
- The variable updates only when:
  1. The app is closed and reopened (triggering `OnStart`).
  2. Explicit logic is implemented to refresh the variable (e.g., after writing a new record).

---

## Exercise: Variables and Collections — Key Steps

1. Set `App.OnStart` to create a collection and a global variable:

```powerfx
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

2. Run `OnStart` manually via the App object ellipsis menu → **Run OnStart**.
3. Bind a Vertical Gallery `Items` property to `colCustomer`.
4. Trash icon `OnSelect` → `UpdateContext({varPopup: true})`.
5. Popup confirmation label `Text`:

```powerfx
varUserDisplayName & "
Please click Delete to confirm deletion of Invoice#" & " " & Gallery1.Selected.InvoiceNumber
```

6. Delete button `OnSelect`:

```powerfx
Remove(colCustomer, LookUp(colCustomer, CustomerNumber = Gallery1.Selected.CustomerNumber));
UpdateContext({varPopup: false})
```

7. Cancel button `OnSelect` → `UpdateContext({varPopup: false})`.
8. Group all popup controls; set **Group Visible** to `varPopup`.

---

## References

- [Author a basic formula that uses tables and records in a Power Apps canvas app](https://learn.microsoft.com/en-us/training/modules/author-basic-formula-tables-records-powerapps/)
- [Use imperative development techniques for canvas apps in Power Apps](https://learn.microsoft.com/en-us/training/modules/use-imperative-dev-techniques-powerapps-canvas-app/)
- [Work with data in a Power Apps canvas app (learning path)](https://learn.microsoft.com/en-us/training/paths/work-with-data-in-a-canvas-app/)
- [Work with data source limits (delegation limits) in a Power Apps canvas app](https://learn.microsoft.com/en-us/training/modules/work-with-data-source-limits-powerapps-canvas-app/)
