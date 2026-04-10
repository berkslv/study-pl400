# Recall: Configure Model-Driven Apps and Customer Engagement Apps

> **Source files:** 01-forms-overview.md, 02-forms-elements.md, 03-configure-multiple-forms.md, 04-specialized-form-components.md, 05-configure-views.md, 06-configure-grids.md, 07-configure-special-views.md, 08-configure-charts.md, 09-dashboards-overview.md, 10-streams-tiles.md

---

## Keywords

| Term | Definition |
|------|-----------|
| **Main Form** | Primary form type for viewing and interacting with table data; supports responsive design and AutoSave. |
| **Quick Create Form** | Streamlined form for creating new records; only one can be active and cannot be assigned to security roles. |
| **Quick View Form** | Embedded form that displays read-only data from a related table row via a lookup column. |
| **Card Form** | Compact form type used in views for mobile devices; added via the Read-only Grid control. |
| **Fallback Form** | Default main form shown to users whose security role has no specific form assigned. |
| **Editable Grid** | Control enabling in-line record editing directly from views and subgrids on web, tablet, or phone. |
| **Public View** | General-purpose, customizable view accessible to all app users via the view selector. |
| **System View** | Special application-dependent view that cannot be deleted, deactivated, or added to dashboards/sublists. |
| **Personal View** | User-created view visible only to its creator, but shareable with others. |
| **Timeline Control** | Form component that captures and displays all activity history (notes, emails, calls, tasks) for a record. |
| **Multi-stream Dashboard** | Interactive dashboard displaying real-time data in multiple configurable streams with visual filters. |
| **Interactive Tile** | Dashboard element showing an aggregated count of rows; selectable to drill down to underlying data. |
| **Form Event Handler** | JavaScript logic triggered by form events (OnLoad, OnSave, OnChange, etc.); requires a JS library. |

---

## Main Ideas

- A data table can have multiple form types: **Main**, **Quick Create**, **Quick View**, and **Card** — each serving a distinct purpose.
- The Main form is the only type with a fallback form requirement; fallback forms do not apply to Quick Create, Quick View, or Card forms.
- Main forms support **AutoSave** by default; administrators can disable it.
- Quick View forms display **non-editable** data and do **not** support form scripts.
- Quick Create forms cannot be assigned to security roles; only one can be active at a time (determined by form order).
- Each form element (tab, section, column, iFrame) can have visibility controlled via the Properties panel, business rules, or scripts — best practice is to hide elements by default and reveal them with script logic.
- Each form element supports up to **50 separate event handlers**.
- Views have three types: **Personal** (creator-only), **System** (admin/customizer-only, cannot be deleted or used in sublists), and **Public** (all users, customizable by makers).
- Views can only be created or edited in an **unmanaged** solution.
- The Power Apps grid control supports **infinite scrolling** and customizable column appearance.
- Charts are configured in a separate browser tab and can use aggregation functions: Average, Count (All/Non-empty), Max, Min, Sum.
- Dashboards display real-time data; **multi-stream** dashboards support unlimited streams (each tied to a single table), while **single-stream** dashboards always show tiles on the right side.
- Interactive dashboards are security-role based and support visual filters, tile view, and stream view toggling.
- Controlling form access via security roles does **not** prevent data access — users can still reach data via advanced find or background automation.

---

## Mini Quiz

### Q1 — Single Choice

A maker wants users to quickly enter a new contact record without navigating away from their current screen. The form should support business rules but must not be assignable to security roles.

Which form type should they use?

- A. Main
- B. Quick View
- C. Quick Create
- D. Card

<details>
<summary>Answer</summary>

**Correct answer:** C. Quick Create

**Explanation:** Quick Create forms are designed for streamlined data entry and appear when a user selects Create or +New. They support business rules and form scripts, but cannot be assigned to security roles and only one can be active at a time.

</details>

---

### Q2 — Fill-in-the-Blank

Quick View forms display ___ data and do ___ support form scripts.

<details>
<summary>Answer</summary>

**Answer:** non-editable; not

**Explanation:** Quick View forms are read-only — data displayed in them cannot be edited, and they explicitly do not support form scripts, unlike Quick Create or Main forms.

</details>

---

### Q3 — Single Choice

A system administrator needs to give all users access to a standard filtered list of active accounts. They also want it to appear in a subgrid on a form. Which view type is appropriate?

- A. Personal View
- B. System View
- C. Public View
- D. Card View

<details>
<summary>Answer</summary>

**Correct answer:** C. Public View

**Explanation:** Public views are accessible to all app users, customizable by makers, and can be added to subgrids in a form or as a list in a dashboard. System views cannot be used in sublists or dashboards.

</details>

---

### Q4 — Fill-in-the-Blank

Each form element can have up to ___ separate event handlers configured, and each handler requires a ___ library to be added first.

<details>
<summary>Answer</summary>

**Answer:** 50; JavaScript

**Explanation:** The source material states that each element (form, tab, column, iFrame) supports up to 50 separate event handlers, all of which depend on a JavaScript library being registered on the form first.

</details>

---

### Q5 — Single Choice

A maker wants to prevent a sensitive section from appearing on a form unless a specific condition is met. What is the recommended best practice?

- A. Leave the section visible by default and hide it with a script when needed
- B. Hide the section by default and show it with a script only when the condition is met
- C. Delete the section and recreate it dynamically
- D. Use form order to control section visibility

<details>
<summary>Answer</summary>

**Correct answer:** B. Hide the section by default and show it with a script only when the condition is met

**Explanation:** The documented best practice states: any element that might be hidden should be hidden by default, and only revealed by script logic when the condition calls for it.

</details>

---

### Q6 — Single Choice

A model-driven app has a dashboard requirement to monitor multiple queues from different tables simultaneously with real-time updates. Which dashboard type is the best fit?

- A. Single-stream dashboard
- B. Power BI embedded dashboard
- C. Multi-stream dashboard
- D. Card dashboard

<details>
<summary>Answer</summary>

**Correct answer:** C. Multi-stream dashboard

**Explanation:** Multi-stream dashboards support unlimited streams, each of which can be based on a different table, making them ideal for monitoring multiple queues or data sources simultaneously in real time.

</details>

---

### Q7 — Fill-in-the-Blank

The ___ form is the form shown to users whose security role does not have a specific main form assigned, and it only applies to ___ forms.

<details>
<summary>Answer</summary>

**Answer:** fallback; main

**Explanation:** Every table must have a designated fallback form — the form all users see if no matching security role form exists. Fallback forms apply only to main forms, not to Quick Create, Quick View, or Card forms.

</details>

---

### Q8 — Single Choice

A maker creates a view in the app editor but later realizes it cannot be edited. What is the most likely cause?

- A. The view is a personal view owned by another user
- B. The view is in a managed solution
- C. The view is a system view
- D. The view has too many columns

<details>
<summary>Answer</summary>

**Correct answer:** B. The view is in a managed solution

**Explanation:** Views can only be created or edited within an unmanaged solution. If the solution is managed (Managed column = Yes), editing is not permitted. The maker should ensure the app resides in an unmanaged solution.

</details>

---
