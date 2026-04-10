# Recall: Get Started with Model-Driven Apps in Power Apps

> **Source files:** 1-introduction.md, 2-building-blocks-of-model-driven-apps.md, 3-2b-design-apps.md, 4-3-create-a-model-driven-app.md, 5-control-security-when-sharing-model-driven-apps.md, 6-business-process-flows.md, 7-5b-create-model-driven-application.md, 8-knowledge-check.md

---

## Keywords

| Term | Definition |
|------|-----------|
| Model-driven app | A Power Apps type where layout is determined by the Dataverse data model, requiring little to no code. |
| Dataverse | The underlying data platform providing tables, columns, relationships, and security for model-driven apps. |
| App Designer | The tool used to compose a model-driven app by selecting tables, forms, views, charts, and dashboards. |
| Site map | The component that defines the navigation structure for a model-driven app. |
| Business Process Flow (BPF) | A guided, visual process that leads users step-by-step through a standard business procedure. |
| Security role | A set of privileges controlling a user's access to Dataverse tables and records within an app. |
| Business rule | Form-level logic used to set column requirements, hide columns, or validate data without code. |
| Form | A defined set of data-entry columns for a given table, used for creating and editing records. |
| View | A configuration defining how a list of records for a table appears, including columns, sort, and filters. |
| Metadata-driven architecture | App structure derived from the data model definition rather than custom code. |
| Choice column | A column type providing predetermined options; available as single-select (choices) or multi-select. |
| Relationship | A defined link between tables (1:N, N:1, N:N) enabling navigation between related data. |
| Dashboard | A visual component displaying one or more charts providing an overview of actionable business data. |

---

## Main Ideas

- Model-driven app design follows five phases: **model business data → define business processes → compose the app → configure security roles → share the app**.
- Components are grouped into four categories: **Data** (Table, Column, Relationship, Choice column), **UI** (App, Site map, Form, View, Custom page), **Logic** (Business process flow, Workflow, Actions, Business rule, Power Automate Flow), and **Visualizations** (Chart, Dashboard, Embedded Power BI).
- Model-driven apps use a **metadata-driven architecture**: the app structure is derived from the data model; no custom code is needed to alter the layout.
- Changing a column's type (e.g., text → choice) requires **deleting and recreating** the column, which causes permanent data loss.
- Business Process Flows can span **up to 5 different tables** in a single process; a table can have **up to 10 active BPFs**.
- Sharing a model-driven app is a **two-step process**: (1) assign a security role to the user, (2) share the app itself. A user without a security role cannot use the app even if the app is shared.
- To share an app, the sharer must have the **Environment Admin** or **System Admin** role.
- Security privileges: **Create, Read, Write, Delete, Append, Append to, Assign, Share** — each grants a distinct type of record access.
- Every app user must have **at least one** assigned security role; a user can hold multiple roles simultaneously.
- **Business Rules** apply logic at the form level (required fields, default values, show/hide). **Business Process Flows** guide multi-step user workflows and are only available in model-driven apps.
- Model-driven apps support **Offline Mode** when accessed via iOS or Android clients.
- Microsoft releases **industry accelerators** for Health, Finance, Banking, Education, Non-Profit, Automotive, and Media to provide pre-built Dataverse data models.

---

## Mini Quiz

### Q1 — Single Choice

A developer is building a Power Apps solution and wants the app's layout to be automatically driven by the data structure rather than manual drag-and-drop design.

Which app type best fits this requirement?

- A. Canvas app
- B. Portal app
- C. Model-driven app
- D. Custom page app

<details>
<summary>Answer</summary>

**Correct answer:** C. Model-driven app

**Explanation:** In model-driven apps, Power Apps determines the layout based on the Dataverse data model (components like forms, views, and charts). Canvas apps give the maker full control over layout.

</details>

---

### Q2 — Fill-in-the-Blank

Model-driven apps use a ___-driven architecture, meaning the app's design is based on how the data is ___, not on custom code.

<details>
<summary>Answer</summary>

**Answer:** metadata; modeled

**Explanation:** Metadata-driven architecture means the data model definitions (tables, columns, relationships) dictate app structure. No custom code is required to change the app's design.

</details>

---

### Q3 — Single Choice

A business analyst needs to create a process that guides sales reps from an initial opportunity through quotes, orders, and invoices before closing.

What is the maximum number of different tables a single Business Process Flow can span?

- A. 2
- B. 3
- C. 5
- D. 10

<details>
<summary>Answer</summary>

**Correct answer:** C. 5

**Explanation:** Business Process Flows can tie together rows for up to five different tables into a single guided process, allowing users to focus on the flow rather than which table they are in.

</details>

---

### Q4 — Fill-in-the-Blank

Sharing a model-driven app requires two steps: first, assign a ___ to the user, and then share the ___ itself.

<details>
<summary>Answer</summary>

**Answer:** security role; app

**Explanation:** Without an assigned security role, a user cannot access the Dataverse data even if the app link is shared with them. Both steps are mandatory.

</details>

---

### Q5 — Single Choice

A user needs to link a record to another existing record (e.g., associating a contact to an account) in a model-driven app.

Which security privilege is specifically required for this action?

- A. Write
- B. Assign
- C. Append
- D. Share

<details>
<summary>Answer</summary>

**Correct answer:** C. Append

**Explanation:** The **Append** privilege is required to associate the current record with another record. **Append to** is the reciprocal privilege required on the target record's table.

</details>

---

### Q6 — Fill-in-the-Blank

A Dataverse table can have up to ___ active Business Process Flows to support different users or conditions.

<details>
<summary>Answer</summary>

**Answer:** 10

**Explanation:** Having up to 10 active BPFs per table allows organizations to apply different guided processes for different roles, departments, or situational requirements.

</details>

---

### Q7 — Single Choice

A maker realizes that a text column on the Account table should have been a choice column.

What must the maker do to correct this?

- A. Change the column type directly in the table designer.
- B. Add a new choice column and keep the text column hidden.
- C. Delete the text column and recreate it as a choice column, accepting data loss.
- D. Convert the column type using the Column Properties pane without data loss.

<details>
<summary>Answer</summary>

**Correct answer:** C. Delete the text column and recreate it as a choice column, accepting data loss.

**Explanation:** Dataverse does not support changing a column's data type in place. Deleting and recreating the column is required, and all existing data in that column is permanently lost.

</details>

---

### Q8 — Single Choice

A team lead wants to enforce consistent data entry for customer service requests so all agents follow identical steps.

Which logic component should be used?

- A. Business rule
- B. Workflow
- C. Power Automate Flow
- D. Business Process Flow

<details>
<summary>Answer</summary>

**Correct answer:** D. Business Process Flow

**Explanation:** Business Process Flows provide a step-by-step visual guide for users and are specifically designed to enforce consistent processes within model-driven apps. Business rules apply form-level logic (required fields, visibility), not multi-step procedural guidance.

</details>

---
