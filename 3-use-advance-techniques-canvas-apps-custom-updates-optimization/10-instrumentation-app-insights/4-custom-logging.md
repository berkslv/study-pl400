# Custom logging with trace

> 5 minutes

In addition to the telemetry that is sent automatically by Power Apps runtime to Application Insights, you can use the Power Fx `Trace()` function to send custom events. By instrumenting your app with trace calls, you can capture important events and associated data.

Examples of when you might add `Trace()` function calls include:

- Using **OnStart** to log the parameters that are passed to your app when it was started
- When users enable or disable options in your application
- When a button is selected to perform an action
- When the user cancels an action
- When an error occurs, such as someone submitting a form or data source errors
- Logging validation errors
- Logging search criteria so that you can determine the popular searches
- Logging feedback based on a user's likes or dislikes in an app
- Anything that you want to query later

In addition to logging the data for Application Insights, trace data is also visible in the Monitor tool and Power Apps Test Studio results.

## Trace() syntax

```powerappsfl
Trace(message, trace_severity, custom_record)
```

- **message** (required) - Identifies why you called trace, such as `"Timesheet Validation Failed"`.
- **trace_severity** (optional) - Severity level: `Information`, `Warning`, `Error`, or `Critical`. Useful for categorizing and querying traces.
- **custom_record** (optional) - A data record with context information using braces (`{}`).

Example with context data:

```powerappsfl
Trace("Timesheet Validation Failed", Warning, { hoursWorked: ThisItem.HoursWorked })
```

## Best practices

- Avoid sensitive data being recorded in Application Insights that might cause compliance problems, such as a customer's name and email address.
- Be alert for bad data or a formula that might cause unexpected results.
- Avoid sending too much data; send only what you need to analyze or query the data.
- Use consistent field names to help make querying easier across related trace calls.

## Query the traces

You can query and view the data that is captured by each `Trace()` function call by querying the log and using **traces** as the table name.

In the results, each line will have an **itemType** of **trace**. In each row, the **message** and **severityLevel** will display. If you expand the row, a **customDimensions** property will display that you can further expand to show the fields that you logged as context data when you invoked the `Trace()` function.

### Useful query fields

| Field | Description |
|---|---|
| `ms-appId` | Unique identifier for the app — use to find all traces for a specific app |
| `ms-appSessionId` | Identifies all traces for a user for that session of running the app |
| Custom fields (e.g., `JobId`, `JobName`) | Context data passed to `Trace()` |

Example query to filter for all trace records from a specific `JobId`:

```kusto
traces
| where customDimensions["JobId"] == "12345"
```

Adding traces to your app can provide you with a valuable resource to track problems. Traces are especially valuable because you can use them to capture data for an app that is running in production and doesn't require you to run the app in Power Apps Studio. By proactively adding `Trace()` function calls to your application, you will be ready when users report a challenging problem in production.
