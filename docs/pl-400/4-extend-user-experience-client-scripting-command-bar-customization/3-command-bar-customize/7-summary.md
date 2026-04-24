# Summary

This module explored how you can customize the command bars in Power Apps model-driven apps. From the app designer, you can launch the command bar editor. You can customize the main grid, main form, subgrid view, and associated view command bars to add and edit commands. Using Power Fx you can implement custom logic to determine when the command shows on the command bars and the action that will be taken.

## Key takeaways

- The **command bar designer** is accessible from the app designer and provides a visual way to create and edit modern commands.
- **Classic commands** (out-of-the-box) cannot be edited with the visual designer; use the ribbon customization tools or replace them with modern commands.
- **Modern commands** support **Power Fx** for both `OnSelect` action logic and `Visible` condition logic.
- Use `Self.Selected.Item` to reference the single row on a Main Form, and `Self.Selected.AllItems` for multiple rows on a grid.
- Microsoft Dataverse is the only data source available for command logic.
