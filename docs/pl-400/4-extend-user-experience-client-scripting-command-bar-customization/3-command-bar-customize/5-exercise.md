# Exercise - Customize the command bar

In this exercise, you add a command bar button to the help request table form. This button is visible for active help requests. When it's clicked, a new task is created for the help request.

> **Important:** Use a test environment with Microsoft Dataverse provisioned and the sample apps enabled. If you don't have one you can sign up for the [community plan](https://powerapps.microsoft.com/communityplan/).

## Task - Prepare your environment

In this task, you create a solution, create a new help request table, and then create a model-driven application. If you would prefer to skip this task and use a starting solution, proceed to the **Import a solution** task.

1. Navigate to [Power Apps maker portal](https://make.powerapps.com/) and make sure you are in the correct environment that has the sample apps enabled.
2. Select **Solutions**.
3. Select **+ New solution**.
4. Enter **Command Bar** for **Display name**, select **CDS default publisher** for **Publisher**, and select **Create**.
5. Open the **Command Bar** solution you created.
6. Select **+ New** and then select **Table > Table (advanced properties)**.
7. Enter **Help Request** for Display name, **Help Requests** for Plural name will auto-populate, and expand **Advanced options**.
8. Scroll down to the **Make this table an option when** section, check the **Create a new activity** checkbox, and select **Save**.
9. Expand the **Help Request** table you created and select **Columns**.
10. Open the **Status Reason** column.
11. Select **New choice**.
12. Enter **Resolved** for Label and select **Save**.
13. Select **Forms** and open the **Main form**.
14. Drag the **Status Reason** column and drop it in the form header.
15. Select **Save and publish** and wait for the form to be published.
16. Select the **Back** button.
17. Select **Apps**.
18. Select **+ New** and then select **App** > **Model-driven app**.
19. Enter **Help Request App** for Name and select **Create**.
20. Select the **Navigation ...** button and then select **New group**.
21. Go to the properties pane. Change the Title to **Requests** and ID to **help_requests_group**.
22. From the pane on the left side of the canvas under **Navigation** select **Requests ...** and then select **New page**.
23. Select **Dataverse table** for Content type and then select **Next**.
24. Select **Help Request** for table and then select **Add**.
25. Select the Help Requests view you just added and then go to the **Settings** tab in the pane to the right of the canvas.
26. Change the ID to **help_requests_subarea**.
27. Select **Save** and wait for the application to be saved.
28. Select **Publish** and wait for the application to be published.
29. Select the **Back** button.
30. Select **Publish all customizations**, and wait for the publishing to complete.

## Task - Import solution

In this task, you import the starting solution into your environment. You only need to complete this task if you didn't complete the Prepare your environment task above.

1. Download the [**CommandBar_1_0_0_1.zip**](https://github.com/MicrosoftDocs/mslearn-developer-tools-power-platform/raw/master/command-bar/CommandBar_1_0_0_1.zip) solution file and save it locally.
2. Navigate to [Power Apps maker portal](https://make.powerapps.com/) and make sure you are in the correct environment.
3. Select **Solutions** > **Import solution** > **Browse**.
4. Choose the downloaded file and select **Open** > **Next** > **Import**.
5. Wait for the import to complete, then select **Publish all customizations**.

## Task - Add command button

In this task, you add a new command button to the Help Request table main form.

1. Open the **Command Bar** solution you created/imported.
2. Select **Apps** and open the **Help Request App**.
3. Select the ellipsis **...** button of the **Help Request view** and select **Edit command bar > Edit**.
4. Select **Main form** and then select **Edit**.
5. Select **+ New** > **Command**.
6. Select **Power Fx** and then select **Continue**. Wait for the **Create a component library** to finish.
7. With your **NewCommand** selected in the canvas, enter **Follow Up** for the Label, select **Use Icon**, select **Placeholder**, and select **Show on condition from formula** for Visibility.
8. Enter **Follow Up** for Tooltip title, Tooltip description, and Accessibility text.
9. Go to the formula bar, select **Visible**, and paste this formula:

    ```powerfx
    If(Self.Selected.Item.'Status Reason' = 'Status Reason (Help Requests)'.Active, true, false)
    ```

    This Power Fx formula shows the button if the help request is active, and hides it if it's resolved.

10. Select **Save and publish** and wait for publishing to complete.
11. Select **Play**.
12. Select **+ New**, enter **Test for Visibility** as Name, and select **Save**.
13. The **Follow Up** command button should become visible.
14. Change the Status Reason to **Resolved** and select **Save**. The **Follow Up** button should no longer be visible.
15. Change the Status Reason to **Active** and select **Save**. The **Follow Up** button should become visible again.
16. Close the application browser window or tab. You should now be back to the command bar editor.

## Task - Add button action

In this task, you add a Power Fx formula that creates a new task due in one week when the command button is clicked.

1. Select **Open component library**.
2. Select the **Data** tab, select **Add data**, search for **tasks**, and select the **Tasks** table.
3. Select **Save** > **Publish** > **Publish this version**.
4. Close the component library browser window or tab.
5. Select **Resume**.
6. Select the **Follow Up** command button you added.
7. Go to the formula bar and select **OnSelect**.
8. Paste this formula in the formula bar:

    ```powerfx
    Patch(Tasks, {Subject: Self.Selected.Item.Name, Regarding: Self.Selected.Item, 'Due Date': DateAdd(Now(),7) }); Notify("Created new task")
    ```

    This formula creates a task for the current help request, sets the due date to one week from the time the button is clicked, and displays a notification.

9. Select **Save and publish** and wait for the changes to be published.
10. Select **Play**.
11. Open the **Test for Visibility** help request record.
12. Select the **Follow Up** button. You should see the notification.
13. Select the **Related** chevron button and then select **Activities**.
14. You should see the created task with a **Due Date** set to 7 days from the current date.
