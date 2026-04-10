# Form elements

Model-driven forms provide the means for presenting data for editing and viewing. They have a responsive design to render on any device. When you create a new form, its form type is **Main**. A goal for designing a **Main** form is to have *only* one per table that can be used everywhere.

## Form Organization

Forms organization includes a header, body, and footer, each capable of containing form elements, like columns. The body of the form has further structure with areas called *tabs* containing sections. You can configure tabs and sections to support columns of form elements.

- The first tab on a form is the most important and should contain the priority data
- Keep the number of tabs smaller with logical grouping for a more usable experience
- Too many tabs can affect performance, particularly for mobile users

## Form Designer

The **Form designer** interface appears with:
- A canvas window in the middle showing the form
- A command bar at the top with quick functions and navigation links
- A side menu for navigating different options in the left-side panel

## Table Columns and Properties

The **Table columns** list shows available columns from your data source. You can:

- Show only columns not yet used, or display all of them
- Add the same column to the form multiple times (values are identical for each occurrence)
- Delete non-required fields or hide required fields without affecting data
- Adjust field name, visibility, and read-only status from the **Properties** tab

Without special configuration, a column renders with input controls according to its data type (e.g., a Choice column shows a drop-down list).

## Components

The **Components** menu provides ways to further customize your form:

- **Layout choices** - organize the physical structure of your form
- **Grid components** - enable data entry via a grid
- **Display components** - insert calendars, external websites, Canvas apps, and other items
- **Input components** - provide other means for data entry (checkboxes, option sets, toggles, pen inputs)

When selecting a component to add, Power Apps prompts you for which field to apply it to and which platforms to display it on.

## Form Settings

Form settings allow installing controls that work behind the scenes, defining which form the user sees. You can:

- Define security roles controlling access, form order, and fallback forms
- Check a particular security group's access to the form
- Set **Form order** to determine which form appears first depending on the security role
- Configure **Fallback forms** for when a security role doesn't have a form selected

## Show or Hide Form Elements

Tabs, sections, columns, iFrames, and web resources can all be shown or hidden via the **Properties** panel. You can use form scripts or business rules to adjust visibility.

> **Best practice**: If you use scripts, ensure any element that might be hidden is hidden by default. Only show an element with scripts when your logic calls for it.

## Form Event Handlers

Form event handlers configure developer logic that runs when users interact with the form. They require a JavaScript library to be added first.

| Elements | Event | Description |
| --- | --- | --- |
| Form | OnLoad | Occurs when the form loads. |
| Form | OnSave | Occurs when data is saved. |
| Tab | TabStateChange | Occurs when the tab is expanded or collapsed. |
| Column | OnChange | Occurs when data in the column changes and the control loses focus. |
| IFrame | OnReadyStateComplete | Occurs when the content of an IFrame loads. |

Each element can have up to **50 separate event handlers** configured.
