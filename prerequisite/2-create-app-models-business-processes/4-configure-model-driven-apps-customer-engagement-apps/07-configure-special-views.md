# Create and edit views

Some public views exist by default for system tables and for any custom table. When you create a new custom table, you get a combination of public views (active and inactive) and system views.

## Default Views

- Users can create and delete custom public views they've created in an unmanaged solution
- **System-defined public views** cannot be deleted

## Creating/Editing a Public View

1. From the Power Apps maker portal, select the **Solution** where your app resides, then select your app

   > **Note**: You cannot create/edit a view within a managed solution. Ensure the app is in an unmanaged solution (check the *Managed* column — select one with value *No*).

2. In the app editor, from the **Pages** panel on the left, select the table you want to create/manage a view in. The table name expands showing *forms* and *views* menu options.

3. Select the **Views** option below the table name. The *Views* properties panel on the right shows all public views currently in the app.

4. To edit an existing view: hover over it to see the edit icon (pencil) and select it. Other options via the ellipsis include:
   - **Edit** - opens the view in the current browser tab
   - **Edit in a new tab** - opens the view in a new tab
   - **Remove** - deletes the view

5. To create a new view: select **+ New View** inside your *Views* pane. In the popup, add a name and select **Create**.

6. In the view editor:
   - Use the **Table columns** pane on the left to add columns (click on them)
   - Or select the **+ View column** button in the table header
   - Drag and drop to reorder columns
   - Use the **Undo** button or select the column name → *Remove* to remove columns

7. To filter your view:
   - Select a column header
   - Choose **Filter by** from the dropdown
   - In the popup, select a condition (e.g., *Equals*, *Contains*, *Begins with*) from the top dropdown
   - Select a value from the second dropdown
   - Select **Apply** to record the filter

8. To add multiple filters:
   - Repeat the column selection method, or
   - Select **Edit filters...** from the properties pane to add conditions in the popup window

9. When satisfied, select **Publish** from the top right of the command ribbon to save and make the view available to all users.

## Edit System Views

System views:
- Are not immediately shown in the view selector
- Cannot be used in sublists in a form or as a list in a dashboard
- Cannot be deleted or deactivated

To find system views: select **Show more** from your **Views** property pane on the right. All four system views appear in the list.

> System administrators can edit system views just like public views by following the same steps.
