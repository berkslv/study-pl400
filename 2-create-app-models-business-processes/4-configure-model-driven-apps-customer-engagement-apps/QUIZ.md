# Quiz: Configure Model-Driven Apps and Customer Engagement Apps

> **Source material:** 01-forms-overview.md, 02-forms-elements.md, 03-configure-multiple-forms.md, 04-specialized-form-components.md, 05-configure-views.md, 06-configure-grids.md, 07-configure-special-views.md, 08-configure-charts.md, 09-dashboards-overview.md, 10-streams-tiles.md, 11-knowledge-check.md, 12-summary.md
> **Total questions:** 25
> **Question types:** Multiple choice (single), Multiple choice (multi-select), Fill-in-the-blank

---

## Questions

### Question 1 — Single Choice

Your organization wants to display summary information about accounts in a compact format suited for users browsing on their mobile phones. Which form type should you use?

- A. Main
- B. Quick Create
- C. Quick View
- D. Card

<details>
<summary>Answer</summary>

**Correct answer:** D. Card

**Explanation:** Card forms present information in a compact format suitable for mobile devices. They are added to views using the Read-only Grid control rather than as a standalone app component.

</details>

---

### Question 2 — Single Choice

A maker is designing a Contact form and wants to display related Account data (such as the account name and phone number) without requiring the user to navigate away from the Contact record. Which form type should the maker use?

- A. Main
- B. Quick Create
- C. Quick View
- D. Card

<details>
<summary>Answer</summary>

**Correct answer:** C. Quick View

**Explanation:** Quick View forms appear within the main form to display additional data for a row that a lookup column references. They allow users to view data from related tables without leaving the current form.

</details>

---

### Question 3 — Single Choice

A maker notices that users are unable to switch between quick create forms for the same table. Which statement correctly explains this behavior?

- A. Quick create forms must be assigned to security roles before users can switch between them.
- B. Only one quick create form can be designated for use, and it cannot be assigned to security roles.
- C. Quick create forms do not support business rules, so switching is disabled.
- D. Quick create forms can only be used from the navigation bar, not from subgrids.

<details>
<summary>Answer</summary>

**Correct answer:** B. Only one quick create form can be designated for use, and it cannot be assigned to security roles.

**Explanation:** Quick create forms cannot be assigned to security roles, meaning users cannot switch between them. Only one quick create form is designated for use, determined by form order.

</details>

---

### Question 4 — Single Choice

An organization has several security roles, but some users have roles that are not assigned to any specific form for the Account table. Which form do these users see?

- A. The form with the highest form order number
- B. The first quick create form available for the table
- C. The fallback form
- D. A system-generated default form

<details>
<summary>Answer</summary>

**Correct answer:** C. The fallback form

**Explanation:** Each table must have a designated fallback form — the form all users see if they don't have a matching security role assigned. Fallback forms apply only to main forms.

</details>

---

### Question 5 — Single Choice

A system administrator wants to prevent data from being automatically saved while users are editing records in a Main form. What is the default behavior for Main forms, and what action is required?

- A. AutoSave is disabled by default; no action is needed.
- B. AutoSave is enabled by default; an administrator must disable it.
- C. AutoSave is enabled by default; users can toggle it off per session.
- D. AutoSave is only available for Quick Create forms.

<details>
<summary>Answer</summary>

**Correct answer:** B. AutoSave is enabled by default; an administrator must disable it.

**Explanation:** AutoSave is the default behavior for Main forms in model-driven apps. Administrators can disable it at the system level, but individual users cannot toggle it per session.

</details>

---

### Question 6 — Single Choice

A developer needs custom logic to execute whenever a user changes the value of the "Status" column on a form. Which event should the developer configure an event handler for?

- A. OnLoad
- B. OnSave
- C. TabStateChange
- D. OnChange

<details>
<summary>Answer</summary>

**Correct answer:** D. OnChange

**Explanation:** The OnChange event occurs when data in a column changes and the control loses focus. OnLoad fires when the form loads and OnSave fires when data is saved — neither would trigger on a field value change.

</details>

---

### Question 7 — Single Choice

A developer is adding multiple event handlers to a single column on a model-driven form and wants to know the maximum number allowed. What is the limit per form element?

- A. 10
- B. 25
- C. 50
- D. 100

<details>
<summary>Answer</summary>

**Correct answer:** C. 50

**Explanation:** Each form element (form, tab, column, or iFrame) can have up to 50 separate event handlers configured.

</details>

---

### Question 8 — Single Choice

A sales manager is viewing a Contact record that includes a quick view control showing related Account details. The manager wants to edit the account phone number directly within that control. What should the manager know?

- A. Quick view controls allow editing if the user has the correct security role.
- B. Quick view controls allow editing only on the web client, not on mobile.
- C. Data displayed in quick view controls is not editable.
- D. Quick view controls support editing only when form scripts are enabled.

<details>
<summary>Answer</summary>

**Correct answer:** C. Data displayed in quick view controls is not editable.

**Explanation:** Quick view controls display non-editable data from a related record. Additionally, quick view forms do not support form scripts, making option D also incorrect.

</details>

---

### Question 9 — Single Choice

A maker attempts to delete a system-defined public view for a custom table. What happens?

- A. The system view is deleted after confirmation.
- B. The system view is moved to an inactive state.
- C. System-defined public views cannot be deleted.
- D. Only system administrators can delete system views by filing a support ticket.

<details>
<summary>Answer</summary>

**Correct answer:** C. System-defined public views cannot be deleted.

**Explanation:** System-defined public views cannot be deleted or deactivated. Users can delete custom public views they created in an unmanaged solution, but system views are protected.

</details>

---

### Question 10 — Single Choice

A user logs into a model-driven app and sees a view in the view selector that was created by a colleague specifically for that colleague's own use. Which view type is this?

- A. System view
- B. Public view
- C. Personal view
- D. Managed view

<details>
<summary>Answer</summary>

**Correct answer:** C. Personal view

**Explanation:** Personal views are individually created and only visible to the person who created them. They can optionally be shared with others, but they are not automatically available to all app users.

</details>

---

### Question 11 — Single Choice

A maker is trying to edit a public view but finds the edit option is unavailable. What is the most likely reason?

- A. The view is a system view.
- B. The view is contained within a managed solution.
- C. The maker does not have a system administrator role.
- D. The view has been set to inactive.

<details>
<summary>Answer</summary>

**Correct answer:** B. The view is contained within a managed solution.

**Explanation:** You cannot create or edit a view within a managed solution. To edit views, you must ensure the app is in an unmanaged solution (where the Managed column shows "No").

</details>

---

### Question 12 — Single Choice

A maker is building a chart to show the total revenue per account. Which aggregate option under Legend Entries should the maker select?

- A. Count: All
- B. Count: Non-empty
- C. Average
- D. Sum

<details>
<summary>Answer</summary>

**Correct answer:** D. Sum

**Explanation:** The Sum aggregate adds up all values for the selected field. To show total revenue per account, Sum is the correct choice, as other options like Count or Average would not represent the total.

</details>

---

### Question 13 — Single Choice

A support team lead wants a dashboard that provides a detailed real-time stream for a single table view, with visual filters already applied and interactive tiles always displayed on the right side of the screen. Which dashboard type should the team lead use?

- A. Multi-stream dashboard
- B. Power BI embedded dashboard
- C. Single-stream dashboard
- D. Table-specific multi-stream dashboard

<details>
<summary>Answer</summary>

**Correct answer:** C. Single-stream dashboard

**Explanation:** Single-stream dashboards display data in real time over a single stream based on a table view with visual filters already applied. They always display tiles on the right side of the screen and are suited for monitoring smaller but more complex data.

</details>

---

### Question 14 — Single Choice

A user is viewing a multi-stream interactive dashboard and selects one of the interactive tiles. What happens?

- A. The tile opens the first record in the stream for editing in a new tab.
- B. A flyout of the rows in that stream appears.
- C. The dashboard visual filters are reset to match the tile's criteria.
- D. The tile expands to show the full stream with all columns.

<details>
<summary>Answer</summary>

**Correct answer:** B. A flyout of the rows in that stream appears.

**Explanation:** Selecting a tile on an interactive dashboard produces a flyout showing the rows within that stream. The tile content represents the count of rows, and selecting it drills down to the underlying records.

</details>

---

### Question 15 — Single Choice

A maker is configuring the Power Apps grid control for a large view and wants users to browse through thousands of records without clicking through numbered pages. Which capability of the grid control supports this requirement?

- A. Customizable column appearance
- B. Editable grid mode
- C. Infinite scrolling
- D. Read-only subgrid

<details>
<summary>Answer</summary>

**Correct answer:** C. Infinite scrolling

**Explanation:** The Power Apps grid control supports infinite scrolling, allowing users to browse data indefinitely until finding the desired records without relying on page-based navigation.

</details>

---

### Question 16 — Multi-Select

A maker is reviewing best practices for designing a Main form. Which **two** guidelines should the maker follow? (Select **two**.)

- A. Place the highest-priority data on the first tab.
- B. Create as many tabs as needed to expose every available column.
- C. Keep the number of tabs small with logical groupings.
- D. Always display all columns regardless of the user's role.
- E. Use a separate form for each device type.

<details>
<summary>Answer</summary>

**Correct answer:** A and C

**Explanation:** The first tab on a form is the most important and should contain priority data. Keeping the number of tabs small with logical groupings improves usability and performance, especially for mobile users. Too many tabs can negatively affect performance.

</details>

---

### Question 17 — Multi-Select

A maker wants to allow users to edit records inline from views and subgrids without having to open individual records. Which **two** grid controls support inline editing? (Select **two**.)

- A. Read-only subgrid
- B. Editable grid
- C. Power Apps grid control (configured as editable)
- D. Quick view control
- E. Read-only grid

<details>
<summary>Answer</summary>

**Correct answer:** B and C

**Explanation:** The Editable Grid control allows users rich in-line editing directly from views and subgrids. The Power Apps grid control is read-only by default but can be configured as editable. Read-only subgrids and read-only grids do not support editing.

</details>

---

### Question 18 — Multi-Select

A maker needs to control the visibility of form elements based on business logic using form scripts or business rules. Which **two** types of form elements support visibility control? (Select **two**.)

- A. Tabs
- B. Form types
- C. Sections
- D. Security roles
- E. Form event handlers

<details>
<summary>Answer</summary>

**Correct answer:** A and C

**Explanation:** Tabs, sections, columns, iFrames, and web resources can all be shown or hidden via the Properties panel or through form scripts and business rules. Security roles and form types are not elements whose visibility is toggled by scripts.

</details>

---

### Question 19 — Multi-Select

A maker is composing a custom interactive dashboard and wants to populate blank dashboard sections. Which **three** component types can be inserted into blank dashboard sections? (Select **three**.)

- A. Chart
- B. Quick Create form
- C. List
- D. IFrame
- E. Business rule
- F. Main form

<details>
<summary>Answer</summary>

**Correct answer:** A, C, and D

**Explanation:** In the dashboard editor, blank sections contain icons to insert a Chart, List, Assistant, IFrame, or Web Resource. Quick Create forms, business rules, and Main forms are not insertable dashboard components.

</details>

---

### Question 20 — Multi-Select

A developer needs to apply form scripts and business rules to forms in a model-driven app. Which **two** form types fully support both form scripts and business rules? (Select **two**.)

- A. Main
- B. Quick Create
- C. Quick View
- D. Card
- E. System view

<details>
<summary>Answer</summary>

**Correct answer:** A and B

**Explanation:** Main forms and Quick Create forms both provide full support for form scripts and business rules. Quick View forms do not support form scripts, and Card forms are not an appropriate context for scripting logic.

</details>

---

### Question 21 — Fill-in-the-Blank

In a model-driven app, the body of a Main form is organized into areas called ___, which in turn contain ___.

<details>
<summary>Answer</summary>

**Answer:** tabs; sections

**Explanation:** The body of a model-driven form has further structure with areas called tabs. Each tab contains sections, and sections hold the actual form elements such as columns, components, and controls.

</details>

---

### Question 22 — Fill-in-the-Blank

When a user's security role does not have any form assigned for a given table, the user will see the ___ form. This type of form applies only to ___ forms.

<details>
<summary>Answer</summary>

**Answer:** fallback; main

**Explanation:** Each table must have a designated fallback form — the form displayed to users whose security role is not mapped to a specific form. Fallback forms only apply to main forms, not quick create, quick view, or card forms.

</details>

---

### Question 23 — Fill-in-the-Blank

___ views can only be edited by system admins or system customizers, while ___ views are general-purpose and customizable by all makers.

<details>
<summary>Answer</summary>

**Answer:** System; Public

**Explanation:** System views are special views the application depends on and are only editable by system administrators or system customizers. Public views are general-purpose, available to all app users through the view selector, and customizable by makers.

</details>

---

### Question 24 — Fill-in-the-Blank

In the chart editor, the ___ field lets you select how data is aggregated, with options including Average, Count: All, Count: Non-empty, Max, Min, and Sum.

<details>
<summary>Answer</summary>

**Answer:** Legend Entries (series)

**Explanation:** Under Legend Entries (series) in the chart editor, you select the data to graph and the aggregation method. The Horizontal (Category) Axis Labels field is used to select the complementary grouping field.

</details>

---

### Question 25 — Fill-in-the-Blank

In a multi-stream interactive dashboard, you can switch from viewing streams to viewing summarized counts by selecting the ___ button, and then return by selecting ___.

<details>
<summary>Answer</summary>

**Answer:** Switch to Tile View; Switch to Stream View

**Explanation:** Multi-stream dashboards allow toggling between a stream view (showing rows of data) and a tile view (showing interactive summary tiles with the count of rows per stream) using the command bar buttons.

</details>
