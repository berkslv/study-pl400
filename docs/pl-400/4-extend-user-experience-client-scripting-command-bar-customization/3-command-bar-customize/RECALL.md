# Recall: Customize Command Bars in Model-Driven Apps

> **Source files:** 1-introduction.md, 2-create-edit.md, 3-work-classic.md, 4-power-fx.md, 5-exercise.md

---

## Keywords

| Term | Definition |
|------|-----------|
| Command bar | A visual collection of command buttons displayed in a pre-determined location in a model-driven app. |
| Modern command | A command created with the visual command bar designer that supports Power Fx and low-code customization. |
| Classic command | An out-of-the-box command using legacy infrastructure that cannot be customized with the visual designer. |
| Command bar designer | A visual tool in the app designer used to add and modify modern commands on a command bar. |
| OnSelect | A Power Fx property that defines logic executed when a command button is selected by a user. |
| Visible | A Power Fx property that evaluates a formula to determine whether a command is shown or hidden. |
| `Self.Selected` | A Power Fx property giving access to currently active data (item, all items, state, unsaved status). |
| Dropdown | A command grouping element that reveals a flyout menu of commands when selected. |
| Split button | A command grouping element with a primary action button and an expandable group of additional commands. |
| `Patch` | A Power Fx function used to create or update records in a Dataverse table. |
| `RecordInfo` | A Power Fx function used to check user permissions on a record (e.g., edit access). |

---

## Main Ideas

- Command bars appear in four key locations: **Main Grid**, **Main Form**, **Subgrid View**, and **Associated View**.
- Commands can be organized using **Dropdown**, **Split button**, and **Group** elements.
- The command bar designer is launched from the model-driven app designer via **Edit command bar**.
- Only **modern commands** are editable in the visual designer; **classic commands** require ribbon/XML customization techniques.
- Classic commands can be **hidden** or **removed and recreated** as modern commands to enable Power Fx logic.
- Command actions are implemented with either **Power Fx** (Run formula) or **JavaScript**.
- Power Fx command logic uses a **subset** of the full Power Fx language; not all functions are supported.
- When a command is selected, **pending form changes are saved first**, then the OnSelect logic executes.
- The `Visible` formula is **reevaluated automatically** whenever its dependent values change.
- `Self.Selected.Item` is available only when a **single row** is selected or displayed on a form.
- `Self.Selected.AllItems` returns **all selected rows** from the data source.
- `Self.Selected.State` returns an enum: **Edit (0)**, **New (1)**, or **View (2)**.
- Microsoft Dataverse is currently the **only supported data source** for command Power Fx logic.
- After configuring a command, select **Save and publish** to apply changes.

---

## Mini Quiz

### Q1 — Single Choice

A maker needs to customize a command that appears on the main grid of a model-driven app. In the command bar designer, the command cannot be edited.

What type of command is this, and what should the maker do?

- A. A modern command; re-open the designer in a different browser.
- B. A classic command; use ribbon/XML customization techniques or hide and recreate it as a modern command.
- C. A modern command; delete and reimport the solution.
- D. A classic command; upgrade the environment to enable visual editing.

<details>
<summary>Answer</summary>

**Correct answer:** B. A classic command; use ribbon/XML customization techniques or hide and recreate it as a modern command.

**Explanation:** Classic commands use legacy infrastructure not supported by the visual designer. Makers should either use ribbon customization techniques or hide the classic command and recreate it as a modern command.

</details>

---

### Q2 — Fill-in-the-Blank

When a user selects a command button, any pending changes on the form are ___ first, and then the command's ___ logic is executed.

<details>
<summary>Answer</summary>

**Answer:** saved; OnSelect

**Explanation:** Power Fx command execution always saves pending form changes before running the OnSelect formula, ensuring a consistent data state.

</details>

---

### Q3 — Single Choice

A developer sets the following Power Fx formula for a command's Visible property:

```powerfx
If(Self.Selected.Item.'Status Reason' = 'Status Reason (Help Requests)'.Active, true, false)
```

When will the command be visible?

- A. Always, because the default is `true`.
- B. Only when the Status Reason of the selected row is Active.
- C. Only when multiple rows are selected.
- D. Only when the form is in Edit (0) state.

<details>
<summary>Answer</summary>

**Correct answer:** B. Only when the Status Reason of the selected row is Active.

**Explanation:** The formula evaluates the Status Reason column of the currently selected item and returns `true` only when it equals Active, hiding the button for any other status.

</details>

---

### Q4 — Fill-in-the-Blank

`Self.Selected.AllItems` returns a ___ of records, while `Self.Selected.Item` returns a single ___ and is only populated when one row is selected.

<details>
<summary>Answer</summary>

**Answer:** table; record

**Explanation:** `AllItems` is a table containing all selected rows, while `Item` is a single record available only when a single row is selected or displayed on a form.

</details>

---

### Q5 — Single Choice

A maker wants a command to create a task due in one week for the current help request record when clicked. Which Power Fx function and property are used?

- A. `Collect` and `Self.Selected.AllItems`
- B. `Patch` and `Self.Selected.Item`
- C. `UpdateIf` and `Self.Selected.State`
- D. `Navigate` and `Self.Selected.Unsaved`

<details>
<summary>Answer</summary>

**Correct answer:** B. `Patch` and `Self.Selected.Item`

**Explanation:** `Patch` creates or updates a Dataverse record, and `Self.Selected.Item` provides the currently open single record as context (e.g., to set the Regarding field and use the record's name).

</details>

---

### Q6 — Single Choice

Which command bar location is displayed when a user opens a specific row from a table using its main form?

- A. Main Grid
- B. Associated View
- C. Subgrid View
- D. Main Form

<details>
<summary>Answer</summary>

**Correct answer:** D. Main Form

**Explanation:** The Main Form command bar is displayed when a user opens a single row and the row is rendered using the table's main form. Commands act in the context of that single row.

</details>

---

### Q7 — Fill-in-the-Blank

To check whether a user has edit permission on a record before showing a command, you can use the Power Fx function ___.

<details>
<summary>Answer</summary>

**Answer:** `RecordInfo`

**Explanation:** `RecordInfo` returns information about a record, including user permissions such as edit access, making it useful in Visible formulas.

</details>

---
