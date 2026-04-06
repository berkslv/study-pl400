# Modify choice and choices values

The simplest way to set a choice column value in a table is to use an [Edit form](https://learn.microsoft.com/en-us/power-apps/maker/canvas-apps/controls/control-form-detail/). When you add a choice column to the form, it automatically:

- Sets up as either a dropdown menu (for a single choice) or a combo box (for more than one choice). (When you add an **Edit form**, Power Apps will set up both with a combo box.)
- Uses the `Choices()` function to populate the list of values that the user can select.
- Sets the control's current value from the row's column value.
- Saves the value to the table by using the `SubmitForm` function on a control, such as a button.

When a column is added to the form, it's editable by default. If you want to display the choice column on the form but not have it editable, select the control's **DisplayMode** and change it to **DisplayMode.View**. (You may need to first navigate to the **Advanced** tab in the **Properties** pane and **Unlock to change properties**.)

## Use Patch to create or update

You can also create or update choice column values by using the `Patch()` function. This approach is suitable when updating only a few fields that require little or no user input.

The following example shows a **Make VIP** button added to a gallery item. When selected, it sets the row's **Category** choice field to **Preferred Customer**:

```powerappsfl
Patch(Accounts, ThisItem, {Category: 'Category (Accounts)'.'Preferred Customer'})
```

> **Important:** If your table column uses a Choice set, when you use `Patch`, you need to prefix your value with the Choice set name, otherwise you get an `'OptionSetValue'` error. You can find the Choice set name by going to your Table in Dataverse, selecting that column in Edit mode, and looking at the **Sync this choice with** field.

For example, if the Choice set name is `Category`, your `Patch()` would look like:

```powerappsfl
Patch(Accounts, ThisItem, {'Customer Type': Category.Preferred})
```

To **clear** the value of a choice column using `Patch()`, set the value to `Blank()`:

```powerappsfl
Patch(Products, ThisItem, {'Sales channels': Blank()})
```
