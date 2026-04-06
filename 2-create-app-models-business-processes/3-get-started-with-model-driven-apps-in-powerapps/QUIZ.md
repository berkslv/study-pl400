# Quiz: Get Started with Model-Driven Apps in Power Apps

> **Source material:** 1-introduction.md, 2-building-blocks-of-model-driven-apps.md, 3-2b-design-apps.md, 4-3-create-a-model-driven-app.md, 5-control-security-when-sharing-model-driven-apps.md, 6-business-process-flows.md, 7-5b-create-model-driven-application.md, 8-knowledge-check.md, 9-summary.md
> **Total questions:** 25
> **Question types:** Multiple choice (single), Multiple choice (multi-select), Fill-in-the-blank

---

## Questions

### Question 1 — Single Choice

A developer is beginning a new Power Apps project and wants to use model-driven app design. Before opening the App Designer, the developer needs to determine the most important foundational step.

What is the first and most important step when building a model-driven app?

- A. Compose the app using the App Designer
- B. Configure security roles in the Power Platform admin center
- C. Model your business data in Dataverse
- D. Define your business processes

<details>
<summary>Answer</summary>

**Correct answer:** C. Model your business data in Dataverse

**Explanation:** Modeling business data is described as the most important step in building a model-driven app. You must first build your data model in Dataverse before you can create an app, since model-driven apps are "data model" driven.

</details>

---

### Question 2 — Single Choice

A business analyst is explaining the difference between canvas apps and model-driven apps to a new team member. They want to clarify who controls the app layout.

In a model-driven app, who or what determines the layout of the app?

- A. The app maker, who has total control over the layout
- B. The security role assigned to the user
- C. The components added to the app (dashboards, forms, views, charts)
- D. The site map designer configuration

<details>
<summary>Answer</summary>

**Correct answer:** C. The components added to the app (dashboards, forms, views, charts)

**Explanation:** Unlike canvas apps where the app maker has total control over the layout, in model-driven apps the components you add—such as dashboards, forms, views, and charts—determine the layout. The App Designer builds the app based on those selections.

</details>

---

### Question 3 — Single Choice

A solution architect explains that model-driven apps do not require custom code to change the app design. They mention the underlying architecture that enables this behavior.

Which architecture do model-driven apps use?

- A. Event-driven architecture
- B. Metadata-driven architecture
- C. Service-oriented architecture
- D. Component-based architecture

<details>
<summary>Answer</summary>

**Correct answer:** B. Metadata-driven architecture

**Explanation:** Model-driven apps use a metadata-driven architecture, where the app's design is based on how your data is modeled. Metadata means "data about data" and defines the data structure stored in the system, eliminating the need to write custom code to alter the app design.

</details>

---

### Question 4 — Single Choice

A maker is building a Dataverse data model and adds a lookup column to the Contact table that references the Account table.

What type of relationship is automatically created between the two tables?

- A. N:N (many-to-many)
- B. N:1 (many-to-one)
- C. 1:1 (one-to-one)
- D. 1:N (one-to-many)

<details>
<summary>Answer</summary>

**Correct answer:** D. 1:N (one-to-many)

**Explanation:** Adding a lookup column to a table creates a new 1:N (one-to-many) relationship between the two tables. The table that holds the lookup column is on the "many" side of the relationship.

</details>

---

### Question 5 — Single Choice

A maker needs to define how users will navigate between different sections of a model-driven app.

Which UI component is responsible for specifying the navigation for a model-driven app?

- A. Form
- B. View
- C. Site map
- D. Dashboard

<details>
<summary>Answer</summary>

**Correct answer:** C. Site map

**Explanation:** The site map is the UI component that specifies the navigation for your app. Power Apps automatically creates a default site map when you build your app in the App Designer.

</details>

---

### Question 6 — Single Choice

A maker has a text column in a Dataverse table that needs to be changed to a choice column. They need to understand the impact of this change before proceeding.

What must a maker do to change a column to a different column type, and what data impact should they expect?

- A. Use the column editor to switch types; no data is lost
- B. Delete the column and recreate it with the correct type; all data in the column is lost
- C. Export the data, change the column type, then re-import; data is preserved
- D. Create a new column alongside the old one; migrate data manually, then hide the old column

<details>
<summary>Answer</summary>

**Correct answer:** B. Delete the column and recreate it with the correct type; all data in the column is lost

**Explanation:** If a column type needs to be changed to a different column type (for example, a text column to a choice), you must delete the column and recreate it with the correct column type. This causes you to lose all the data stored in that column.

</details>

---

### Question 7 — Single Choice

A Power Apps consultant wants to guide users step-by-step through a sales process, ensuring every salesperson follows the same stages from lead qualification to closing.

Which type of business logic component is best suited for this requirement?

- A. Business rule
- B. Workflow
- C. Business process flow
- D. Power Automate Flow

<details>
<summary>Answer</summary>

**Correct answer:** C. Business process flow

**Explanation:** Business process flows provide a guided, step-by-step experience that leads users through a standard business process. They are specifically designed to ensure consistent processes across all users and are only available in model-driven apps.

</details>

---

### Question 8 — Single Choice

A maker is designing a multi-stage sales process that starts with an Opportunity, moves through a Quote and an Order, and ends with an Invoice before returning to close the Opportunity.

What is the maximum number of different tables that a single business process flow can span?

- A. 3
- B. 10
- C. 5
- D. 7

<details>
<summary>Answer</summary>

**Correct answer:** C. 5

**Explanation:** A business process flow can tie together rows for up to five different tables into a single process. This allows users to focus on the flow of the process rather than which table they are working in.

</details>

---

### Question 9 — Single Choice

An organization has multiple teams with different workflows for handling service requests. Each team requires its own process flow for the same table.

What is the maximum number of active business process flows that can exist per table?

- A. 3
- B. 5
- C. 15
- D. 10

<details>
<summary>Answer</summary>

**Correct answer:** D. 10

**Explanation:** You can have up to 10 active business process flows per table to provide appropriate processes for different situations and users. This allows different teams or conditions to use different process flows on the same table.

</details>

---

### Question 10 — Single Choice

An administrator needs to share a newly published model-driven app with members of the sales team. Before sharing, they want to confirm what permissions they need to perform this action.

Which role is required to share a model-driven app?

- A. Basic User or System Customizer
- B. Delegated Admin or Global Admin
- C. Environment Admin or System Admin
- D. App Contributor or Solution Architect

<details>
<summary>Answer</summary>

**Correct answer:** C. Environment Admin or System Admin

**Explanation:** To share a model-driven app, you must have the Environment Admin or System Admin role. This requirement ensures that only authorized administrators can grant access to apps and their underlying data.

</details>

---

### Question 11 — Single Choice

A manager shares a model-driven app directly with a new employee but forgets to assign a security role. The employee attempts to open the app.

What will happen when the employee tries to access the app?

- A. The employee can view the app in read-only mode
- B. The employee will be prompted to request a security role
- C. The employee will not be able to use the app
- D. The employee gets temporary access for 24 hours

<details>
<summary>Answer</summary>

**Correct answer:** C. The employee will not be able to use the app

**Explanation:** Model-driven app sharing is a two-step process: first assign a security role to the user, then share the app. If a user doesn't have an assigned security role for the table containing the app's data, they won't be able to use the app even if the app itself has been shared with them.

</details>

---

### Question 12 — Single Choice

A security role is being configured for pet grooming technicians. Technicians need to link appointment records to customer records in the system.

Which security privilege must be included so technicians can associate the current record with another record?

- A. Write
- B. Assign
- C. Share
- D. Append

<details>
<summary>Answer</summary>

**Correct answer:** D. Append

**Explanation:** The Append privilege is required to associate the current record with another record. In the Contoso scenario, technicians need Read, Write, and Append privileges to perform their duties, including attaching records to one another.

</details>

---

### Question 13 — Single Choice

A scheduling manager needs to transfer ownership of a customer appointment record to a different technician in the system.

Which security privilege is required to give ownership of a record to another user?

- A. Share
- B. Append to
- C. Write
- D. Assign

<details>
<summary>Answer</summary>

**Correct answer:** D. Assign

**Explanation:** The Assign privilege is required to give ownership of a record to another user. The Share privilege is different—it gives another user access to a record while the original owner keeps their own access.

</details>

---

### Question 14 — Single Choice

A maker is using the App Designer to customize the display of Account records. They want to control which columns appear, their widths, the sort order, and the default filters when users browse the list.

Which UI component should the maker configure to achieve this?

- A. Form
- B. Dashboard
- C. View
- D. Chart

<details>
<summary>Answer</summary>

**Correct answer:** C. View

**Explanation:** Views define how a list of records for a specific table appears in the app. A view defines the columns shown, the width of each column, the sort behavior, and the default filters—all the properties the maker needs to configure in this scenario.

</details>

---

### Question 15 — Single Choice

A maker wants to automatically set a default value on a form column and hide another column based on a condition, without writing any code.

Which logic component should the maker use?

- A. Business process flow
- B. Workflow
- C. Power Automate Flow
- D. Business rule

<details>
<summary>Answer</summary>

**Correct answer:** D. Business rule

**Explanation:** Business rules are used to apply logic to a form, such as setting column requirements, setting default values, hiding columns, or validating data. They operate directly on the form without requiring custom code or triggering external flows.

</details>

---

### Question 16 — Multi-Select

A trainer is preparing study material on model-driven app components. They need to identify all four high-level categories into which components are organized.

Which four categories classify the components of a model-driven app? (Select **four**.)

- A. Data
- B. Security
- C. User Interface (UI)
- D. Logic
- E. Navigation
- F. Visualization

<details>
<summary>Answer</summary>

**Correct answer:** A. Data, C. User Interface (UI), D. Logic, F. Visualization

**Explanation:** Model-driven app components are categorized into four groups: Data (tables, columns, relationships, choice columns), User Interface (app, site map, form, view, custom page), Logic (business process flows, workflows, actions, business rules, Power Automate flows), and Visualization (charts, dashboards, embedded Power BI).

</details>

---

### Question 17 — Multi-Select

A project manager is reviewing the recommended phases for building a model-driven app with their team. They want to confirm which steps are part of the formal development lifecycle.

Which of the following are fundamental phases of building a model-driven app? (Select **five**.)

- A. Model your business data
- B. Write custom plug-ins
- C. Define your business processes
- D. Compose the app
- E. Configure security roles
- F. Share the app

<details>
<summary>Answer</summary>

**Correct answer:** A. Model your business data, C. Define your business processes, D. Compose the app, E. Configure security roles, F. Share the app

**Explanation:** The five fundamental phases of model-driven app development are: (1) Model your business data, (2) Define your business processes, (3) Compose the app, (4) Configure security roles, and (5) Share the app. Writing custom plug-ins is not part of this standard lifecycle.

</details>

---

### Question 18 — Multi-Select

A developer is evaluating which logic components to use in a model-driven app to automate processes triggered by system events, walk users through a process, and validate form data.

Which three logic components should the developer consider? (Select **three**.)

- A. Site map
- B. Workflow
- C. Business process flow
- D. View
- E. Business rule
- F. Dashboard

<details>
<summary>Answer</summary>

**Correct answer:** B. Workflow, C. Business process flow, E. Business rule

**Explanation:** Workflows automate business processes triggered by events or schedules. Business process flows walk users step-by-step through a process. Business rules apply form-level logic such as validation and conditional visibility. Site map, view, and dashboard are not logic components.

</details>

---

### Question 19 — Multi-Select

An administrator is configuring the **Pet Grooming Schedulers** security role for a pet grooming app. Schedulers need full access to both the Pet and Account tables.

Which privileges should be included in the Pet Grooming Schedulers role? (Select **five**.)

- A. Create
- B. Read
- C. Execute
- D. Write
- E. Delete
- F. Assign

<details>
<summary>Answer</summary>

**Correct answer:** A. Create, B. Read, D. Write, E. Delete, F. Assign

**Explanation:** The Pet Grooming Schedulers role includes Create, Read, Write, Delete, Append, Append to, Assign, and Share privileges (all eight privileges) on the relevant tables. From the given options, Create, Read, Write, Delete, and Assign are all included. Execute is not one of the defined Dataverse security privileges.

</details>

---

### Question 20 — Multi-Select

A maker is reviewing Dataverse data component types to design a table that captures a contact's preferred communication channels, where the contact can select more than one option.

Which two data components are most relevant to this scenario? (Select **two**.)

- A. Relationship
- B. Multi-select choice column
- C. View
- D. Column (standard data type)
- E. Chart

<details>
<summary>Answer</summary>

**Correct answer:** B. Multi-select choice column, D. Column (standard data type)

**Explanation:** A multi-select choice column provides a predetermined set of options and allows more than one selection—exactly what is needed for selecting multiple preferred communication channels. A standard column defines the data type stored in the table. Relationship, View, and Chart are not data-entry components relevant to this field design.

</details>

---

### Question 21 — Fill-in-the-Blank

Model-driven apps use a ___-driven architecture, meaning the app's design is derived from how the data is modeled, and there is no need to write custom code to alter the app design.

<details>
<summary>Answer</summary>

**Answer:** metadata

**Explanation:** Model-driven apps use a metadata-driven architecture. "Metadata" means "data about data" and defines the data structure stored in the system, allowing the app design to automatically follow the data model without custom code.

</details>

---

### Question 22 — Fill-in-the-Blank

A business process flow in a model-driven app can span up to ___ different tables in a single process, allowing users to focus on the flow of work rather than on which table they are currently using.

<details>
<summary>Answer</summary>

**Answer:** five (5)

**Explanation:** Business process flows can tie together rows for up to five different tables into a single process. This enables multi-stage flows such as Opportunity → Quote → Order → Invoice without users having to switch contexts manually.

</details>

---

### Question 23 — Fill-in-the-Blank

Each Dataverse table can have up to ___ active business process flows, enabling different teams or conditions to use appropriate processes for their specific situations.

<details>
<summary>Answer</summary>

**Answer:** ten (10)

**Explanation:** Up to 10 active business process flows can exist per table. This allows organizations to support multiple workflows for different user roles or business conditions using the same underlying table.

</details>

---

### Question 24 — Fill-in-the-Blank

Sharing a model-driven app is a ___-step process: first you assign a ___ to the user, and then you share the app itself.

<details>
<summary>Answer</summary>

**Answer:** two (2); security role

**Explanation:** Model-driven app sharing requires two steps. First, you must share access to the Dataverse table by assigning a security role to the user (or group). Then, you share the app itself. A user without a security role cannot use the app even after the app is shared with them.

</details>

---

### Question 25 — Fill-in-the-Blank

Business process flows are only available for ___ apps, not canvas apps. They reduce the need for training because new users can follow the ___ rather than having to remember which table to use.

<details>
<summary>Answer</summary>

**Answer:** model-driven; process (flow)

**Explanation:** Business process flows are exclusively a feature of model-driven apps. They provide a streamlined, guided user experience that directs users step-by-step through a process, reducing reliance on training since the flow itself guides the user through the correct tables and steps.

</details>
