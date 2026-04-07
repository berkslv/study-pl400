# Summary: Using Monitor to Troubleshoot Canvas Apps

> **Source files:** 1-introduction.md, 2-common-problems.md, 3-remote-collaboration.md, 4-monitor-exercise.md, 5-knowledge-check.md

---

## Monitor Overview

- **Monitor** is a tool launched from **Microsoft Power Apps Studio** (via **Advanced tools** tab) to troubleshoot and improve app quality.
- Captures a stream of events from a running app and displays them in real time.
- Events include: user interactions with controls and use of data sources.
- Captured data includes app-specific context such as control names and formulas — not available in browser developer tools alone.
- Can be used in both development (Power Apps Studio preview) and published apps.
- Monitor **cannot** identify accessibility issues.

### Key Issues Identifiable with Monitor

- Errors when using connectors
- Large volumes of data being sent or received
- Slow connector response times
- Unexpected interactions with controls
- Duplicate data actions

---

## Usage Approaches

- **Reactive**: Use Monitor when a problem is known — observe events related to a reported issue to identify root cause.
- **Proactive**: Use Monitor before releasing an app — run the app, capture events, and review the log for long response times, anomalies, or errors.

---

## Troubleshooting Techniques

### Clean Event Log

- Select **Clear data** before testing to ensure captured data reflects only new actions.

### Meaningful Control Names

- Control names in the event log correspond to names in the app.
- Descriptive control names make event data easier to analyze.

### Filtering Events

- **Global filter**: Searches all columns; found in upper-right corner of the Monitor dashboard. Useful for broad searches by control name or connector action.
- **Column filters**: Target specific columns via dropdown → **Filter by**. Multiple column filters can be applied simultaneously; all conditions must be met for an event to display.

### Identifying and Resolving Errors

- Look for entries in the **Result** column labeled **Error**.
- Error rows are marked with a red circle at the start.
- Check the **Status** column for HTTP status codes.
- Double-click a row to open a detail pane with three tabs:
  - **Formula** – shows the formula that triggered the error
  - **Request** – includes URL and body sent to the connector
  - **Response** – includes returned data and error messages
- Compare request details to connector documentation to identify discrepancies.
- Business rule violations are visible in the **Response** tab.

### Identifying and Resolving Slow Actions

- Use the **Duration** column to find slow actions; values are in **milliseconds (ms)**.
- Filter the Duration column to display entries exceeding a threshold (e.g., 1000 ms = 1 second).
- To capture startup performance, ensure **Run OnStart** logic is selected in Monitor before running.
- To improve performance:
  - Reduce volume of data returned
  - Optimize query criteria
  - Request only necessary data
  - Use connector options to limit returned data where available

### Identifying and Resolving Delegation Problems

- Delegation issues occur when a data source can't process a query remotely; app retrieves a limited data set (default **500 records**) and filters locally, risking incomplete/inaccurate data.
- Use **App checker** in Power Apps Studio as the primary tool to identify delegation issues.
- Use Monitor for additional context: review the request, examine query criteria for unsupported functions, then modify formulas to use delegable functions.
- Monitor confirms whether formula changes result in correct data retrieval.

---

## Collaboration Features

Monitor provides three collaboration options:

| Option | Use Case |
|---|---|
| **Download / Upload** | Async collaboration; save session to file, share via email/OneDrive/DevOps work items; no real-time requirement |
| **Invite** | Real-time collaboration during development preview in Power Apps Studio |
| **Connect user** | Real-time monitoring of a **published** app run by a remote user |

> **Note:** All collaboration options expose events and data used in the app to collaborators.

### Download / Upload

- **Download**: Saves current session events to a local file.
- **Upload**: Reloads a downloaded file into any Monitor session without affecting the current session.
- Shareable with anyone who has Monitor access — even without edit access to the monitored app.
- Useful for: saving a baseline for future comparison, async collaboration across time zones.

### Invite (Development App)

- Select **Invite** from the command bar → Monitor generates an invite link.
- Invite link is valid for **60 minutes**; remove and reinvite if more time is needed.
- Inviting the wrong person: remove the invite — they won't be notified.
- Each invited user receives their own independent copy of events (e.g., **Clear data** only clears the local user's log).
- Invited user can view Monitor events but **cannot** see the host's activity in the app — screen sharing is recommended.
- Invited user does **not** need app permissions (they don't run the app).
- Intended for **development**, not deployed apps.

### Connect User (Published App)

- Requires enabling **Debug published app** setting in the app → save and republish.
- Enable this setting **only when needed** — it adds debug information that may impact performance.
- Launch Monitor from the **app list** (not Power Apps Studio).
- Select **Connect user** from the command bar → provide user info → share generated link.
- The remote user **must run the app**, so the app must be shared with them with necessary permissions.
- Host Monitor session displays events generated by the remote user's actions.
- Screen sharing is useful to observe user actions alongside the event log.

---

## Exercise Procedures

### Import Solution and Generate Test Data

1. Download the solution zip file from GitHub.
2. Go to Power Apps maker portal → select environment → **Solutions > Import solution**.
3. Browse, upload the zip, select **Next** twice, create/select a connection if prompted, then **Import**.
4. In the solution, select **Generate Test Data** cloud flow → **Run > Run flow** → **Done**.
5. Wait 3–6 minutes, then open the app to verify test data appears.

### Debug and Fix a Load/Delegation Issue

1. Open the app in edit mode → **Advanced tools > Open live monitor** (or **App checker > Open monitor**).
2. Select **Preview** in the app, trigger the warning, then in Monitor expand **formulaData > data** nodes in the **Filter** panel.
3. Download the Monitor log (**Download** button) for later reference.
4. Select **Clear data**, close Monitor.
5. In Tree view, select the gallery control and inspect the delegation warning on the **Items** property.
6. Replace formula with a delegable version:

```powerappsfl
Filter(Bottles, 'Modified On' > DateAdd(Today(), -7, TimeUnit.Days))
```

7. Reopen Monitor → Preview → Refresh → verify no warnings appear.
8. Use **Upload** to reload the saved log and confirm the original warning is no longer reproducible.

### Debug and Fix a Type Mismatch Error

1. Open Monitor → Preview the app.
2. Enter an integer value (e.g., `28`) → **Fill Bottle** → confirm **patchRow** event returns status **200**.
3. Clear data, enter a decimal value (e.g., `28.5`) → **Fill Bottle** → confirm **patchRow** shows type mismatch error.
4. In Tree view, select **ButtonFillBottle**, update the **DisplayMode** property:

```powerappsfl
If(IsMatch(TextVolume.Text, Match.MultipleDigits), DisplayMode.Edit, DisplayMode.Disabled)
```

5. Preview and test with `28`, `28.5`, and `28 oz` — confirm button disables for non-integer values.
6. Verify Monitor shows no errors.

### Collaborate with Invite

1. Open app in Power Apps Studio → **Advanced tools > Open monitor**.
2. Select **Invite** → add a user → copy and share the session link.
3. Preview the app → both users should see the event log in Monitor.

### Debug a Published App with Connect User

1. In the app, go to **Settings > Debug published app** → enable, save, and publish.
2. Share the app with the target user and assign necessary security role/permissions.
3. In Power Apps, select **Apps > Details > Monitor**.
4. Select **Play published app** to verify, then select **Connect user** → invite colleague → share session link.
5. Observe event logs from the colleague's actions; close Monitor to end the session.

---

## Key Facts (Assessment)

- Monitor is started via the **Advanced tools** tab in Power Apps Studio.
- To monitor a published app: enable **Debug published app** setting, **save and publish** the app, then launch Monitor and invite the user.
- Monitor **cannot** identify **accessibility issues** (can identify delegation issues, slow queries, and connector errors).

---

## References

- [Power Apps maker portal](https://make.powerapps.com/)
- [Solution zip file – CohoVineyardMonitorModule](https://github.com/MicrosoftDocs/mslearn-developer-tools-power-platform/blob/master/power-apps/troubleshoot-monitor/CohoVineyardMonitorModule_1_0_0_1.zip)
