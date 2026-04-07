# Recall: Optimize Canvas App Load Time

> **Source files:** 1-introduction.md, 2-monitor-start-performance-issues.md, 3-optimize-on-start.md, 4-data-load-strategies.md

---

## Keywords

| Term | Definition |
|------|-----------|
| App.OnStart | App object property that runs formulas when a user starts the app; commonly used to preload data and set global variables. |
| App.StartScreen | Data flow property that replaces `Navigate()` in OnStart to conditionally select the first screen shown at startup. |
| Monitor | Power Apps Studio tool that captures a stream of events from a running app to identify performance and connector issues. |
| Trace() | Power Apps function that logs custom messages to the Monitor event log for marking OnStart/OnVisible execution points. |
| Concurrent() | Power Apps function that runs multiple independent data-loading formulas in parallel instead of sequentially. |
| ClearCollect() | Function that clears a collection and refills it from a data source, used to preload data into a local collection. |
| Delegation | Capability allowing data operations (filter, sort) to be processed server-side, bypassing the Data row limit. |
| Data row limit | App setting (1–2,000, default 500) that caps how many rows are retrieved from a server when delegation is not supported. |
| LoadData() / SaveData() | Functions to read from and write to device local storage, enabling offline or fast-start data loading strategies. |
| Delay load | App setting that defers running screen expression calls until they are needed; on by default for new apps. |
| Use non-blocking OnStart rule | App setting allowing App.OnStart formulas to run concurrently with other app rules rather than blocking them. |
| Power Apps Review Tool | Open-source solution importable into Dataverse that audits apps against a best-practices checklist including startup performance. |
| Cold start | Running an app without any cached data to get accurate Monitor event logs unaffected by prior caching. |

---

## Main Ideas

- App startup has four phases: **Authenticate**, **Get metadata**, **OnStart processing**, and **Render screens** — each is a potential optimization target.
- Unused connectors increase authentication prompts and slow startup; remove connectors not in use.
- `Navigate()` in `App.OnStart` is retired for new apps; use `App.StartScreen` (a data flow property) instead. Global variables and collections set in OnStart are **not** available in `StartScreen`.
- If data is only needed on one screen, move the load logic from `App.OnStart` to that screen's `OnVisible` property to defer it.
- Enable **Use non-blocking OnStart rule** so OnStart runs concurrently with other app rules; required for older apps (on by default for new apps).
- The **Data row limit** setting (default 500, max 2,000) can silently truncate preloaded collections in production; always check this when preloading large datasets.
- Direct data source binding in gallery `Items` supports delegation and has no row limit, but does not allow showing a loading indicator.
- Preloading into a collection via `ClearCollect()` supports loading indicators and batch edits via `Patch()`, but data goes stale until `ClearCollect()` is called again.
- Use `LoadData()` first then `ClearCollect()` then `SaveData()` to implement a persisted storage strategy that speeds up initial display and supports intermittent connectivity.
- Cache non-tabular connector results in a single variable (e.g., `Set(profile, Office365Users.MyProfileV2())`) and use dot notation to avoid multiple redundant connector calls.
- Wrap independent `ClearCollect()` / `Set()` calls in `Concurrent()` to load data in parallel and reduce total wait time.
- Use `If(IsEmpty(colDesks), ClearCollect(colDesks, Desks))` in `OnVisible` to prevent reloading data every time a screen is revisited.
- **Debug published app** setting enables extra diagnostic info but degrades performance — never leave it on for production.
- Monitor requires a **cold start** (publish the app, launch Monitor from make.powerapps.com) to avoid cache-skewed event logs.
- A loading image/spinner (controlled by a variable like `showLoader`) improves user perception without actually speeding up the app.

---

## Mini Quiz

### Q1 — Single Choice

A maker has conditional navigation logic using `Navigate()` in `App.OnStart` in an older app. They want to migrate to the modern approach.

Which property should replace this logic?

- A. `App.OnStart` with `IfError()`
- B. `Screen.OnVisible`
- C. `App.StartScreen`
- D. `App.OnError`

<details>
<summary>Answer</summary>

**Correct answer:** C. `App.StartScreen`

**Explanation:** `App.StartScreen` is the modern replacement for `Navigate()` in `App.OnStart`. It is a data flow property evaluated once at startup and supports functions like `Param()`, `User()`, and `LookUp()`.

</details>

---

### Q2 — Fill-in-the-Blank

To load three independent collections simultaneously instead of one at a time, wrap the `ClearCollect()` calls inside the `___` function.

<details>
<summary>Answer</summary>

**Answer:** `Concurrent`

**Explanation:** The `Concurrent()` function runs multiple independent formulas in parallel, reducing the total data load time compared to sequential execution.

</details>

---

### Q3 — Single Choice

A gallery bound directly to a Dataverse table with 100,000 rows loads only the first page and fetches more rows as the user scrolls. Which feature enables this behavior?

- A. `ClearCollect()` preloading
- B. Delegation
- C. `LoadData()` from local storage
- D. The `Concurrent()` function

<details>
<summary>Answer</summary>

**Correct answer:** B. Delegation

**Explanation:** Direct data source binding with delegation allows Power Apps to push filter/sort operations to the server, bypassing the Data row limit and using `getRows` / `getMoreRows` calls automatically.

</details>

---

### Q4 — Fill-in-the-Blank

To prevent an `OnVisible` formula from reloading a collection every time the user navigates to a screen, wrap the `ClearCollect()` call in `If(___(colDesks), ClearCollect(colDesks, Desks))`.

<details>
<summary>Answer</summary>

**Answer:** `IsEmpty`

**Explanation:** Checking `IsEmpty(colDesks)` before calling `ClearCollect()` ensures the data is only loaded once — when the collection is empty — rather than on every screen visit.

</details>

---

### Q5 — Single Choice

A developer calls `Office365Users.MyProfileV2()` three separate times to store `displayName`, `hireDate`, and `city` into individual variables. What is the main problem with this approach?

- A. `Set()` cannot store connector results
- B. The connector is called three times instead of once, causing unnecessary overhead
- C. Global variables are not available in `App.StartScreen`
- D. `Office365Users` does not support delegation

<details>
<summary>Answer</summary>

**Correct answer:** B. The connector is called three times instead of once, causing unnecessary overhead

**Explanation:** Each `Set()` call invoking `MyProfileV2()` triggers a separate connector request. Storing the full result in one variable (`Set(profile, Office365Users.MyProfileV2())`) and using dot notation eliminates the redundant calls.

</details>

---

### Q6 — Single Choice

When using Monitor to evaluate app startup performance, why is a cold start required?

- A. Monitor only works on published apps, not apps in Studio
- B. Cached data from previous runs can mask the true startup event timings
- C. The `Trace()` function only logs events during a cold start
- D. Power Apps Studio blocks Monitor during hot starts

<details>
<summary>Answer</summary>

**Correct answer:** B. Cached data from previous runs can mask the true startup event timings

**Explanation:** A cold start ensures no previously cached data influences the events captured in Monitor, giving an accurate picture of how the app spends its load time.

</details>

---

### Q7 — Fill-in-the-Blank

The `___` strategy loads data from device local storage first, then refreshes from the data source, and finally calls `SaveData()` to persist the latest data — useful when the data source is slow or intermittently available.

<details>
<summary>Answer</summary>

**Answer:** Load from persisted storage (LoadData / SaveData pattern)

**Explanation:** Using `LoadData()` before `ClearCollect()` displays locally cached data immediately while the fresh data loads, improving perceived performance and supporting offline scenarios.

</details>

---
