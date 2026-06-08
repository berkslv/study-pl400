# Summary: Canvas App Instrumentation with Application Insights

> **Source files:** 1-introduction.md, 2-configure.md, 3-view-app-insights.md, 4-custom-logging.md, 5-exercise.md, 6-check.md

---

## Overview

- **Application Insights** is a feature of Azure Monitor used to monitor application performance.
- Canvas apps from Power Apps can be configured to send telemetry to Application Insights by setting an **Instrumentation Key** on the App object.
- Basic screen telemetry is sent **automatically** by the Power Apps runtime once the key is set — no extra code required.
- Telemetry is only captured when the **published app** is run; usage inside Power Apps Studio during development does not affect telemetry.
- Custom events can be sent using the Power Fx **Trace()** function.
- Sending telemetry adds minimal overhead and should be considered for any app with multiple users.

---

## Configuring Application Insights

### Setup Steps

1. Provision an **Application Insights** resource in the [Azure portal](https://portal.azure.com/).
2. Copy the **Instrumentation Key** from the resource.
3. Open the canvas app in Power Apps Studio, select the **App** object, paste the key in the **Instrumentation Key** field in the Properties pane.
4. Save and publish the app.

### Costs and Workspace

- Pricing is **pay-as-you-go** based on data volume ingested and, optionally, data retention duration.
- Each billing account includes **5 GB of free log data ingestion** — low-usage apps may have no extra cost.
- When creating the resource, choose the default Log Analytics workspace or create a custom one.

### Multiple Apps in One Resource

- Multiple apps can share a single Application Insights resource by using the **same Instrumentation Key**.
- Each app's events include an **`ms-appId`** property to keep data identifiable per app.
- Default visualizations will **mix data from all apps**, making per-app analysis harder.
- Separate resources (one per app) give cleaner per-app visualizations but make cross-app analysis harder.

### Development to Production

- After setting the key and publishing, all subsequent runs of the **published app** send telemetry.
- Running the app in Power Apps Studio never sends telemetry.
- **Environment variables are not supported** for configuring the Instrumentation Key.
- When using **Power Platform CLI** to unpack/pack an app, the key is stored in a file named `AppInsightsKey.json`, enabling per-environment keys via source control.

### No Azure Subscription Access

- Ask a **Microsoft Entra ID administrator** to create the Application Insights resource and share the Instrumentation Key.
- The administrator can also grant access to the resource so you can view and analyze the collected data.

---

## Viewing Application Insights Data

Three ways to access data from the Azure portal:

- **Individual visualizations** — e.g., the Users report, which provides summary data for a time period with drill-down capability.
- **Workbooks** — prebuilt and custom dashboards covering availability, performance, usage, and health, supporting multiple Azure data sources.
- **Logs** — query raw event data using Kusto Query Language (KQL); can be used inside the portal or fed into external tools like Power BI.

### Useful Visualizations and Workbooks for Power Apps

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
- Recommended starting point: **`Usage > Users`** to understand app adoption.

### Cohorts

- Define named sets of users, events, or operations that share a common property (e.g., all users of a specific screen, all users from a country/region).
- Use cohorts to filter any Application Insights visualization.

### Custom Visualizations and Alerts

- Most built-in visualizations support adding/modifying filters and saving the result as a custom view.
- **Alerts** notify you when a metric breaches a threshold (e.g., average page load time too high).

### Integration with Power BI and Power Automate

- Log data can be **imported into Power BI** to build custom dashboards.
- The **Azure Monitor connector** in Power Automate enables automated workflows using Application Insights data (e.g., daily email of errors logged by users).

---

## Custom Logging with Trace()

### Syntax

```powerfx
Trace(message, trace_severity, custom_record)
```

- `message` — **required**; identifies the purpose of the trace (e.g., `"Timesheet Validation Failed"`).
- `trace_severity` — optional; one of `TraceSeverity.Information`, `TraceSeverity.Warning`, `TraceSeverity.Error`, `TraceSeverity.Critical`.
- `custom_record` — optional inline record using `{}` with named fields providing context data.

### Example

```powerfx
Trace("Job Viewed", TraceSeverity.Information, {JobId: ThisItem.JobId, JobName: ThisItem.JobName})
```

```powerfx
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

### When to Add Trace() Calls

- `OnStart` — log parameters passed to the app at startup.
- When users enable or disable options.
- When a button is selected to perform an action.
- When a user cancels an action.
- When an error occurs (form submission errors, data source errors).
- Logging validation errors.
- Logging search criteria to identify popular searches.
- Logging user feedback (likes/dislikes).

### Best Practices

- **Avoid sensitive data** (customer names, email addresses) — compliance risk.
- **Avoid bad data or formulas** that could produce unexpected results.
- **Avoid sending too much data** — send only what is needed for analysis.
- **Use consistent field names** across related trace calls to simplify querying.

### Trace Data Visibility

- Trace data appears in Application Insights **and** in the **Monitor tool** and **Power Apps Test Studio** results.
- Traces can be captured from a production app without requiring Power Apps Studio.

---

## Querying Trace Data in Log Analytics

- Use `traces` as the table name to query custom trace events.
- Use `pageViews` as the table name to query screen navigation events.
- Each trace result row includes:
  - `itemType`: always `trace`
  - `message`: the message string passed to Trace()
  - `severityLevel`: the severity passed
  - `customDimensions`: expandable object with all custom fields logged as context data

### Automatically Added Fields (all traces)

- `ms-appId` — unique identifier for the app; use to filter traces for a specific app.
- `ms-appSessionId` — unique identifier for a user's session in the app.
- All other `ms-*` fields are automatically included in every trace.

### Example KQL Query

```kusto
traces
| where message == "Validation Failed"
```

---

## References

- [Azure Monitor connector (Power Automate / Logic Apps)](https://learn.microsoft.com/azure/azure-monitor/logs/logicapp-flow-connector/)
- [Azure portal](https://portal.azure.com/)
- [Azure sign up](https://signup.azure.com/signup?offer=ms-azr-0044p)
- [Designing your Log Analytics workspaces](https://learn.microsoft.com/azure/azure-monitor/logs/design-logs-deployment/)
- [Import log data into Power BI](https://learn.microsoft.com/azure/azure-monitor/visualize/powerbi/)
- [Log data ingestion costs](https://azure.microsoft.com/pricing/details/monitor/)
- [Power Apps maker portal](https://make.powerapps.com/)
- [Tutorial: Metrics Explorer (create a new chart)](https://learn.microsoft.com/azure/azure-monitor/essentials/tutorial-metrics-explorer/)
- [View all billing accounts](https://learn.microsoft.com/azure/cost-management-billing/manage/view-all-accounts/)
