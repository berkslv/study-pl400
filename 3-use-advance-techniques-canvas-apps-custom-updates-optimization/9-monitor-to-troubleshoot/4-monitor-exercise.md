# Exercise - Debug and collaborate with Monitor in Power Apps

In this exercise scenario, you've created and published the Bottle Management application for your organization, CoHo Winery.

You've received the following feedback:

- Users receive a warning when starting the application.
- Users encounter an error when submitting volume data that includes decimal numbers.

> **Note:** To complete all steps in this lab, you must have access to two users in your environment or work in pairs. If a second user isn't available, complete the available steps and review the paired activities.

## Tasks

In this exercise, you'll complete these tasks:

1. Debug by using the Monitor tool.
2. Resolve the issues.
3. Test your solutions.
4. Publish changes.

## Objectives

The objectives for this exercise are to:

- Use the Monitor tool.
- Debug issues with your canvas app.
- Invite other users to debug sessions.
- Enable debugging for a published app.
- Debug a published app with a connected user.

## Exercise 1: Import a solution and run a flow

### Task 1: Import a solution

1. Download the [solution zip file](https://github.com/MicrosoftDocs/mslearn-developer-tools-power-platform/blob/master/power-apps/troubleshoot-monitor/CohoVineyardMonitorModule_1_0_0_1.zip).
2. Go to [Power Apps maker portal](https://make.powerapps.com/) and select your environment.
3. Select **Solutions > Import solution**.
4. Select **Browse** and upload the zip file.
5. Select **Next** twice.
6. If prompted, create or select a connection.
7. Select **Import** and wait for the process to complete.
8. Wait until the success message appears; you may need to refresh.

### Task 2: Run a flow

1. In the solution, select **Generate Test Data** cloud flow.
2. Select **Run > Run flow**.
3. Select **Done** and wait for 3 to 6 minutes.
4. Return to the solution and open the **CoHo Bottle Management** app.
5. Verify that test data appears on the home screen.

## Exercise 2: Debug and fix a load issue

### Task 1: Debug

1. Open the **CoHo Bottle Management** app in edit mode.
2. Select **Advanced tools > Open live monitor**.
3. Alternatively, use the **App checker > Open monitor**.
4. With Monitor open, return to the browser tab hosting your app and select **Preview**.
5. In the app, select **Refresh**.
6. In Monitor, select the warning event and in the **Filter** panel under **Details** expand the **formulaData** and **data** nodes.
7. Scroll down to review the complete error message and follow the **helpUrl** link if needed.
8. Select **Download** to save the Monitor log. The download allows you to view the issue later or share it with team members.
9. Select **Clear data**.
10. Close Monitor and return to your app.

### Task 2: Fix the formula

1. In Tree view, select **BottleGallery**. Note the delegation warning in the **Items** property, indicated by the squiggly yellow underline. Hover over the warning to see a description of the problem.
2. In the **Items** property, replace the formula with:

    ```powerappsfl
    Filter(Bottles, 'Modified On' > DateAdd(Today(), -7, TimeUnit.Days))
    ```

    The warning should go away.
3. Open Monitor again from **Advanced tools**.
4. In Power Apps, select **Preview > Refresh**.
5. In Monitor, verify no warnings appear.
6. Select **Clear data**, then **Upload** and reload the saved log.
7. Confirm the warning event appears in the saved log. This problem has been resolved.
8. Close Monitor and cancel the preview.

## Exercise 3: Monitor and fix bottle fill issue

### Task 1: Debug fill bottle

1. Open Monitor from **Advanced tools**.
2. In the app, select **Preview**.
3. Enter `28` for **Volume** and select **Fill Bottle**.
4. In Monitor, review the **patchRow** event. Confirm status is **200**.
5. Select **Clear data**.
6. In the app, enter `28.5` for **Volume** and select **Fill Bottle**.
7. In Monitor, review the **patchRow** event. Confirm a type mismatch error occurred.
8. Select **Clear data** but leave Monitor running and return to your app.

### Task 2: Fix the mismatch issue

1. In Tree view, expand **BottleGallery**.
2. Select **ButtonFillBottle**.
3. In the **DisplayMode** property, use:

    ```powerappsfl
    If(IsMatch(TextVolume.Text,Match.MultipleDigits),DisplayMode.Edit,DisplayMode.Disabled)
    ```

4. Select Preview and test values `28`, `28.5`, and `28 oz`.
5. Confirm the **Fill Bottle** button behaves correctly.
6. Use Monitor to confirm no errors. Then close Monitor and cancel Preview.

## Exercise 4: Collaborate

### Task 1: Share a debugging session

1. Open **CoHo Bottle Management** in Power Apps.
2. Select **Advanced tools > Open monitor**.
3. Select **Invite** and add a user from your organization.
4. Copy and share the session link.
5. In the app, select **Preview > Refresh**.
6. In Monitor, confirm both users see the event log.

### Task 2: Debug a published application

1. In the app, select **Settings > Debug published app**.
2. Save and publish the app.

### Task 3: Share and debug a published application

1. Share the app with a user.
2. In the **Admin center**, create a **Bottle Filler** security role.
3. Assign full access to the **Bottle** table.
4. Add your colleague to the role.
5. In Power Apps, select **Apps > Details > Monitor**.
6. In Monitor, select **Play published app**.
7. Use the app and review Monitor logs.
8. Select **Connect user** and invite your colleague.
9. Share the session link.
10. Observe the event logs from your colleague's actions.
11. Close Monitor to end the session.

Monitor helps you debug issues and collaborate in real time with colleagues to improve your canvas apps.
