# Introduction

A common requirement in business app data storage to help ensure data consistency is a data column with a standardized, infrequently changing list of values. Users enter data by choosing an option from a list instead of typing a free-form value. Examples of these options include lists such as countries/regions, incident priority, and satisfaction rating.

Microsoft Dataverse has a column type that supports this functionality, the **Choice** column. Choice columns allow a user to pick values from a list when entering data. By default, users can pick a single choice, but the column can be easily configured to allow multiple values from a single list of known values. For example, **Primary Category** could be a single choice column, **Other Categories** could be a multiple choice column, and both could use the same list of categories.

You can either use system-defined values or a custom list of values for choice columns. The choices are stored as table column metadata and can only be modified by an app maker, not an app user. This feature is beneficial when building an app that works with a list of values, as your formulas can reference the choice list name and the display names of the values. For example, the following formula sets a color on a gallery item's text **Color** property based on the **Category** column, which is a choice column.

```powerappsfl
Switch(
  ThisItem.Category,
  'Category (Accounts)'.'Preferred Customer', Green,
  'Category (Accounts)'.'Standard', Black
)
```

As you compose this formula, Power Apps will know the possible values for the **Category** column, and will allow you to select the value to compare from the list of known values for the choice column as soon as you insert the "." after the column name.

> **Note:** If you add or change values on a choice list and the new or changed choices don't immediately show in the editor, refresh the table in the data panel. Refresh the table on the data panel by selecting the ellipsis (**...**) next to the table, and selecting **Refresh** from the pop-up menu. Repeat until your new values show.

## Local versus global

You can create a list of available choice values as a local or global list. **Local choice** lists can only be used in the column and table where they're created. The **Global choice** option allows the list to be used in multiple columns, either in the same table or in many different tables. When you create a new **Choice** column, the default value for the option **Sync with global choice?** is **Yes** (which is recommended). The **Global choice** option allows use of the same choices in other tables. Unless the values only apply to a single column in a single table, use global choice values.

With **Yes** selected, the **Sync this choice with** becomes a mandatory field, and you must make a selection for the choices. You can either type in the choice type you're looking for, or scroll through the list to select one. Hovering over any of the choice sets shows a preview of the choices already part of that set.

It's also possible to create a new choice set by selecting **+ New choice** and entering information on your choices.

If you want to keep your choice options as a **local** choice set, select **No** under **Sync with global choice?**. In this case, define your choices just below the **No** button. You'll need to add a **Label** for each choice; Power Apps will automatically assign an integer value. You can change the value, but it's not recommended. You can also select a color for each choice — available only in model-driven apps.

You add more choices by selecting the **+ New choice** button and repeating the process.

If you need to allow the user to select multiple choices, you must check **"Selecting multiple choices is allowed"** before creating the column, as this option will be disabled once the column is created.

## Display column values

When the data for a choice is stored in a Dataverse row, only the numeric value is stored, not the text. For multiple choices, a comma-separated list of numeric values is stored to represent multiple selections.

How you display values in a control, such as a label, is different for single and multiple choice values.

For a **single choice** column, use the column reference directly in the label's **Text** property:

```powerappsfl
ThisItem.Category
```

For **multiple choices** columns, the property on the record is of type Table — a single-column table with a `Value` column, with each row representing a selected value. To display a user-friendly, comma-separated list of text values, use the `Concat` function:

```powerappsfl
Concat(ThisItem.'Preferred Delivery', Text(Value), ", ")
```

## Choice vs. lookup

One common data modeling decision is choosing between a choice column and a lookup column or between multiple choices and a many-to-many relationship. Consider the differences summarized in the following table.

| Choice | Lookup or many-to-many relationship |
| --- | --- |
| List modified by maker, no user editing. | List is table data and normal security applies. |
| Data stored as a whole number or a comma-separated list of numbers (when more than one). | Data stored as a table reference. |
| No built-in way to inactivate or retire a choice. | Supports inactive state on row and can be filtered by formulas in app to limit selection. |
| Treated as a solution component with full ALM support. | Treated as reference data. |
| Only has label, value, and color; only label is usable in formulas. (Filter and sorting can only be done on display label.) | Can add other data to a look-up target table usable in formulas. (Filter and sorting on any column added to the table.) |
| Localization built in. | Handle localization yourself. |
| No built-in support of dependent choice columns. | Easier to data model and implement dependent columns. |

> **Remember:** After you've created the column, you can't change the data type. So before you create the column, consider how the apps, automation, or reporting will be using the data.

The rest of this module explores how to use choice columns when building a canvas app from Microsoft Power Apps.
