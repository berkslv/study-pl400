# Recall: Testing and Performance Checks in Power Apps

> **Source files:** 1-performance.md, 2-data-sources.md, 3-testing-troubleshooting.md, 3a-exercise-performance.md, 5-summary.md

---

## Keywords

| Term | Definition |
|------|-----------|
| Delegation | A mechanism where data source handles query processing server-side, returning only matching rows to the app. |
| ClearCollect | Function that clears a collection and repopulates it with data from a specified source. |
| Concurrent | Power Apps function that executes multiple formulas simultaneously instead of sequentially. |
| OnStart | App-level property whose formulas run once when the app launches, blocking until complete. |
| OnVisible | Screen-level property whose formulas run every time a user navigates to that screen; non-blocking. |
| Monitor | Built-in Power Apps tool that logs network calls, durations, and data source activity in real time. |
| Timer control | A Power Apps control used to measure elapsed time in milliseconds for formula execution. |
| Preview feature | A well-tested feature near general release, enabled by default in new apps, not yet fully released. |
| Experimental feature | An unstable Power Apps feature, off by default, that may change or disappear without notice. |
| Azure Blob Storage | Cloud storage optimized for binary data like images, faster than SQL Server for file read/write. |
| Delegation limit | Default cap (500 rows; configurable up to 2,000) on records returned when a function is non-delegable. |

---

## Main Ideas

- Data source interactions (network round-trips, query processing, data return) are the most common performance bottleneck in Power Apps.
- Redundant `Refresh()` calls slow apps; Power Apps automatically refreshes connections after form submissions — add `Refresh` only when explicitly needed.
- A `LookUp` inside a Gallery executes once per visible record; 100 records = 100 network calls. Cache related data in a collection instead.
- Store images in Azure Blob Storage, not SQL Server — SQL is inefficient for binary file read/write operations.
- `ClearCollect` in `OnStart` caches static data once at launch; referencing the collection in controls eliminates repeated data source queries.
- `ClearCollect` is non-delegable — only the first 500 rows are fetched by default; plan for this limit.
- Non-delegable functions with a raised delegation limit (up to 2,000 rows) download all matching rows across the network for local processing, which is costly on slow/mobile connections.
- The `Concurrent` function runs multiple formulas in parallel; three 3-second collections take ~3 seconds total instead of 9 seconds.
- Formulas inside `Concurrent` must be independent — execution order is not guaranteed.
- `OnStart` blocks app launch until complete; `OnVisible` is non-blocking but re-executes every navigation.
- The Timer control (Start property bound to a context variable) measures formula duration in milliseconds; only works in Preview mode.
- The Monitor tool (accessible via Advanced tools or App checker) records every network call with timestamps, duration, data source, status, and control name.
- Monitor can distinguish whether a performance lag originates in the app, network, or data source.
- Always test apps in conditions matching the end-user environment (mobile device, cellular network, etc.), not just on a development PC.
- Asset file size directly impacts app load time; resize images to their display size before embedding them.
- Republishing an app moves it to the latest Power Apps runtime version, picking up platform-level performance improvements.

---

## Mini Quiz

### Q1 — Single Choice

You have a Gallery that displays 150 employee records. Each row includes a Label with `LookUp(Departments, DepartmentID = thisGalleryItem.DeptID, DeptName)`.

What is the performance impact of this formula?

- A. One network call is made and results are cached automatically.
- B. 150 individual network calls to the Departments data source are made per render.
- C. The LookUp is delegated, so no network overhead occurs.
- D. Power Apps batches all LookUp calls into a single request.

<details>
<summary>Answer</summary>

**Correct answer:** B. 150 individual network calls to the Departments data source are made per render.

**Explanation:** A `LookUp` placed inside a Gallery control executes once for every record displayed. With 150 records, that means 150 separate network calls, which can cause the screen to take minutes to render.

</details>

---

### Q2 — Fill-in-the-Blank

To load three collections at the same time instead of sequentially, wrap the `ClearCollect` calls inside the ___ function.

<details>
<summary>Answer</summary>

**Answer:** Concurrent

**Explanation:** The `Concurrent` function executes all its formula arguments simultaneously. Three collections that each take 3 seconds sequentially (9 seconds total) will complete in approximately 3 seconds when wrapped in `Concurrent`.

</details>

---

### Q3 — Single Choice

A maker stores user-uploaded photos directly in a SQL Server database. Users report the app is slow when saving photos.

What is the recommended fix?

- A. Compress photos to grayscale before upload.
- B. Store photos in Microsoft Dataverse instead.
- C. Store photos in Azure Blob Storage instead.
- D. Increase the SQL Server connection timeout.

<details>
<summary>Answer</summary>

**Correct answer:** C. Store photos in Azure Blob Storage instead.

**Explanation:** SQL Server is inefficient for storing and retrieving binary image data. Azure Blob Storage is purpose-built for such files and provides faster read/write performance for images in Power Apps.

</details>

---

### Q4 — Fill-in-the-Blank

The `ClearCollect` function is non-___, meaning only the first ___ records are returned from the data source by default.

<details>
<summary>Answer</summary>

**Answer:** delegable; 500

**Explanation:** Because `Collect`/`ClearCollect` is non-delegable, Power Apps returns only the first 500 rows from the data source and stores them in the collection. Makers must plan for this limit when caching data.

</details>

---

### Q5 — Single Choice

A maker wants to measure exactly how long a `ClearCollect` formula takes to execute inside a running app.

Which control and mode combination achieves this?

- A. A Text Input control in Edit mode.
- B. A Timer control in Preview mode.
- C. A Slider control in Play mode.
- D. A Timer control in Design mode.

<details>
<summary>Answer</summary>

**Correct answer:** B. A Timer control in Preview mode.

**Explanation:** The Timer control measures elapsed time in milliseconds, but it only starts counting when the app is in Preview mode. The `Start` property is bound to a context variable that is set to `true` before and `false` after the formula runs.

</details>

---

### Q6 — Single Choice

A maker needs to decide where to initialize data that multiple screens share, versus data that is only relevant when a specific screen is shown.

Which statement correctly describes the difference between `OnStart` and `OnVisible`?

- A. `OnStart` runs every time a screen is navigated to; `OnVisible` runs once at launch.
- B. `OnStart` runs once at launch and blocks; `OnVisible` runs on each navigation and is non-blocking.
- C. `OnStart` is non-blocking; `OnVisible` blocks screen rendering until complete.
- D. Both properties execute in parallel and are non-blocking.

<details>
<summary>Answer</summary>

**Correct answer:** B. `OnStart` runs once at launch and blocks; `OnVisible` runs on each navigation and is non-blocking.

**Explanation:** `OnStart` is an app-level property that must finish before the app opens, making it blocking. `OnVisible` is per-screen and fires on every navigation to that screen, but the screen renders before the formulas finish — making it non-blocking.

</details>

---

### Q7 — Fill-in-the-Blank

The built-in ___ tool in Power Apps logs every network call made by the app, including duration in milliseconds, and can be opened from the Advanced tools icon or the App checker icon.

<details>
<summary>Answer</summary>

**Answer:** Monitor

**Explanation:** Monitor records app actions and network calls in real time, showing timestamps, operation type, data source, status, and duration. It helps determine whether a performance issue originates in the app, the network, or the data source.

</details>

---
