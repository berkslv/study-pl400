# Use Power Fx

Power Fx is the low-code language used across Microsoft Power Platform. Power Fx can also be used to implement custom logic with Power Apps model-driven command bar commands. Command bar logic can use a [subset](https://learn.microsoft.com/en-us/power-apps/maker/model-driven-apps/commanding-use-powerfx#functions-not-supported) of the full Power Fx language capabilities.

There are two places you can use Power Fx when customizing a command:

- **OnSelect** - This logic executes when a command button is selected by a user.
- **Visible** - This logic is executed to evaluate if the command should be hidden or visible to the user running the app.

## Configuring OnSelect

In order to use Power Fx logic when the command is selected, make sure the action property is configured to **Run formula**. You can find **Action** on the **Command** pane on the left side of the screen.

When configured, the formula bar is enabled and Power Fx logic can be provided. This option is the default for new commands. However, if the formula bar is disabled, you're likely working with a command that uses JavaScript for the logic.

The default formula is simply `true` which doesn't result in any action happening. You must provide your own logic for the command to perform an action when selected.

When a user selects the command, any pending changes on the form data are saved, and then the command OnSelect logic is executed. This order ensures a consistent state of the data at the time the command is executed.

## Configuring visibility

By default, new commands added to a command bar will be visible. By changing the command's visibility property to **Show on condition formula**, you can provide a formula that is evaluated to determine if the command should be visible. **Visibility** can be found and changed in the left-hand **Command** pane.

The default formula is simply `true` which makes the command always visible. To change the default, you must provide your own true/false logic. If your formula results in a `false` evaluation, the command won't be visible.

The visibility formula is reevaluated if any of its dependent values change. This allows the command's visibility to respond to the current condition of data and user actions.

## Currently active data

You can access the current active data using the `Selected` property. The selected property is automatically populated at runtime.

| Field | Type | Description |
|---|---|---|
| `Item` | Record from the DataSource | Available only when a single row is selected or when on a form displaying a single row. When not populated it will be set to blank. Example: `Self.Selected.Item.'Account Rating'>20` |
| `AllItems` | Table of records from the DataSource | All of the rows selected from the DataSource. Example: `CountRows(Self.Selected.AllItems) > 0` |
| `State` | Enum | Indicates if the hosting control is in **Edit (=0)**, **New (=1)**, or **View (=2)** state. |
| `Unsaved` | Boolean | Returns `true` if Selected or SelectedItems have unsaved changes. Otherwise returns `false`. |

## Data from data sources

In addition to working with data from the `Selected` property, you can also query and save data to other Microsoft Dataverse tables. For example, the following formula changes the name on an account row:

```powerfx
Patch(Accounts, Self.Selected.Item, {'Account Name': "New Account name"})
```

You can also use relationships between tables to access related rows:

```powerfx
Self.Selected.Item.'Recurring Appointments'
```

Currently, Microsoft Dataverse is the only data source available to use command logic.

## Common scenarios

- **Create related rows** based on current data — for example, create a series of scheduled follow-up calls based on potential opportunity value.
- **Navigate** to internal or external websites — for example, do a news site search passing the row's company name as a search parameter.
- **Modify data** on the current row — for example, reactivate a service customer by setting various column values.
- **Use `RecordInfo`** to ensure commands are visible when they should be — for example, check if the user has edit permission and only show the command if they do.
