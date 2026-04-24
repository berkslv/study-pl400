# Recall: Client-Side Scripting in Power Apps Model-Driven Apps

> **Source files:** 1-introduction.md, 2-upload-scripts.md, 3-event-handlers.md, 4-context.md, 5-common-tasks.md, 6-exercise.md

---

## Keywords

| Term | Definition |
|------|-----------|
| Client scripting | JavaScript-based customization for model-driven app forms responding to form events. |
| Script web resource | A JavaScript file uploaded to Dataverse, used as a library for client scripting. |
| Event handler | A function registered to execute when a specific form event occurs. |
| Execution context | Object passed to event handlers providing information about the triggering event and form. |
| formContext | Object referencing the form or form item against which current client code executes. |
| `getFormContext()` | Method on execution context that retrieves the current form context object. |
| `formContext.data` | Namespace for accessing and manipulating table row data and attributes on a form. |
| `formContext.ui` | Namespace for manipulating UI components like tabs, sections, and controls on a form. |
| OnLoad event | Form event fired when the form loads; must be registered via form properties, not code. |
| OnChange event | Form event fired when a column value changes; can be registered via code or form properties. |
| Web resource dependency | Configuration that auto-loads dependent web resources when a primary script is loaded. |
| `Xrm.Page` (deprecated) | Legacy global object for form access, replaced by `getFormContext()` from execution context. |
| `addOnChange()` | Method to programmatically register an OnChange event handler on an attribute. |
| `setVisible()` | Method to show or hide a form control, tab, or section. |

---

## Main Ideas

- Client scripting uses JavaScript to implement custom business logic in model-driven app forms when declarative business rules are insufficient.
- Scripts run in response to form events: form load, column data change, form save, tab state change, and command bar button press.
- Scripts must be uploaded as **JavaScript web resources** before use; TypeScript must be transpiled to JavaScript first.
- A script library must be associated with a form only **once per form**, regardless of how many event handlers are registered on it.
- Web resource dependencies load **asynchronously and in parallel** — they do not guarantee load order.
- **OnLoad** is the only event handler that must be registered via form properties configuration (not code); all other handlers can be registered programmatically.
- A common pattern: register OnLoad via form properties, then register all other handlers via code inside the OnLoad handler — this avoids registering handlers separately on every form.
- `Xrm.Page` is deprecated; always use `executionContext.getFormContext()` to retrieve form context.
- Use `formContext.data` to get/set attribute values (one attribute per column); use `formContext.ui` to manipulate controls (multiple controls can map to one attribute).
- `getEventSource()` on the execution context returns the object that triggered the event, enabling generic multi-control handlers.
- Client-side logic only enforces rules in the UI — it must be paired with server-side logic to guarantee enforcement regardless of data access method.
- After updating an existing script web resource, you must **publish** it for changes to take effect in the app.
- Removing a column from a form that a script references will break the script; configure the column as a **dependency** to prevent this.

---

## Mini Quiz

### Q1 — Single Choice

A developer needs to register an event handler that fires whenever the `revenue` column value changes on the Account form.

Which event type should they use?

- A. OnLoad
- B. OnSave
- C. OnChange
- D. OnTabStateChange

<details>
<summary>Answer</summary>

**Correct answer:** C. OnChange

**Explanation:** The OnChange event fires when a column's data is changed. It can be registered via form properties or programmatically using `addOnChange()` on the attribute.

</details>

---

### Q2 — Fill-in-the-Blank

The `Xrm.Page` object is deprecated and should be replaced by calling `___` on the execution context object.

<details>
<summary>Answer</summary>

**Answer:** `getFormContext()`

**Explanation:** The modern approach retrieves the form context via `executionContext.getFormContext()` instead of the global `Xrm.Page` object.

</details>

---

### Q3 — Single Choice

A developer registers two JavaScript web resources as dependencies of a primary script. In what order do the dependent web resources load?

- A. In the order they are listed in the dependency configuration
- B. The primary script loads first, then dependencies load sequentially
- C. All resources load asynchronously and in parallel with no guaranteed order
- D. Dependencies load before the primary script

<details>
<summary>Answer</summary>

**Correct answer:** C. All resources load asynchronously and in parallel with no guaranteed order

**Explanation:** Web resource dependencies do not control load order — all web resources load asynchronously and in parallel. Order-sensitive initialization must be managed in code.

</details>

---

### Q4 — Fill-in-the-Blank

To make a column required using the Client API, call `formContext.getAttribute("fieldname").___("required")`.

<details>
<summary>Answer</summary>

**Answer:** `setRequiredLevel`

**Explanation:** `setRequiredLevel("required")` marks the attribute as required; `setRequiredLevel("none")` makes it optional.

</details>

---

### Q5 — Single Choice

A developer wants a single OnLoad handler registration on a form to also cover registering handlers for multiple other events. What is the recommended approach?

- A. Register all event handlers individually via form properties for each event
- B. Register the OnLoad handler via form properties, then register other handlers programmatically inside the OnLoad function
- C. Register all event handlers using code, including OnLoad
- D. Use `Xrm.Page` to register all handlers at runtime

<details>
<summary>Answer</summary>

**Correct answer:** B. Register the OnLoad handler via form properties, then register other handlers programmatically inside the OnLoad function

**Explanation:** OnLoad must be registered via form properties. Registering remaining handlers in code inside the OnLoad function avoids duplicating registrations across multiple forms and allows dynamic logic to decide which handlers to register.

</details>

---

### Q6 — Single Choice

A script references a column that is displayed on a form. A colleague later removes that column from the form. What is the best way to prevent the script from breaking?

- A. Add a null check in the script for every attribute access
- B. Configure the column as a dependency of the script web resource
- C. Upload a new version of the script that does not use that column
- D. Register an OnSave handler that re-adds the column if it is missing

<details>
<summary>Answer</summary>

**Correct answer:** B. Configure the column as a dependency of the script web resource

**Explanation:** Adding the column as a dependency ensures the column data remains available for the script even if someone removes it from the visible form layout.

</details>

---

### Q7 — Fill-in-the-Blank

To hide a tab named `tab_general` on a form, use: `formContext.ui.tabs.get('tab_general').___(___)`.

<details>
<summary>Answer</summary>

**Answer:** `setVisible(false)`

**Explanation:** `setVisible(false)` hides the tab; `setVisible(true)` shows it. This method is available on tabs, sections, and controls.

</details>

---
