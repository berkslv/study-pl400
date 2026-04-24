# Summary: Customize Command Bars in Model-Driven Apps

> **Source files:** 1-introduction.md, 2-create-edit.md, 3-work-classic.md, 4-power-fx.md, 5-exercise.md

---

## Command Bar Locations

- **Main Grid** — top of a list of rows from a Dataverse table; commands act on any displayed rows.
- **Main Form** — displayed when a row is opened using the main form; commands act on the single row.
- **Subgrid View** — visible on a main form when a subgrid of a related table is configured; commands act on subgrid rows.
- **Associated View** — above related table rows displayed from the main form; commands act on one or more related rows.

---

## Command Bar Composition

- A command bar contains one or more command buttons presented side by side.
- Grouping elements available:
  - **Dropdown** — flyout menu containing one or more groups of commands; visible only when selected.
  - **Split button** — primary command selectable directly, plus expandable groups with extra commands.
  - **Group** — labels and contains one or more commands inside a dropdown or split button.

---

## Classic vs. Modern Commands

- **Classic commands** — out-of-the-box commands using internal infrastructure that does not support low-code customization via the visual designer.
- **Modern commands** — new commands added via the visual command bar designer; support Power Fx and JavaScript.
- Both classic and modern commands can co-exist on a command bar.
- Classic commands will be incrementally migrated to modern commands over time.
- Options for classic commands that need customization:
  - **Hide** the classic command.
  - **Remove** and re-create as a modern command (enables Power Fx action logic).
  - Use [ribbon customization techniques](https://learn.microsoft.com/en-us/power-apps/developer/model-driven-apps/customize-commands-ribbon/) until migration occurs.

---

## Creating and Editing Modern Commands

1. Open the model-driven app in the app designer.
2. Select **Edit command bar** for the desired table and command bar location.
3. Select **+ New** > **Command** to add a new command.
4. Choose **Power Fx** or **JavaScript** as the action type.
5. Configure command properties: label, icon, tooltip, visibility, and action logic.
6. Select **Save and publish** to apply changes.

---

## Power Fx in Command Bars

- Power Fx can be used in two places on a command:
  - **OnSelect** — executes when the command button is selected.
  - **Visible** — evaluates whether the command should be hidden or visible.
- Only a [subset of Power Fx functions](https://learn.microsoft.com/en-us/power-apps/maker/model-driven-apps/commanding-use-powerfx#functions-not-supported) is supported.
- Microsoft Dataverse is the **only** data source available to command logic.

### OnSelect Configuration

- Set the **Action** property to **Run formula** to enable Power Fx logic.
- If the formula bar is disabled, the command uses JavaScript — not Power Fx.
- Default formula is `true` (no action); must be replaced with custom logic.
- Pending form changes are **saved before** the OnSelect logic executes, ensuring consistent data state.

### Visibility Configuration

- Default visibility is always visible (`true`).
- Change **Visibility** to **Show on condition formula** to supply a true/false formula.
- A `false` result hides the command.
- The visibility formula is **reevaluated** whenever its dependent values change.

### `Self.Selected` Property

| Field | Type | Description |
|---|---|---|
| `Item` | Record | Single selected row or form row; blank when not populated. Example: `Self.Selected.Item.'Account Rating' > 20` |
| `AllItems` | Table | All selected rows. Example: `CountRows(Self.Selected.AllItems) > 0` |
| `State` | Enum | `Edit (=0)`, `New (=1)`, or `View (=2)` state of the hosting control. |
| `Unsaved` | Boolean | `true` if selected items have unsaved changes. |

### Common Power Fx Scenarios

- **Create related rows** based on current data (e.g., scheduled follow-up tasks from opportunity value).
- **Navigate** to internal or external websites passing row data as parameters.
- **Modify data** on the current row (e.g., reactivate a service customer by setting column values).
- **Use `RecordInfo`** to control visibility based on user permissions (e.g., show only when user has edit permission).

### Example Formulas

Navigate to a specific view:
```powerfx
Navigate('Accounts (Views)'.'My Active Accounts')
```

Patch a field on the current row:
```powerfx
Patch(Accounts, Self.Selected.Item, {'Account Name': "New Account name"})
```

Access related rows via relationship:
```powerfx
Self.Selected.Item.'Recurring Appointments'
```

Visibility based on status:
```powerfx
If(Self.Selected.Item.'Status Reason' = 'Status Reason (Help Requests)'.Active, true, false)
```

Create a task due in one week and notify:
```powerfx
Patch(Tasks, {Subject: Self.Selected.Item.Name, Regarding: Self.Selected.Item, 'Due Date': DateAdd(Now(),7) }); Notify("Created new task")
```

---

## References

- [Customize commands and the ribbon](https://learn.microsoft.com/en-us/power-apps/developer/model-driven-apps/customize-commands-ribbon/)
- [Modern commanding overview](https://learn.microsoft.com/en-us/power-apps/maker/model-driven-apps/command-designer-overview/)
- [Power Fx functions not supported in commanding](https://learn.microsoft.com/en-us/power-apps/maker/model-driven-apps/commanding-use-powerfx#functions-not-supported)
