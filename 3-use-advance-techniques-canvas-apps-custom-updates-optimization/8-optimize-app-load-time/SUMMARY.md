# Summary: Optimizing Canvas App Load Time

> **Source files:** 1-introduction.md, 2-monitor-start-performance-issues.md, 3-optimize-on-start.md, 4-data-load-strategies.md, 5-check.md

---

## App Startup Sequence

- **Authenticate** — Handles authentication prompts for all configured connections. Removing unused connectors reduces prompts and speeds up this phase.
- **Get metadata** — Retrieves platform version and data source metadata.
- **OnStart processing** — Evaluates formulas in the `App.OnStart` property. Streamlining this phase has the most direct impact on load time.
- **Render screens** — Prepares and displays the first screen; evaluates `OnVisible` formulas. Fewer controls and optimized formulas improve render time.

---

## Measuring and Monitoring Load Performance

### Baseline Measurement

- Measure startup time from launch to first usable state with a stopwatch.
- Re-evaluate with each app update to track regressions.
- Consider user **perception** as well as actual time — users may feel an app is slow even if it loads quickly (e.g., data continues loading after first screen appears).
- Maker portal analytics: **Time to first screen** and **Time to first screen without connection setup** (last 30 days).

### Power Apps Review Tool

- Open-source solution importable into a Dataverse environment; also accepts `.msapp` file uploads.
- Checks against a customizable best-practices checklist.
- Key rules it checks for load time impact:
  - **Use of Concurrent function** — Use `Concurrent()` for parallel independent data requests.
  - **App Settings flags** — Ensure Delayed Load and Explicit Column Selection are On.
  - **Delegation** — Ensure `ClearCollect` and `Filter` operations are delegable.
  - **Asset Optimization** — Review embedded asset compression and size.
  - **Data loading strategy** — Avoid data calls in `OnStart`; move to `OnVisible` when possible.
  - **Cross-screen dependencies** — Encapsulate repeating UI (menus, header, footer) in components.

### Monitor Tool

- Launched from Power Apps Studio; captures a real-time stream of events from the running app.
- Identifies: connector errors, excessive data sent/received, slow connector responses, duplicated data actions.
- Provides app context (control name, formula) that browser developer tools lack.
- Changes can be made and retested without leaving Studio.

### Custom Logging with Trace()

```powerappsfl
Trace("Start of OnStart");

ClearCollect(colDesks, Desks);

Trace("End of OnStart");
```

- `Trace()` messages appear in the Monitor event log; use them to mark the start/end of `OnStart` or `OnVisible` blocks.

### Cold Start Evaluation

1. Enable the **Debug published app** setting.
2. Save the app.
3. Publish the app.
4. Launch Monitor from make.powerapps.com.

> **Warning:** Do not manually rerun `OnStart` or `OnVisible` from Studio; this bypasses data caching behavior and gives misleading results.

---

## App Settings for Performance

- **Debug published app** — Enables extra debug info in Monitor. Must **not** be left on in production; it degrades performance.
- **Data row limit** — Maximum rows retrieved from server-based connections when delegation is not supported. Default: 500; range: 1–2,000. A limit of 2,000 in production with a large dataset will cause significantly slower load times than seen in development.
- **Enable Navigate function in App.OnStart** — Deprecated setting. When on, the first screen does not render until all `OnStart` expressions finish. Replace with `App.StartScreen`.
- **Enable App.OnStart property** — On by default. Turn off to discourage use of `OnStart`.
- **Use non-blocking OnStart rule** — Allows `App.OnStart` formulas to run concurrently with other app rules (on by default for new apps; must be enabled manually for older apps).
- **Delay load** — Delays running screen expression calls until needed. On by default for new apps; can be enabled manually for older apps.
- **Upcoming features categories:**
  - **Experimental** — Not for production; off by default.
  - **Preview** — Final testing stage; on by default for new apps.
  - **Retired** — Deprecated settings.

### Connector Limits

- Each connector has its own data retrieval limits and throttling.
- Platform-level [service protection limits](https://learn.microsoft.com/en-us/power-apps/developer/data-platform/api-limits/) also apply.
- Apps that hit these limits during startup will exhibit slowdowns.

---

## Optimizing App.OnStart

### App.StartScreen (replaces Navigate() in OnStart)

- `Navigate()` in `App.OnStart` is retired; all new apps are prohibited from using it.
- Use **`App.StartScreen`** property instead — evaluated once at startup.
- If `StartScreen` evaluation results in an error, the first screen is shown; use `IfError()` to redirect to an error screen.
- Available data flow functions in `StartScreen`:
  - `Param()` — reads app launch parameters
  - `User()` — reads current user info
  - `LookUp()`, `Filter()`, `CountRows()`, `Max()`, and other data-reading functions
  - Connector calls (should resolve quickly)
  - Signals: `Connection`, `Compass`, `App`
- **Constraint:** Global variables and collections (including those set in `OnStart`) are **not** available in `StartScreen`.
- To force reevaluation: use the **Navigate to StartScreen** context menu on the app object.

### Migrating from Navigate() in OnStart

- Go to **Settings > Updates > Retired** and disable **Enable Navigate function in App.OnStart** to test without the old behavior.

### Move Logic to OnVisible

- If formulas in `App.OnStart` only preload data for one screen, move them to that screen's `OnVisible` property to defer execution until needed.

---

## Data Load Strategies

### Key Evaluation Questions

- Is the initial data shown to the user useful? (Avoid unfiltered large preloads.)
- Does the app offer correct data filters? (Reduce displayed rows for performance.)
- Are related data lookups per row causing overhead? (Preload related data into a collection.)
- Is data static or frequently updated? (Cache static data; avoid caching frequently changing data.)
- Is a loading indicator needed? (Not possible with direct binding.)
- Will the dataset exceed the **Data row limit**? (Consider delegation or direct binding.)
- Can computed columns be handled in the data source (e.g., Dataverse calculated/rollup columns)?
- How often does data from other apps/automations need to reflect in the collection?

---

### Direct Data Source Binding

- Set the gallery `Items` property directly to a table or a `Filter()` expression on a table.

```powerappsfl
SortByColumns(Filter([@Desks], StartsWith(Title, TextSearchBox1.Text)), "Title", If(SortDescending1, Descending, Ascending))
```

**Advantages:**
- Data retrieves on filter changes (declarative).
- Not limited by **Data row limit** if the connector supports delegation (e.g., 100,000 Dataverse rows loaded incrementally via `getRows`/`getMoreRows`).
- Auto-refreshed when data is modified elsewhere in the app.
- Manual refresh: `Refresh(tableName)`.

**Disadvantages:**
- Cannot show a loading indicator.

---

### Preload Data into a Collection

```powerappsfl
ClearCollect(colDesks, Desks)
```

- **`App.OnStart`** — Use when data is needed across multiple screens.
- **`OnVisible`** — Defers load until that screen is accessed.

**Advantages:**
- Can show a loading indicator during load.
- Allows multi-row edits without saving each row; commit all at once:

```powerappsfl
Patch(Desks, colDesks)
```

**Disadvantages:**
- Data not refreshed unless `ClearCollect()` is called again.

---

### Load from Persisted (Local) Storage

Useful when the data source is slow or intermittently available.

```powerappsfl
LoadData(colDesks, "LocalDesks", true);

ClearCollect(colDesks, Desks);

SaveData(colDesks, "LocalDesks");
```

With connectivity check:

```powerappsfl
LoadData(colDesks, "LocalDesks", true);

If(Connection.Connected,
    ClearCollect(colDesks, Desks);
    SaveData(colDesks, "LocalDesks")
)
```

---

### Preload into a Variable (Non-Tabular Connectors)

**Inefficient** — calls connector three times:

```powerappsfl
Set(profileDisplayName, Office365Users.MyProfileV2().displayName);

Set(profileHireDate, Office365Users.MyProfileV2().hireDate);

Set(profileCity, Office365Users.MyProfileV2().city);
```

**Efficient** — calls connector once:

```powerappsfl
Set(profile, Office365Users.MyProfileV2());

Set(profileDisplayName, profile.displayName);

Set(profileHireDate, profile.hireDate);

Set(profileCity, profile.city);
```

Or simplify to a single variable and use dot notation inline: `profile.hireDate`.

---

### Load Data Concurrently

Use `Concurrent()` to run multiple independent data loads in parallel instead of sequentially:

```powerappsfl
Concurrent(
    ClearCollect(colDesks, Desks),
    ClearCollect(colDeskFeatures, 'Desk Features'),
    Set(userProfile, Office365Users.MyProfileV2())
)
```

---

### Load Data Only Once (OnVisible Guard)

Prevent re-fetching data every time a screen is navigated to:

```powerappsfl
If(IsEmpty(colDesks), ClearCollect(colDesks, Desks))
```

---

### Using a Loading Image

- Import a spinner component and place it on the initial screen above other controls.
- Control visibility with a boolean variable (`showLoader`).

```powerappsfl
Set(showLoader, true);

ClearCollect(colDesks, Desks);

ClearCollect(colDeskFeatures, 'Desk Features');

Set(showLoader, false);
```

- Does not speed up the app but improves perceived performance by providing visual feedback.
- Prebuilt component available in the [Power Apps tools GitHub repository](https://github.com/microsoft/powerapps-tools/blob/master/Components/Preloader%20Component.msapp/).

---

## References

- [Power Apps Review Tool](https://github.com/microsoft/powerapps-tools/tree/master/Tools/Apps/Microsoft.PowerApps.CodeReview/)
- [Preloader Component](https://github.com/microsoft/powerapps-tools/blob/master/Components/Preloader%20Component.msapp/)
- [Service protection API limits](https://learn.microsoft.com/en-us/power-apps/developer/data-platform/api-limits/)
