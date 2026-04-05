# Quiz: Building Mobile-Optimized Canvas Apps in Power Apps

> **Source material:** 1-introduction.md, 2-mobile-optimized-applications.md, 3-components.md, 4-responsive-designs.md, 5-performance.md
> **Total questions:** 25
> **Question types:** Multiple choice (single), Multiple choice (multi-select), Fill-in-the-blank

---

## Questions

### Question 1 — Single Choice

A field technician uses a canvas app on a phone while working on-site in areas with unreliable Wi-Fi. The app currently tries to load customer records whenever the technician opens a form, causing frequent errors when offline.

Which design element should you prioritize to address this scenario?

- A. Seamless setup
- B. Streamlined user interface
- C. Offline capabilities
- D. Connectivity alerts

<details>
<summary>Answer</summary>

**Correct answer:** C. Offline capabilities

**Explanation:** Offline capabilities allow the app to store data locally and sync when connectivity resumes. This is essential when users need access in locations without reliable connectivity.

</details>

---

### Question 2 — Single Choice

You are creating a new canvas app and want it to automatically adjust its layout to the screen size of any device. Before building any screens, you need to choose the correct format at app creation time.

Which format option should you select when starting a blank canvas app?

- A. Phone
- B. Tablet
- C. Responsive
- D. Portrait

<details>
<summary>Answer</summary>

**Correct answer:** C. Responsive

**Explanation:** The Responsive format uses predefined container templates that adjust to screen size. However, containers must be used correctly for the responsive behavior to function.

</details>

---

### Question 3 — Single Choice

A maker has built a canvas app and wants to enable responsive design. After opening Settings > Display, they notice that the Scale to fit option is turned On by default.

What should the maker do to support responsive design?

- A. Turn Scale to fit On and Lock aspect ratio Off
- B. Turn Scale to fit Off
- C. Turn Lock orientation On
- D. Set Orientation to Landscape

<details>
<summary>Answer</summary>

**Correct answer:** B. Turn Scale to fit Off

**Explanation:** Scale to fit must be turned Off to enable responsive design. When Scale to fit is On, the app scales to a fixed size rather than adapting to the device screen.

</details>

---

### Question 4 — Single Choice

Your organization stores its data in Microsoft Dataverse. A colleague suggests moving to an on-premises SQL Server for better security. You are concerned about performance impact for your canvas app.

Why does Dataverse typically offer better performance than an on-premises SQL Server for Power Apps?

- A. Dataverse compresses data before sending it to Power Apps
- B. Dataverse and Power Apps exist in the same environment, eliminating API calls
- C. Dataverse automatically caches all records on the user's device
- D. Dataverse uses a dedicated data gateway that is faster than cloud gateways

<details>
<summary>Answer</summary>

**Correct answer:** B. Dataverse and Power Apps exist in the same environment, eliminating API calls

**Explanation:** Because Power Apps and Dataverse share the same environment, data access does not require API calls, which is the primary reason for its superior performance. On-premises servers, by contrast, must route data through an on-premises data gateway.

</details>

---

### Question 5 — Single Choice

You want to add a visual connectivity indicator to your canvas app's header. When the user is online, the icon should appear green; when offline, it should appear light steel blue.

Which formula should you apply to the Color property of a Globe icon control?

- A. `If(Connection.Online, Color.Green, Color.LightSteelBlue)`
- B. `If(Connection.Connected, Color.Green, Color.LightSteelBlue)`
- C. `If(Network.Status = "Online", Color.Green, Color.LightSteelBlue)`
- D. `If(IsConnected(), Color.Green, Color.LightSteelBlue)`

<details>
<summary>Answer</summary>

**Correct answer:** B. `If(Connection.Connected, Color.Green, Color.LightSteelBlue)`

**Explanation:** The Connection signal in Power Apps exposes a Connected property that returns true when the device has internet access. This is the correct signal to monitor connectivity status.

</details>

---

### Question 6 — Single Choice

A maker is experiencing performance issues in a canvas app and wants to start troubleshooting. They have limited experience with advanced diagnostic tools.

Which built-in Power Apps feature is the most accessible starting point for diagnosing performance problems?

- A. Power Apps Monitor
- B. App checker
- C. Performance Profiler
- D. Solution checker

<details>
<summary>Answer</summary>

**Correct answer:** B. App checker

**Explanation:** App checker is described as the most accessible performance troubleshooting feature. Power Apps Monitor is available for more advanced users who need to identify specific bottlenecks.

</details>

---

### Question 7 — Single Choice

You are designing a canvas app for warehouse workers who use phones. Each screen contains dozens of fields, requiring users to scroll extensively to find the Submit button.

Which design recommendation best addresses this issue?

- A. Convert all text fields to dropdown controls
- B. Place the Submit button in an easily accessible location and reduce the number of fields on the form
- C. Increase the font size of the Submit button
- D. Use a tablet layout instead of a phone layout

<details>
<summary>Answer</summary>

**Correct answer:** B. Place the Submit button in an easily accessible location and reduce the number of fields on the form

**Explanation:** A streamlined user interface avoids excessive fields and places action buttons like Submit in easily accessible locations. Minimizing scrolling is a key mobile design principle.

</details>

---

### Question 8 — Single Choice

A manager reports that users in the field accidentally trigger system gestures when interacting with input fields near the screen edges.

Which design adjustment should you make to prevent this?

- A. Switch from portrait to landscape orientation
- B. Add spacing between fields and screen edges
- C. Enable Lock orientation in Display settings
- D. Use a horizontal container instead of a vertical container

<details>
<summary>Answer</summary>

**Correct answer:** B. Add spacing between fields and screen edges

**Explanation:** Adding spacing between fields and screen edges reduces touch errors and prevents focus from shifting unintentionally or triggering system gestures.

</details>

---

### Question 9 — Single Choice

You are building a form that includes both optional and mandatory fields. Users frequently miss required fields because they are positioned at the bottom of the form.

Where should you position mandatory fields for a mobile-optimized form?

- A. At the bottom of the form, near the Submit button
- B. In a separate tab or section
- C. Near the top of the form
- D. In alphabetical order regardless of priority

<details>
<summary>Answer</summary>

**Correct answer:** C. Near the top of the form

**Explanation:** Mandatory fields should be displayed near the top of the form so users encounter and complete them first, reducing the chance of missing required information before submission.

</details>

---

### Question 10 — Single Choice

You are adding a gallery to your mobile canvas app. The gallery currently supports both vertical and horizontal scrolling, which users find confusing.

What is the correct design guideline for gallery scrolling behavior in a mobile-optimized app?

- A. Galleries should always scroll vertically only
- B. Galleries should scroll in only one direction and span the screen width
- C. Galleries should scroll horizontally to save vertical space
- D. Scrolling should be disabled; use pagination instead

<details>
<summary>Answer</summary>

**Correct answer:** B. Galleries should scroll in only one direction and span the screen width

**Explanation:** Grids and galleries should scroll in only one direction—either vertically or horizontally—and span the screen width. This ensures consistent and predictable navigation for mobile users.

</details>

---

### Question 11 — Single Choice

Your organization is deploying a new canvas app that requires users to enter an API key during first-time setup. Several users report confusion about where to find this value.

Which mobile design principle does this scenario violate?

- A. Responsive design
- B. Clearly defined purpose
- C. Seamless setup
- D. Performance optimization

<details>
<summary>Answer</summary>

**Correct answer:** C. Seamless setup

**Explanation:** Seamless setup requires that if users must enter configuration values such as URLs or API keys, clear guidance on where to find them is provided. The app should assume the user is opening it for the first time.

</details>

---

### Question 12 — Single Choice

You are building a new canvas app screen. From the Layout tab when adding a new screen, you want to use a built-in responsive template that displays a navigation panel on the left and main content on the right.

Which built-in layout template should you select?

- A. Split screen
- B. Header and footer
- C. Sidebar
- D. Fullscreen

<details>
<summary>Answer</summary>

**Correct answer:** C. Sidebar

**Explanation:** The Sidebar layout template provides a navigation panel on the side alongside a main content area. Built-in responsive templates available from the Layout tab include Split screen, Sidebar, and Header and footer.

</details>

---

### Question 13 — Single Choice

A canvas app is connected to a SharePoint list that currently has 500 items but is expected to grow to 50,000 items over the next year.

Based on performance characteristics, what should you consider when the list grows significantly?

- A. SharePoint improves performance automatically as the list grows
- B. SharePoint may slow down as list size increases due to API dependencies
- C. SharePoint performance is unaffected by list size because it caches results
- D. SharePoint outperforms Dataverse for large datasets

<details>
<summary>Answer</summary>

**Correct answer:** B. SharePoint may slow down as list size increases due to API dependencies

**Explanation:** SharePoint can be effective for smaller data loads but may slow down as list size increases due to its API dependencies. For large datasets, Dataverse or cloud SQL are better-performing alternatives.

</details>

---

### Question 14 — Single Choice

You want a canvas app to allow users to freely rotate their phone between portrait and landscape, with the app adapting accordingly, rather than enforcing a fixed orientation.

Which Display setting should you configure?

- A. Set Orientation to Auto
- B. Turn Lock orientation Off
- C. Turn Lock orientation On and set Orientation to Portrait
- D. Turn Scale to fit On

<details>
<summary>Answer</summary>

**Correct answer:** B. Turn Lock orientation Off

**Explanation:** When Lock orientation is Off, users can switch between orientations based on how they hold the device. When Lock orientation is On, the orientation setting is enforced and users cannot switch.

</details>

---

### Question 15 — Single Choice

A canvas app contains a Delete button that should be placed for right-handed users who hold the phone with their right hand.

Based on mobile design guidelines, where should the Delete button be positioned?

- A. At the top center of the form
- B. On the side that aligns with user hand preference
- C. At the bottom center of the screen
- D. Inside a collapsed menu to prevent accidental taps

<details>
<summary>Answer</summary>

**Correct answer:** B. On the side that aligns with user hand preference

**Explanation:** Action buttons such as delete should be placed on the side that aligns with the user's hand preference to improve reachability and reduce accidental taps.

</details>

---

### Question 16 — Multi-Select

A solution architect is reviewing a list of design requirements for a new mobile canvas app. They need to identify which elements are considered core design elements of a mobile-optimized canvas app.

Which **three** of the following are key design elements of a mobile-optimized canvas app? (Select **three**.)

- A. Clearly defined purpose
- B. Multi-purpose forms for efficiency
- C. Offline capabilities
- D. Connectivity alerts
- E. Mandatory use of tablet layout
- F. Dependency on a physical keyboard

<details>
<summary>Answer</summary>

**Correct answer:** A. Clearly defined purpose, C. Offline capabilities, D. Connectivity alerts

**Explanation:** Mobile-optimized apps should have a clearly defined purpose, support offline capabilities when needed, and alert users about connectivity status. Multi-purpose forms, tablet-only layouts, and keyboard dependencies all run counter to mobile design principles.

</details>

---

### Question 17 — Multi-Select

You are building a custom canvas app and want to understand which built-in layout templates are available when adding a new screen using the Layout tab.

Which **three** layouts are available as built-in responsive templates? (Select **three**.)

- A. Split screen
- B. Sidebar
- C. Full canvas
- D. Header and footer
- E. Grid view
- F. Tabbed navigation

<details>
<summary>Answer</summary>

**Correct answer:** A. Split screen, B. Sidebar, D. Header and footer

**Explanation:** Power Apps provides three built-in responsive layout templates from the Layout tab: Split screen, Sidebar, and Header and footer. For other layouts, makers must create custom responsive designs using containers and formulas.

</details>

---

### Question 18 — Multi-Select

You are enabling offline capabilities for a canvas app used by field workers. You need to implement local data storage so users can work without connectivity and sync later.

Which **three** functions should you use to manage offline data storage in Power Apps? (Select **three**.)

- A. SaveData
- B. LoadData
- C. SyncData
- D. ClearData
- E. ExportData
- F. CacheData

<details>
<summary>Answer</summary>

**Correct answer:** A. SaveData, B. LoadData, D. ClearData

**Explanation:** Power Apps Mobile supports offline data storage through three functions: SaveData persists data to device local storage, LoadData retrieves stored data, and ClearData deletes stored data. SyncData, ExportData, and CacheData are not valid Power Apps functions for this purpose.

</details>

---

### Question 19 — Multi-Select

A performance review of a canvas app shows that it is loading slowly on mobile devices. You need to apply best practices to improve performance.

Which **three** actions will most effectively improve the app's performance? (Select **three**.)

- A. Limit the amount of data the app retrieves
- B. Use multiple data sources to distribute the load
- C. Design galleries and forms to source data from a single data source
- D. Remove unnecessary or redundant data calls
- E. Increase the number of connectors to parallelize data access
- F. Display all available fields on every form

<details>
<summary>Answer</summary>

**Correct answer:** A. Limit the amount of data the app retrieves, C. Design galleries and forms to source data from a single data source, D. Remove unnecessary or redundant data calls

**Explanation:** Performance best practices include limiting data retrieval, using a single data source per gallery or form, and eliminating redundant data calls. Using multiple connectors or displaying all fields increases complexity and reduces performance.

</details>

---

### Question 20 — Multi-Select

A maker is configuring Display settings for a new mobile canvas app. They need to understand which settings are available under Settings > Display.

Which **three** options are available in the Display settings? (Select **three**.)

- A. Orientation
- B. Scale to fit
- C. Theme color
- D. Lock aspect ratio
- E. Font family
- F. Lock orientation

<details>
<summary>Answer</summary>

**Correct answer:** A. Orientation, B. Scale to fit, D. Lock aspect ratio (or F. Lock orientation)

**Explanation:** The Display settings panel includes Orientation, Scale to fit, Lock aspect ratio, and Lock orientation. Theme color and Font family are not part of the Display settings.

</details>

---

### Question 21 — Fill-in-the-Blank

Microsoft Power Apps Mobile can store data locally using the ___ function and retrieve it using the ___ function. To remove stored data, you use the ___ function.

<details>
<summary>Answer</summary>

**Answer:** SaveData, LoadData, ClearData

**Explanation:** These three functions work together to manage offline data persistence in Power Apps. SaveData writes data to device storage, LoadData reads it back, and ClearData removes it when no longer needed.

</details>

---

### Question 22 — Fill-in-the-Blank

To enable responsive design in a canvas app, the ___ setting under Settings > Display must be turned ___.

<details>
<summary>Answer</summary>

**Answer:** Scale to fit, Off

**Explanation:** Scale to fit is On by default and causes the app to scale to a fixed size. Turning it Off is required for the app to adapt dynamically to different screen sizes and orientations.

</details>

---

### Question 23 — Fill-in-the-Blank

The ___ signal in Power Apps is used to monitor internet connectivity status. Its ___ property returns true when the device has an active internet connection.

<details>
<summary>Answer</summary>

**Answer:** Connection, Connected

**Explanation:** The Connection signal exposes a Connected property that Power Apps evaluates to determine whether the device is currently online. This is used to conditionally display alerts or disable controls that require internet access.

</details>

---

### Question 24 — Fill-in-the-Blank

Among available data sources, ___ typically offers the best performance in Power Apps because it exists within the ___ as Power Apps, eliminating the need for API calls.

<details>
<summary>Answer</summary>

**Answer:** Dataverse, same environment

**Explanation:** Because Dataverse and Power Apps share the same environment, data access is direct without requiring API calls, which is the primary reason Dataverse outperforms other data sources in performance benchmarks.

</details>

---

### Question 25 — Fill-in-the-Blank

When adding a new screen in Power Apps, the ___ layout template provides a navigation panel alongside the main content area. For custom responsive layouts not covered by built-in templates, makers use ___, formulas, and conditional logic.

<details>
<summary>Answer</summary>

**Answer:** Sidebar, containers

**Explanation:** The Sidebar template is one of three built-in responsive layout templates (along with Split screen and Header and footer). When none of the built-in templates meet requirements, custom responsive layouts are built using containers combined with formulas and conditional logic.

</details>
