# Recall: Build Your First Model-Driven App with Dataverse

> **Source files:** 1-introduction.md, 2-model-driven-apps.md, 3-dataverse-model-driven-apps.md, 4-exercise-explore-sample-apps.md

---

## Keywords

| Term | Definition |
|------|-----------|
| Dataverse | Microsoft Power Platform's foundational cloud-based data storage service using tables and role-based security. |
| Model-driven app | A Power Apps type built using a component-focused approach where layout is determined by data model. |
| Canvas app | A Power Apps type where developers control layout screen-by-screen with full UI customization. |
| Table | A set of records used to store data in Dataverse, analogous to a database table. |
| Standard table | A pre-built Dataverse table covering typical business scenarios, available out of the box. |
| Custom table | A user-defined Dataverse table created to meet organization-specific data requirements. |
| Business Process Flow | A guided, stage-based workflow in model-driven apps that navigates users through a business process. |
| WYSIWYG authoring | "What You See Is What You Get" — app preview in model-driven designer reflects the live app appearance instantly. |
| Custom page | A model-driven app page type that embeds a Power Apps canvas app directly within the model-driven app. |
| Web resource | A developer-created file (HTML, JS, image, etc.) that extends model-driven app functionality. |
| Dashboard page | A model-driven page type displaying charts from one or more connected Dataverse tables. |
| Many-to-one relationship | A Dataverse table relationship where multiple rows in one table relate to a single row in another. |

---

## Main Ideas

- Dataverse is the preferred data source for Power Platform apps due to deepest integration, richest features, and built-in role-based security.
- Data in Dataverse is stored in **tables** (standard or custom); tables provide a secure, cloud-based, business-focused data structure.
- Business rules applied at the Dataverse level enforce data integrity regardless of which tool accesses the data.
- Model-driven apps use a **component-focused** approach — the layout is auto-generated based on selected components, not manually designed.
- Model-driven app design focuses on three areas: **modeling business data**, **defining business processes**, and **composing the app**.
- Page types in model-driven apps: **Dataverse table**, **Dashboard**, **URL**, **Web resource**, and **Custom page**.
- A **Dataverse table page** provides two sub-pages: a **view** (rows/columns grid) and a **form** (row editing/creation).
- Navigation in model-driven apps is organized using **Groups** and **Subareas** visible in the app's navigation pane.
- Business Process Flows appear graphically above the table page, guiding users step-by-step through stages.
- Table relationships defined in Dataverse are automatically available and easy to use when building model-driven app views and forms.
- Editing a form, view, or chart in the app designer redirects to the Dataverse table; published changes instantly reflect in all model-driven apps using that table.
- Model-driven apps are automatically **responsive** across desktop and mobile devices; responsiveness depends on how data is modeled in Dataverse.
- Sample apps in Power Apps (e.g., Fundraiser, Innovation Challenge) use fictitious data to demonstrate real-world design patterns.

---

## Mini Quiz

### Q1 — Single Choice

A developer wants to enforce data integrity rules so they apply regardless of which app or tool accesses the data.

Where should business rules be applied?

- A. In each individual canvas app's formula bar
- B. At the Dataverse table level
- C. In a Power Automate cloud flow
- D. In the model-driven app's custom page

<details>
<summary>Answer</summary>

**Correct answer:** B. At the Dataverse table level

**Explanation:** Business rules applied at the Dataverse level maintain business integrity no matter what tool is used to interact with the data.

</details>

---

### Q2 — Fill-in-the-Blank

Model-driven apps use a ___-focused approach to development, where the ___ is automatically generated based on the components added.

<details>
<summary>Answer</summary>

**Answer:** component; layout (UI)

**Explanation:** Unlike canvas apps where developers control every screen, model-driven apps auto-generate the layout from the selected components.

</details>

---

### Q3 — Single Choice

A maker adds a Dataverse table page to their model-driven app. What two sub-pages does this page type automatically provide?

- A. Dashboard and Chart
- B. Form and Report
- C. View and Form
- D. Canvas and Web resource

<details>
<summary>Answer</summary>

**Correct answer:** C. View and Form

**Explanation:** A Dataverse table page gives a view (displaying rows and columns) and a form (for editing or creating rows).

</details>

---

### Q4 — Fill-in-the-Blank

In a model-driven app, navigation is organized using ___ and ___, where the first acts as the parent navigation element and the second is listed beneath it.

<details>
<summary>Answer</summary>

**Answer:** Groups; Subareas

**Explanation:** Group names appear as top-level navigation elements, with subarea names listed beneath each group in the app's navigation pane.

</details>

---

### Q5 — Single Choice

A maker modifies a form on a Dataverse table that is shared by two model-driven apps. After publishing, what happens?

- A. Only the app where the edit was initiated reflects the change.
- B. Both apps must be republished manually to reflect the change.
- C. Both apps instantly reflect the change because they share the same Dataverse table.
- D. The form change applies only to new records, not existing ones.

<details>
<summary>Answer</summary>

**Correct answer:** C. Both apps instantly reflect the change because they share the same Dataverse table.

**Explanation:** Any model-driven app using the same Dataverse table as a data source instantly gains access to modified or newly created views, forms, and charts.

</details>

---

### Q6 — Single Choice

Which model-driven app page type allows a maker to embed a Power Apps canvas app directly within the model-driven app?

- A. Web resource
- B. Dashboard
- C. URL
- D. Custom page

<details>
<summary>Answer</summary>

**Correct answer:** D. Custom page

**Explanation:** A Custom page creates a page that shows a Power Apps canvas app directly embedded in the model-driven app, where interactive components can be dragged onto a canvas.

</details>

---

### Q7 — Fill-in-the-Blank

The three focus areas when creating model-driven apps are: modeling ___ data, defining ___ processes, and composing the ___.

<details>
<summary>Answer</summary>

**Answer:** business; business; app

**Explanation:** Model-driven app creation centers on modeling business data, defining business processes (in Dataverse), and then composing the app from those building blocks.

</details>

---
