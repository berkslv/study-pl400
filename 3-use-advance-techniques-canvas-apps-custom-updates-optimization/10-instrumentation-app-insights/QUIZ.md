# Quiz: Instrumentation of Canvas Apps with Application Insights

> **Source material:** 1-introduction.md, 2-configure.md, 3-view-app-insights.md, 4-custom-logging.md, 5-exercise.md, 6-check.md, 7-summary.md, SUMMARY.md
> **Total questions:** 22
> **Question types:** Multiple choice (single), Multiple choice (multi-select), Fill-in-the-blank

---

## Questions

### Question 1 — Single Choice

Your organization has just launched a canvas app for 200 employees. You want to understand which screens are slow and how many people are using the app each day. You have an Azure subscription available.

Which step is required to start collecting telemetry from the canvas app?

- A. Install the Application Insights connector from Microsoft AppSource.
- B. Configure the Instrumentation Key on the app object, then save and publish the app.
- C. Enable telemetry in the Power Apps admin center.
- D. Add the `Monitor()` function to each screen's `OnVisible` property.

<details>
<summary>Answer</summary>

**Correct answer:** B. Configure the Instrumentation Key on the app object, then save and publish the app.

**Explanation:** Canvas apps send telemetry to Application Insights only after you set the Instrumentation Key on the app object in Power Apps Studio, then save and publish the app. No connector or admin center setting is required.

</details>

---

### Question 2 — Single Choice

A developer is testing a new canvas app in Power Apps Studio and wants to verify that telemetry is being captured in Application Insights. After running the app from within Studio for 30 minutes, no data appears in Application Insights.

What is the most likely reason?

- A. The Instrumentation Key is incorrect.
- B. Application Insights has a 24-hour delay before showing data.
- C. Telemetry is only captured when the published app is run outside of Power Apps Studio.
- D. The Azure subscription has not been linked to the Power Platform environment.

<details>
<summary>Answer</summary>

**Correct answer:** C. Telemetry is only captured when the published app is run outside of Power Apps Studio.

**Explanation:** Canvas app telemetry is only sent to Application Insights when users run the published app. Running the app from within Power Apps Studio does not generate telemetry, regardless of whether the Instrumentation Key is configured.

</details>

---

### Question 3 — Single Choice

Your company runs three different canvas apps and wants to use a single Application Insights resource to monitor all of them using the same Instrumentation Key.

Which statement best describes the consequence of this approach?

- A. Each app will have its own isolated dashboard with no data mixing.
- B. Application Insights will reject telemetry from more than one app per resource.
- C. Default visualizations will mix data from all apps, making it harder to analyze a single app.
- D. The `ms-appSessionId` property will be used to separate data from different apps.

<details>
<summary>Answer</summary>

**Correct answer:** C. Default visualizations will mix data from all apps, making it harder to analyze a single app.

**Explanation:** When multiple apps share the same Instrumentation Key, all their data lands in one Application Insights resource. The default visualizations mix that data, making single-app analysis difficult. Each app's events do include an `ms-appId` property, but default views don't filter by it automatically.

</details>

---

### Question 4 — Single Choice

A company uses the Power Platform CLI to unpack and pack its canvas apps as part of a CI/CD pipeline. The app uses an Application Insights Instrumentation Key. They need different keys for development, test, and production environments.

Where is the Instrumentation Key stored after unpacking the app with the CLI?

- A. `settings.json`
- B. `AppInsightsKey.json`
- C. `manifest.yml`
- D. `properties.json`

<details>
<summary>Answer</summary>

**Correct answer:** B. `AppInsightsKey.json`

**Explanation:** When using the Power Platform CLI to unpack an app that has an Instrumentation Key configured, the key is stored in a file named `AppInsightsKey.json`. Teams can use source control strategies to substitute different keys for different environments.

</details>

---

### Question 5 — Single Choice

A developer wants to log additional data when users open a job record in a canvas app. The goal is to record the job ID and job name so they can determine which jobs are viewed most frequently.

Which Power Fx function should the developer use?

- A. `Notify("Job Viewed", NotificationType.Information)`
- B. `Log("Job Viewed", {JobId: ThisItem.JobId})`
- C. `Trace("Job Viewed", TraceSeverity.Information, {JobId: ThisItem.JobId, JobName: ThisItem.JobName})`
- D. `Patch(AppInsights, {Message: "Job Viewed", JobId: ThisItem.JobId})`

<details>
<summary>Answer</summary>

**Correct answer:** C. `Trace("Job Viewed", TraceSeverity.Information, {JobId: ThisItem.JobId, JobName: ThisItem.JobName})`

**Explanation:** The `Trace()` Power Fx function is the correct way to send custom events from a canvas app to Application Insights. It accepts a message, an optional severity level, and an optional custom record with contextual data.

</details>

---

### Question 6 — Single Choice

You are writing a Kusto query in Application Insights Logs to find all custom events logged by the `Trace()` function in your canvas app.

Which table name should you use in your query?

- A. `customEvents`
- B. `pageViews`
- C. `appEvents`
- D. `traces`

<details>
<summary>Answer</summary>

**Correct answer:** D. `traces`

**Explanation:** Custom events logged by the `Trace()` function are written to the `traces` table in Application Insights. The `pageViews` table contains screen navigation events that are sent automatically by the Power Apps runtime.

</details>

---

### Question 7 — Single Choice

An administrator needs to identify all telemetry from a specific canvas app when multiple apps share the same Application Insights resource.

Which field in the logged events identifies the specific app?

- A. `ms-appSessionId`
- B. `ms-appId`
- C. `ms-userId`
- D. `appName`

<details>
<summary>Answer</summary>

**Correct answer:** B. `ms-appId`

**Explanation:** When multiple apps log to the same Application Insights resource, each event includes an `ms-appId` property that uniquely identifies the source app. The `ms-appSessionId` identifies a specific user's session within an app, not the app itself.

</details>

---

### Question 8 — Single Choice

A canvas app team wants to receive an automatic notification when the average page load time exceeds a defined threshold.

Which Application Insights feature should they configure?

- A. Cohorts
- B. Workbooks
- C. Alerts
- D. User Flows

<details>
<summary>Answer</summary>

**Correct answer:** C. Alerts

**Explanation:** The Alerts feature in Application Insights allows you to define metric thresholds and receive notifications when those thresholds are exceeded. For example, you can set an alert to trigger when average page load time is too high.

</details>

---

### Question 9 — Single Choice

A developer needs to analyze Application Insights data for a canvas app using a custom report with visualizations that are not available in the Azure portal.

Which option allows the developer to build fully custom visualizations of the Application Insights data?

- A. Transaction Search
- B. Power BI
- C. Workbooks
- D. Cohorts

<details>
<summary>Answer</summary>

**Correct answer:** B. Power BI

**Explanation:** You can import Application Insights log data into a Power BI dataset to create fully custom visualizations. Workbooks provide prebuilt and customizable dashboards within the Azure portal, but Power BI offers far greater flexibility for custom reporting.

</details>

---

### Question 10 — Single Choice

A developer wants to automate the delivery of a daily email listing all errors logged by the canvas app in the past 24 hours. They plan to use data from Application Insights.

Which Microsoft service and component should they use to build this automated workflow?

- A. Power Automate with the Application Insights connector
- B. Power Automate with the Azure Monitor connector
- C. Logic Apps with the Power Apps connector
- D. Azure Functions with the Event Hubs connector

<details>
<summary>Answer</summary>

**Correct answer:** B. Power Automate with the Azure Monitor connector

**Explanation:** The Azure Monitor connector in Power Automate allows you to build automated workflows that query Application Insights data. This is the supported approach for building scheduled reports, such as a daily error digest email.

</details>

---

### Question 11 — Single Choice

An analyst wants to understand the browsing behavior of users across screens in a canvas app — specifically which screens users navigate to after a specific starting screen.

Which Application Insights feature is most appropriate for this analysis?

- A. Usage > Users
- B. Usage > Sessions
- C. Usage > User Flows
- D. Monitoring > Workbooks > Usage Calendar

<details>
<summary>Answer</summary>

**Correct answer:** C. Usage > User Flows

**Explanation:** The User Flows visualization in Application Insights shows how users navigate from one event (such as a page view) to the next, making it the best tool for understanding navigation patterns between screens.

</details>

---

### Question 12 — Single Choice

Your company does not have direct access to the Azure subscription. You need to connect your canvas app to Application Insights.

What is the correct approach?

- A. Use the Power Apps admin center to self-provision Application Insights without an Azure subscription.
- B. Ask a Microsoft Entra ID administrator to create the Application Insights resource and share the Instrumentation Key.
- C. Use a trial Azure subscription independently of the company's tenant.
- D. Application Insights cannot be used without direct access to an Azure subscription.

<details>
<summary>Answer</summary>

**Correct answer:** B. Ask a Microsoft Entra ID administrator to create the Application Insights resource and share the Instrumentation Key.

**Explanation:** Even without direct Azure subscription access, you can still use Application Insights by having an Entra ID administrator create the resource and share the Instrumentation Key. The administrator can also grant you access to view the collected data.

</details>

---

### Question 13 — Multi-Select

A canvas app developer is adding `Trace()` calls to record important events in the app. They want to categorize traces by severity for easier querying.

Which of the following are valid severity levels for the `Trace()` function? (Select **three**.)

- A. Information
- B. Debug
- C. Warning
- D. Critical
- E. Verbose
- F. Error

<details>
<summary>Answer</summary>

**Correct answer:** A. Information, C. Warning, D. Critical, F. Error

*(Select any three of these four — the module lists all four as valid.)*

**Explanation:** The `Trace()` function's `trace_severity` parameter accepts four values: `Information`, `Warning`, `Error`, and `Critical`. `Debug` and `Verbose` are not valid severity levels for this function.

</details>

---

### Question 14 — Multi-Select

A Power Apps developer is exploring the Application Insights portal for a canvas app and wants to identify visualizations relevant to app usage and performance.

Which of the following are listed as useful for canvas apps? (Select **three**.)

- A. Monitoring > Workbooks > App Performance Index
- B. Monitoring > Workbooks > Dependency Tracking
- C. Usage > User Flows
- D. Usage > Exceptions
- E. Monitoring > Workbooks > User Retention
- F. Investigate > Transaction Search

<details>
<summary>Answer</summary>

**Correct answer:** A. Monitoring > Workbooks > App Performance Index, C. Usage > User Flows, E. Monitoring > Workbooks > User Retention, F. Investigate > Transaction Search

*(Select any three of these four correct options.)*

**Explanation:** Application Insights offers many visualizations, but only a subset is applicable to canvas apps. The module specifically lists App Performance Index, User Flows, User Retention, and Transaction Search among the useful options. Dependency Tracking and Exceptions are not listed as applicable for canvas apps.

</details>

---

### Question 15 — Multi-Select

A developer is reviewing the best practices for using the `Trace()` function in a production canvas app.

Which of the following are recommended best practices? (Select **two**.)

- A. Log customer names and email addresses to help identify which users encounter errors.
- B. Use consistent field names across related `Trace()` calls to simplify querying.
- C. Log as much data as possible to ensure no event is missed.
- D. Avoid logging sensitive data that may cause compliance issues.
- E. Always use `TraceSeverity.Error` regardless of the actual event type.

<details>
<summary>Answer</summary>

**Correct answer:** B. Use consistent field names across related `Trace()` calls to simplify querying, D. Avoid logging sensitive data that may cause compliance issues.

**Explanation:** The documentation highlights two key best practices: using consistent field names to make cross-call querying easier, and avoiding sensitive data (such as names or email addresses) that could create compliance problems. Logging excessive data and using a single severity level for all events are explicitly discouraged.

</details>

---

### Question 16 — Multi-Select

A team is deciding how to access and analyze Application Insights data for their canvas app.

Which of the following are valid ways to access data from an Application Insights resource? (Select **three**.)

- A. Individual visualizations (e.g., Users report)
- B. Directly from Power Apps Studio's formula bar
- C. Workbooks
- D. Logs (Kusto queries)
- E. The Power Apps Monitor tool (live view)

<details>
<summary>Answer</summary>

**Correct answer:** A. Individual visualizations (e.g., Users report), C. Workbooks, D. Logs (Kusto queries)

**Explanation:** From an Application Insights resource in the Azure portal, you can access data via individual visualizations, workbooks, and logs (Kusto query interface). Power Apps Studio's formula bar and the Power Apps Monitor tool are separate tools not used to access Application Insights data.

</details>

---

### Question 17 — Fill-in-the-Blank

Canvas apps automatically send basic ___ telemetry to Application Insights once the ___ is configured on the app object and the app is published.

<details>
<summary>Answer</summary>

**Answer:** screen (page view) | Instrumentation Key

**Explanation:** Power Apps runtime automatically sends basic screen/page view telemetry to Application Insights when the Instrumentation Key is set on the app. No additional code is required for this default telemetry.

</details>

---

### Question 18 — Fill-in-the-Blank

When using the Power Platform CLI to unpack a canvas app that has an Instrumentation Key configured, the key is stored in a file named ___.

<details>
<summary>Answer</summary>

**Answer:** AppInsightsKey.json

**Explanation:** The Power Platform CLI stores the Instrumentation Key in a dedicated file called `AppInsightsKey.json` during the unpack operation. This file can be managed in source control to support different keys per environment.

</details>

---

### Question 19 — Fill-in-the-Blank

The complete syntax of the Power Fx function used for custom logging is: `___(message, trace_severity, custom_record)`, where only the ___ parameter is required.

<details>
<summary>Answer</summary>

**Answer:** Trace() | message

**Explanation:** The `Trace()` function is used for custom logging in canvas apps. Its first parameter, `message`, is the only required argument. The `trace_severity` and `custom_record` parameters are optional but highly recommended for effective querying.

</details>

---

### Question 20 — Fill-in-the-Blank

To query all screen navigation events that are automatically sent by the Power Apps runtime to Application Insights, you use the Kusto table named ___. To query custom events logged by the `Trace()` function, you use the table named ___.

<details>
<summary>Answer</summary>

**Answer:** pageViews | traces

**Explanation:** The Power Apps runtime writes automatic screen navigation events to the `pageViews` table, while custom events from `Trace()` function calls are written to the `traces` table. Both tables are accessible via the Logs (Kusto) interface in Application Insights.

</details>

---

### Question 21 — Single Choice

An analyst wants to define a subset of users who interacted with a specific screen in the app, and then use that subset to filter Application Insights visualizations.

Which Application Insights feature supports this use case?

- A. Alerts
- B. Cohorts
- C. User Flows
- D. Transaction Search

<details>
<summary>Answer</summary>

**Correct answer:** B. Cohorts

**Explanation:** Cohorts let you define named sets of users, events, or operations that share a common trait — such as users who visited a specific screen. Once defined, a cohort can be used as a filter in most Application Insights visualizations.

</details>

---

### Question 22 — Single Choice

Application Insights pricing is based on a pay-as-you-go model. Your canvas app is used infrequently by a small team.

How much free log data ingestion is included per billing account before additional charges apply?

- A. 1 GB per month
- B. 5 GB per month
- C. 10 GB per month
- D. Unlimited, with charges only for retention beyond 90 days

<details>
<summary>Answer</summary>

**Correct answer:** B. 5 GB per month

**Explanation:** Each Application Insights billing account includes 5 GB of free log data ingestion per month. Low-usage apps that log sporadic data are likely to remain within this free tier with no extra ingestion cost.

</details>

---
