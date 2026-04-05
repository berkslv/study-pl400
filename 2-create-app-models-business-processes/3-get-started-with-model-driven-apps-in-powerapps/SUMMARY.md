# Summary: Get Started with Model-Driven Apps in Power Apps

> **Source files:** 1-introduction.md, 2-building-blocks-of-model-driven-apps.md, 3-2b-design-apps.md, 4-3-create-a-model-driven-app.md, 5-control-security-when-sharing-model-driven-apps.md, 6-business-process-flows.md, 7-5b-create-model-driven-application.md, 8-knowledge-check.md

---

## What Are Model-Driven Apps

- Model-driven app design starts with arranging data (in Dataverse), then adding dashboards, forms, views, and charts to interact with that data.
- Model-driven apps connect Dataverse tables via relationships, reducing repeated data.
- Unlike canvas apps (where the maker controls full layout), model-driven apps have the layout determined by the components added (dashboards, forms, views, charts).
- Built with little or no code using the App Designer.
- Use a **metadata-driven architecture**: the app design is derived from how data is modeled; no custom code is needed to alter design. "Metadata" means "data about data."

### Fundamental Development Phases

1. Model your business data (most important step — build the data model in Dataverse first)
2. Define your business processes
3. Compose the app (select and configure pages in App Designer)
4. Configure security roles
5. Share the app

---

## Components of Model-Driven Apps

Components fall into four categories: **Data**, **User Interface (UI)**, **Logic**, and **Visualization**.

### Data Components

| Component | Description | Designer |
| --- | --- | --- |
| Table | Contains records with tracked properties (e.g., Contact, Account). Standard tables available; custom tables can be created. | Power Apps table designer |
| Column | A property of a table with a defined data type (text, number, date/time, currency, lookup). | Power Apps table designer |
| Relationship | Defines how tables relate: 1:N, N:1, N:N. Adding a lookup column creates a new 1:N relationship. | Power Apps table designer |
| Choice column | Provides a predetermined set of options. **Choices** = single selection; **Multi-select choices** = multiple selections. | Power Apps option set designer |

### UI Components

| Component | Description | Designer |
| --- | --- | --- |
| App | Fundamental settings: components, properties, client type, URL. | App designer |
| Site map | Specifies navigation for the app. | Site map designer |
| Form | Defined set of data-entry columns for a given table. | Form designer |
| View | Defines how a list of records appears: columns shown, column widths, sort behavior, default filters. | View designer |
| Custom page (preview) | Canvas app-based page with flexible layout, low-code Fx functions, and Power Apps connector data. | Canvas designer |

### Logic Components

| Type | Description | Designer |
| --- | --- | --- |
| Business process flow | Online process that walks users step-by-step through a standard business process. | Business process flow designer |
| Workflow | Automates business processes; triggered manually, at intervals, or by events. | Workflow designer |
| Actions | Manually invoke actions (including custom actions) from a workflow, plugin, custom button, or code. | Process designer |
| Business rule | Apply logic to a form: set column requirements, hide columns, validate data. | Business rule designer |
| Power Automate Flow | Cloud-based automated workflows between apps and services. | Power Automate |

### Visualization Components

| Component | Description | Designer |
| --- | --- | --- |
| Chart | Single graphic visualization (bar, pie, etc.) displayed within a view, form, or dashboard. | Chart designer |
| Dashboard | Palette for one or more visualizations providing an overview of actionable business data. | Dashboard designer |
| Embedded Power BI | Power BI tiles and dashboards added to the app for cloud-based business intelligence. | Chart designer + Dashboard designer + Power BI |

---

## Designing Model-Driven Apps

Key design factors to address before building:

- **Business requirements**: Security model (hierarchy security, row-level security), government regulations, authentication/authorization (e.g., multifactor authentication), offline mode support (iOS/Android clients via Dataverse).
- **Data model**: Define tables, columns, and relationships first. Data is the foundation. 
  - ⚠️ Changing a column type requires deleting and recreating the column — all data in that column is lost.
- **UI/UX**: Power Apps determines most of the UI/UX from the data model. Customise via App Designer (Forms, Views, Charts, Dashboards, navigation options).
- **Business logic**: Use **Business Rules** (column requirements, defaults, show/hide) or **Business Process Flows** (guided step-by-step experience).
- **Output**: Create dashboards with custom filters and visual graphics. Keep dashboards simple — high-level snapshots with drill-down capability.

### Industry Accelerators

- Microsoft releases accelerators and foundational Dataverse components for: Health, Finance, Banking, Education, Non-Profit, Automotive, Media.

---

## Creating a Model-Driven App (Basic)

### Create a Solution and Add an Existing Table

1. Go to Power Apps home → **Solutions** → **New solution**.
2. Set **Display name** (e.g., `Learning Account`) and select a **Publisher** → **Create**.
3. In the solution, select **Add existing** > **Table** → find and select the **Account** table → **Next**.
4. Select **Include all objects** → **Add**.

### Create the App

1. In Solution Objects, select **New** > **App** > **Model-driven app**.
2. Name the app (e.g., `Learning Accounts`) → **Create**. Opens in App Designer.

### Add a Page

1. Select **Add Page** → **Dataverse table**.
2. Select the **Account** table → **Add**.
3. Select **Publish**.

### Edit a Form

1. In **Pages**, expand **Accounts View** → select the **Accounts form** → click the pencil icon.
2. From **Table columns** pane, select a column to add it to the form.
3. To remove a column, select it and choose **Delete** from the command bar.
4. Select **Save and publish** → **Back**.

### Edit a View

1. Select the view in **Navigation** → **Edit view**.
2. Select a column from **Table columns** to add it.
3. Drag and drop column headers to reorder.
4. Select **Save and publish** → **Back**.

### View Charts

- Select **Show Chart** from the app command bar.
- Use the dropdown next to a chart to switch between chart types (e.g., Accounts by Industry, Accounts by Owner, New Accounts By Month).

---

## Creating a Model-Driven App (Advanced — Prospects Table)

### Create the App

1. Sign in to [Power Apps](https://make.powerapps.com/) and select the target environment.
2. From Home, select **Start with a page design** > **Blank page with navigation**.
3. Enter app name (e.g., `Prospect Entry`) → **Create**.
4. Select **+ Add page** > **Dataverse table** → find and add the **Prospects** table → **Add**.
5. Select **Publish**.

### Create a Chart

1. In the app, select the **Data** tab → expand **In your app** → select the Prospects table → **Open** (via ellipsis **...**).
2. Under **Data experiences**, select **Charts** → **New chart**.
3. Enter chart name (e.g., `Forecasted Revenue by Stage`).
4. Set **Legend Entries (Series)** to a column (e.g., Forecasted Revenue) with an aggregate (Sum, Avg, Count:All).
5. Set **Horizontal (Category) Axis Labels** to a column (e.g., Stage).
6. **Save and Close** → **Done** in the pop-up.
7. In App Designer, select **Show Chart** → **Publish**.

### Create a Form

1. From Power Apps Home, select **Tables** → **Prospects** table → **Forms** under **Data experiences**.
2. Select the dropdown next to **+ New form** → **Main Form** > **Create**.
3. Add columns from the left panel (drag and drop to reorder): Stage, Contract Amount, Probability, Forecasted Revenue.
4. To make a column read-only: select it → **Properties** tab → check **Read-only column**.
5. **Save and Publish** → **Back**.
6. In **Form settings** > **Form order** (Main Form set), drag the new form to the top → **Save and publish**.
7. In app builder, select **+ New** to verify the new form loads. Then **Publish** the app.

---

## Security Roles and Sharing

- Every Dataverse table must have a defined security role for access.
- A user can have **multiple security roles**; every app user must have **at least one**.
- Security roles can be assigned to individual users or to teams.
- Sharing is a **two-step process**: (1) assign a security role to the user, (2) share the app itself.
- A user without an assigned security role cannot use the app even if the app is shared with them.
- To share an app, you must have the **Environment Admin** or **System Admin** role.

### Security Privileges

| Privilege | Description |
| --- | --- |
| Create | Required to make a new record. |
| Read | Required to open an existing record to view contents. |
| Write | Required to make changes to a record. |
| Delete | Required to permanently remove a record. |
| Append | Required to associate the current record with another record. |
| Append to | Required to associate a record with the current record. |
| Assign | Required to give ownership of a record to another user. |
| Share | Required to give access to a record to another user while keeping your own access. |

### Create a Security Role

1. Sign in to [Power Platform admin center](https://admin.powerplatform.microsoft.com/) → select an environment.
2. Select **Settings** > **Users + permissions** > **Security roles** → **+ New role**.
3. Set **Role Name**, **Business unit**, and **Member's privilege inheritance** (e.g., Team privileges only) → **Save**.
4. In the table search, find the target table and set privilege levels (e.g., None → Organization) for each relevant privilege.
5. **Save + close**.

### Assign Security Roles to Users

1. In Power Platform admin center, go to **Security roles** → search and select the role → **Members** → **+ Add people**.
2. Search for users → select → **Add**.

### Share the App

1. Go to [make.powerapps.com](https://make.powerapps.com/) → **Apps** → select the app → **Share**.
2. Add groups or users, assign a security role, then select **Share**.

---

## Business Process Flows

- Guide users step-by-step through a standard business process with a streamlined UI.
- Can be tailored per security role to show a relevant experience.
- Reduce training needs — new users follow the flow rather than memorizing which table to use.
- Available **only** in model-driven apps.
- Can span **up to 5 different tables** in a single process.
- Up to **10 active business process flows per table**.

### System Business Process Flows (built-in examples in Power Automate)

- Lead to Opportunity Sales Process
- Opportunity Sales Process
- Phone to Case Process

### Use Cases

- Ensure consistent data entry across all users (e.g., all users handle service requests the same way).
- Require approval steps (e.g., invoice approval before order submission).
- Multi-table flows: Opportunity → Quote → Order → Invoice → close Opportunity.

---

## References

- [make.powerapps.com](https://make.powerapps.com/)
- [Power Platform admin center](https://admin.powerplatform.microsoft.com/)
