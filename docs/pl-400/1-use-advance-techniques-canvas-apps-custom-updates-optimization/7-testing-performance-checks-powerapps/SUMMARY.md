# Summary: Testing, Performance, and Optimization in Power Apps Canvas Apps

> **Source files:** 1-performance.md, 2-data-sources.md, 3-testing-troubleshooting.md, 3a-exercise-performance.md, 4-knowledge-check.md

---

## Common Performance Bottlenecks

### Data Source Issues

- Data source interactions are the most common performance bottleneck: network round-trip, server-side processing, data return, and local rendering all add latency.
- **Too many refreshes**: Power Apps auto-refreshes connections after form submissions; adding an explicit `Refresh()` on top is redundant. Do not use `Refresh()` unless confirmed necessary.
- **Too many LookUps in a Gallery**: A `LookUp` inside a Gallery label executes once per record — 100 records = 100 individual data source calls. Use a details screen or cache data in a collection instead.
- **Wrong data source for the data type**: Storing images in SQL Server is slow; use Azure Blob Storage for images and files.

### Other Bottlenecks

- **Asset size**: High-resolution images consume more resources. Use an image editing tool to resize assets to the display size needed in the app.
- **Outdated app version**: Published apps stay on the Power Apps version they were published with. Republish periodically to benefit from platform performance improvements.
- **Too many screens / unfocused scope**: Large, all-purpose apps are harder to optimize. Build focused apps per role/process; break large apps into smaller ones.

---

## Data Source Optimization Techniques

### Caching with Collections

- Query static or repeated data once and store it in a collection using `ClearCollect` in the app's **OnStart** property.
- Change control `Items` properties to reference the collection instead of querying the data source directly.
- **Delegation warning**: `Collect` is not delegable — by default only the first 500 records are stored. Plan for this limit.

```powerappsfl
ClearCollect(colDepartmentList, Filter(DepartmentList, Status = "Active"))
```

### Delegation and Performance

- Delegable functions push processing to the data source; only matching rows are returned across the network.
- Non-delegable functions download up to the delegation limit (commonly 2,000 rows) locally for processing — costly on slow cellular or low-end devices.
- Use delegable functions wherever possible; if not, account for end-user impact on slow connections.

### Concurrent Function

- Sequential `ClearCollect` calls are processed one at a time; 3 calls × 3 s each = 9 s load time.
- `Concurrent` runs all enclosed formulas simultaneously; same 3 calls complete in ~3 s.
- Formulas inside `Concurrent` must be independent — order of start/completion is not guaranteed.

```powerappsfl
Concurrent(
    ClearCollect(colDepartmentList, Filter(DepartmentList, Status = "Active")),
    ClearCollect(colCompanyList, CompanyList),
    ClearCollect(colRegions, RegionList)
)
```

### OnStart vs. OnVisible

| Property | Scope | When it runs | Blocking? |
|---|---|---|---|
| **OnStart** | App-level | Once, at app launch; all formulas complete before app opens | Yes |
| **OnVisible** | Per-screen | Every time the user navigates to the screen; screen renders before formula finishes | No (non-blocking) |

- Use **OnStart** for data that is needed app-wide (e.g., loading collections once).
- Use **OnVisible** for screen-specific logic; it does not block screen rendering.
- Moving a collection load from **OnStart** to **OnVisible** negates the caching benefit — the data source is re-queried on every navigation.
- Most apps use a mix of both.

### Preview and Experimental Features

- **Preview features**: Well-tested, nearly GA; enabled by default in new apps. Example: **Optimize for devices** — renders native UI elements for mobile instead of web view.
- **Experimental features**: Off by default; may change, break, or disappear at any time. Not safe for production apps. Occasionally contain performance-related features worth evaluating.
- Access both via **File > App settings > Advanced settings**.

---

## Testing and Troubleshooting Techniques

### Timer Control for Measuring Query Performance

- Use a **Timer** control, **Button**, and **Text label** to measure how long a formula takes in milliseconds.
- Timer only starts counting in **Preview mode**, not in the editor.

**Setup steps:**
1. Set the Button's `OnSelect` property:
   ```powerappsfl
   Reset(Timer1);
   UpdateContext({StartTimer: true});
   Refresh('Workout tracker');
   ClearCollect(colWorkoutTracker, Filter('Workout tracker', Status = "Active"));
   UpdateContext({StartTimer: false})
   ```
2. Set the Timer control's `Start` property to: `StartTimer`
3. Set a Label's `Text` property to: `Timer1.Value`
4. Run in Preview mode and select the Button — the label shows elapsed milliseconds.

- Log timer values to a collection and average them to establish baseline performance.
- Test on all target environments: developer PC, mobile on Wi-Fi, mobile on cellular.

### Labels for Variable Inspection

- Add temporary label controls to display variable values during development.
- Use **File > Variables** in Power Apps Studio to see all variables, their current values, where they were created, and where they are used.
- Add a version label (e.g., `v1`, `v2`) on the welcome screen to distinguish cached vs. freshly published versions.

### Preview vs. Published App Testing

- Preview mode in Studio closely mirrors the published experience but is not identical.
- Always test the published app in the actual player in the same environment as end users.

### Monitor Tool for Network Activity

- **Monitor** logs every app action including individual network calls, timing, data source interactions, and selected controls.
- Access via: **Advanced tools** icon (left toolbar) → **Open Monitor**, or **App checker** icon → **Open Monitor**.
- Opens in a separate browser tab; tracking begins immediately.
- Logged columns: timestamp, category, operation, result, result info, status, **duration (ms)**, data source, selected control.
- Use Monitor alongside the Timer control to isolate whether a performance lag is in the app, the network, or the data source.

---

## Exercise: Comparing Sequential vs. Concurrent Collection Loading

**Sequential (baseline):**
```powerappsfl
Set(varStart, Now());
ClearCollect(colFruit,
    {Name: "banana", Category: "fruit", AvgCost: .49},
    {Name: "peach", Category: "fruit", AvgCost: 1.12},
    ...
);
ClearCollect(colVegetable,
    {Name: "carrot", Category: "vegetable", AvgCost: .95},
    ...
);
Set(varSpeedCollect, Text(DateDiff(varStart, Now(), TimeUnit.Milliseconds)));
```

**Concurrent (optimized):**
```powerappsfl
Set(varStart, Now());
Concurrent(
    ClearCollect(collectFruit,
        {Name: "banana", Category: "fruit", AvgCost: .49},
        ...
    ),
    ClearCollect(collectVegetable,
        {Name: "carrot", Category: "vegetable", AvgCost: .95},
        ...
    )
);
Set(varSpeedConcurrent, Text(DateDiff(varStart, Now(), TimeUnit.Milliseconds)));
```

- Use `DateDiff(varStart, Now(), TimeUnit.Milliseconds)` to measure elapsed time.
- `Concurrent` version completes in approximately half the time of the sequential version for independent collections.

---

## Best Practices Summary

- Build a **functional app first**, then optimize performance in small, validated increments.
- Verify each change doesn't break existing functionality before moving to the next.
- Use **delegable functions** wherever possible.
- Cache static/repeated data in collections via **OnStart** using `ClearCollect`.
- Use `Concurrent` to parallelize independent data loads.
- Store images in **Azure Blob Storage**, not SQL Server.
- Test in **all user environments** (device type, network type).
- Use **Monitor** + **Timer** control together to pinpoint the layer causing performance issues.

---

## References

- [Performance considerations with Power Apps](https://www.microsoft.com/power-platform/blog/power-apps/performance-considerations-with-powerapps/)
- [Power Apps Canvas App Coding Standards and Guidelines](https://www.microsoft.com/power-platform/blog/wp-content/uploads/2024/06/PowerApps-canvas-app-coding-standards-and-guidelines.pdf)
- [Power Apps](https://make.powerapps.com/)
