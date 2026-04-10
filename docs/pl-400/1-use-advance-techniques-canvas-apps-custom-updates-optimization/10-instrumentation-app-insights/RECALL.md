# Recall: Instrumentation of Canvas Apps with Application Insights

> **Source files:** 1-introduction.md, 2-configure.md, 3-view-app-insights.md, 4-custom-logging.md, 5-exercise.md

---

## Keywords

| Term | Definition |
|------|-----------|
| Application Insights | Azure Monitor feature used to collect and analyze telemetry from apps, including canvas apps. |
| Instrumentation Key | Unique key set on a canvas app's App object to route telemetry to an Application Insights resource. |
| Telemetry | Automatically collected runtime data (e.g., screen views, session duration) sent to Application Insights. |
| `Trace()` | Power Fx function for sending custom events with message, severity, and context data to Application Insights. |
| `TraceSeverity` | Enum used in `Trace()` to classify events as `Information`, `Warning`, `Error`, or `Critical`. |
| `customDimensions` | Property in Application Insights log results that holds context fields passed to `Trace()`. |
| `ms-appId` | Built-in log field that uniquely identifies the canvas app that generated a telemetry event. |
| `ms-appSessionId` | Built-in log field identifying all traces from a single user's app session. |
| Workbooks | Prebuilt or custom Azure Monitor dashboards combining multiple data sources for app health analysis. |
| Cohorts | User-defined filters in Application Insights grouping users, events, or operations by shared attributes. |
| Kusto Query Language (KQL) | Query language used in Application Insights Logs to filter and analyze raw telemetry tables. |
| `AppInsightsKey.json` | File produced when unpacking a canvas app via Power Platform CLI that stores the Instrumentation Key. |

---

## Main Ideas

- Canvas apps send telemetry to Application Insights automatically once an **Instrumentation Key** is set on the App object and the app is **published**.
- Telemetry is **not** captured when running the app inside Power Apps Studio during development — only from the published app.
- Application Insights pricing is pay-as-you-go by data volume ingested; each billing account includes **5 GB** of free log ingestion.
- Multiple apps can share one Application Insights resource using the same Instrumentation Key; events are distinguished by `ms-appId`. Separate resources give cleaner per-app analysis.
- Environment variables are **not** supported for configuring the Instrumentation Key; use Power Platform CLI with `AppInsightsKey.json` for environment-specific keys.
- Useful Azure portal views for Power Apps telemetry: **Usage > Users/Sessions/Events/User Flows**, **Monitoring > Logs**, and workbooks such as **Active Users**, **App Performance Index**, and **User Retention**.
- **Cohorts** let you define filtered user/event sets to apply across Application Insights visualizations.
- The `Trace()` function signature is: `Trace(message, trace_severity, custom_record)` — only `message` is required.
- Custom trace data is stored in the **traces** table; queried fields include `message`, `severityLevel`, and `customDimensions`.
- Trace data is also visible in the **Power Apps Monitor tool** and **Power Apps Test Studio** results — not just Application Insights.
- Best practices: avoid logging sensitive/PII data, use consistent field names, send only data needed for analysis.
- Power Automate with the **Azure Monitor connector** can automate reporting (e.g., daily error digest emails).
- Power BI can import Application Insights log data for custom visualizations beyond the portal workbooks.

---

## Mini Quiz

### Q1 — Single Choice

A developer sets the Instrumentation Key on their canvas app and saves the project. They then test the app inside Power Apps Studio.

Will Application Insights receive telemetry from this testing session?

- A. Yes, because the Instrumentation Key is already configured.
- B. No, because telemetry is only sent from the published app run outside Studio.
- C. Yes, but only `Trace()` events — not automatic screen telemetry.
- D. No, because the Instrumentation Key must also be published to take effect.

<details>
<summary>Answer</summary>

**Correct answer:** B. No, because telemetry is only sent from the published app run outside Studio.

**Explanation:** The app must be published and run outside Power Apps Studio for telemetry to be captured. Testing inside Studio does not generate telemetry.

</details>

---

### Q2 — Fill-in-the-Blank

When multiple canvas apps share the same Application Insights resource, the `___` property in each logged event is used to identify which app generated the event.

<details>
<summary>Answer</summary>

**Answer:** `ms-appId`

**Explanation:** The `ms-appId` property is automatically included in telemetry events and uniquely identifies the source canvas app within a shared Application Insights resource.

</details>

---

### Q3 — Single Choice

A maker wants to log a warning-level custom event that captures which form fields failed validation, including the job name status.

Which `Trace()` call is correct?

- A. `Trace("Validation Failed", TraceSeverity.Error, {JobName: IsBlank(TextInputClientName.Text)})`
- B. `Trace("Validation Failed", TraceSeverity.Warning, {JobName: IsBlank(TextInputClientName.Text)})`
- C. `Trace(TraceSeverity.Warning, "Validation Failed", {JobName: IsBlank(TextInputClientName.Text)})`
- D. `Trace("Validation Failed", {JobName: IsBlank(TextInputClientName.Text)}, TraceSeverity.Warning)`

<details>
<summary>Answer</summary>

**Correct answer:** B. `Trace("Validation Failed", TraceSeverity.Warning, {JobName: IsBlank(TextInputClientName.Text)})`

**Explanation:** The `Trace()` signature is `Trace(message, trace_severity, custom_record)`. `message` comes first, followed by the severity level, then the optional custom record object.

</details>

---

### Q4 — Fill-in-the-Blank

To query all custom trace events in Application Insights Logs, use `___` as the table name. Each row includes a `___` property that can be expanded to reveal context fields logged via `Trace()`.

<details>
<summary>Answer</summary>

**Answer:** `traces`; `customDimensions`

**Explanation:** Custom events logged by `Trace()` are stored in the `traces` table. The context record passed as the third argument appears under `customDimensions` when a row is expanded.

</details>

---

### Q5 — Single Choice

A Power Platform developer needs to configure different Application Insights Instrumentation Keys for development, test, and production environments.

What is the recommended approach?

- A. Use environment variables to store the Instrumentation Key per environment.
- B. Manually update the Instrumentation Key in app settings before each deployment.
- C. Use Power Platform CLI to unpack the app and manage `AppInsightsKey.json` via source control.
- D. Create a separate App object in each environment with a hard-coded key.

<details>
<summary>Answer</summary>

**Correct answer:** C. Use Power Platform CLI to unpack the app and manage `AppInsightsKey.json` via source control.

**Explanation:** Environment variables are not supported for the Instrumentation Key. The CLI unpacks the key into `AppInsightsKey.json`, which can be managed per environment through source control.

</details>

---

### Q6 — Single Choice

Which Application Insights Azure portal section is the best starting point to see how many unique people are actively using a canvas app?

- A. Monitoring > Logs
- B. Usage > Users
- C. Monitoring > Workbooks > App Performance Index
- D. Investigate > Transaction Search

<details>
<summary>Answer</summary>

**Correct answer:** B. Usage > Users

**Explanation:** The **Usage > Users** section provides a summary of unique users over a time period and is recommended as the first place to check adoption and active usage of a canvas app.

</details>

---

### Q7 — Fill-in-the-Blank

Application Insights pricing is based on ___ ingested. Each billing account includes ___ GB of free log data ingestion.

<details>
<summary>Answer</summary>

**Answer:** data volume; 5

**Explanation:** Application Insights uses a pay-as-you-go model priced by the volume of data ingested. The first 5 GB per billing account is included at no charge.

</details>

---
