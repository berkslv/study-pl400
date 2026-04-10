# Exercise - Create a Microsoft Dataverse table

- 12 minutes

In this unit, you'll create a custom table and configure key components. You'll learn how to:

- Create a custom table
- Add custom columns
- Customize a view
- Customize a form

This tutorial uses a scenario from Contoso, a pet grooming business that serves dogs and cats. Contoso needs an app for client and pet tracking that employees can use across various devices.

## Create a custom table

Follow these steps to create a new custom table:

1. Sign in to the [Power Apps maker portal](https://make.powerapps.com/).
2. In the left navigation, select **Tables**, then select the **New table** dropdown, and choose **Table (advanced properties)**.
3. In the *Properties* tab of the New table pane, enter:
   - **Display name**: *Pet*
   - **Description**: *Track pets for pet grooming*
4. Select the *Primary column* tab and enter:
   - **Display name**: *Pet Name*
5. Select **Save**.

## Add and customize columns

1. Once the table is created, the **Pet columns and data** section displays. Select **+** to add a new column or use the **Edit** button.
2. Select **New > Column** from the command bar.
3. In the **New column** pane, enter:
   - **Display name**: *Species*
   - **Data type**: *Choice*
4. Create a new choice set:
   1. Under **Sync this choice with**, select **New choice**
   2. In the **Display name**, enter *Species*
   3. Add **Dog** as a label
   4. Add **Cat** as another label
   5. Select **Save**
5. To assign this choice set to the column, search for *Species* under **Sync this choice with**, select it, and then choose **Save**.
6. Add another column:
   - **Display name**: *Pet Breed*
   - **Data type**: *Single line of text*
7. Add one more column:
   - **Display name**: *Appointment date*
   - **Data type**: *Date and time*

   Select **Save** after each column.

## Customize a view

1. Select **Views** from the **Data experiences** pane.
2. Select **Active Pets** to open the view designer.
3. Add columns to the view by selecting them from the **Table columns** panel:
   - *Appointment date*
   - *Pet Breed*
   - *Species*
4. To remove a column, select its name in the view header, then choose **Remove**. Remove the **Created On** column.
5. Drag column headers to reorder them. Move *Species* before *Pet Breed*.
6. Select **Save and publish**.

## Customize the main form

1. Select **Forms** from the **Data experiences** pane.
2. Open the **Main** form and select **Edit**.
3. In the form editor, add *Species*, *Pet Breed*, and *Appointment date* to the *General* section.
4. Select **Save and publish**.
5. Return to the **Pet** table after publishing is complete.
6. You can now enter data directly in the table. Select **+ New row** to add test data for display in views and forms.

You can also import data into the table. The next unit covers how to import data.
