# Exercise - Collect and analyze telemetry data

> 15 minutes

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

- An environment with Microsoft Dataverse installed
- A Microsoft Azure subscription

---

## Exercise 1: Import a solution

In this exercise, you'll import a solution into your environment. This solution contains a working canvas application. You'll modify it later to add tracing to certain user actions and then analyze the results.

### Task: Import a solution

1. Download the [ContosoCostEstimator_1_0_0_1.zip](https://github.com/MicrosoftDocs/mslearn-developer-tools-power-platform/blob/master/power-apps/collect-analyze-telemetry-data/ContosoCostEstimator_1_0_0_1.zip) solution file.
2. Go to [Power Apps maker portal](https://make.powerapps.com/) and select the environment you want to use for this lab.
3. Select **Solutions > Import**.
4. Select **Browse**.
5. Select the **ContosoCostEstimator_1_0_0_1.zip** solution, and then select **Open**.
6. Select **Next**.
7. Select **Import** and then wait for the solution importing to complete.

---

## Exercise 2: Set up the app

In this exercise, you'll set up the app for Application Insights.

### Task: Create an Application Insights app

1. Go to the [Microsoft Azure portal](https://portal.azure.com/) and select **Create a resource**.
2. Search for and select **Application Insights**.
3. Select **Create**.
4. Select your subscription and then select **Create new** under the **Resource Group** dropdown list.
5. Enter **fl_insights** for **Name** (replace **fl** with your initials) and then select **OK**.
6. Enter **Insights_Lab** for **Name**, select your **Region**, and then select **Review + create**.
7. Select **Create** and then wait for the resource to be created.
8. Select **Go to resource**.
9. Copy the **Instrumentation Key**.
10. Go to the [Power Apps maker portal](https://make.powerapps.com/) and select the correct environment.
11. Select **Solutions** and then open the **Contoso Cost estimator** solution.
12. Open the **Cost Estimator** application in app studio.
13. Select **App**, go to the **Properties** pane, and then paste the Instrumentation Key in the **Instrumentation key** field.
14. Select the **Save** icon.
15. Select the **Publish** icon.
16. Select **Publish this version** and then wait for publishing to complete.
17. Select the **back** button.
18. Select **Play**.
19. Make sure that the app loads the data, then close the preview.

---

## Exercise 3: Edit and add trace

In this exercise, you'll add trace to the application by modifying formulas.

### Task: Add trace

1. Expand **OpenJobsPage**.
2. Expand **JobsListGallery** and then select **icon2**.
3. Append the **OnSelect** value of **icon2** with the following formula:

    ```powerappsfl
    ;Trace("Job Viewed", TraceSeverity.Information, {JobId: ThisItem.JobId, JobName: ThisItem.JobName})
    ```

4. Select **NewJob** page from the **Tree view**.
5. Select the **Save job** button.
6. Go to the formula bar, select **OnSelect**, and then expand the formula bar.
7. Select **Format text**.
8. Scroll down and locate **UpdateContext**. Two occurrences should be shown.
9. Add the following formula after the **first** `UpdateContext` occurrence:

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

10. Go to the **second** `UpdateContext` occurrence and add the same formula.
11. Select the **Save** icon.
12. Select the **Publish** icon.
13. Select **Publish this version** and then wait for publishing to complete.
14. Close the app studio browser window or tab.

---

## Exercise 4: Run the published app

In this exercise, you'll run the published application to generate telemetry data.

### Task: Run the application

1. Go to the [Power Apps maker portal](https://make.powerapps.com/) and make sure you are in the correct environment.
2. Select **Apps** and then launch the **Cost Estimator** application.
3. Select to open a job.
4. Select the **back** button.
5. Open another job and then select the **back** button again.
6. Open a few more jobs.
7. Select the plus (**+**) icon to add a job.
8. Select **Save job** without providing data.
9. Provide a **Client name** and then select **Save job**.
10. Provide an **Email** and then select **Save job**.
11. Provide an **Address** and then select **Save job**.
12. Provide **City** and **State** information and then select **Save job**.
13. Provide **Zip code** and **Phone** information and then select **Save job**. The job should be saved.
14. Create another job, but provide a contact name and leave some required fields empty.

---

## Exercise 5: View Application Insights

### Task: View Application Insights

1. Go to the [Microsoft Azure portal](https://portal.azure.com/).
2. Select to open the **Insights_Lab** resource.
3. Scroll down to the **Usage** section and select **Users**.
4. At least one user should display. If not, verify the Instrumentation key and republish.
5. From the chart, scroll down and select **View more insights**.
6. At least five events should show. If not, return to Exercise 4 and complete it again. Wait five minutes before continuing.
7. Scroll down and select **View user timeline**.
8. Information about the use location and events should display. Select to expand the session.
9. View the listed events.
10. Go to the **Monitoring** section and select **Logs**.
11. Close the **Queries** pop-up window.

---

## Exercise 6: Query the logs

### Task: Query the logs

1. Type `pageViews` and then select **Run**.
2. Go to the **Results** tab and view the traced data.
3. Expand one of the results and then expand **customDimensions**.
4. Change the query to `traces` and then select **Run** again.
5. Expand one of the results and then expand **customDimensions**.
6. Filter for validation logs. Replace the query with the following and then select **Run**:

    ```kusto
    traces
    | where message == "Validation Failed"
    ```

7. Expand one of the results and then expand **customDimensions**.
8. Query for jobs without a contact name. Paste the following query and then select **Run**:

    ```kusto
    traces
    | where message == "Validation Failed"
    | where customDimensions.ContactName == "true"
    ```

    You should get traces with no contact name.
