# Quiz: Testing, Performance, and Optimization in Power Apps Canvas Apps

> **Source material:** 1-performance.md, 2-data-sources.md, 3-testing-troubleshooting.md, 3a-exercise-performance.md, 4-knowledge-check.md, 5-summary.md, SUMMARY.md
> **Total questions:** 25
> **Question types:** Multiple choice (single), Multiple choice (multi-select), Fill-in-the-blank

---

## Questions

### Question 1 — Single Choice

A maker builds a gallery that displays 150 employee records from a Dataverse table. Inside the gallery, each row has a label whose **Text** property uses `LookUp(Departments, ID = ThisItem.DeptID, Name)` to display the department name. Users report the gallery takes several minutes to render.

What is the root cause of this performance problem?

- A. The gallery exceeds the maximum supported record count for Dataverse.
- B. LookUp inside a gallery executes once per record, resulting in 150 individual data source calls.
- C. The Departments table is stored in the wrong data source type for lookups.
- D. The Refresh function is automatically triggered for each gallery row.

<details>
<summary>Answer</summary>

**Correct answer:** B. LookUp inside a gallery executes once per record, resulting in 150 individual data source calls.

**Explanation:** When a LookUp function is placed on a control inside a gallery, it is evaluated once for every record displayed. With 150 records, this generates 150 individual round-trips to the data source, which can take minutes to render. The recommended fix is to cache related data in a collection or use a details screen.

</details>

---

### Question 2 — Single Choice

A maker finishes building a canvas app. The app uses a form to submit new records to a SharePoint list, which is also displayed in a gallery on the next screen. In the **OnVisible** property of the gallery screen, the maker adds `Refresh(SharePointList)` to ensure fresh data.

What is the impact of this approach?

- A. It is the recommended way to keep gallery data current after form submissions.
- B. It redundantly refreshes data that Power Apps already refreshed automatically, slowing the app.
- C. Without Refresh in OnVisible, the gallery will never show newly submitted records.
- D. The Refresh function is required because OnVisible is non-blocking.

<details>
<summary>Answer</summary>

**Correct answer:** B. It redundantly refreshes data that Power Apps already refreshed automatically, slowing the app.

**Explanation:** Power Apps automatically refreshes a data source connection when a form submits a new record. Adding an explicit Refresh call on top of this is redundant and adds unnecessary network latency. The Refresh function should only be used when you have confirmed it is actually needed.

</details>

---

### Question 3 — Single Choice

A field technician app allows users to capture photos using the Camera control and save them alongside inspection records. The current implementation stores images directly in SQL Server. Users on mobile devices report that saving an inspection takes a long time.

Which change would most directly improve the save performance for images?

- A. Increase the SQL Server connection timeout setting in Advanced settings.
- B. Use the Experimental features toggle to enable faster file writes.
- C. Store images in Azure Blob Storage instead of SQL Server.
- D. Move the image save logic from OnVisible to OnStart.

<details>
<summary>Answer</summary>

**Correct answer:** C. Store images in Azure Blob Storage instead of SQL Server.

**Explanation:** SQL Server is inefficient for storing image and file data; writing and reading images to a SQL database is slow. Azure Blob Storage is optimized for this type of binary data and is significantly faster for image read/write operations, which directly improves the user's save experience.

</details>

---

### Question 4 — Single Choice

A maker's app loads three collections at startup using sequential `ClearCollect` calls in the **OnStart** property. Each collection takes approximately four seconds to load from its data source. Users are frustrated by the twelve-second load time.

Which formula change reduces the startup time to approximately four seconds?

- A. Move all three `ClearCollect` calls to the **OnVisible** property of the home screen.
- B. Replace the three `ClearCollect` calls with a single `Collect` call that combines all three tables.
- C. Wrap all three `ClearCollect` calls inside the `Concurrent` function.
- D. Add a `Refresh` call before each `ClearCollect` to pre-warm the connections.

<details>
<summary>Answer</summary>

**Correct answer:** C. Wrap all three `ClearCollect` calls inside the `Concurrent` function.

**Explanation:** The `Concurrent` function runs all enclosed formulas simultaneously. Instead of waiting for each ClearCollect to finish before starting the next (4 s + 4 s + 4 s = 12 s), all three execute at the same time, reducing total load time to approximately 4 seconds — the duration of the longest single call.

</details>

---

### Question 5 — Single Choice

A maker wants to preload a list of active regions from a Dataverse table into a collection when the app starts. The collection is used in drop-down controls on multiple screens. The maker is deciding between placing the `ClearCollect` call in **OnStart** or **OnVisible** on the first screen.

Which placement provides the best performance and why?

- A. OnVisible, because it runs before the screen renders, ensuring data is always current.
- B. OnStart, because it runs once at launch and the collection is available throughout the app without repeated queries.
- C. OnVisible, because it is non-blocking and will not delay the user from seeing the screen.
- D. OnStart, because it is the only property that supports the ClearCollect function.

<details>
<summary>Answer</summary>

**Correct answer:** B. OnStart, because it runs once at launch and the collection is available throughout the app without repeated queries.

**Explanation:** OnStart runs once when the app launches, making the collection available on every screen without re-querying the data source each time. Placing the same call in OnVisible would negate the caching benefit — the data source would be queried every time a user navigates to that screen.

</details>

---

### Question 6 — Single Choice

A maker builds a mobile app that filters a large Inventory table using a formula that is not delegable. To see all records, the maker increases the delegation limit to 2,000 rows. The app will be used by warehouse workers on mobile devices with cellular connections.

What performance risk must the maker consider?

- A. The app will return no results because non-delegable functions are blocked on mobile.
- B. The first 2,000 rows are downloaded across the network and processed locally, which is costly on slow cellular connections.
- C. Increasing the delegation limit automatically converts the function to a delegable one.
- D. The data source will reject queries that exceed the default delegation limit of 500.

<details>
<summary>Answer</summary>

**Correct answer:** B. The first 2,000 rows are downloaded across the network and processed locally, which is costly on slow cellular connections.

**Explanation:** When a function is not delegable, Power Apps downloads up to the delegation limit (commonly 2,000 rows) from the data source and processes the data locally. On a slow cellular connection or a low-end mobile device, transferring and processing this volume of data can cause significant delays and a poor user experience.

</details>

---

### Question 7 — Single Choice

A maker discovers an Experimental feature in Power Apps Studio that claims to improve data loading speed. The maker wants to enable it in a production app that is used by 500 employees.

What is the most important consideration before enabling this feature in production?

- A. Experimental features require a premium Power Apps license to enable.
- B. Experimental features may change, break, or disappear at any time and are not safe for production use.
- C. Experimental features are fully supported once enabled and can be used in production with no risk.
- D. Experimental features can only be enabled one at a time per app.

<details>
<summary>Answer</summary>

**Correct answer:** B. Experimental features may change, break, or disappear at any time and are not safe for production use.

**Explanation:** Experimental features are off by default and are explicitly labeled as features that might change, break, or disappear. Incorporating them into production apps carries a significant risk, as they can evolve, completely change, or be removed without notice. They are best used for evaluation in development environments only.

</details>

---

### Question 8 — Single Choice

A maker sets up a **Timer** control, a **Button**, and a **Text label** to measure how long a `ClearCollect` call takes. The Button's `OnSelect` sets a context variable `StartTimer` to `true`, runs the ClearCollect, then sets `StartTimer` to `false`. The Timer's `Start` property is set to `StartTimer`, and the label's `Text` is set to `Timer1.Value`.

After selecting the button in Power Apps Studio (edit mode), the label shows 0. What is the likely reason?

- A. The Timer control requires a Premium connector to measure elapsed time.
- B. The context variable `StartTimer` must be initialized in OnStart before use.
- C. The Timer control does not start counting unless the app is in Preview mode.
- D. `Timer1.Value` returns seconds, not milliseconds, so the label appears to show 0.

<details>
<summary>Answer</summary>

**Correct answer:** C. The Timer control does not start counting unless the app is in Preview mode.

**Explanation:** The Timer control only starts counting when the app is running in Preview mode. Selecting the button directly in the edit/design mode of Power Apps Studio does not activate the Timer, so the value remains 0. The maker must press the Play button to enter Preview mode before testing.

</details>

---

### Question 9 — Single Choice

A maker notices that a specific screen in their app has a noticeable lag. Using the Timer control, they measure the operation takes 4,200 milliseconds. They want to determine whether the lag originates inside the app logic, in the network, or in the data source processing.

Which tool should the maker use to isolate the source of the delay?

- A. The Variables panel under File > Variables in Power Apps Studio.
- B. The Power Apps Monitor tool, which logs individual network calls and their durations.
- C. The App checker icon, which runs a static analysis of formula performance.
- D. A third-party browser extension that intercepts all HTTP traffic.

<details>
<summary>Answer</summary>

**Correct answer:** B. The Power Apps Monitor tool, which logs individual network calls and their durations.

**Explanation:** The Monitor tool logs every app action including individual network calls, timestamps, operation type, result, status, and duration in milliseconds. By examining these logs, a maker can determine whether most of the elapsed time is spent in the app, on the network, or waiting for the data source to process and respond.

</details>

---

### Question 10 — Single Choice

A maker uses `ClearCollect(colProducts, ProductsTable)` in the app's **OnStart** property to cache product data. The ProductsTable has 1,200 active records, but when the maker checks the collection, it only contains 500 records.

What is the cause of this discrepancy?

- A. ClearCollect has a maximum collection size of 500 records enforced by the Power Platform.
- B. The Collect function is not delegable; by default only the first 500 items are returned from the data source.
- C. The ProductsTable data source requires a delegation override formula to return more than 500 records.
- D. OnStart only supports collections up to 500 records due to memory constraints.

<details>
<summary>Answer</summary>

**Correct answer:** B. The Collect function is not delegable; by default only the first 500 items are returned from the data source.

**Explanation:** The Collect (and ClearCollect) function is not delegable, which means it cannot push filtering or paging logic to the data source. As a result, it retrieves only the default row limit — 500 records by default — regardless of how many records exist in the source table. Makers must account for this limitation when deciding to use collections.

</details>

---

### Question 11 — Single Choice

A maker's published canvas app was created two years ago and has not been reopened or republished since. The maker is told that Power Apps has released several platform performance improvements since then.

What must the maker do to benefit from those platform improvements?

- A. Enable the "Update to latest version" experimental feature from App settings.
- B. Delete and recreate the app from scratch to get the latest version.
- C. Open the app in Power Apps Studio and republish it.
- D. Upgrade the Power Apps license to access the latest platform version.

<details>
<summary>Answer</summary>

**Correct answer:** C. Open the app in Power Apps Studio and republish it.

**Explanation:** A published canvas app stays on the version of the Power Apps platform it was built and published with. The only way to take advantage of platform performance improvements and new features is to open the app in Power Apps Studio and publish it again. Periodically republishing is a recommended best practice.

</details>

---

### Question 12 — Single Choice

A new maker is building their first canvas app and wants to apply every performance optimization technique from the start. However, the app's core functionality is not yet working correctly.

According to best practices, what is the recommended approach?

- A. Apply all performance optimizations first so the app runs fast from the start; fix bugs after.
- B. Build the app so it is fully functional first, then revisit and apply performance optimizations incrementally.
- C. Performance and functionality should always be developed in parallel with equal priority.
- D. Delegate performance optimization to Power Apps automatic tuning and focus entirely on features.

<details>
<summary>Answer</summary>

**Correct answer:** B. Build the app so it is fully functional first, then revisit and apply performance optimizations incrementally.

**Explanation:** The recommended methodology is to make the app functional first, then optimize performance in small, incremental steps — verifying that each change does not break existing functionality. A fast app that throws errors has no value. As a maker gains experience, performance patterns can be incorporated earlier in development.

</details>

---

### Question 13 — Single Choice

A maker builds a canvas app intended for use by warehouse workers who will run the app on Android phones over a cellular network. The maker tests exclusively on their high-speed office PC.

What critical testing scenario is the maker missing?

- A. Testing with the Power Apps Monitor tool open at all times.
- B. Testing the app as published in the same environment and network conditions as the end users.
- C. Testing all 200+ data source connectors to ensure compatibility.
- D. Testing each screen's OnStart property in isolation before publishing.

<details>
<summary>Answer</summary>

**Correct answer:** B. Testing the app as published in the same environment and network conditions as the end users.

**Explanation:** Testing only from a local PC with a fast connection gives best-case results that may not reflect what end users experience. For mobile apps used over cellular networks, the maker must test on mobile devices with the same network type to account for latency, smaller screen form factors, and varying connection speeds.

</details>

---

### Question 14 — Single Choice

A maker places a complex formula in the **OnVisible** property of a screen. The formula queries a data source and updates several local variables.

How does the **OnVisible** property handle screen rendering relative to formula execution?

- A. The screen waits until the formula fully completes before displaying any content to the user.
- B. The screen renders and displays to the user before the OnVisible formula finishes processing.
- C. OnVisible formulas are queued and run in the background without ever blocking the screen.
- D. OnVisible and OnStart formulas always execute simultaneously regardless of screen navigation.

<details>
<summary>Answer</summary>

**Correct answer:** B. The screen renders and displays to the user before the OnVisible formula finishes processing.

**Explanation:** OnVisible is non-blocking — the screen renders and becomes visible to the user before the OnVisible formula finishes executing. This means users see the screen immediately upon navigation, but controls that depend on data loaded by OnVisible may initially show empty or loading states until the formula completes.

</details>

---

### Question 15 — Single Choice

A maker adds a label to the app's welcome screen with the text property set to `"v3"`. The app has been updated three times and published each time.

What is the primary purpose of this version label in the context of testing?

- A. It tells Power Apps Studio which version of the platform API to use.
- B. It helps makers confirm they are viewing the latest published version rather than a cached older version.
- C. It is required by the App checker to validate that the app version matches the data source schema.
- D. It automatically invalidates the app cache every time the number changes.

<details>
<summary>Answer</summary>

**Correct answer:** B. It helps makers confirm they are viewing the latest published version rather than a cached older version.

**Explanation:** Power Apps caches apps to optimize performance. When republishing frequently — for example, when customizing SharePoint forms — it can be difficult to know whether you are seeing the latest published version or a cached older one. A visible version label (e.g., v1, v2, v3) lets the maker quickly confirm which version is currently running.

</details>

---

### Question 16 — Multi-Select

A development team is reviewing performance issues in a canvas app before releasing it to production. They identify several areas to investigate. (Select **three** areas that are commonly identified as performance bottlenecks based on best practices.)

- A. Too many LookUp calls executed inside a gallery control
- B. Using the Concurrent function to load multiple collections
- C. Storing images and files in SQL Server instead of Azure Blob Storage
- D. Publishing the app to production using the latest Power Apps Studio version
- E. High-resolution image assets embedded in the app that have not been resized
- F. Using the Filter function with a delegable data source

<details>
<summary>Answer</summary>

**Correct answer:** A, C, E

**Explanation:** LookUp inside a gallery generates one data source call per record (A), SQL Server is slow for image storage compared to Azure Blob Storage (C), and high-resolution assets consume more resources to store and display (E). Using Concurrent (B) is a performance improvement, not a bottleneck. Publishing with the latest Studio version (D) and using delegable Filter functions (F) are both recommended practices that improve, not hurt, performance.

</details>

---

### Question 17 — Multi-Select

A maker wants to improve startup performance of a canvas app that currently loads five data source collections sequentially in OnStart, taking 15 seconds in total. (Select **three** techniques that directly address this startup performance problem.)

- A. Wrap the ClearCollect calls inside the Concurrent function to run them simultaneously
- B. Move all ClearCollect calls to the OnVisible property of the home screen
- C. Ensure the ClearCollect calls use delegable functions to minimize downloaded row counts
- D. Use the Refresh function before each ClearCollect to ensure the data is current
- E. Cache only static or slowly changing data in OnStart, removing unnecessary collections
- F. Enable an Experimental feature that claims to speed up collection loading in production

<details>
<summary>Answer</summary>

**Correct answer:** A, C, E

**Explanation:** Using Concurrent (A) executes all collections in parallel instead of sequentially. Using delegable functions (C) ensures only matching rows are transferred across the network rather than downloading the full row limit locally. Removing unnecessary collections from OnStart (E) reduces total load work. Moving loads to OnVisible (B) re-queries the data source on every navigation, negating the cache benefit. Adding Refresh (D) is redundant and adds overhead. Enabling Experimental features in production (F) is not recommended due to instability risks.

</details>

---

### Question 18 — Multi-Select

A maker uses the Power Apps Monitor tool to investigate a 5-second lag when a screen loads. (Select **two** capabilities of Monitor that help diagnose this issue.)

- A. It shows the duration in milliseconds of each individual network call made by the app.
- B. It provides a step-by-step code execution debugger for Power Fx formulas.
- C. It logs which data source was called and what the result and status of each call was.
- D. It automatically suggests formula changes to improve delegation performance.
- E. It blocks slow network calls and replaces them with cached responses for testing.

<details>
<summary>Answer</summary>

**Correct answer:** A, C

**Explanation:** The Monitor tool logs each network call with its duration in milliseconds (A) and includes columns for the data source, operation, result, and status of each call (C). This allows makers to see whether delay originates in the app, the network, or the data source. Monitor does not provide a formula debugger (B), auto-suggest formula fixes (D), or intercept and mock network calls (E).

</details>

---

### Question 19 — Multi-Select

A maker is deciding what logic to place in the **OnStart** property of their app. (Select **two** characteristics of OnStart that are important to consider when making this decision.)

- A. OnStart formulas must fully complete before the app opens for the user.
- B. OnStart runs every time the user navigates to any screen in the app.
- C. OnStart is an app-level property that runs once when the app launches.
- D. OnStart is non-blocking, so users see the first screen while it processes.
- E. OnStart supports a maximum of three formula statements.

<details>
<summary>Answer</summary>

**Correct answer:** A, C

**Explanation:** OnStart is an app-level property (C) that runs once when the app launches, and all formulas in it must finish processing before the app opens for the user, making it blocking (A). It does not run on every screen navigation (B is false), it is not non-blocking (D is false), and there is no limit of three statements (E is false).

</details>

---

### Question 20 — Multi-Select

A maker wants to reduce the overall size and complexity of an all-purpose canvas app that currently serves five different job roles. (Select **two** recommended strategies from Power Apps best practices.)

- A. Break the large app into smaller, focused apps organized by role or process.
- B. Move all images to a hidden gallery to load them in the background.
- C. Resize image assets to match the display dimensions needed in the app.
- D. Increase the delegation limit to 5,000 rows to reduce the need for multiple apps.
- E. Add experimental features to compress images at runtime.

<details>
<summary>Answer</summary>

**Correct answer:** A, C

**Explanation:** Building focused apps per role or process (A) reduces app size, simplifies troubleshooting, and optimizes the user experience. Resizing image assets to the dimensions actually displayed (C) reduces file size and the resources needed to store and render images. Hiding images in a gallery (B) does not reduce app size. Increasing the delegation limit (D) addresses record count, not app complexity or asset size. Using experimental features in production (E) is not a recommended practice.

</details>

---

### Question 21 — Fill-in-the-Blank

The `___` function in Power Apps allows multiple formulas to execute simultaneously rather than sequentially, which is especially useful for loading several collections at app startup.

<details>
<summary>Answer</summary>

**Answer:** Concurrent

**Explanation:** The `Concurrent` function runs all enclosed formulas at the same time. For example, three `ClearCollect` calls that each take 3 seconds sequentially (9 s total) complete in approximately 3 seconds when wrapped in `Concurrent`, because all three execute simultaneously.

</details>

---

### Question 22 — Fill-in-the-Blank

The `Collect` and `ClearCollect` functions are not `___`, meaning that by default only the first `___` records are returned from the data source and stored in the collection.

<details>
<summary>Answer</summary>

**Answer:** delegable; 500

**Explanation:** Because Collect and ClearCollect are not delegable, they cannot push processing to the data source. As a result, they retrieve only up to the default row limit of 500 records. Makers must plan for this limitation when implementing collection-based caching strategies.

</details>

---

### Question 23 — Fill-in-the-Blank

To access the Power Apps `___` tool, a maker can select the **Advanced tools** icon from the left-side toolbar or the **App checker** icon from the command bar, then select **Open ___**. The tool opens in a separate `___` tab and begins logging all app actions immediately.

<details>
<summary>Answer</summary>

**Answer:** Monitor; Monitor; browser

**Explanation:** The Monitor tool is accessible from two entry points in Power Apps Studio. Once opened, it runs in a separate browser tab and automatically begins tracking every app action, including network calls, timing, and data source interactions — all without requiring additional configuration.

</details>

---

### Question 24 — Fill-in-the-Blank

When using a Timer control to measure query performance, the **Text** property of a label control should be set to `___` to display the elapsed time, and the Timer will only begin counting when the app is in `___` mode.

<details>
<summary>Answer</summary>

**Answer:** Timer1.Value; Preview

**Explanation:** `Timer1.Value` returns the elapsed time recorded by the Timer control. The Timer only activates and starts counting when the app is running in Preview mode — selecting the trigger button in the design/edit view of Power Apps Studio will not start the Timer.

</details>

---

### Question 25 — Fill-in-the-Blank

`___` features in Power Apps are well-tested and nearly ready for general availability; they are enabled by default in new apps. `___` features, by contrast, are off by default and may change, break, or disappear at any time, making them unsuitable for production apps. Both can be accessed via **File > App settings > `___`**.

<details>
<summary>Answer</summary>

**Answer:** Preview; Experimental; Advanced settings

**Explanation:** Preview features represent capabilities that are close to being released and are generally safe to use, as they will soon become standard. Experimental features are unstable by definition and should only be evaluated in development or test environments. Both types of features are toggled from the Advanced settings section of the App settings panel.

</details>
