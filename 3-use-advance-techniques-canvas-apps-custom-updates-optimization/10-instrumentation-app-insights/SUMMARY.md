# Summary: Instrumentation of Canvas Apps with Application Insights

> **Source files:** 1-introduction.md, 2-configure.md, 3-view-app-insights.md, 4-custom-logging.md, 5-exercise.md, 6-check.md

---

## Overview

- **Application Insights** is a feature of Azure Monitor used to monitor application performance.
- Canvas apps send telemetry to Application Insights when an **Instrumentation Key** is configured on the app object.
- Telemetry is **only captured from the published app** — usage in Power Apps Studio does not generate telemetry.
- Default telemetry includes basic screen/page view data (screen name, load times, session info).
- Custom events can be logged using the Power Fx `Trace()` function.
- Telemetry adds minimal overhead and is recommended for any app with multiple users.

---

## Setting Up Application Insights

### Prerequisites

- An Azure subscription with permission to create resources (or an admin who can share the Instrumentation Key).
- A published canvas app.

### Configuration Steps

1. Go to the [Azure portal](https://portal.azure.com/) and provision an **Application Insights** resource.
2. Copy the **Instrumentation Key** from the resource overview.
3. Open the canvas app in Power Apps Studio.
4. Select **App** in the Tree view, go to the **Properties** pane.
5. Paste the key into the **Instrumentation key** field.
6. Save and publish the app.

### Pricing

- Pay-as-you-go model based on data volume ingested.
- Each billing account includes **5 GB of free log data ingestion** per month.
- Low-usage apps may incur no extra ingestion cost.
- Optional cost for longer data retention.

### Multiple Apps in One Resource

- Multiple apps can share one Application Insights resource by using the **same Instrumentation Key**.
- Each app's events include an `ms-appId` property to distinguish apps.
- Default visualizations will **mix data** from all apps — harder to analyze a single app.
- For isolated per-app analysis, use **separate Application Insights resources** with separate keys.

### Development vs. Production Environments

- By default, transporting an app across environments (dev → test → prod) retains the same Instrumentation Key and logs to the same resource.
- **Environment variables are not currently supported** for configuring the Instrumentation Key.
- When using **Power Platform CLI** to unpack/pack an app, the key is stored in `AppInsightsKey.json` — use source control to manage different keys per environment.

### No Azure Subscription Access

- Ask a Microsoft Entra ID administrator to create the Application Insights resource and share the Instrumentation Key.
- The admin can also grant access to view and analyze collected data.

---

## Viewing Data in the Azure Portal

### Access Methods

- **Individual visualizations** — Pre-built charts (e.g., Users report) with drill-down capability.
- **Workbooks** — Availability, performance, usage, and health dashboards; supports custom workbooks from multiple Azure data sources.
- **Logs** — Raw event query interface (Kusto Query Language); usable in-portal or from Power BI.

### Useful Visualizations and Workbooks for Canvas Apps

- `Investigate > Transaction Search`
- `Monitoring > Metrics`
- `Monitoring > Logs`
- `Monitoring > Workbooks > App Performance Index`
- `Monitoring > Workbooks > Active Users`
- `Monitoring > Workbooks > Analysis of page views`
- `Monitoring > Workbooks > Engaged Users`
- `Monitoring > Workbooks > New, returning, and churn`
- `Monitoring > Workbooks > Usage calendar`
- `Monitoring > Workbooks > Usage through the day`
- `Monitoring > Workbooks > User Timeliness`
- `Monitoring > Workbooks > User Retention`
- `Usage > Users`
- `Usage > Sessions`
- `Usage > Events`
- `Usage > User Flows`

> **Tip:** Start with `Usage > Users` to understand who is using the app and how many.

### Additional Features

- **Cohorts** — Define sets of users/events/operations that share a trait (e.g., users of a specific screen, users from a country/region); use cohorts to filter visualizations.
- **Custom visualizations** — Add/modify filters on built-in visualizations and save them for reuse.
- **Alerts** — Notify when metrics exceed thresholds (e.g., high average page load time).
- **Power BI** — Import log data into a Power BI dataset for custom visualizations.
- **Power Automate (Azure Monitor connector)** — Automate reporting workflows (e.g., daily error digest email).

---

## Custom Logging with `Trace()`

### When to Use

- App **OnStart** — log startup parameters passed to the app.
- User enables/disables options.
- Button selected to perform an action.
- User cancels an action.
- Errors (form submission failures, data source errors).
- Validation errors.
- Search criteria (to identify popular searches).
- User feedback (likes/dislikes).

> Trace data also appears in **Power Apps Monitor** tool and **Power Apps Test Studio** results.

### Syntax

```powerappsfl
Trace(message, trace_severity, custom_record)
```

| Parameter | Required | Description |
|---|---|---|
| `message` | Yes | Identifies why Trace was called (e.g., `"Timesheet Validation Failed"`) |
| `trace_severity` | No | `Information`, `Warning`, `Error`, or `Critical` |
| `custom_record` | No | A data record `{}` with contextual fields |

### Example

```powerappsfl
Trace("Timesheet Validation Failed", Warning, { hoursWorked: ThisItem.HoursWorked })
```

```powerappsfl
Trace("Job Viewed", TraceSeverity.Information, {JobId: ThisItem.JobId, JobName: ThisItem.JobName})
```

```powerappsfl
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

### Best Practices

- **Do not** log sensitive data (names, emails) that may cause compliance issues.
- **Do not** send excessive data — log only what is needed for analysis.
- Use **consistent field names** across related `Trace()` calls to simplify querying.
- Be alert to bad data or formulas that may cause unexpected results.

---

## Querying Logs (Kusto Query Language)

### Key Tables

| Table | Contents |
|---|---|
| `pageViews` | Screen navigation events sent automatically by Power Apps runtime |
| `traces` | Custom events logged by `Trace()` function calls |

### Key Fields in `traces`

| Field | Description |
|---|---|
| `ms-appId` | Unique identifier for the app |
| `ms-appSessionId` | Identifies all traces for a user in one app session |
| `message` | The message string passed to `Trace()` |
| `severityLevel` | Severity of the trace |
| `customDimensions` | Contains all custom fields passed as the `custom_record` parameter |

### Example Queries

```kusto
traces
| where message == "Validation Failed"
```

```kusto
traces
| where message == "Validation Failed"
| where customDimensions.ContactName == "true"
```

```kusto
traces
| where customDimensions["JobId"] == "12345"
```

---

## Exercise Procedure Summary

### Connect App to Application Insights

1. Create an **Application Insights** resource in the Azure portal.
2. Copy the **Instrumentation Key**.
3. Open the canvas app in Power Apps Studio → select **App** → **Properties** pane → paste key in **Instrumentation key** field.
4. Save and publish the app.
5. Run the published app (not from Studio) to generate telemetry.

### Add Trace to App

1. Select the control whose action you want to trace (e.g., a button or icon).
2. Append `Trace()` call to the control's `OnSelect` formula using `;` as a separator:
   ```powerappsfl
   ;Trace("Job Viewed", TraceSeverity.Information, {JobId: ThisItem.JobId, JobName: ThisItem.JobName})
   ```
3. Save and publish the app.

### Query Traces in Azure Portal

1. Open the Application Insights resource → **Monitoring > Logs**.
2. Close the **Queries** pop-up.
3. Type `pageViews` and select **Run** to see screen navigation events.
4. Type `traces` and select **Run** to see custom Trace events.
5. Expand results → expand **customDimensions** to view custom fields.
6. Add `| where` filters to narrow results.

---

## References

- [Azure portal](https://portal.azure.com/)
- [ContosoCostEstimator_1_0_0_1.zip (GitHub)](https://github.com/MicrosoftDocs/mslearn-developer-tools-power-platform/blob/master/power-apps/collect-analyze-telemetry-data/ContosoCostEstimator_1_0_0_1.zip)
- [Power Apps maker portal](https://make.powerapps.com/)
