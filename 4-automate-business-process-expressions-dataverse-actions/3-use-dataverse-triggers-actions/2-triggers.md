# Dataverse triggers

With Power Automate, you can build automated cloud workflows with a trigger and multiple actions. A trigger is an event that starts a cloud flow. The Dataverse connector supports four triggers that allow the starting of flows based on Dataverse data events.

Triggers on the Dataverse connector are as follows:

- **When a row is added, modified or deleted** - Use this trigger to start a flow when a row is added, modified, or deleted in a Dataverse table. For example, when you add a new row to the Project table, the system should run a flow.
- **When an action is performed** - This trigger occurs when a Dataverse action completes. As a result, the system triggers flows from custom business events that you define. For example, you could create an **EmployeeOnboarded** event and then use it to trigger flows.
- **When a flow step is run from a business process flow** - With this trigger, you can start a flow when someone selects the **Run Flow** button in a business process flow step. For example, in a Microsoft Power Apps model-driven app that uses a business process flow, you could create a step that starts a flow to get a manager's approval.
- **When a row is selected** - This trigger starts a flow when a user in a Power Apps model-driven app selects a row and runs the flow.

Each trigger has different options that you need to set up. Some triggers have advanced options that provide extra control over the behaviors of the trigger.

## When a row is added, modified or deleted

To use the **When a row is added, modified or deleted** trigger, you need to set up the change type, table, and scope options on the trigger. All other configuration is optional.

### Change type

Use the **Change type** trigger to set up one or more data row events that you want to trigger the flow. For example, you can choose to have the flow run when a row is added, modified, or deleted or combinations of these actions. These data row events trigger the flow after the change to the row occurs in the Dataverse environment.

If you add or modify the change type, the current Dataverse table row is available as output for you to use in subsequent steps from the dynamic content area. If you delete the change type, only the row ID of the Dataverse row is available.

If you trigger your flow on multiple change types, and if you need conditional logic depending on the type, then you can use the following expression to get the change type that triggered the flow. The `SdkMessage` property contains `create`, `update`, or `delete`.

```
triggerBody()?['SdkMessage']
```

If you complete multiple updates for a row, your flow might trigger for each update, even if the row column values don't change. This situation occurs because you completed the update on the row multiple times. The logic in your flow must take this factor into consideration.

### Table name

You can choose the table name from the full list, or you can filter the list by starting to type the table name. Table names aren't presented in alphabetical order, so using the filter can be helpful in environments with a large number of tables.

### Scope

When you create a Dataverse table, you specify the type of row ownership. The organization can own the rows, or a user or team can own them.

You can use the scope option to specify which rows qualify to trigger the flow based on who owns the row that's being modified. If the table row ownership is organization, the only option for scope is organization. For tables that allow user or team ownership, you can choose any of the following options for scope:

- **Organization** - This option is the default. Any user who owns a row and modifies it can trigger your flow. Additionally, anyone who modifies organization-owned tables can trigger your flow.
- **User** - This option is the most limiting; your flow only runs if you own the modified row.
- **Business Unit** - This option triggers your flow if anyone in your business unit owns the modified row.
- **Parent: Child Business Unit** - This option includes any child business unit users in determining whose actions can trigger your flow.

Organization and user are the most common configurations. Organization scope is best if you're creating a flow for all users. User scope is best if you're creating your own personal automation and want to minimize random or irrelevant data that other users enter.

## Advanced options

In addition to the required choices, the trigger has the following **Advanced options** for further modification:

### Select columns

The **Select columns** option only applies when you set the change type to include modified rows. You can provide a list of table columns that, if they're included in modifying the data row, your flow runs.

```
firstname,lastname
```

> **Important:** Use this feature if your flow intends to use an update row action later to update columns on the row that triggered the flow. To avoid an infinite loop, make sure that you don't include the columns that you update in the **Select columns** option.

### Filter rows

Use the **Filter rows** option to filter the rows that trigger your flow based on the values of the row's columns. You can specify filter rows by using an OData expression. The flow runs only when the system evaluates the expression to be true after you save the change in Dataverse.

```
contoso_amountoverbudget gt 10000
```

### Delay until

You can use **Delay until** to specify a specific time to delay the trigger evaluation. By using an OData-style time stamp, you can delay the flow trigger until a specific UTC time. A key benefit of using this option vs. a standard **Delay until** *action* is that the Dataverse **Delay until** property of this trigger never expires, allowing the flow run to wait for long periods of time.

### Run as

By using the **run as** option, you can set each Dataverse action in the flow to be performed by using the context of a user other than the flow owner. The flow owner must have the **Act on Behalf of Another User** Dataverse privilege. The **Delegate** security role includes this privilege by default.

You can set the **run as** feature with the following options:

- **Flow owner** - The user who created the flow.
- **Row owner** - The user who owns the Dataverse row that triggered the flow.
- **Modifying user** - The user who took the action on the Dataverse row, causing the flow to be triggered or modified.

For each Dataverse action that you want to run as a different user, select **Use invoker's connection** on the action's **Settings** tab.
