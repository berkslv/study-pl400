# Recall: Imperative Development Techniques in Power Apps Canvas Apps

> **Source files:** 1-imperative-vs-declarative.md, 2-variables.md, 3-global-variables.md, 4-contextual-variables.md, 5-collections.md, 6-additional-variables.md, 7-exercise-variables-collection.md, 8-knowledge-check.md

---

## Keywords

| Term | Definition |
|------|-----------|
| Imperative development | Approach focused on *how* to achieve a goal by defining each step explicitly. |
| Declarative development | Approach focused on *what* result you want, without specifying execution steps. |
| Global variable | App-wide variable created with `Set()`, accessible from any screen in the app. |
| Context variable | Screen-scoped variable created with `UpdateContext()`, only accessible on its originating screen. |
| Collection | A table-type variable for storing structured (multi-row/column) data in memory. |
| `Set()` | Power Apps function that creates or updates a global variable. |
| `UpdateContext()` | Power Apps function that creates or updates one or more context variables simultaneously. |
| `Collect()` | Appends records to a collection; not delegable (retrieves first 500 records by default). |
| `ClearCollect()` | Clears a collection then populates it with new records in a single operation. |
| Delegation | The ability to push query processing to the data source; `Collect()` is not delegable. |
| Dot notation | Syntax (e.g., `varUser.Email`) used to access individual fields of a record stored in a variable. |
| OnStart | App-level property that runs formulas when the app first loads; ideal for initializing global variables. |
| OnVisible | Screen-level property that runs formulas each time a screen opens; used to set screen-level state. |

---

## Main Ideas

- Power Apps supports both imperative logic (step-by-step, push data) and declarative logic (formula-driven, pull data); variables are the primary driver of imperative logic.
- Three variable types exist: **global** (app-wide, `Set()`), **context** (screen-scoped, `UpdateContext()`), and **collections** (tabular, `Collect()`/`ClearCollect()`).
- Variables require no explicit declaration or type annotation; Power Apps infers the type from the assigned value automatically.
- Default values by type: Text = `""`, Number = `0`, Boolean = `false`.
- Variables are **temporary and session-scoped** — all variable data is lost when the user closes the app; write to a data source to persist.
- Set global variables in `OnStart` (e.g., `Set(varUserDisplayName, User().FullName)`) to avoid repeated network calls to Microsoft Entra ID on every screen.
- Context variables with the same name on different screens have **independent values**; this enables safe reuse of UI patterns (e.g., pop-up dialogs) across multiple screens.
- `UpdateContext()` can set multiple context variables in a single call (`UpdateContext({var1: val1, var2: val2})`); `Set()` cannot — chain with `;` instead.
- `Collect()` is **not delegable**: only the first 500 records from a data source are loaded into a collection by default.
- Collections are **not linked** to the data source after creation; changes do not auto-sync back to the source.
- Collections **cannot be used directly** with the Form control, even though they store tabular data.
- Variables can **self-reference** (e.g., `Set(varCounter, varCounter + 1)`) to implement counters or string concatenation.
- A global or context variable can store an **entire record** (e.g., `Set(varUser, User())`); individual fields are retrieved via dot notation.
- Variables do **not auto-update** — the value reflects what was set at the time; manual logic is required to refresh it after data changes.
- When in doubt between global and context, choose **global** — it offers the most flexibility.

---

## Mini Quiz

### Q1 — Single Choice

A developer wants to display the current user's full name on every screen without issuing repeated calls to Microsoft Entra ID.

What is the best approach?

- A. Use `User().FullName` inline in each Label control's `Text` property
- B. Set a global variable in `OnStart` and reference it across all screens
- C. Set a context variable on each screen's `OnVisible` property
- D. Store the user name in a collection on app load

<details>
<summary>Answer</summary>

**Correct answer:** B. Set a global variable in `OnStart` and reference it across all screens

**Explanation:** Setting `Set(varUserDisplayName, User().FullName)` in `OnStart` queries Microsoft Entra ID once; all screens then read the cached variable, eliminating repeated network calls.

</details>

---

### Q2 — Fill-in-the-Blank

The `___` function creates a global variable, while `___` creates a context variable.

<details>
<summary>Answer</summary>

**Answer:** `Set`, `UpdateContext`

**Explanation:** `Set(varName, value)` creates/updates a global variable accessible app-wide; `UpdateContext({varName: value})` creates/updates a variable scoped to the current screen only.

</details>

---

### Q3 — Single Choice

A developer copies a pop-up group with a `varShowPopUp` context variable from Screen1 to Screen2.

What happens to the two instances of `varShowPopUp`?

- A. Both screens share the same value; changing one updates the other
- B. The copy on Screen2 is automatically renamed to avoid conflicts
- C. Each screen maintains an independent value for `varShowPopUp`
- D. The variable on Screen2 is read-only until reassigned with `Set()`

<details>
<summary>Answer</summary>

**Correct answer:** C. Each screen maintains an independent value for `varShowPopUp`

**Explanation:** Context variables are scoped to their screen; even when names match, `varShowPopUp` on Screen1 and `varShowPopUp` on Screen2 hold separate values independently.

</details>

---

### Q4 — Fill-in-the-Blank

By default, `Collect()` retrieves only the first `___` records from a data source because it is not `___`.

<details>
<summary>Answer</summary>

**Answer:** 500, delegable

**Explanation:** `Collect()` processes data locally in Power Apps rather than pushing the query to the data source, making it non-delegable and capping results at 500 records.

</details>

---

### Q5 — Single Choice

A developer stores the full user record with `Set(varUser, User())`.

How should they display the user's email address in a Label?

- A. `varUser["Email"]`
- B. `GetField(varUser, "Email")`
- C. `varUser.Email`
- D. `Email(varUser)`

<details>
<summary>Answer</summary>

**Correct answer:** C. `varUser.Email`

**Explanation:** When a record is stored in a variable, individual fields are accessed using dot notation (`variable.FieldName`). The `User()` record exposes `Email`, `FullName`, and `Image` fields.

</details>

---

### Q6 — Single Choice

A developer sets a variable in `OnStart` to count the total number of customer invoices. A user then creates a new invoice inside the app.

What is the state of the variable after the new invoice is created?

- A. The variable automatically increments by 1
- B. The variable is cleared and must be reset manually
- C. The variable still reflects the count from when `OnStart` last ran
- D. The variable throws a delegation error

<details>
<summary>Answer</summary>

**Correct answer:** C. The variable still reflects the count from when `OnStart` last ran

**Explanation:** Variables do not auto-update; they hold the value assigned at the time of the `Set()` call. Explicit logic must be added to refresh the variable after the data source changes.

</details>

---

### Q7 — Fill-in-the-Blank

A global variable storing a Boolean has a default value of `___`, a text variable defaults to `___`, and a number variable defaults to `___`.

<details>
<summary>Answer</summary>

**Answer:** `false`, `""`, `0`

**Explanation:** Power Apps assigns type-based defaults to uninitialized variables: Boolean → `false`, Text → empty string `""`, Number → `0`.

</details>

---

### Q8 — Single Choice

Which statement correctly describes how Power Apps handles variable typing?

- A. Variables must be declared with an explicit type before use
- B. Power Apps automatically infers the variable type from the assigned value
- C. Variables are always Text unless explicitly cast to another type
- D. Variables must be initialized to zero or empty string before use

<details>
<summary>Answer</summary>

**Correct answer:** B. Power Apps automatically infers the variable type from the assigned value

**Explanation:** Power Apps uses dynamic typing; when you call `Set()` or `UpdateContext()`, it determines the variable's type from the value you assign — no explicit declaration is needed.

</details>

---
