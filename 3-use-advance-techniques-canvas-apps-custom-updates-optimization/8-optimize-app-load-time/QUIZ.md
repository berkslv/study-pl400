# Quiz: Optimizing Canvas App Load Time

> **Source material:** 1-introduction.md, 2-monitor-start-performance-issues.md, 3-optimize-on-start.md, 4-data-load-strategies.md, 5-check.md, 6-summary.md
> **Total questions:** 25
> **Question types:** Multiple choice (single), Multiple choice (multi-select), Fill-in-the-blank

---

## Questions

### Question 1 — Single Choice

A canvas app performs several steps before presenting its first screen to users. A maker notices that the app is slow to start and suspects the issue is in the formulas used to preload data and set global variables.

Which app startup phase has the most direct impact on improving load time when optimized?

- A. Authenticate
- B. Get metadata
- C. OnStart processing
- D. Render screens

<details>
<summary>Answer</summary>

**Correct answer:** C. OnStart processing

**Explanation:** The OnStart phase evaluates formulas in the `App.OnStart` property, including data preloads and global variable assignments. Streamlining this phase has the most direct impact on improving app load time.

</details>

---

### Question 2 — Single Choice

Your organization wants to establish performance benchmarks for a canvas app before rolling it out to 500 users. You need a way to capture the time from launching the app to when it is fully usable.

What is the recommended starting approach for establishing a load time baseline?

- A. Run the Power Apps Review Tool and note the startup score.
- B. Use a stopwatch to measure the time from launch to first usable state, and re-evaluate with each update.
- C. Enable the Debug published app setting and read the trace logs.
- D. Check the **Time to first screen** analytics for the last 7 days in the maker portal.

<details>
<summary>Answer</summary>

**Correct answer:** B. Use a stopwatch to measure the time from launch to first usable state, and re-evaluate with each update.

**Explanation:** The documentation recommends using a stopwatch to measure startup time from launching the application to when it becomes usable, and conducting a new evaluation with each app update to compare against the prior baseline.

</details>

---

### Question 3 — Single Choice

A maker runs Microsoft Azure Monitor while the app loads and then reviews the event log. The maker wants to mark exactly when `App.OnStart` begins and ends to isolate its duration.

Which function should the maker add to the `App.OnStart` formula to log custom checkpoint messages in Monitor?

- A. `Log()`
- B. `Notify()`
- C. `Trace()`
- D. `Debug()`

<details>
<summary>Answer</summary>

**Correct answer:** C. `Trace()`

**Explanation:** The `Trace()` function lets makers add custom log messages that appear in the Monitor event log. Placing `Trace("Start of OnStart")` and `Trace("End of OnStart")` around the data preload logic reveals how long OnStart processing takes.

</details>

---

### Question 4 — Single Choice

A maker uses Monitor to evaluate app startup performance. To get accurate results, they need to ensure that cached data from previous test runs does not skew the captured events.

Which step is essential to guarantee a cold start when using Monitor?

- A. Clear the app's collections manually before pressing Play in Studio.
- B. Enable Debug published app, publish the app, then launch Monitor from make.powerapps.com.
- C. Restart Power Apps Studio and immediately open Monitor.
- D. Disable all connectors, run Monitor, then re-enable connectors.

<details>
<summary>Answer</summary>

**Correct answer:** B. Enable Debug published app, publish the app, then launch Monitor from make.powerapps.com.

**Explanation:** A cold start requires enabling the Debug published app setting, saving and publishing the app, and then launching Monitor from make.powerapps.com. Manually rerunning OnStart or OnVisible from within Studio causes data caching that skews the results.

</details>

---

### Question 5 — Single Choice

A Power Apps developer is optimizing an older canvas app. The app currently uses `Navigate()` inside `App.OnStart` to direct users to different screens based on their role. The developer notices this causes the first screen to not render until all OnStart formulas complete.

What is the recommended replacement for using `Navigate()` in `App.OnStart`?

- A. Move the `Navigate()` call to the first screen's `OnVisible` property.
- B. Use the `App.StartScreen` property with conditional logic.
- C. Use the `Redirect()` function in `App.OnStart`.
- D. Set the screen order in the screen tree view to match the conditional logic.

<details>
<summary>Answer</summary>

**Correct answer:** B. Use the `App.StartScreen` property with conditional logic.

**Explanation:** Using `Navigate()` in `App.OnStart` has been retired in new apps. The `App.StartScreen` property is the correct replacement — it evaluates once at startup and determines which screen to show without blocking the first screen from rendering.

</details>

---

### Question 6 — Single Choice

A maker configures the `App.StartScreen` property with a `LookUp()` call that occasionally returns an error due to network issues. The maker wants to prevent the app from failing silently.

What happens by default when `App.StartScreen` evaluates to an error, and what function can the maker use to handle it gracefully?

- A. The app crashes; use `Try()` to wrap the formula.
- B. The first screen in the screen tree view is shown; use `IfError()` to redirect to an error screen.
- C. The app shows a blank screen; use `IsError()` to check the result.
- D. The last visited screen is shown; use `If()` to provide a fallback.

<details>
<summary>Answer</summary>

**Correct answer:** B. The first screen in the screen tree view is shown; use `IfError()` to redirect to an error screen.

**Explanation:** If the formula in `App.StartScreen` evaluates to an error, the app falls back to showing the first screen in the screen tree view, as if the property were empty. Makers can use `IfError()` to catch errors and redirect to a dedicated error screen.

</details>

---

### Question 7 — Single Choice

An app preloads data for only one specific screen inside `App.OnStart`. The rest of the app's screens do not need this data at startup.

What is the best approach to defer this data load and improve startup time?

- A. Move the preload logic to the screen's `OnHidden` property.
- B. Move the preload logic to the screen's `OnVisible` property.
- C. Remove the preload and use direct data source binding instead.
- D. Wrap the preload logic in a `Timer` control set to fire after 5 seconds.

<details>
<summary>Answer</summary>

**Correct answer:** B. Move the preload logic to the screen's `OnVisible` property.

**Explanation:** If data is only needed for a single screen, moving the `ClearCollect()` or other preload logic from `App.OnStart` to the screen's `OnVisible` property defers the load until that screen is actually navigated to, reducing initial startup time.

</details>

---

### Question 8 — Single Choice

A canvas app in development loads quickly, but in production with a fully populated dataset it is significantly slower. The app uses `ClearCollect(colDesks, Desks)` in `App.OnStart`. The Desks table has 1,800 rows in production.

What app setting is most likely causing the performance difference between environments?

- A. Explicit Column Selection
- B. Delay load
- C. Data row limit
- D. Use non-blocking OnStart rule

<details>
<summary>Answer</summary>

**Correct answer:** C. Data row limit

**Explanation:** The **Data row limit** setting controls the maximum rows retrieved from server-based connections when delegation is not supported. A higher value (up to 2,000) causes the app to retrieve far more rows in production than in a development environment with fewer records, resulting in slower load times.

</details>

---

### Question 9 — Single Choice

A maker enables the **Debug published app** setting while troubleshooting and forgets to turn it off before releasing the app to production users.

What is the impact of leaving this setting enabled in a production app?

- A. It has no impact on performance; it only affects the app editor experience.
- B. It prevents users from seeing error messages in the app.
- C. It degrades app performance because extra debug information is being generated.
- D. It causes the app to revert to a previous published version.

<details>
<summary>Answer</summary>

**Correct answer:** C. It degrades app performance because extra debug information is being generated.

**Explanation:** The **Debug published app** setting allows extra debug information to be displayed in Monitor when troubleshooting a published app. Leaving it enabled is detrimental to performance and should not be used in production apps.

</details>

---

### Question 10 — Single Choice

A gallery in a canvas app is bound directly to a Dataverse table containing 80,000 rows using a `Filter()` expression. A maker wants to understand whether the app will be limited by the **Data row limit** setting.

What is the correct behavior when a connector supports delegation?

- A. The app retrieves only the number of rows configured in the **Data row limit** setting.
- B. The app retrieves all rows at once and stores them in memory.
- C. The app loads an initial set of rows and retrieves more automatically as the user scrolls.
- D. The app throws a delegation warning and returns no data.

<details>
<summary>Answer</summary>

**Correct answer:** C. The app loads an initial set of rows and retrieves more automatically as the user scrolls.

**Explanation:** When a connector supports delegation (such as Dataverse), direct data source binding is not limited by the **Data row limit** setting. The app handles large datasets incrementally via `getRows` followed by `getMoreRows` calls as the user scrolls.

</details>

---

### Question 11 — Single Choice

A maker's app calls `Office365Users.MyProfileV2()` three separate times in `App.OnStart` — once for `displayName`, once for `hireDate`, and once for `city`.

What is the most efficient way to rewrite this logic to reduce connector calls?

- A. Use `Concurrent()` to call `MyProfileV2()` three times in parallel.
- B. Call `MyProfileV2()` once and store the result in a single variable; access properties using dot notation.
- C. Call `MyProfileV2()` once and use `ClearCollect()` to cache the result in a collection.
- D. Move the three calls to each individual screen's `OnVisible` property.

<details>
<summary>Answer</summary>

**Correct answer:** B. Call `MyProfileV2()` once and store the result in a single variable; access properties using dot notation.

**Explanation:** Calling `Office365Users.MyProfileV2()` once and storing the result in a single variable (e.g., `Set(profile, Office365Users.MyProfileV2())`) reduces three connector calls to one. Properties are then accessed using dot notation such as `profile.displayName`, `profile.hireDate`, and `profile.city`.

</details>

---

### Question 12 — Single Choice

An app uses `OnVisible` to preload a collection. During testing, a maker notices that navigating back and forth between screens causes the collection to reload each time, causing unnecessary slowness.

Which formula pattern prevents the collection from being reloaded on every screen visit?

- A. `Refresh(colDesks)`
- B. `If(IsEmpty(colDesks), ClearCollect(colDesks, Desks))`
- C. `Set(colDesks, ClearCollect(colDesks, Desks))`
- D. `Once(ClearCollect(colDesks, Desks))`

<details>
<summary>Answer</summary>

**Correct answer:** B. `If(IsEmpty(colDesks), ClearCollect(colDesks, Desks))`

**Explanation:** Wrapping the `ClearCollect()` call in an `If(IsEmpty(...))` guard ensures that the collection is only loaded the first time the screen is visited. On subsequent visits, the collection already has data so the expensive load is skipped.

</details>

---

### Question 13 — Single Choice

A canvas app works well when users have a stable network connection, but performance degrades significantly when the connection is intermittent. The maker wants to show the last known data from the local device while a fresh load occurs in the background.

Which data load strategy best addresses this requirement?

- A. Direct data source binding with `Refresh(tableName)` on a timer.
- B. Load from persisted local storage using `LoadData()` first, then reload from the connector.
- C. Preload data using `Concurrent()` across all screens.
- D. Use `ClearCollect()` in `OnVisible` with an `IsEmpty()` guard.

<details>
<summary>Answer</summary>

**Correct answer:** B. Load from persisted local storage using `LoadData()` first, then reload from the connector.

**Explanation:** The load-from-persisted-storage strategy calls `LoadData()` to immediately show the last saved data from the device, then calls `ClearCollect()` to refresh from the connector, and finally calls `SaveData()` to update local storage. This is especially useful when the data source is slow or intermittently available.

</details>

---

### Question 14 — Single Choice

A maker wants to show users a visual indicator that the app is loading data. The app currently uses direct data source binding for its gallery.

Why can't the maker show a loading indicator when using direct data source binding?

- A. Loading indicators are only supported in model-driven apps.
- B. Direct binding does not support the `Set()` function needed to toggle visibility.
- C. Direct binding retrieves data declaratively, so there is no explicit point at which to set or clear a loading variable.
- D. The `Visible` property of controls cannot reference variables when direct binding is used.

<details>
<summary>Answer</summary>

**Correct answer:** C. Direct binding retrieves data declaratively, so there is no explicit point at which to set or clear a loading variable.

**Explanation:** With direct data source binding, data is retrieved automatically as filter criteria change — the maker does not write imperative code that starts and ends the load. As a result, there is no explicit step where a `showLoader` variable can be toggled on and off.

</details>

---

### Question 15 — Single Choice

The Power Apps Review Tool can evaluate a canvas app against a checklist of best practices. A maker wants to upload an app file for evaluation without importing a solution into Dataverse.

What file format does the Power Apps Review Tool accept for direct upload?

- A. `.zip`
- B. `.json`
- C. `.msapp`
- D. `.pbix`

<details>
<summary>Answer</summary>

**Correct answer:** C. `.msapp`

**Explanation:** The Power Apps Review Tool, which is packaged as an importable Dataverse solution, also accepts `.msapp` files for direct upload and evaluation without needing the app to be present in your Dataverse environment.

</details>

---

### Question 16 — Multi-Select

A canvas app maker wants to use the `App.StartScreen` property to determine which screen to display at startup based on the current user's role.

Which of the following are data flow functions or signals that are available in the `App.StartScreen` property? (Select **three**.)

- A. `Param()`
- B. `Navigate()`
- C. `User()`
- D. `Set()`
- E. `Filter()`
- F. `ClearCollect()`

<details>
<summary>Answer</summary>

**Correct answer:** A. `Param()`, C. `User()`, E. `Filter()`

**Explanation:** `App.StartScreen` is a data flow property and supports data flow functions such as `Param()`, `User()`, `Filter()`, `LookUp()`, `CountRows()`, `Max()`, and signals like `Connection` and `Compass`. Behavior functions such as `Navigate()`, `Set()`, and `ClearCollect()` are not allowed in `StartScreen`.

</details>

---

### Question 17 — Multi-Select

A maker is reviewing an existing canvas app for startup performance improvements. They want to identify which app settings to verify.

Which of the following app settings have a direct positive impact on load time performance when enabled? (Select **two**.)

- A. Debug published app
- B. Delay load
- C. Enable Navigate function in App.OnStart
- D. Use non-blocking OnStart rule
- E. Explicit Column Selection

<details>
<summary>Answer</summary>

**Correct answer:** B. Delay load, D. Use non-blocking OnStart rule

**Explanation:** **Delay load** delays running screen expression calls until they are needed, reducing the work done at startup. **Use non-blocking OnStart rule** allows `App.OnStart` formulas to run concurrently with other app rules in published apps, preventing other rules from waiting for OnStart to finish. Both are on by default for new apps but may need to be manually enabled for older apps.

</details>

---

### Question 18 — Multi-Select

A maker is evaluating which data load strategy to use for a new screen in their canvas app. The screen will allow users to edit multiple rows and submit all changes at once.

Which of the following are advantages of preloading data into a collection using `ClearCollect()`? (Select **two**.)

- A. Data is automatically refreshed whenever another user modifies a record.
- B. A loading indicator can be shown while data is being fetched.
- C. The collection is not limited by the Data row limit setting.
- D. Users can modify multiple rows locally and commit all changes at once using `Patch()`.
- E. Data retrieval automatically scales beyond 2,000 rows without delegation.

<details>
<summary>Answer</summary>

**Correct answer:** B. A loading indicator can be shown while data is being fetched, D. Users can modify multiple rows locally and commit all changes at once using `Patch()`.

**Explanation:** Preloading into a collection allows makers to wrap the load with `Set(showLoader, true/false)` to display a visual indicator. It also enables multi-row local edits that can be committed in a single `Patch(Desks, colDesks)` call. However, collections are subject to the Data row limit setting and are not automatically refreshed when data changes externally.

</details>

---

### Question 19 — Multi-Select

A maker launches Microsoft Azure Monitor and starts the canvas app to observe its startup behavior.

Which of the following issues can Monitor help identify? (Select **three**.)

- A. Errors in using connectors
- B. Compilation errors in formulas during editing
- C. Excessive data being sent or received
- D. Duplicated data actions
- E. Missing required fields in Dataverse tables
- F. Slow response from connectors

<details>
<summary>Answer</summary>

**Correct answer:** A. Errors in using connectors, C. Excessive data being sent or received, D. Duplicated data actions, F. Slow response from connectors

**Explanation:** Monitor captures a real-time stream of events that includes connector interactions. It can surface connector errors, large data payloads, duplicated data calls, and slow connector response times. Formula compilation errors and Dataverse schema issues are identified in Power Apps Studio, not in Monitor.

> **Note:** Three options are correct according to the source material (A, C, D, F = four). The question stem said "Select three" but all four are correct per the documentation. Accept any three or all four.

</details>

---

### Question 20 — Multi-Select

A developer is reviewing the Power Apps Review Tool's checklist for a canvas app's startup performance.

Which of the following rules does the Power Apps Review Tool check that can impact startup time? (Select **three**.)

- A. Use of the `Concurrent` function for parallel data requests
- B. Cross-screen dependencies — encapsulate repeating UI in components
- C. Correct color theming applied to all controls
- D. App Settings flags — ensure Delayed Load and Explicit Column Selection are On
- E. Use of responsive layout containers
- F. Asset Optimization — review embedded asset compression and size

<details>
<summary>Answer</summary>

**Correct answer:** A. Use of the `Concurrent` function, B. Cross-screen dependencies, D. App Settings flags, F. Asset Optimization

**Explanation:** The Power Apps Review Tool checks for use of `Concurrent()`, cross-screen dependencies that should be encapsulated in components, app settings like Delayed Load and Explicit Column Selection, asset optimization, delegation, and data loading strategy. Color theming and responsive layout are not startup performance checks.

> **Note:** Four options are correct per the source material. Accept any three or all four.

</details>

---

### Question 21 — Fill-in-the-Blank

When using `OnVisible` to preload a collection, the data reload can be prevented on every screen visit by checking whether the collection already has data. The following formula only loads the collection if it is empty:

`___(IsEmpty(colDesks), ClearCollect(colDesks, Desks))`

<details>
<summary>Answer</summary>

**Answer:** `If`

**Explanation:** Wrapping `ClearCollect()` in an `If(IsEmpty(...))` guard ensures the expensive data load only runs the first time the screen is visited. On subsequent visits, the collection is already populated and the load is skipped.

</details>

---

### Question 22 — Fill-in-the-Blank

To run multiple independent data loads in parallel rather than sequentially in `App.OnStart`, makers use the `___()` function and pass each data load operation as a separate argument.

<details>
<summary>Answer</summary>

**Answer:** `Concurrent`

**Explanation:** The `Concurrent()` function allows multiple independent formulas — such as several `ClearCollect()` calls and a `Set()` call — to execute in parallel. This can significantly reduce total startup time compared to running them one at a time sequentially.

</details>

---

### Question 23 — Fill-in-the-Blank

To load data from a device's local storage before fetching fresh data from a connector, a maker uses the `___()` function. After updating the collection from the connector, the maker persists the latest data locally using the `___()` function.

<details>
<summary>Answer</summary>

**Answer:** `LoadData`, `SaveData`

**Explanation:** The load-from-persisted-storage pattern calls `LoadData()` to immediately populate the collection from local device storage (providing instant data while the network call completes), then calls `ClearCollect()` to refresh from the connector, and finally `SaveData()` to persist the updated data locally for the next launch.

</details>

---

### Question 24 — Fill-in-the-Blank

A maker wants to add custom log messages to the Monitor event log to mark the beginning and end of data loading in `App.OnStart`. They use the following pattern:

```
___("Start of OnStart");
ClearCollect(colDesks, Desks);
___("End of OnStart");
```

The function used in both blanks is `___`.

<details>
<summary>Answer</summary>

**Answer:** `Trace`

**Explanation:** The `Trace()` function logs custom messages into the Monitor event log. Placing `Trace()` calls before and after data loading operations allows makers to measure the duration of each step during a cold start evaluation.

</details>

---

### Question 25 — Fill-in-the-Blank

To display a loading indicator while preloading data in `App.OnStart`, a maker places a spinner component on the first screen and sets its `Visible` property to a variable called `showLoader`. In `App.OnStart`, the loading state is enabled before the data calls and disabled after with `Set(showLoader, ___)` and `Set(showLoader, ___)` respectively.

<details>
<summary>Answer</summary>

**Answer:** `true`, `false`

**Explanation:** The loading image pattern sets `showLoader` to `true` before the data loads begin and to `false` after all `ClearCollect()` calls complete. The spinner component's `Visible` property is bound to the `showLoader` variable, providing visual feedback to users during the load without actually speeding up the app.

</details>
