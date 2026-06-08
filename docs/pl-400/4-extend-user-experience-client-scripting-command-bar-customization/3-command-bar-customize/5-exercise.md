# Exercise - Customize the command bar

Completed

- 9 minutes

In this exercise, you add a command bar button to the help request table form. This button is visible for active help requests. When it's clicked, a new task is created for the help request.

Important

Use a test environment with Microsoft Dataverse provisioned and the sample apps enabled. If you don't have one you can sign up for the community plan [here](https://powerapps.microsoft.com/communityplan/?azure-portal=true).

### Task - Prepare your environment

In this task, you create a solution, create a new help request table, and then create a model driven application. If you would prefer to skip this task and use a starting solution, proceed to the **Import a solution** task.

1. Navigate to [Power Apps maker portal](https://make.powerapps.com/?azure-portal=true) and make sure you are in the correct environment that has the sample apps enabled.

![Screenshot showing environment name.](media/dev-labs.png)
2. Select **Solutions**.
3. Select **+ New solution**.
4. Enter **Command Bar** for **Display name**, select **CDS default publisher** for **Publisher**, and select **Create**.

![Screenshot showing new solution properties.](media/new-solution.png)
5. Open the **Command Bar** solution you created.
6. Select **+ New** and the select **Table &gt; Table (advanced properties)**.
7. Enter **Help Request** for Display name, **Help Requests** for Plural name will auto-populate, and expand **Advanced options**.

![Screenshot showing the create new table dialog.](media/new-table.png)
8. Scroll down to the **Make this table an option when** section, check the **Create a new activity** checkbox, and select **Save**.

![Screenshot showing the enable table for activity checkbox.](media/create-activity.png)
9. Expand the **Help Request** table you created and select **Columns**.

![Screenshot showing the table columns button.](media/columns.svg)
10. Open the **Status Reason** column.

![Screenshot showing the status reason column.](media/status-reason.png)
11. Select **New choice**.

![Screenshot showing the add new choice button.](media/new-choice.png)
12. Enter **Resolved** for Label and select **Save**.

![Screenshot showing a new choice added to the status reason choices.](media/resolved.png)
13. Select Forms and open the Main form.

[![Screenshot showing table forms.](media/forms.svg)](media/forms.svg#lightbox)
14. Drag the **Status Reason** column and drop it in the form header.

[![Screenshot showing the status reason reason column getting added to the form header.](media/drag-status-reason.png)](media/drag-status-reason.png#lightbox)
15. Select **Save and publish** and wait for the form to be published.
16. Select the **Back** button.
17. Select **Apps**.
18. Select **+ New** and then select **App** and then **Model-driven app**.

[![Screenshot showing the create new model-driven application button.](media/model-driven.png)](media/model-driven.png#lightbox)
19. Enter **Help Request App** for Name and select **Create**.
20. Select the **Navigation ...** button and then select **New group**.

![Screenshot showing the navigation group.](media/group.svg)
21. Go to the properties pane.
22. Change the Title to **Requests** and ID to **help\_requests\_group**.

![Screenshot showing the navigation group properties.](media/requests.png)
23. Next, from the pane on the left side of the canvas under **Navigation** select **Requests ...** and then select **New page**.
24. Select **Dataverse table** for Content type and then select **Next**.
25. Select **Help Request** for table and then select **Add**.

![Screenshot showing the navigation subarea properties.](media/help-requests.svg)
26. Select the Help Requests view you just added and then go to the **Settings** tab in the pane to the right of the canvas.
27. Change the ID to **help\_requests\_subarea**.

![Screenshot showing the help request ID value.](media/help-requests-view-id.svg)
28. Select **Save** and wait for the application to be saved.
29. Select **Publish** and wait for the application to be published.
30. Select the **Back** button.

![Screenshot showing the back button.](media/back.svg)
31. Select **Publish all customizations**, and wait for the publishing to complete.

### Task - Import solution

In this task, you import the starting solution into your environment. You only need to complete this task if you didn't complete the Prepare your environment task, above. If you completed the Prepare your environment task, proceed to the Add command button task.

1. Download the [**CommandBar\_1\_0\_0\_1.zip**](https://github.com/MicrosoftDocs/mslearn-developer-tools-power-platform/raw/master/command-bar/CommandBar_1_0_0_1.zip) solution file located in the GitHub and save locally on your computer.
2. Navigate to [Power Apps maker portal](https://make.powerapps.com/?azure-portal=true) and make sure you are in the correct environment that has the sample apps enabled.
3. Select **Solutions**.
4. Select **Import solution**.
5. Select **Browse**.
6. Choose the file you downloaded and select **Open**.
7. Select **Next**.
8. Select **Import** and wait for the solution import to complete.

![Screenshot showing the import solution dialog.](media/import.png)
9. You should see a notification when the import completes. Select **Publish all customizations** and wait for the publishing to complete.

### Task - Add command button

In this task, you add a new command button to the Help Request table main form.

1. Open the **Command Bar** solution you created/imported.
2. Select **Apps**, and open the **Help Request App**.

[![Screenshot showing the help request application.](media/help.png)](media/help.png#lightbox)
3. Select the ellipsis **...** button of the **Help Request view** and select **Edit command bar &gt; Edit**.

![Screenshot showing the edit command bar button.](media/edit.svg)
4. Select **Main form** and then select **Edit**.
5. Select **New** and then select **Command**.

![Screenshot showing the add new command button.](media/new-command.png)
6. Select **Power Fx** and then select **Continue**. You need to wait for the **Create a component library** to finish and the pop up to disappear.
7. With your **NewCommand** selected in the canvas, enter **Follow Up** for the Label, select **Use Icon**, select **Placeholder**, and select **Show on condition from formula** for Visibility.

![Screenshot showing the command properties.](media/show.png)
8. Enter **Follow Up** for Tooltip title, Tooltip description, and Accessibility text.
9. Go to the formula bar, select **Visible**, and paste this formula. This Power Fx formula shows the button if the help request is active, and hide it if it's resolved.

    `If(Self.Selected.Item.'Status┬áReason'┬á=┬á┬á'Status┬áReason┬á(Help┬áRequests)'.Active,┬átrue,┬áfalse)`

[![Screenshot showing the command button visibility formula.](media/follow-up.png)](media/follow-up.png#lightbox)
10. Select **Save and publish**.
11. Wait for the publishing to complete.
12. Select **Play**.

![Screenshot showing the play button.](media/play.png)
13. Select **+ New**.
14. Enter **Test for Visibility** as Name and select **Save**.

[![Screenshot showing the new help request record.](media/test.png)](media/test.png#lightbox)
15. The **Follow Up** command button should become visible. Change the Status Reason to **Resolved**.

[![Screenshot showing the status reason value.](media/resolved-status.png)](media/resolved-status.png#lightbox)
16. Select **Save**.
17. The **Follow Up** command button should no longer be visible.

[![Screenshot showing the command bar without the follow up button.](media/invisible.png)](media/invisible.png#lightbox)
18. Change the Status Reason to **Active**.
19. Select **Save**.
20. The **Follow Up** command button should become visible again.
21. Close the application browser window or tab.
22. You should now be back to the command bar editor. Don't navigate away from this page.

### Task - Add button action

In this task, you add a Power Fx formula that creates a new task that is due in one week when the command button is clicked.

1. Select **Open component library**.

![Screenshot showing the open component library button.](media/open.png)
2. Select the **Data** tab, select **Add data**, search for tasks, and select the **Tasks** table.

![Screenshot showing the add data dialog.](media/tasks.png)
3. Select **Save**.
4. Select **Publish**
5. Select **Publish this version**.
6. Close the component library browser window or tab.
7. Select **Resume**.

![Screenshot showing the resume editing the command bar popup.](media/resume.png)
8. Select the **Follow Up** command button you added.
9. Go to the formula bar and select **OnSelect**.

[![Screenshot showing the on-select action of the follow up button.](media/on-select-formula.png)](media/on-select-formula.png#lightbox)
10. Paste this formula in the formula bar. This formula creates a task for the current help request and set the due date to one week from the time the button is clicked and display a notification.

    `Patch(Tasks,┬á{Subject:┬áSelf.Selected.Item.Name,┬áRegarding:┬áSelf.Selected.Item,┬á'Due┬áDate':┬áDateAdd(Now(),7)┬á});┬áNotify("Created┬ánew┬átask")`

[![Screenshot showing the on-select command formula.](media/formula.png)](media/formula.png#lightbox)
11. Select **Save and publish**.
12. Wait for the changes to be published.
13. Select **Play**.
14. Open the **Test for Visibility** help request record.
15. Select the **Follow Up** button.

[![Screenshot showing the follow up command button.](media/follow-up-button.png)](media/follow-up-button.png#lightbox)
16. You should see the notification. Select the **Related** chevron button and then select **Activities**,

[![Screenshot showing the related activities button.](media/activities.png)](media/activities.png#lightbox)
17. You should see the created task. Make sure the **Due Date** is set to 7 days from current date.

[![Screenshot showing the created task record.](media/due.svg)](media/due.svg#lightbox)
