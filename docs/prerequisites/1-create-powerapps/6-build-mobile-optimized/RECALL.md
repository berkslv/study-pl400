# Recall: Build Mobile-Optimized Canvas Apps in Power Apps

> **Source files:** 1-introduction.md, 2-mobile-optimized-applications.md, 3-components.md, 4-responsive-designs.md, 5-performance.md

---

## Keywords

| Term | Definition |
|------|-----------|
| Canvas app | A Power Apps app type built visually on a blank canvas for flexible, custom UI design. |
| Scale to fit | A display setting that scales the app to fill the screen; must be **Off** for responsive design. |
| Responsive layout | A canvas app format where the UI automatically adjusts to different screen sizes and orientations. |
| Auto-layout container | A Horizontal or Vertical container that dynamically manages spacing and alignment of child controls. |
| SaveData / LoadData | Power Apps functions that persist and retrieve data to/from local device storage for offline use. |
| Connection signal | A Power Apps signal object used to detect whether the device currently has internet connectivity. |
| App checker | A built-in Power Apps tool for diagnosing performance issues and app errors. |
| Power Apps Monitor | An advanced diagnostics tool for identifying performance bottlenecks beyond App checker. |
| Dataverse | Microsoft's native data platform for Power Apps; offers best performance as no API calls are required. |
| Lock orientation | A display setting that enforces portrait or landscape orientation, preventing the user from switching. |
| BYOD (Bring Your Own Device) | Design principle requiring the app to work across a variety of user-owned devices and screen sizes. |
| ClearData | A Power Apps function that deletes data previously stored on the device via SaveData. |

---

## Main Ideas

- A mobile-optimized canvas app must have a **clearly defined purpose**; each form should serve a single function expressed in one sentence.
- **Scale to fit** must be toggled **Off** in Settings > Display to enable true responsive behavior; this also disables Lock aspect ratio.
- Phone layout assumes **vertical orientation** with vertical scrolling; tablet layout assumes **landscape orientation**.
- Responsive layout templates (Split screen, Sidebar, Header and footer) are available from the Layout tab when adding a new screen.
- **Horizontal** and **Vertical containers** with auto-layout manage child element positioning dynamically across form factors.
- Offline support uses three functions: **SaveData** (persist), **LoadData** (retrieve), and **ClearData** (delete) from device storage.
- The **Connection** signal monitors connectivity; use it with Icon color changes or the **Notify** function to alert users when offline.
- Buttons should be easily tappable — placed at top or bottom, extending edge to edge, with spacing around all fields to reduce touch errors.
- Grids should scroll in **one direction only** (vertical or horizontal) and span the full screen width.
- **Dataverse** is the highest-performing data source because it operates within the same Power Apps environment without API calls.
- **SharePoint** degrades in performance as list size grows due to API dependency; on-premises sources require a data gateway.
- App performance is more critical on mobile due to **limited multitasking capabilities**; minimize data retrieval and reduce connector complexity.
- Use **App checker** for accessible performance diagnosis; use **Power Apps Monitor** for advanced bottleneck identification.
- Mandatory fields should appear **near the top** of the form to reduce scrolling on small screens.

---

## Mini Quiz

### Q1 — Single Choice

A developer wants their canvas app to resize and reflow automatically on both phones and tablets.

Which display setting must be turned **Off** to enable responsive behavior?

- A. Lock orientation
- B. Lock aspect ratio
- C. Scale to fit
- D. Portrait mode

<details>
<summary>Answer</summary>

**Correct answer:** C. Scale to fit

**Explanation:** Turning off **Scale to fit** disables fixed scaling and enables the app to respond to different screen sizes. It also automatically disables Lock aspect ratio.

</details>

---

### Q2 — Fill-in-the-Blank

To persist data on the device when offline, use the `___` function. To retrieve it later, use the `___` function.

<details>
<summary>Answer</summary>

**Answer:** SaveData; LoadData

**Explanation:** `SaveData` writes data to local device storage and `LoadData` reads it back, enabling offline scenarios in Power Apps Mobile.

</details>

---

### Q3 — Single Choice

A canvas app retrieves data from multiple sources. Which data source offers the best performance in Power Apps?

- A. SharePoint
- B. Cloud-based SQL
- C. On-premises SQL via data gateway
- D. Dataverse

<details>
<summary>Answer</summary>

**Correct answer:** D. Dataverse

**Explanation:** Dataverse operates within the same Power Apps environment, eliminating the need for API calls and providing the lowest latency of all available data sources.

</details>

---

### Q4 — Fill-in-the-Blank

The `___` signal can be used in a formula to check whether the device is currently connected to the internet, and the `___` function can display a message to the user based on that status.

<details>
<summary>Answer</summary>

**Answer:** Connection; Notify

**Explanation:** `Connection.Connected` returns a Boolean indicating internet availability. The `Notify` function displays a banner message to inform users of offline status.

</details>

---

### Q5 — Single Choice

A designer places many fields and controls on a single form to minimize the number of screens users must navigate.

What is the primary problem with this approach on a mobile device?

- A. Power Apps does not support multi-field forms on phone layouts.
- B. It causes clutter, excessive scrolling, and risk of accidental selections.
- C. Offline capabilities are disabled when too many controls are present.
- D. The Connection signal stops working when more than 10 controls exist.

<details>
<summary>Answer</summary>

**Correct answer:** B. It causes clutter, excessive scrolling, and risk of accidental selections.

**Explanation:** Mobile screens are small and users interact via touch. Overcrowded forms lead to poor usability; the recommendation is to create concise, single-purpose forms and separate advanced fields into additional screens.

</details>

---

### Q6 — Fill-in-the-Blank

The built-in Power Apps tool used to diagnose app errors and common performance issues is called `___`. For more advanced bottleneck analysis, developers can use `___`.

<details>
<summary>Answer</summary>

**Answer:** App checker; Power Apps Monitor

**Explanation:** App checker is the most accessible tool for identifying issues. Power Apps Monitor provides deeper diagnostic data for experienced developers investigating performance bottlenecks.

</details>

---

### Q7 — Single Choice

When creating a new canvas app, a developer selects the **Responsive** format. Which of the following is required for the responsive behavior to function correctly?

- A. The app must connect to Dataverse.
- B. Controls must be placed inside auto-layout containers.
- C. Scale to fit must be turned On.
- D. Lock orientation must be set to Off.

<details>
<summary>Answer</summary>

**Correct answer:** B. Controls must be placed inside auto-layout containers.

**Explanation:** Responsive layouts use predefined container templates. The auto-layout containers are what cause the UI to adapt to different screen sizes; simply selecting the Responsive format is not sufficient without using the containers.

</details>

---
