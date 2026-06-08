# Quiz: Canvas App Instrumentation with Application Insights

> **Source material:** 1-introduction.md, 2-configure.md, 3-view-app-insights.md, 4-custom-logging.md, 5-exercise.md, 6-check.md, 7-summary.md
> **Total questions:** 22
> **Question types:** Multiple choice (single), Multiple choice (multi-select), Fill-in-the-blank

---

## Questions

### Question 1 — Single Choice

You have built a canvas app and shared it with hundreds of users in your organization. You want to start monitoring how the app is performing and which screens are used most often.

What must you configure on the canvas app to enable telemetry to be sent to Application Insights?

- A. A connection string on the App object
- B. The Instrumentation Key on the App object
- C. The App ID registered in Microsoft Entra ID
- D. A resource token from the Azure portal

<details>
<summary>Answer</summary>

**Correct answer:** B. The Instrumentation Key on the App object

**Explanation:** Canvas apps send telemetry to Application Insights when the Instrumentation Key is set on the App object in Power Apps Studio. After setting the key and publishing the app, the Power Apps runtime automatically sends basic screen telemetry for each published run.

</details>

---

### Question 2 — Single Choice

A developer has set the Instrumentation Key on a canvas app and is actively building new features in Power Apps Studio. They notice that no new telemetry is appearing in Application Insights.

Which statement explains this behavior?

- A. The Instrumentation Key only works in production environments.
- B. Telemetry requires the Azure Monitor agent to be installed on the developer's machine.
- C. Telemetry is only captured when the published app is run outside of Power Apps Studio.
- D. The developer must call the Trace() function before any automatic telemetry is sent.

<details>
<summary>Answer</summary>

**Correct answer:** C. Telemetry is only captured when the published app is run outside of Power Apps Studio.

**Explanation:** Usage from within Power Apps Studio while building the app does not send telemetry to Application Insights. Only the published app, when run by users outside of the Studio, generates telemetry data.

</details>

---

### Question 3 — Single Choice

Your organization is evaluating the cost of using Application Insights to monitor a low-traffic internal canvas app that generates sporadic data.

Which pricing model does Application Insights use, and what is included at no additional cost?

- A. Flat monthly fee with unlimited data ingestion
- B. Pay-as-you-go based on data volume ingested; each billing account includes 5 GB of free log data ingestion
- C. Per-user licensing with 1 GB of data per licensed user
- D. Pay-as-you-go based on the number of events logged, with no free tier

<details>
<summary>Answer</summary>

**Correct answer:** B. Pay-as-you-go based on data volume ingested; each billing account includes 5 GB of free log data ingestion

**Explanation:** Application Insights uses a pay-as-you-go model based on data volume ingested and, optionally, longer data retention. Each billing account includes 5 GB of free log data ingestion, so low-usage apps with sporadic data may incur no additional ingestion cost.

</details>

---

### Question 4 — Single Choice

Your team maintains five canvas apps and wants to configure Application Insights so that each app's telemetry is easy to analyze independently.

What is the recommended approach?

- A. Use a single Application Insights resource with the same Instrumentation Key for all apps, then use ms-appId to filter.
- B. Configure separate Application Insights resources with individual Instrumentation Keys for each app.
- C. Use a single Log Analytics workspace for all apps and differentiate by app name.
- D. Create cohorts in Application Insights to separate the data from each app.

<details>
<summary>Answer</summary>

**Correct answer:** B. Configure separate Application Insights resources with individual Instrumentation Keys for each app.

**Explanation:** When each app has its own Application Insights resource and Instrumentation Key, the event data is separated, making it easier to visualize single-app usage patterns. Sharing a single resource mixes data from all apps in the default visualizations, making per-app analysis more difficult.

</details>

---

### Question 5 — Single Choice

Multiple canvas apps share the same Application Insights resource and Instrumentation Key. A developer needs to write a log query that returns traces only from a specific app.

Which automatically added property should the developer use to filter by app?

- A. ms-appVersion
- B. ms-appSessionId
- C. ms-appName
- D. ms-appId

<details>
<summary>Answer</summary>

**Correct answer:** D. ms-appId

**Explanation:** When multiple apps log data to the same Application Insights resource, each app's events include an ms-appId property that uniquely identifies the app. Developers can use ms-appId in log queries to filter traces for a specific app.

</details>

---

### Question 6 — Single Choice

A developer uses Power Platform CLI to unpack a canvas app that has an Instrumentation Key configured. They want to use source control to maintain different keys for development and production environments.

In which file does the CLI store the unpacked Instrumentation Key?

- A. config.json
- B. settings.json
- C. AppInsightsKey.json
- D. telemetry.json

<details>
<summary>Answer</summary>

**Correct answer:** C. AppInsightsKey.json

**Explanation:** When using the Power Platform CLI to unpack an app that has the Instrumentation Key set up, the key is stored in a file named AppInsightsKey.json. This allows teams to use source control strategies to apply different keys per environment.

</details>

---

### Question 7 — Single Choice

A Power Apps maker has just configured Application Insights for a newly published canvas app. They want to understand app adoption and start by checking how many users have run the app.

Which Application Insights section is the recommended starting point?

- A. Monitoring > Logs
- B. Monitoring > Workbooks > App Performance Index
- C. Usage > Users
- D. Investigate > Transaction Search

<details>
<summary>Answer</summary>

**Correct answer:** C. Usage > Users

**Explanation:** The recommended starting point is Usage > Users, which allows you to visualize summary data for a time period and drill down into more detail about who is using the app and how often.

</details>

---

### Question 8 — Single Choice

A developer wants to use the Trace() function to record that a validation rule failed and include the number of hours worked in the logged record.

Which syntax correctly represents this call?

- A. `Trace(TraceSeverity.Warning, "Validation Failed", {hoursWorked: ThisItem.HoursWorked})`
- B. `Trace("Validation Failed", TraceSeverity.Warning, {hoursWorked: ThisItem.HoursWorked})`
- C. `Trace({hoursWorked: ThisItem.HoursWorked}, "Validation Failed", TraceSeverity.Warning)`
- D. `Trace("Validation Failed", {hoursWorked: ThisItem.HoursWorked}, TraceSeverity.Warning)`

<details>
<summary>Answer</summary>

**Correct answer:** B. `Trace("Validation Failed", TraceSeverity.Warning, {hoursWorked: ThisItem.HoursWorked})`

**Explanation:** The Trace() function signature is `Trace(message, trace_severity, custom_record)`. The message parameter is required and comes first, followed by the optional severity level, then the optional custom record containing context data fields.

</details>

---

### Question 9 — Single Choice

A developer wants to query all custom events logged by their canvas app using the Trace() function. They open the Logs section of Application Insights on the Azure portal.

Which table name should they use in their Kusto query?

- A. customEvents
- B. pageViews
- C. telemetry
- D. traces

<details>
<summary>Answer</summary>

**Correct answer:** D. traces

**Explanation:** Custom events logged by the Trace() function are stored in the `traces` table. The `pageViews` table is used for screen navigation events that are automatically sent by the Power Apps runtime.

</details>

---

### Question 10 — Single Choice

A canvas app has been configured with an Instrumentation Key and published to a development environment. The app is then exported and imported into a test environment with no additional changes.

What happens to the telemetry when the app is run in the test environment?

- A. The app stops sending telemetry until a new key is configured for the test environment.
- B. The app uses the same Instrumentation Key and logs to the same Application Insights resource as development.
- C. The app generates a new Instrumentation Key automatically from the test environment.
- D. The test environment clears the Instrumentation Key for security reasons.

<details>
<summary>Answer</summary>

**Correct answer:** B. The app uses the same Instrumentation Key and logs to the same Application Insights resource as development.

**Explanation:** By default, if you transport the app to test and production environments, it will use the same Instrumentation Key and log to the same Application Insights resource. Environment variables are not currently supported for configuring the Instrumentation Key.

</details>

---

### Question 11 — Single Choice

A developer queries trace data in Application Insights and wants to examine the custom context data that was passed when the Trace() function was called.

Which property in the query results contains this information?

- A. properties
- B. dimensions
- C. customDimensions
- D. traceData

<details>
<summary>Answer</summary>

**Correct answer:** C. customDimensions

**Explanation:** In the query results, each trace row contains a customDimensions property that can be expanded to show the named fields that were logged as context data when the Trace() function was invoked. Automatically added ms-* fields are also included here.

</details>

---

### Question 12 — Single Choice

A team wants to receive a daily email summarizing all errors logged by users of their canvas app. They plan to build this workflow using Azure and Microsoft Power Platform services.

Which combination of tools enables this automated reporting?

- A. Power BI and a scheduled dataset refresh
- B. Power Automate with the Azure Monitor connector
- C. Azure Data Factory and Power BI streaming dataset
- D. Application Insights Alerts with an email action

<details>
<summary>Answer</summary>

**Correct answer:** B. Power Automate with the Azure Monitor connector

**Explanation:** By using the Azure Monitor connector in Power Automate, you can build automated workflows that use data from your Application Insights workspace. For example, you could create a flow that sends a daily email containing a list of errors logged by users of your app.

</details>

---

### Question 13 — Single Choice

A developer adds Trace() calls to a canvas app in production to help diagnose a reported issue. They need to confirm that the trace data is visible somewhere other than Application Insights.

In addition to Application Insights, where else is Trace() data visible?

- A. Power Apps Studio Formula Bar and Dataverse audit logs
- B. The Monitor tool and Power Apps Test Studio results
- C. Power Automate run history and Azure Log Analytics
- D. Azure DevOps dashboards and Teams notifications

<details>
<summary>Answer</summary>

**Correct answer:** B. The Monitor tool and Power Apps Test Studio results

**Explanation:** In addition to logging data to Application Insights, trace data is also visible in the Monitor tool and Power Apps Test Studio results, making it useful for debugging and testing as well as production monitoring.

</details>

---

### Question 14 — Multi-Select

A maker wants to configure a new canvas app to send telemetry to Application Insights. They need to identify the required steps to complete this setup.

Which two steps are required? (Select **two**.)

- A. Install the Application Insights connector from the Power Apps connector catalog
- B. Provision an Application Insights resource in the Azure portal
- C. Set the Instrumentation Key on the App object in Power Apps Studio and publish the app
- D. Enable the telemetry feature toggle in the Power Apps admin center
- E. Add a Trace() call to the app's OnStart property

<details>
<summary>Answer</summary>

**Correct answer:** B. Provision an Application Insights resource in the Azure portal; C. Set the Instrumentation Key on the App object in Power Apps Studio and publish the app

**Explanation:** Setting up a canvas app for Application Insights requires two steps: (1) provisioning an Application Insights resource in the Azure portal to obtain an Instrumentation Key, and (2) setting that key on the App object in Power Apps Studio and publishing the app. No connector installation, admin toggle, or Trace() call is required for basic telemetry.

</details>

---

### Question 15 — Multi-Select

A developer is designing a strategy for adding Trace() function calls to a new canvas app. They need to identify the valid scenarios for instrumentation.

Which three of the following are appropriate use cases for Trace() calls? (Select **three**.)

- A. Logging when a user views a specific job record in a gallery
- B. Improving delegation limits on SharePoint data sources
- C. Recording which validation fields failed when a user submits a form
- D. Logging when a user cancels a multi-step action
- E. Replacing the built-in Power Apps runtime screen telemetry

<details>
<summary>Answer</summary>

**Correct answer:** A. Logging when a user views a specific job record in a gallery; C. Recording which validation fields failed when a user submits a form; D. Logging when a user cancels a multi-step action

**Explanation:** Trace() is used to capture custom app events such as viewing records, validation failures, and user actions like cancellations. It complements, rather than replaces, the automatic runtime telemetry. Trace() does not affect delegation behavior.

</details>

---

### Question 16 — Multi-Select

A maker is reviewing best practices for using the Trace() function. They need to identify which guidelines should be followed when composing Trace() calls.

Which three guidelines are recommended? (Select **three**.)

- A. Avoid logging sensitive data such as customer names and email addresses
- B. Use a different field name in every Trace() call to maximize data variety
- C. Send only the data that is needed for analysis or querying
- D. Use consistent field names across related Trace() calls to simplify querying
- E. Always set trace severity to Critical to ensure the data is captured

<details>
<summary>Answer</summary>

**Correct answer:** A. Avoid logging sensitive data such as customer names and email addresses; C. Send only the data that is needed for analysis or querying; D. Use consistent field names across related Trace() calls to simplify querying

**Explanation:** Best practices for Trace() include avoiding sensitive data to prevent compliance issues, sending only what is needed to avoid excessive data volume, and using consistent field names to make log queries easier. Varying field names and always using Critical severity are both discouraged.

</details>

---

### Question 17 — Multi-Select

A team wants to analyze Application Insights data using tools beyond the built-in Azure portal visualizations. They need to identify which external tools can be integrated.

Which two tools can be used to consume Application Insights data outside of the Azure portal? (Select **two**.)

- A. Azure Data Studio
- B. Power BI, by importing log data into a Power BI dataset
- C. Microsoft Purview compliance dashboards
- D. Power Automate using the Azure Monitor connector
- E. Azure Synapse Analytics real-time streams

<details>
<summary>Answer</summary>

**Correct answer:** B. Power BI, by importing log data into a Power BI dataset; D. Power Automate using the Azure Monitor connector

**Explanation:** Application Insights data can be imported into a Power BI dataset for custom visualizations, and the Azure Monitor connector in Power Automate can be used to build automated workflows based on Application Insights data such as error summaries.

</details>

---

### Question 18 — Fill-in-the-Blank

To enable a canvas app to send telemetry to Application Insights, a maker must set the ___ property on the App object in Power Apps Studio and then save and publish the app.

<details>
<summary>Answer</summary>

**Answer:** Instrumentation Key

**Explanation:** The Instrumentation Key, copied from the Application Insights resource in the Azure portal, must be pasted into the Instrumentation Key field in the App object's Properties pane. Once the app is published, the Power Apps runtime will automatically send basic telemetry.

</details>

---

### Question 19 — Fill-in-the-Blank

The Power Fx function ___ is used to send custom event data from a canvas app to Application Insights. Its first parameter, which is ___, identifies the purpose of the call.

<details>
<summary>Answer</summary>

**Answer:** Trace(); required (message)

**Explanation:** The Trace() function enables custom logging from within a canvas app. The message parameter is mandatory and should describe why the trace was called, such as "Timesheet Validation Failed". The severity and custom record parameters are optional.

</details>

---

### Question 20 — Fill-in-the-Blank

When using Power Platform CLI to unpack a canvas app that has an Instrumentation Key configured, the key is stored in a file named ___.

<details>
<summary>Answer</summary>

**Answer:** AppInsightsKey.json

**Explanation:** The Power Platform CLI unpacks the Instrumentation Key into a file named AppInsightsKey.json. This enables source control strategies that allow different Application Insights keys to be used per environment (development, test, production).

</details>

---

### Question 21 — Fill-in-the-Blank

In Application Insights log queries, screen navigation events automatically sent by the Power Apps runtime are stored in the ___ table, while custom events logged using the Trace() function are stored in the ___ table.

<details>
<summary>Answer</summary>

**Answer:** pageViews; traces

**Explanation:** The Power Apps runtime automatically logs screen navigation to the pageViews table. Custom events generated by Trace() function calls appear in the traces table. Knowing the correct table name is essential for writing targeted KQL queries.

</details>

---

### Question 22 — Fill-in-the-Blank

In Application Insights, a ___ is a defined set of users, events, or operations that share a common property. Once defined, it can be used to ___ any Application Insights visualization.

<details>
<summary>Answer</summary>

**Answer:** cohort; filter

**Explanation:** Cohorts allow you to group users or events that meet a common criterion — for example, all users of a specific screen or all users from a particular country/region. You can then apply the cohort as a filter across built-in visualizations such as Users, Sessions, and Metrics.

</details>
