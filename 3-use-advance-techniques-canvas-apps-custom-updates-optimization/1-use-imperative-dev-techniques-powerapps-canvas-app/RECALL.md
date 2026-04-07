# Recall: Imperative Development Techniques for Canvas Apps in Power Apps

> **Source files:** 1-imperative-vs-declarative.md, 2-variables.md, 3-global-variables.md, 4-contextual-variables.md, 5-collections.md, 6-additional-variables.md, 6a-exercise-variables-collection.md

---

## Keywords

| Term | Definition |
|------|-----------|
| Imperative development | Approach that defines each step of a process; focuses on *how* to achieve a goal. |
| Declarative development | Approach that focuses on *what* result is desired, as seen in Excel and Power Fx formulas. |
| Global variable | App-wide variable created with `Set()`; accessible and updatable from any screen. |
| Context variable | Screen-scoped variable created with `UpdateContext()`; isolated to the screen where it is defined. |
| Collection | Variable type that stores a table of records in memory; created with `Collect()` or `ClearCollect()`. |
| `Set()` | Power Apps function used to create or update a global variable. |
| `UpdateContext()` | Power Apps function used to create or update one or more context variables on the current screen. |
| `Collect()` | Function that adds records to a collection without clearing existing data. |
| `ClearCollect()` | Function that clears a collection and then populates it with new data. |
| Delegation | Concept limiting `Collect()` to retrieve only the first 500 records from a data source by default. |
| Dot notation | Syntax (`varRecord.FieldName`) used to access individual fields of a record stored in a variable. |
| `OnStart` | App-level property used to initialize global variables and collections when the app loads. |
| `OnVisible` | Screen-level property used to set variables when a screen opens. |

---

## Main Ideas

- Power Apps supports both **imperative** (variable-driven, step-by-step) and **declarative** (formula-driven) logic; the key enabler of imperative logic is variables.
- There are three variable types: **global** (app-wide, `Set()`), **context** (screen-scoped, `UpdateContext()`), and **collections** (table of records, `Collect()`/`ClearCollect()`).
- Variables do **not** need to be declared, initialized, or typed — Power Apps infers the type from the assigned value automatically.
- Variables are **temporary** and **user-session-scoped**: all variable data is lost when the app is closed. Persistent data must be written to a data source.
- Default values when a variable is never set: text = `""`, number = `0`, boolean = `false`.
- Use global variables on `OnStart` to cache expensive or repeated lookups (e.g., `User().FullName`) and reference the variable throughout the app instead of re-querying.
- Use context variables for screen-local UI state such as pop-up dialogs; copying controls to another screen creates an independent instance of the same variable name.
- `UpdateContext()` can declare **multiple** context variables in one call using a record literal; `Set()` cannot — multiple global variables require chained `Set()` calls separated by semicolons.
- Collections are **not linked** to their source after creation; changes to a collection do not automatically persist to the data source.
- `Collect()` is **not delegable**; only the first 500 records are retrieved from a data source by default.
- Collections **cannot** be used directly with the Form control, even though they store tabular data.
- Variables can **self-reference** (e.g., `Set(varCounter, varCounter + 1)`) to build counters or append strings.
- A variable can store an **entire record**; individual fields are accessed with dot notation (e.g., `varUser.Email`).
- Variables do **not auto-update**: a variable set on `OnStart` will not reflect data changes made during the session unless code explicitly updates it.

---

## Mini Quiz

### Q1 — Single Choice

An app queries `User().FullName` inside a Label on every screen, causing slow performance.

What is the recommended fix?

- A. Replace `User().FullName` with a hard-coded string.
- B. Store `User().FullName` in a global variable on `OnStart` and reference that variable in each Label.
- C. Store `User().FullName` in a context variable on each screen's `OnVisible`.
- D. Use a collection to cache the user record on each screen.

<details>
<summary>Answer</summary>

**Correct answer:** B. Store `User().FullName` in a global variable on `OnStart` and reference that variable in each Label.

**Explanation:** Setting a global variable once on `OnStart` avoids repeated calls to Microsoft Entra ID on every screen navigation, reducing network traffic and improving app performance.

</details>

---

### Q2 — Single Choice

A developer copies a delete-confirmation pop-up (which uses `varShowPopUp`) from Screen1 to Screen2.

What happens to the value of `varShowPopUp` on Screen2 when it is set to `true`?

- A. It also sets `varShowPopUp` to `true` on Screen1.
- B. It has no effect because context variables cannot be set by copying controls.
- C. It sets `varShowPopUp` to `true` only on Screen2, independently of Screen1's value.
- D. It converts `varShowPopUp` into a global variable automatically.

<details>
<summary>Answer</summary>

**Correct answer:** C. It sets `varShowPopUp` to `true` only on Screen2, independently of Screen1's value.

**Explanation:** Context variables are screen-scoped. Two screens can share the same variable name but each maintains its own independent value.

</details>

---

### Q3 — Fill-in-the-Blank

To create a global variable named `varCount` and set it to `0`, you use the formula `___(varCount, 0)`. To create a context variable with the same name, you use `___({varCount: 0})`.

<details>
<summary>Answer</summary>

**Answer:** `Set` / `UpdateContext`

**Explanation:** `Set()` creates or updates global variables; `UpdateContext()` creates or updates context variables using a record literal syntax.

</details>

---

### Q4 — Single Choice

A canvas app loads 600 records from Dataverse into a collection using `Collect(collectData, DataverseTable)`.

How many records will the collection contain?

- A. 600 — all records are retrieved.
- B. 2,000 — the default Power Apps data row limit.
- C. 500 — because `Collect()` is not delegable and retrieves only the first 500 records by default.
- D. 0 — `Collect()` cannot be used with Dataverse.

<details>
<summary>Answer</summary>

**Correct answer:** C. 500 — because `Collect()` is not delegable and retrieves only the first 500 records by default.

**Explanation:** The `Collect()` function is non-delegable, so only the first 500 records from the data source are retrieved and stored in the collection.

</details>

---

### Q5 — Fill-in-the-Blank

A variable storing a full user record with `Set(varUser, User())` can have its email accessed using the expression `___.___`.

<details>
<summary>Answer</summary>

**Answer:** `varUser.Email`

**Explanation:** When a record is stored in a variable, individual fields are accessed using dot notation in the format `variableName.FieldName`.

</details>

---

### Q6 — Single Choice

A developer sets a variable tracking invoice count on `OnStart`. During the session, the user creates a new invoice. The developer notices the variable still shows the old count.

What explains this behavior?

- A. Global variables are read-only after they are set.
- B. Variables do not automatically update; the variable only refreshes when `OnStart` runs again or when code explicitly updates it.
- C. The variable was set as a context variable, so it is isolated to the home screen.
- D. `Set()` only stores Boolean and text values, not numbers.

<details>
<summary>Answer</summary>

**Correct answer:** B. Variables do not automatically update; the variable only refreshes when `OnStart` runs again or when code explicitly updates it.

**Explanation:** Variables in Power Apps are static after they are set. They do not react to changes in the underlying data source unless an explicit `Set()` or `UpdateContext()` call is made to refresh them.

</details>

---

### Q7 — Fill-in-the-Blank

To clear a collection and repopulate it in a single step, use the `___` function instead of `Collect()`.

<details>
<summary>Answer</summary>

**Answer:** `ClearCollect`

**Explanation:** `ClearCollect()` removes all existing records from the collection before adding the new data, preventing duplicate entries from accumulating.

</details>

---
