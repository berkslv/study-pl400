# Exercise - Collect and analyze telemetry data

Completed

- 15 minutes

In this exercise scenario, you have been asked to collect telemetry data from the Cost Estimator application. You have decided to use Application Insights to collect and analyze the telemetry data.

## Tasks

The tasks that you'll complete in this exercise are:

- Add trace that will track viewed jobs.
- Add trace that will track jobs from validation errors.

## Objectives

The objectives of this exercise are to show you how to:

- Create an Application Insights app in Azure.
- Connect a canvas app to Application Insights.
- Add traces to your application.
- Query trace logs.

## Prerequisites

Make sure that you meet the following prerequisites before beginning the exercise:

- An environment with Microsoft Dataverse installed
- A Microsoft Azure subscription: [Azure - Sign up](https://signup.azure.com/signup?offer=ms-azr-0044p&amp;appId=102&amp;ref=portal&amp;redirectURL=https:%2F%2Fazure.microsoft.com%2Fen-us%2Fget-started%2Fwelcome-to-azure%2F&amp;l=en-us&amp;correlationId=a18965c7a16f4722a855a8e7953047f3)

## Exercise 1: Import a solution

In this exercise, you'll import a solution into your environment. This solution contains a working canvas application. You'll modify it later to add tracing to certain user actions and then analyze the results.

### Task: Import a solution

In this task, you'll import a solution into your environment.

1. You'll need to download the [zip file](https://github.com/MicrosoftDocs/mslearn-developer-tools-power-platform/blob/master/power-apps/collect-analyze-telemetry-data/ContosoCostEstimator_1_0_0_1.zip) to complete this exercise. Select download once the link opens.
2. Go to [Power Apps maker portal](https://make.powerapps.com/?azure-portal=true) and select the environment that you want to use for this lab.
3. Select **Solutions &gt; Import**.

[![Screenshot of the Import button in the Solutions area.](media/import-button.png)](media/import-button.png#lightbox)
4. Select **Browse**.
5. Select the **ContosoCostEstimator\_1\_0\_0\_1.zip** solution, and then select **Open**.
6. Select **Next**.
7. Select **Import** and then wait for the solution importing to complete.

## Exercise 2: Set up the app

In this exercise, you'll set up the app for Application Insights. If you have an active Azure subscription that is associated with your lab user, follow the steps in this section. If you don't have an active Azure subscription, you'll be prompted to add it while following these steps. The free Azure subscription that is offered will be enough for you to complete this lab.

### Task: Create an Application Insights app

In this task, you'll create an Application Insights app in Microsoft Azure, which requires an active Azure subscription. If you don't have an Azure subscription, you can [sign up](https://signup.azure.com/signup?offer=ms-azr-0044p&amp;appId=102&amp;ref=portal&amp;redirectURL=https:%2F%2Fazure.microsoft.com%2Fen-us%2Fget-started%2Fwelcome-to-azure%2F&amp;l=en-us&amp;correlationId=a18965c7a16f4722a855a8e7953047f3).

1. Go to the [Microsoft Azure portal](https://portal.azure.com/?azure-portal=true) and select **Create a resource**.

[![Screenshot of the Create a resource button.](media/create-resource.png)](media/create-resource.png#lightbox)
2. Search for and select **Application Insights**.
3. Select **Create**.
4. Select your subscription and then select **Create new** under the **Resource Group** dropdown list.
5. Enter **fl\_insights** for **Name** and then select **OK**. Replace **fl** with your initials.

[![Screenshot of the create resource group window.](media/resource-group.png)](media/resource-group.png#lightbox)
6. Enter **Insights\_Lab** for **Name**, select your **Region**, and then select **Review + create**.
7. Select **Create** and then wait for the resource to be created.
8. Select **Go to resource**.
9. Copy the **Instrumentation Key**.

[![Screenshot of the Instrumentation Key.](media/instrumentation-key.png)](media/instrumentation-key.png#lightbox)
10. Go to the [Power Apps maker portal](https://make.powerapps.com/?azure-portal=true) and select the environment that you're using for this lab.
11. Select **Solutions** and then select to open the **Contoso Cost estimator** solution that you imported.
12. Select to open the **Cost Estimator** application. The application should open in app studio.
13. Select **App**, go to the **Properties** pane, and then paste the instrumentation key that you copied from the **Instrumentation Key** field.

[![Screenshot of the Instrumentation key pasted in the properties.](media/properties-instrumentation-key.png)](media/properties-instrumentation-key.png#lightbox)
14. Select the **Save** icon.
15. Select the **Publish** icon.
16. Select **Publish this version** and then wait for the publishing to complete.
17. Select the **back** button.
18. Select **Play**.
19. Make sure that the app loads the data.

[![Screenshot of the Cost Estimator application.](media/cost-estimator.png)](media/cost-estimator.png#lightbox)
20. Close the preview.
21. Don't navigate away from this page.

## Exercise 3: Edit and add trace

In this exercise, you'll add trace to the application by modifying formulas that are already part of the working app from Power Apps.

### Task: Add trace

In this task, you'll add trace to the application.

1. Expand **OpenJobsPage**.
2. Expand **JobsListGallery** and then select **icon2**.

[![Screenshot of the icon control.](media/icon-control.png)](media/icon-control.png#lightbox)
3. Append the **OnSelect** value of **icon2** with the following formula. This trace will track which jobs are being viewed.

    `;Trace("Job Viewed",TraceSeverity.Information,{JobId:ThisItem.JobId, JobName:ThisItem.JobName})`

[![Screenshot of the formula being edited.](media/edit-formula.png)](media/edit-formula.png#lightbox)
4. Select **NewJob** page from the **Tree view**.
5. Select the **Save job** button.

[![Screenshot of the Save job button.](media/save-job.png)](media/save-job.png#lightbox)
6. Go to the formula bar, select **OnSelect**, and then expand the formula bar.

[![Screenshot of the expand formula bar button.](media/expand-formula.png)](media/expand-formula.png#lightbox)
7. Select **Format text**.

[![Screenshot of the Format text button.](media/format-text.png)](media/format-text.png#lightbox)
8. Scroll down and locate **UpdateContext**. Two occurrences should be shown.

[![Screenshot of the two UpdateContext occurrences.](media/update-context.png)](media/update-context.png#lightbox)
9. Add the following formula after the first **UpdateContext** occurrence.

    ```powerappsfl
     ;
     Trace(
             "Validation Failed",
             TraceSeverity.Warning,
             {
                 JobName: IsBlank(TextInputClientName.Text),
                 ContactName: IsBlank(TextInput1_15.Text),
                 Phone: IsBlank(TextInputPhone.Text),
                 Email: IsBlank(TextInputEmail.Text),
                 AppointmentDate: IsBlank(TextInputDate.Text),
                 AppointmentTime: IsBlank(TextInputTime.Text)
             }
         )
    ```

[![Screenshot of the formula edit area.](media/formula-edit.png)](media/formula-edit.png#lightbox)
10. Go to the second **UpdateContext** occurrence and add the same formula.

[![Screenshot of the second formula edit area.](media/formula-edit-2.png)](media/formula-edit-2.png#lightbox)
11. Select the **Save** icon.
12. Select the **Publish** icon.
13. Select **Publish this version** and then wait for the publishing to complete.
14. Close the app studio browser window or tab.

## Exercise 4: Run the published app

In this exercise, you'll run the published application, which will trigger the tracing that you added. Additionally, it will give you data to analyze in the steps that follow.

### Task: Run the application

In this task, you'll run the application that you published.

1. Go to the [Power Apps maker portal](https://make.powerapps.com/?azure-portal=true) and make sure that you are in the correct environment.
2. Select **Apps** and then select to launch the **Cost Estimator** application.
3. Select to open a job.

[![Screenshot of the row from the gallery.](media/row.png)](media/row.png#lightbox)
4. Select the **back** button.
5. Open another job and then select the **back** button again.
6. Open a few more jobs.
7. Select the plus (**+**) icon to add a job.
8. Select **Save job** without providing data, which will give you data to analyze where the user didn't follow the expected data entry path.

[![Screenshot of the Cost Estimator form.](media/cost-estimator-form.png)](media/cost-estimator-form.png#lightbox)
9. Provide a **Client name** and then select **Save job**.
10. Provide an **Email** and then select **Save job**.
11. Provide an **Address** and then select **Save job**.
12. Provide **City** and **State** information and then select **Save job**.
13. Provide **Zip code** and **Phone** information and then select **Save job**.

[![Screenshot of the completed Cost Estimator form.](media/cost-estimator-form-2.png)](media/cost-estimator-form-2.png#lightbox)

    The job should be saved.
14. Create another job, but this time, provide a contact name and then leave some of the required fields empty.

## Exercise 5: View Application Insights

In this exercise, you'll view Application Insights.

### Task: View Application Insights

In this task, you view Application Insights.

1. Go to the [Microsoft Azure portal](https://portal.azure.com/?azure-portal=true) and make sure that you are in the correct environment.
2. Select to open the **Insights\_Lab** resource that you created.

[![Screenshot of the Insights_Lab resource.](media/insights-lab.png)](media/insights-lab.png#lightbox)
3. Scroll down to the **Usage** section and select **Users**.

[![Screenshot of the Users option in the Usage section.](media/users.png)](media/users.png#lightbox)
4. At least one user should display. If at least one user doesn't show, edit the app again, make sure that you provided the correct Instrumentation key, and then publish it again.

[![Screenshot showing one user in the user count.](media/user-count.png)](media/user-count.png#lightbox)
5. From the chart, scroll down and select **View more insights** in the lower left of the chart.

[![Screenshot of the View More Insights button.](media/view-more-insights.png)](media/view-more-insights.png#lightbox)
6. At least five events should show. If at least five events don't show, then return to Exercise 4 and complete it again. Wait for five minutes before continuing.
7. Scroll down and select **View user timeline**.

[![Screenshot of the View user timeline button.](media/user-timeline.png)](media/user-timeline.png#lightbox)
8. Information about the use location and events should display. Select to expand the session.

[![Screenshot of the expand session button.](media/expand-session.png)](media/expand-session.png#lightbox)
9. View the listed events.

[![Screenshot of the session events.](media/session-events.png)](media/session-events.png#lightbox)
10. Go to the **Monitoring** section and select **Logs**.

[![Screenshot of the Logs button.](media/logs.png)](media/logs.png#lightbox)
11. Close the **Queries** pop-up window.
12. Don't navigate away from this page.

## Exercise 6: Query the logs

In this exercise, you'll query the logs.

### Task: Query the logs

In this task, you'll query the logs.

1. Type **pageViews** and then select **Run**.

[![Screenshot of the Run query button.](media/run-query.png)](media/run-query.png#lightbox)
2. Go to the **Results** tab.
3. Traces should display. Scroll up/down and left/right to view what was traced.
4. Expand one of the results and then select to expand **customDimensions**.

[![Screenshot of the expand button next to customDimensions.](media/expand-custom-dimensions.png)](media/expand-custom-dimensions.png#lightbox)
5. Change the query to **traces** and then select **Run** again.

[![Screenshot of the Run query button to run it again.](media/run-query-2.png)](media/run-query-2.png#lightbox)
6. Expand one of the results and then select to expand **customDimensions**.
7. Filter for validation logs. Replace the query with the following query logic and then select **Run**.

    ```powerappsfl
     traces
     | where message =="Validation Failed"
    ```

[![Screenshot of the query traces with the Run button highlighted.](media/query-traces.png)](media/query-traces.png#lightbox)
8. Expand one of the results and then select to expand **customDimensions**.

[![Screenshot of the query results.](media/query-results.png)](media/query-results.png#lightbox)
9. Query for jobs without a contact name. Paste the following query and then select **Run**.

[![Screenshot of the trace query showing the Run button.](media/query-traces-run.png)](media/query-traces-run.png#lightbox)

    You should get traces with no contact name.
