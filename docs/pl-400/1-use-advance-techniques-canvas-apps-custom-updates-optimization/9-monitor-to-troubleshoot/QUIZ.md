# Quiz: Using Monitor to Troubleshoot Canvas Apps

> **Source material:** 1-introduction.md, 2-common-problems.md, 3-remote-collaboration.md, 4-monitor-exercise.md, 5-knowledge-check.md, 6-summary.md, SUMMARY.md
> **Total questions:** 22
> **Question types:** Multiple choice (single), Multiple choice (multi-select), Fill-in-the-blank

---

## Questions

### Question 1 — Single Choice

A maker wants to begin troubleshooting a canvas app that is currently open in Power Apps Studio. They need to capture events such as connector calls and control interactions in real time.

How should the maker launch Monitor?

- A. Navigate to make.powerapps.com and open Monitor from the portal home page.
- B. Select the **Advanced tools** tab in Power Apps Studio and open Monitor.
- C. Install Monitor from Microsoft AppSource and pin it to the studio.
- D. Monitor starts automatically whenever a canvas app is in preview mode.

<details>
<summary>Answer</summary>

**Correct answer:** B. Select the **Advanced tools** tab in Power Apps Studio and open Monitor.

**Explanation:** Monitor is launched from the **Advanced tools** tab within Power Apps Studio. It does not start automatically, is not installed from AppSource, and is not accessed from the make.powerapps.com home page.

</details>

---

### Question 2 — Single Choice

A maker's app displays incomplete results when filtering a large SharePoint list. The app appears to apply the filter locally rather than delegating it to the data source, and only a subset of records is returned.

What type of problem does this describe?

- A. A connector timeout error
- B. A duplicate data action
- C. A delegation problem
- D. A slow query caused by large data volume

<details>
<summary>Answer</summary>

**Correct answer:** C. A delegation problem

**Explanation:** Delegation issues occur when a data source cannot process a query remotely. The app retrieves a limited data set (default 500 records) and filters locally, which can result in incomplete or inaccurate results.

</details>

---

### Question 3 — Single Choice

While reviewing the Monitor event log, a maker notices that some rows begin with a red circle and the **Result** column shows "Error" for those rows.

What do the red circle and "Error" result indicate?

- A. The event was logged at a low priority and can be ignored.
- B. The connector returned a response that exceeded the data size limit.
- C. The event represents a failed operation, likely involving a connector error.
- D. The event was captured from a published app rather than a development preview.

<details>
<summary>Answer</summary>

**Correct answer:** C. The event represents a failed operation, likely involving a connector error.

**Explanation:** In Monitor, error rows are marked with a red circle at the start of the row and the **Result** column displays "Error." These entries typically relate to failed connector operations and can be expanded to view Formula, Request, and Response details.

</details>

---

### Question 4 — Single Choice

A maker's canvas app loads slowly on startup. They want to use Monitor to identify which operations are taking the most time during app launch.

Which column in Monitor should the maker examine?

- A. Result
- B. Status
- C. Duration
- D. Control

<details>
<summary>Answer</summary>

**Correct answer:** C. Duration

**Explanation:** The **Duration** column in Monitor shows how long each action takes. Values are displayed in milliseconds. Filtering this column to show entries exceeding a set threshold (e.g., 1000 ms) helps identify slow operations during startup.

</details>

---

### Question 5 — Single Choice

A maker filters the Monitor Duration column to find operations that take longer than one second.

In what unit are Duration values displayed in Monitor?

- A. Seconds
- B. Milliseconds
- C. Microseconds
- D. Minutes

<details>
<summary>Answer</summary>

**Correct answer:** B. Milliseconds

**Explanation:** Monitor displays Duration values in milliseconds (ms). To filter for operations taking longer than one second, the maker should set the threshold to values greater than 1000 ms.

</details>

---

### Question 6 — Single Choice

A developer needs to share Monitor session data with a colleague who is located in a different time zone. Real-time collaboration is not required. The colleague needs to be able to view the captured events at their convenience.

Which Monitor collaboration option is most appropriate?

- A. Invite
- B. Connect user
- C. Download / Upload
- D. Screen sharing with a preview session

<details>
<summary>Answer</summary>

**Correct answer:** C. Download / Upload

**Explanation:** The Download / Upload feature saves Monitor session events to a local file that can be shared via email, OneDrive, or a work item. The recipient can reload the file into Monitor at any time, making it ideal for asynchronous collaboration across time zones.

</details>

---

### Question 7 — Single Choice

A support engineer wants to observe the events generated by a remote user who is experiencing a problem in a published canvas app. The user cannot reproduce the issue in the development environment.

Which Monitor feature allows the engineer to view the remote user's events in real time?

- A. Invite
- B. Download / Upload
- C. App checker
- D. Connect user

<details>
<summary>Answer</summary>

**Correct answer:** D. Connect user

**Explanation:** The **Connect user** feature allows a developer to use Monitor to connect to a remote user running a published canvas app. The developer's Monitor session displays the events generated by that user's actions in real time.

</details>

---

### Question 8 — Single Choice

A developer uses Monitor's Invite feature to bring a colleague into a debugging session. The colleague is taking longer than expected to join.

How long is the Invite link valid, and what should the developer do if the link expires?

- A. 30 minutes; generate a new link from the Monitor settings menu.
- B. 60 minutes; remove the current invite and reinvite the user.
- C. 24 hours; wait for the colleague to use the same link later.
- D. 90 minutes; share the link again without making any changes.

<details>
<summary>Answer</summary>

**Correct answer:** B. 60 minutes; remove the current invite and reinvite the user.

**Explanation:** An Invite link in Monitor is valid for 60 minutes. If the link expires or more time is needed, the developer must remove the existing invite and generate a new one by reinviting the user.

</details>

---

### Question 9 — Single Choice

A developer invites a colleague to a Monitor session using the **Invite** feature. The colleague joins the session. What permissions does the colleague need to participate?

- A. The colleague must have edit access to the app in Power Apps Studio.
- B. The colleague must have the app shared with them and a valid security role assigned.
- C. The colleague needs no special app permissions because they do not run the app.
- D. The colleague must be an environment administrator to view Monitor events.

<details>
<summary>Answer</summary>

**Correct answer:** C. The colleague needs no special app permissions because they do not run the app.

**Explanation:** When using the **Invite** feature, the invited user views Monitor events generated by the host who runs the app in Power Apps Studio. The invited user does not run the app themselves, so no app sharing or permissions are required.

</details>

---

### Question 10 — Single Choice

A maker wants to use the **Connect user** feature to monitor events from a remote user running a published canvas app. They have not yet taken any preparatory steps.

What must the maker do before using Connect user?

- A. Enable **Debug published app** in the app settings, then save and republish the app.
- B. Assign the remote user an Environment Maker security role in the Admin center.
- C. Install a Monitor agent on the remote user's machine.
- D. Enable **Debug published app**, publish the app, and then share the Monitor session URL from Power Apps Studio.

<details>
<summary>Answer</summary>

**Correct answer:** A. Enable **Debug published app** in the app settings, then save and republish the app.

**Explanation:** To use **Connect user**, the maker must turn on the **Debug published app** setting in the app, then save and republish. Monitor should be launched from the app list (not Power Apps Studio) to use this feature. The setting should only be enabled when needed, as it may impact performance.

</details>

---

### Question 11 — Single Choice

A maker double-clicks an error row in Monitor and sees a detail pane with multiple tabs. They want to view the HTTP URL and the data body that was sent to the connector during the failed operation.

Which tab should the maker select?

- A. Formula
- B. Response
- C. Request
- D. Details

<details>
<summary>Answer</summary>

**Correct answer:** C. Request

**Explanation:** The **Request** tab in the Monitor event detail pane includes the URL and body sent to the connector. The **Formula** tab shows the formula that triggered the error, and the **Response** tab shows the data returned, including error messages.

</details>

---

### Question 12 — Single Choice

A developer hosts a Monitor session and invites a colleague using the **Invite** feature. The colleague joins the session. The developer selects **Clear data** in Monitor.

What happens to the colleague's event log?

- A. Both the developer's and the colleague's event logs are cleared simultaneously.
- B. Only the developer's event log is cleared; the colleague's log is unaffected.
- C. The colleague's session is disconnected until the developer reinvites them.
- D. The colleague receives a notification that the developer cleared the session.

<details>
<summary>Answer</summary>

**Correct answer:** B. Only the developer's event log is cleared; the colleague's log is unaffected.

**Explanation:** Each user in an Invite session receives their own independent copy of events. Actions such as **Clear data** only affect the local user's event log and do not impact other participants' sessions.

</details>

---

### Question 13 — Single Choice

A canvas app shows a yellow squiggly underline on the Items property of a gallery control. A maker wants to identify and resolve the underlying issue.

Which tool in Power Apps Studio is the primary tool for identifying this type of issue?

- A. Monitor
- B. Performance profiler
- C. App checker
- D. Test Studio

<details>
<summary>Answer</summary>

**Correct answer:** C. App checker

**Explanation:** **App checker** in Power Apps Studio is the primary tool for identifying delegation issues, which are indicated by yellow delegation warnings. Monitor can provide additional context to confirm whether formula changes resolve the problem.

</details>

---

### Question 14 — Multi-Select

A maker is evaluating whether Monitor can help identify specific problems in their canvas app before release.

Which of the following issues can Monitor help identify? (Select **three**.)

- A. Accessibility issues in the app's user interface
- B. Errors when using connectors
- C. Slow connector response times
- D. Duplicate data actions
- E. Missing alt-text on images

<details>
<summary>Answer</summary>

**Correct answer:** B. Errors when using connectors, C. Slow connector response times, D. Duplicate data actions

**Explanation:** Monitor can identify connector errors, slow response times, large data volumes, unexpected control interactions, and duplicate data actions. It **cannot** identify accessibility issues such as missing alt-text — those require a separate accessibility checker.

</details>

---

### Question 15 — Multi-Select

A maker double-clicks an error row in Monitor to investigate a failed connector operation.

Which tabs are available in the event detail pane? (Select **three**.)

- A. Formula
- B. Schema
- C. Request
- D. Response
- E. Permissions

<details>
<summary>Answer</summary>

**Correct answer:** A. Formula, C. Request, D. Response

**Explanation:** When you double-click an event row in Monitor, a detail pane opens with three tabs: **Formula** (shows the formula that caused the error), **Request** (URL and body sent to the connector), and **Response** (returned data including error messages).

</details>

---

### Question 16 — Multi-Select

A team wants to understand the full range of collaboration options available in Monitor.

Which of the following are collaboration features provided by Monitor? (Select **three**.)

- A. Download / Upload
- B. Merge sessions
- C. Invite
- D. Connect user
- E. Co-author editing

<details>
<summary>Answer</summary>

**Correct answer:** A. Download / Upload, C. Invite, D. Connect user

**Explanation:** Monitor offers three collaboration options: **Download / Upload** for asynchronous session sharing, **Invite** for real-time collaboration during a development preview, and **Connect user** for monitoring a remote user running a published app. Merge sessions and co-author editing are not Monitor features.

</details>

---

### Question 17 — Multi-Select

A maker identifies that a connector action in their canvas app is returning data slowly. They want to improve performance.

Which of the following actions help resolve slow connector performance? (Select **two**.)

- A. Increase the delegation limit to 2000 records in app settings.
- B. Reduce the volume of data returned by the connector.
- C. Optimize query criteria to limit the records requested.
- D. Switch from reactive to proactive use of Monitor.
- E. Clear the event log before each test run.

<details>
<summary>Answer</summary>

**Correct answer:** B. Reduce the volume of data returned by the connector, C. Optimize query criteria to limit the records requested.

**Explanation:** To improve connector performance, makers should reduce the volume of data returned and optimize query criteria to ensure only necessary data is requested. Increasing the delegation limit and clearing the event log do not directly improve connector response times.

</details>

---

### Question 18 — Fill-in-the-Blank

When reviewing slow operations in Monitor, the **Duration** column displays values measured in ___.

<details>
<summary>Answer</summary>

**Answer:** milliseconds (ms)

**Explanation:** Monitor expresses all Duration values in milliseconds. To filter for operations taking longer than one second, makers set a threshold of 1000 ms or greater.

</details>

---

### Question 19 — Fill-in-the-Blank

When a delegation failure occurs, the canvas app retrieves a limited data set of ___ records by default and applies filtering locally, which can result in incomplete or inaccurate results.

<details>
<summary>Answer</summary>

**Answer:** 500

**Explanation:** When a data source cannot process a query remotely, Power Apps falls back to retrieving a default maximum of 500 records and filtering them locally. This behavior can lead to missing data if the full data set exceeds this limit.

</details>

---

### Question 20 — Fill-in-the-Blank

When using Monitor's Invite feature, the generated session link is valid for ___ minutes. If additional time is needed, the host must ___ the current invitation and reinvite the user.

<details>
<summary>Answer</summary>

**Answer:** 60 minutes; remove (or revoke)

**Explanation:** Invite links expire after 60 minutes. To extend access, the host removes the existing invite and generates a new link by reinviting the user. The removed user is not notified of the removal.

</details>

---

### Question 21 — Fill-in-the-Blank

Monitor provides two filtering options: the ___ filter, which searches across all columns and is located in the upper-right corner of the dashboard, and ___ filters, which target individual columns. When multiple column filters are active, ___ conditions must be met for an event to appear.

<details>
<summary>Answer</summary>

**Answer:** global; column; all

**Explanation:** The global filter performs a broad search across all columns in the event log. Column filters narrow results to specific columns, and multiple column filters combine using AND logic — all conditions must be satisfied for an event to be displayed.

</details>

---

### Question 22 — Fill-in-the-Blank

To monitor a published canvas app using the **Connect user** feature, a maker must first enable the ___ setting in the app's settings, then ___ and republish the app before launching Monitor from the app list.

<details>
<summary>Answer</summary>

**Answer:** Debug published app; save

**Explanation:** The **Debug published app** setting must be enabled and the app must be saved and republished before the Connect user feature becomes available. Monitor is then launched from the app list (not Power Apps Studio) to access the Connect user option. This setting should only be enabled when needed, as it adds debug overhead that may affect performance.

</details>
