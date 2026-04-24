# Quiz: Customize the Command Bar in Power Apps Model-Driven Apps

> **Source material:** 1-introduction.md, 2-create-edit.md, 3-work-classic.md, 4-power-fx.md, 5-exercise.md, 6-check.md, 7-summary.md
> **Total questions:** 22
> **Question types:** Multiple choice (single), Multiple choice (multi-select), Fill-in-the-blank

---

## Questions

### Question 1 — Single Choice

A user navigates to the list of rows for the **Opportunities** table from the left-hand navigation in a model-driven app. A maker wants to add a command that acts on one or more rows in that list.

Which command bar should the maker edit?

- A. Main Form
- B. Associated View
- C. Main Grid
- D. Subgrid View

<details>
<summary>Answer</summary>

**Correct answer:** C. Main Grid

**Explanation:** The Main Grid command bar is displayed at the top of a list of rows from a Dataverse table when the user navigates to the list from the left-hand navigation. Commands on this bar can act on any of the rows displayed in the list.

</details>

---

### Question 2 — Single Choice

A maker opens a single account row in a model-driven app and wants to add a command that acts on that specific record.

Which command bar location should the maker configure?

- A. Main Grid
- B. Subgrid View
- C. Associated View
- D. Main Form

<details>
<summary>Answer</summary>

**Correct answer:** D. Main Form

**Explanation:** The Main Form command bar is displayed when a user opens a single row from a table using the main form. Commands on this bar act in the context of that single row.

</details>

---

### Question 3 — Single Choice

A model-driven app form contains a subgrid that lists related contact rows. A maker wants to add commands that act on the rows shown in that subgrid.

Which command bar should the maker edit?

- A. Associated View
- B. Main Form
- C. Main Grid
- D. Subgrid View

<details>
<summary>Answer</summary>

**Correct answer:** D. Subgrid View

**Explanation:** The Subgrid View command bar is visible when a user is displaying a main form for a table row and the form includes a subgrid with a related table's data. Commands act on the rows displayed in the subgrid.

</details>

---

### Question 4 — Single Choice

A maker wants to group a set of related commands so they only appear when a user selects a single menu entry on the command bar, without designating one command as a primary action.

Which grouping element should the maker use?

- A. Group
- B. Split button
- C. Dropdown
- D. Command

<details>
<summary>Answer</summary>

**Correct answer:** C. Dropdown

**Explanation:** A Dropdown creates a flyout menu that is visible when selected. Its content is one or more groups of commands, keeping related commands together and only visible when expanded. A Split button is similar but exposes a primary command directly.

</details>

---

### Question 5 — Single Choice

A maker needs a command bar element that presents a primary action directly on the bar while also providing access to additional related commands in an expandable group.

Which element should the maker use?

- A. Group
- B. Dropdown
- C. Command
- D. Split button

<details>
<summary>Answer</summary>

**Correct answer:** D. Split button

**Explanation:** A Split button is similar to a Dropdown but exposes a primary command for selection without requiring the user to expand the additional groups that contain the extra commands.

</details>

---

### Question 6 — Single Choice

A maker opens the command bar designer and notices that some of the existing out-of-the-box commands cannot be edited visually. What type of commands are these?

- A. Modern commands
- B. Classic commands
- C. Legacy Power Fx commands
- D. Deprecated ribbon commands

<details>
<summary>Answer</summary>

**Correct answer:** B. Classic commands

**Explanation:** Out-of-the-box commands that use an internal infrastructure not supported by the visual designer are called classic commands. New commands added through the designer are modern commands. Both types can co-exist on a command bar.

</details>

---

### Question 7 — Single Choice

A maker wants to customize an existing classic command that cannot be edited with the visual command bar designer. The maker wants to use Power Fx for the action logic.

What is the recommended approach?

- A. Edit the classic command directly in the ribbon XML editor.
- B. Hide the classic command and re-create it as a modern command.
- C. Convert the classic command to JavaScript in the designer.
- D. Leave the classic command unchanged; Power Fx cannot be used for actions.

<details>
<summary>Answer</summary>

**Correct answer:** B. Hide the classic command and re-create it as a modern command.

**Explanation:** Classic commands cannot be edited with the visual designer. To use Power Fx, the recommended approach is to hide the classic command and re-create it as a modern command, which supports Power Fx action logic.

</details>

---

### Question 8 — Single Choice

A maker configures a new command and sets the **Action** property to **Run formula**. Which Power Fx property executes logic when a user selects the command button?

- A. Visible
- B. OnChange
- C. OnSelect
- D. OnLoad

<details>
<summary>Answer</summary>

**Correct answer:** C. OnSelect

**Explanation:** The OnSelect property executes when a command button is selected by a user. When the Action property is set to Run formula, the formula bar is enabled and Power Fx logic can be provided for OnSelect.

</details>

---

### Question 9 — Single Choice

A maker adds a new command to a command bar. By default, what is the initial behavior of the command's **Visible** property?

- A. The command is hidden until a condition formula evaluates to `true`.
- B. The command is always visible because the default formula is `true`.
- C. The command is visible only when the form is in Edit state.
- D. The command is hidden until the user explicitly enables it.

<details>
<summary>Answer</summary>

**Correct answer:** B. The command is always visible because the default formula is `true`.

**Explanation:** New commands added to a command bar are visible by default. The default Visible formula is simply `true`. To make visibility conditional, the maker must change the property to **Show on condition formula** and provide custom logic.

</details>

---

### Question 10 — Single Choice

A maker writes a visibility formula for a command that references a column on the current row. The user changes the value of that column on the form. What happens to the command's visibility?

- A. The visibility does not change until the record is saved.
- B. The visibility is reevaluated immediately because the dependent value changed.
- C. The visibility is reevaluated only when the page is refreshed.
- D. The command becomes permanently visible once shown.

<details>
<summary>Answer</summary>

**Correct answer:** B. The visibility is reevaluated immediately because the dependent value changed.

**Explanation:** The visibility formula is reevaluated whenever any of its dependent values change, allowing the command's visibility to respond dynamically to the current condition of data and user actions.

</details>

---

### Question 11 — Single Choice

A maker wants to reference data for the single row currently displayed on a Main Form in a Power Fx OnSelect formula.

Which expression provides access to that row's data?

- A. `Self.Selected.AllItems`
- B. `Self.Selected.State`
- C. `Self.Selected.Unsaved`
- D. `Self.Selected.Item`

<details>
<summary>Answer</summary>

**Correct answer:** D. `Self.Selected.Item`

**Explanation:** `Self.Selected.Item` is available when a single row is selected or when on a form displaying a single row. It provides the record from the DataSource so column values can be used in the formula.

</details>

---

### Question 12 — Single Choice

A maker needs a Power Fx expression to count the number of rows a user has selected in a Main Grid and show a command only when at least one row is selected.

Which expression correctly retrieves all selected rows?

- A. `Self.Selected.Item`
- B. `Self.Selected.State`
- C. `Self.Selected.AllItems`
- D. `Self.Selected.Unsaved`

<details>
<summary>Answer</summary>

**Correct answer:** C. `Self.Selected.AllItems`

**Explanation:** `Self.Selected.AllItems` returns a table of all the rows selected from the DataSource. Using `CountRows(Self.Selected.AllItems) > 0` is a valid pattern to check whether at least one row is selected.

</details>

---

### Question 13 — Single Choice

A maker's Power Fx OnSelect formula needs to detect whether the current form has unsaved changes before proceeding with an action.

Which `Self.Selected` property should the maker check?

- A. `Self.Selected.State`
- B. `Self.Selected.Unsaved`
- C. `Self.Selected.Item`
- D. `Self.Selected.AllItems`

<details>
<summary>Answer</summary>

**Correct answer:** B. `Self.Selected.Unsaved`

**Explanation:** `Self.Selected.Unsaved` is a Boolean that returns `true` if the Selected or SelectedItems have unsaved changes, and `false` otherwise, making it the correct property to check for pending changes.

</details>

---

### Question 14 — Single Choice

A maker wants a command to update the **Account Name** column on the currently selected account row using Power Fx.

Which formula correctly patches the record?

- A. `Update(Accounts, Self.Selected.Item, {'Account Name': "New Account name"})`
- B. `Patch(Accounts, Self.Selected.Item, {'Account Name': "New Account name"})`
- C. `Set(Self.Selected.Item.'Account Name', "New Account name")`
- D. `Collect(Accounts, {'Account Name': "New Account name"})`

<details>
<summary>Answer</summary>

**Correct answer:** B. `Patch(Accounts, Self.Selected.Item, {'Account Name': "New Account name"})`

**Explanation:** The `Patch` function is used to modify an existing record in a Dataverse table. The example from the source material uses exactly this syntax to change the name on an account row.

</details>

---

### Question 15 — Single Choice

A maker is designing a command and wants to query and write data from Dataverse tables other than the one displayed on the current form. Which data sources are available for command logic in Power Fx?

- A. Microsoft Dataverse and SharePoint lists
- B. Microsoft Dataverse and SQL Server
- C. Microsoft Dataverse only
- D. Any connector available in Power Apps

<details>
<summary>Answer</summary>

**Correct answer:** C. Microsoft Dataverse only

**Explanation:** Currently, Microsoft Dataverse is the only data source available to use in command logic. Connectors to external services like SharePoint or SQL Server are not supported.

</details>

---

### Question 16 — Single Choice

A maker configures the **OnSelect** action of a command. The user selects the command while a form has pending, unsaved changes. In what order does Power Apps process the events?

- A. The OnSelect logic executes first, then pending changes are saved.
- B. Pending form changes are discarded, then OnSelect logic executes.
- C. Pending form changes are saved first, then the OnSelect logic executes.
- D. Both actions occur simultaneously and independently.

<details>
<summary>Answer</summary>

**Correct answer:** C. Pending form changes are saved first, then the OnSelect logic executes.

**Explanation:** When a user selects a command, any pending changes on the form data are saved, and then the command OnSelect logic is executed. This order ensures a consistent state of the data at the time the command runs.

</details>

---

### Question 17 — Multi-Select

A maker is planning to use Power Fx to customize a command on a model-driven app command bar. (Select **two**.)

Which two properties support Power Fx formulas when configuring a modern command?

- A. OnLoad
- B. OnSelect
- C. Visible
- D. OnSave
- E. OnChange

<details>
<summary>Answer</summary>

**Correct answer:** B. OnSelect, C. Visible

**Explanation:** Power Fx can be used in two places when customizing a command: **OnSelect** (executes when the button is selected) and **Visible** (evaluates whether the command should be shown or hidden). The other options are not command-level Power Fx properties.

</details>

---

### Question 18 — Multi-Select

A maker wants to understand the available grouping elements for organizing commands on a command bar. (Select **three**.)

Which of the following are valid command bar grouping options?

- A. Dropdown
- B. Tab
- C. Split button
- D. Section
- E. Group

<details>
<summary>Answer</summary>

**Correct answer:** A. Dropdown, C. Split button, E. Group

**Explanation:** The three available grouping options for command bars are Dropdown (flyout menu), Split button (flyout with a primary exposed action), and Group (labels and contains commands within a dropdown or split button). Tab and Section are not command bar grouping elements.

</details>

---

### Question 19 — Multi-Select

A maker is reviewing options for dealing with classic commands that need customization. (Select **two**.)

Which two actions can a maker take for a classic command that cannot be edited with the visual command bar designer?

- A. Convert it to a canvas app component.
- B. Hide the classic command.
- C. Edit it directly in the visual designer.
- D. Remove it and re-create it as a modern command.
- E. Export and modify it in Visual Studio.

<details>
<summary>Answer</summary>

**Correct answer:** B. Hide the classic command, D. Remove it and re-create it as a modern command.

**Explanation:** For classic custom commands that cannot be modified in the visual designer, a maker can either hide the command or remove it and re-create it as a modern command. Re-creating it as modern enables the use of Power Fx for action logic.

</details>

---

### Question 20 — Multi-Select

A maker is writing Power Fx command logic and needs to work with the `Self.Selected` property. (Select **two**.)

Which two `Self.Selected` fields return data about currently selected records?

- A. `Self.Selected.State`
- B. `Self.Selected.Item`
- C. `Self.Selected.Unsaved`
- D. `Self.Selected.AllItems`
- E. `Self.Selected.Source`

<details>
<summary>Answer</summary>

**Correct answer:** B. `Self.Selected.Item`, D. `Self.Selected.AllItems`

**Explanation:** `Self.Selected.Item` provides the single record when one row is selected (or on a form), and `Self.Selected.AllItems` provides a table of all selected rows. `State` and `Unsaved` return metadata about the form/selection state, not record data. `Source` is not a valid field.

</details>

---

### Question 21 — Fill-in-the-Blank

When a maker sets a command's Action property to ___, the formula bar is enabled and Power Fx logic can be entered for the OnSelect behavior.

<details>
<summary>Answer</summary>

**Answer:** Run formula

**Explanation:** To use Power Fx logic when a command is selected, the Action property must be configured to **Run formula**. If the formula bar is disabled, the command is likely configured to use JavaScript instead.

</details>

---

### Question 22 — Fill-in-the-Blank

The ___ property of `Self.Selected` is an enum that indicates whether the hosting control is in Edit (=0), New (=1), or View (=2) state.

<details>
<summary>Answer</summary>

**Answer:** State

**Explanation:** `Self.Selected.State` is an enum value that reflects the current state of the hosting control. Makers can use this to conditionally show or hide commands or change logic based on whether the user is creating a new record, editing an existing one, or viewing it read-only.

</details>
