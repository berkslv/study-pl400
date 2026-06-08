# Exercise - Work with Dataverse relational data

Completed

- 15 minutes

Contoso, like many companies, has multiple locations and allows employees to work from home. Occasionally, employees need to come into the office and need a desk to use during their visit. Previously, Contoso instructed their employees to walk around the office location on arrival to find an available desk. The company has since discovered that this type of shared workspace system, or *hot desking*, has created challenges for IT support and licensing. As a result, Contoso has recently built a Microsoft Power Platform solution that allows employees to view which desks are available and reserve one in advance.

In this exercise, you'll be enhancing the canvas app from Power Apps.

## Objectives

The objectives for this exercise are for you to learn how to work with the following relationships:

- One-to-many and many-to-one
- Many-to-many

## Prerequisite

To complete this exercise, you'll need an environment with Microsoft Dataverse.

## Exercise 1: Import a solution

In this exercise, you'll import a starting solution into your test environment and then load sample data by using a Microsoft Power Automate cloud flow. This solution contains five tables, one canvas application, one model-driven application, and one cloud flow.

### Task 1: Import the starting solution

In this task, you'll import a solution into your environment.

1. You'll need to download the [zip file](https://github.com/MicrosoftDocs/mslearn-developer-tools-power-platform/blob/master/power-apps/relational-data/ContosoHotDesking_1_0_0_0.zip) to complete this exercise. Select download once the link opens.
2. Navigate to [Power Apps maker portal](https://make.powerapps.com/?azure-portal=true), and select the environment you would like to use for this lab.
3. Select **Solutions &gt; Import Solution**.

[![Screenshot of the Import solution button.](media/import.svg)](media/import.svg#lightbox)
4. Select **Browse**.
5. Select the ContosoHotDesking\_1\_0\_0\_0.zip solution, and select **Open**.
6. Select **Next**.
7. Select **Next** again.
8. In the **Select a connection** dropdown list, if your credentials are already provided, Select **Import** and skip to Task 2. Otherwise, select **+ New connection**.

[![Screenshot of the New connection button in the Select a connection dropdown list.](media/new-connection.png)](media/new-connection.png#lightbox)
9. Select **Create**.
10. Provide your credentials.
11. Close the connections browser window or tab.
12. Select **Refresh**.
13. Select **Import** and then wait for the solution importing to complete.

### Task 2: Load sample data

In this task, you'll run a cloud flow that will create sample data.

1. Select **Solutions**, and then select to open the **Contoso hot desking** solution that you imported.
2. Select **Cloud flows**, and then select to open the **Load Sample Hot Desk Data** flow.

[![Screenshot of the Load Sample Hot Desk Data flow button.](media/load-data.png)](media/load-data.png#lightbox)
3. Once the flow opens, select **Run** from the command bar.
4. Select **Run flow** from the bottom of the dialog box.
5. Select **Done**, and then wait for the flow run to complete. Select the **Refresh** button to view the flow run status. A **Succeeded** status should display when the flow run completes.

[![Screenshot of the Refresh button.](media/refresh.png)](media/refresh.png#lightbox)

### Task 3: Run apps

In this task, you'll run the **Hot Desking Manager** and **Hot Desking** applications to become familiar with them. Then, you'll finish setting up the data.

1. Return to your solution, or you can go to the [Power Apps maker portal](https://make.powerapps.com/?azure-portal=true), and select the environment and solution that you're using for this lab.
2. Select **Apps** and select the **Hot Desking Manager** application to launch it.

[![Screenshot of the Hot Desking Manager application link.](media/launch-application.png)](media/launch-application.png#lightbox)
3. Select **Desks view** and make sure that you have sample data.
4. Select **Locations view** and make sure that you have sample data.
5. Select **Desk Features view** and make sure that you have sample data.
6. Select **Locations**, select three locations, and then select **Edit**.

[![Screenshot of three locations selected in the Active Locations dropdown list, with the Edit button highlighted.](media/edit-rows.png)](media/edit-rows.png#lightbox)
7. In the **Primary Contact** field select a user, and then select **Save**.

[![Screenshot of the Primary Contact field, with the user selected.](media/primary-contact.png)](media/primary-contact.png#lightbox)
8. Close the **Hot Desking Manager** application by selecting **Back**.
9. Make sure that you still have **Apps** selected, select the **Hot Desking** application, and then select **Edit**. The application should open in make.powerapps.com.

[![Screenshot of the Edit button highlighted and the Hot Desking application selected.](media/edit-application.png)](media/edit-application.png#lightbox)
10. Select the **HomeScreen** and then select **Play**.
11. Select the **New Reservation** button.
12. Select **Building 1**, **Enclosed Office**, and **Desk # 1**.

[![Screenshot of the Contoso Hot Desking reservation form.](media/reservation-form.png)](media/reservation-form.png#lightbox)
13. Select a future date and then select **Book** for **9:00**.
14. Select **New Reservation** again.
15. Select **Building 2**, **Teams Room**, and **Desk # 2**.
16. Select a future date and then select **Book** for **13:00**.
17. Add a few more reservations with different combinations.
18. You should now have at least four reservations. Close the preview by selecting the **X** in the upper right.

[![Screenshot of the close canvas app preview button.](media/close.png)](media/close.png#lightbox)
19. Expand the **ReserveDeskScreen** dropdown list, expand **Gallery3**, and then select **Button1**.

[![Screenshot of the Button1 control in the ReserveDeskScreen dropdown list.](media/button.png)](media/button.png#lightbox)
20. Go to the formula bar, and review the formula for **OnSelect**. When the user selects the **Book** option, a Patch() function is used to create a new **Reservation** row. This new row has relationships to the desk and your user. The user relationship is set from a global variable that is established in the app on start.

[![Screenshot of the OnSelect button and its formula.](media/button-formula.png)](media/button-formula.png#lightbox)
21. Review other formulas in the application to become familiar with how the process works.
22. Select the **Back** button after you're done reviewing the formulas.

[![Screenshot of the Back button to return to apps.](media/back.png)](media/back.png#lightbox)
23. Don't navigate away from this page.

## Exercise 2: Create a relationship

In this exercise, you'll create a relationship for favorite desks. This relationship will be a many-to-many relationship between the User and Desk tables. This relationship will allow you to implement a feature where a user can tag a desk as a favorite.

### Task: Create a relationship

In this task, you'll create a relationship for favorite desks.

1. Select **Tables**.
2. Select the **Desk** table.

[![Screenshot of the Tables with the Desk table highlighted.](media/desk-table.png)](media/desk-table.png#lightbox)
3. Select the **Relationships** option from the **Schema** pane. Select **+ New relationship**, and then select **Many-to-many**.

[![Screenshot of the Many-to-many relationship selected.](media/relationships.png)](media/relationships.png#lightbox)
4. Find/select **User** for **Related (Many) Table** and then select **Done**.
5. Select the **Back** arrow in the upper left.
6. Return to your solution by selecting **Objects** or **Overview** from the left-side menu, and then select **Publish all customizations** from the command bar.
7. Wait for the publishing process to complete.

## Exercise 3: Add information to a reservation display

In this exercise, you'll change the reservation gallery to show reservations that have been created by the current user instead of showing all reservations. You'll also show more information on the reservation list.

### Task: Edit the application

In this task, you'll edit the Contoso product manager application.

1. Go to the [Power Apps maker portal](https://make.powerapps.com/?azure-portal=true) and return to the environment and solution that you're using for this lab.
2. Select **Apps**, select the **Hot Desking** application, and then open it in **Edit** mode.

[![Screenshot of the Edit application button for the Hot Desking application.](media/edit-application.png)](media/edit-application.png#lightbox)
3. Expand **HomeScreen** and select **Gallery5**.
4. Go to the formula bar and change the **Items** formula to the following formula. This formula will filter for a reservation that is associated with current user, and it uses the one-to-many relationship between the user and reservation table.

    `LookUp(Users,'Primary Email'=currentUserEmail).'Reservations (contoso_Reservation_ReservedFor_SystemUser)'`

[![Screenshot of the items formula.](media/items-formula.png)](media/items-formula.png#lightbox)
5. Select the edit gallery icon.

[![Screenshot of the edit icon button to edit the gallery.](media/edit-gallery.png)](media/edit-gallery.png#lightbox)
6. Go to the **Insert** dropdown and select **Text label**.
7. Then change the **Text** value to the following formula. This formula uses the one-to-many relationship between the reservation and desk tables.

    `ThisItem.Desk.Name`
8. Resize and reposition the label.

[![Screenshot of the label control for resizing and repositioning.](media/resize-reposition.png)](media/resize-reposition.png#lightbox)
9. While still in edit mode, select to add another **Label**.
10. Select the label that you added and set the **Text** value to the following formula. The following formula shows that you're using two levels deep in the relationships, starting from the reservation, and using **Desk** to get the **Location**.

    `ThisItem.Desk.Location.Phone`
11. Resize and reposition the label.

[![Screenshot of the label control position.](media/label-control-position.png)](media/label-control-position.png#lightbox)
12. While still in edit mode, select **Label** one more time.
13. Select the label that you added and set the **Text** value to the following formula.

    `If(IsBlank(ThisItem.Desk.Location.'Primary Contact'),"No Primary Contact",ThisItem.Desk.Location.'Primary Contact'.'Full Name')`
14. Resize and reposition the label.

    The reservation gallery should now appear similar to the following image.

[![Screenshot of the reservation gallery.](media/reservation-gallery.png)](media/reservation-gallery.png#lightbox)
15. Select **Save**.
16. Stay in the app edit screen for the next exercise.

## Exercise 4: Add a favorite desk

In this exercise, you'll add an icon that lets users select favorite desks. You'll also add a label that shows desk features.

### Task: Add a favorite

In this task, you'll add a favorite desk and add a label to show desk features.

1. Expand **FindDeskScreen**, and then select **GalleryDesks**.
2. Select the **Edit** gallery icon.

[![Screenshot of the button for editing the gallery.](media/gallery-edit.png)](media/gallery-edit.png#lightbox)
3. Go to the **Insert** tab, select **Icons**, and then select one of the icons. You'll set the specific icon in the next step by using a formula. Therefore, for this step, it doesn't matter which icon you choose.
4. Select the icon that you added and change the **Icon** value to the following formula. This formula shows the **thumbs up** icon filled if the user didn't indicate this desk as a favorite, or it shows the **thumbs up** icon if the user has already selected the desk as a favorite.

    ```
    `If(CountIf(ThisItem.Users, ThisRecord.User = currentUser.User) > 0, Icon.ThumbsUp,Icon.ThumbsUpFilled)`
    
    > [!NOTE]
    > The CountIf encounters a [delegation](/power-apps/maker/canvas-apps/delegation-overview/?azure-portal=true) issue. If you have a large number of rows in your app, you might have to use an alternate approach.
    ```
5. Make sure that you still have the icon selected. Select **OnSelect** and then paste the following formula. This formula will relate or unrelate this desk and signed-in user, depending on whether the user has already added the desk as a favorite.

    `If(CountIf(ThisItem.Users, ThisRecord.User = currentUser.User) > 0, Unrelate(ThisItem.Users, currentUser), Relate(ThisItem.Users, currentUser))`
6. Reposition the icon in the gallery, as shown in the following image.

[![Screenshot of the icon position.](media/icon-position.png)](media/icon-position.png#lightbox)
7. Make sure you're still in gallery edit mode. Go to the **Insert** tab and select **Text label**.
8. Select the label that you added and set the **Text** value to the following formula. This formula will concatenate the desk feature names and uses the many-to-many relationship between the Desk and Desk Features tables.

    `Concat(ThisItem.'Desk Features', Name, " , " )`
9. Resize and reposition the label to better fit the space.
10. **Save** the app.
11. Select **Play** to preview the app.
12. The gallery should appear like the following image. Select the **thumbs up** icon of one of the desks.

[![Screenshot of the thumbs up desk icon.](media/like-icon.png)](media/like-icon.png#lightbox)
13. The icon should change to thumbs up. Select the icon again.

[![Screenshot of the thumbs up desk icon changed.](media/like-icon-2.png)](media/like-icon-2.png#lightbox)
14. The icon should change back to showing the **thumbs up** icon as filled. Select the icon again.
15. Close the preview.
16. Don't navigate away from this page.

## Exercise 5: Filter desks

In this exercise, you'll add a filter to the desks gallery if the user selects a feature from the dropdown list.

### Task: Filter for features

In this task, you'll add a filter for features.

1. Select **GalleryDesks**.
2. Go to the formula bar and modify your formula for **Items**. This formula filters the desks to show only desks that have the selected feature.

    `Filter(Desks,Location.Location = FilterLocation.Selected.Location,IsBlank(filterFeatures.Selected) || Desk in filterFeatures.Selected.Desks.Desk)`

[![Screenshot of the formula edit area.](media/formula-edit.png)](media/formula-edit.png#lightbox)
3. Save your changes (if necessary).
4. Select **Play** to preview your app.
5. Note the desk features that are available for the selected building.

[![Screenshot of the desk features.](media/features.png)](media/features.png#lightbox)
6. Select a feature from the dropdown list. Only desks that have the selected feature should display.

[![Screenshot of the filtered desks.](media/filtered-desks.png)](media/filtered-desks.png#lightbox)
7. Select different buildings and features to make sure that the application behaves as expected.
8. Close the preview.
9. Close the app designer.
