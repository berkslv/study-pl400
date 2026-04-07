# Quiz: Build Your First Model-Driven App with Dataverse

> **Source material:** 1-introduction.md, 2-model-driven-apps.md, 3-dataverse-model-driven-apps.md, 4-exercise-explore-sample-apps.md, 5-check.md, 6-summary.md
> **Total questions:** 22
> **Question types:** Multiple choice (single), Multiple choice (multi-select), Fill-in-the-blank

---

## Questions

### Question 1 — Single Choice

Your organization needs a cloud-based data storage platform that integrates deeply with Microsoft Power Platform and supports role-based security. Which data source provides the most functionality and the deepest integration with Power Apps?

- A. SharePoint
- B. Microsoft Dataverse
- C. Azure SQL Database
- D. Microsoft Access

<details>
<summary>Answer</summary>

**Correct answer:** B. Microsoft Dataverse

**Explanation:** Microsoft Dataverse is described as the foundational data source of Microsoft Power Platform, offering the most functionality, the deepest integrations, the most features, and the best ease of use of any available data sources.

</details>

---

### Question 2 — Single Choice

A developer wants to store and manage data in Microsoft Dataverse. How is data organized within Dataverse?

- A. In spreadsheets
- B. In SharePoint document libraries
- C. In tables
- D. In flat files

<details>
<summary>Answer</summary>

**Correct answer:** C. In tables

**Explanation:** In Dataverse, all data is stored in tables. A table is a set of records used to store data, similar to how a table stores data within a database.

</details>

---

### Question 3 — Single Choice

A maker is deciding between building a canvas app and a model-driven app. Which statement best describes the key difference in the app development approach?

- A. Canvas apps use a component-focused approach; model-driven apps require complete manual layout
- B. Model-driven apps require extensive coding; canvas apps do not
- C. Canvas apps give complete control over appearance and behavior; model-driven apps use a component-focused approach where the layout is done for you
- D. Model-driven apps are only available on desktop; canvas apps work on all devices

<details>
<summary>Answer</summary>

**Correct answer:** C. Canvas apps give complete control over appearance and behavior; model-driven apps use a component-focused approach where the layout is done for you

**Explanation:** Unlike canvas apps where you build screen-by-screen with full layout control, model-driven apps use a component-focused approach where the layout is automatically determined by the components you add to the app.

</details>

---

### Question 4 — Single Choice

A maker adds views and forms from Dataverse tables while building a model-driven app. What happens immediately after each component is added?

- A. The app must be published before changes are visible
- B. A preview is shown in the app designer reflecting how the app will appear to users
- C. An error is displayed until all tables are connected
- D. The form is locked and cannot be edited until the app is saved

<details>
<summary>Answer</summary>

**Correct answer:** B. A preview is shown in the app designer reflecting how the app will appear to users

**Explanation:** Model-driven apps provide a WYSIWYG authoring experience — as you select views and forms from your tables, they reflect instantly in the preview, enabling you to see exactly how the app will appear for your users.

</details>

---

### Question 5 — Single Choice

An app maker wants to add a page to a model-driven app that displays a collection of charts from multiple Dataverse tables. Which page type should they choose?

- A. URL
- B. Web resource
- C. Dataverse table
- D. Dashboard

<details>
<summary>Answer</summary>

**Correct answer:** D. Dashboard

**Explanation:** The Dashboard page type displays a collection of charts related to your tables. The charts can come from any table connected to your app and do not have to be from the same table.

</details>

---

### Question 6 — Single Choice

A maker wants to provide users with a helpful link to an external website directly within the app navigation. Which page type should be used?

- A. Custom page
- B. Web resource
- C. URL
- D. Dashboard

<details>
<summary>Answer</summary>

**Correct answer:** C. URL

**Explanation:** Adding a URL page type to your navigation adds a link to a URL. When selected, it opens the URL in another browser tab, allowing you to provide helpful external links relevant to app users.

</details>

---

### Question 7 — Single Choice

A developer needs to extend the functionality of a model-driven app by connecting it to files created by developers that go beyond standard model-driven app capabilities. Which page type supports this scenario?

- A. Custom page
- B. Web resource
- C. URL
- D. Dataverse table

<details>
<summary>Answer</summary>

**Correct answer:** B. Web resource

**Explanation:** Web resources are files created by developers that extend the functionality of an app. The Web resource page type displays such a resource inside your app page, connecting the app to resources beyond standard model-driven apps.

</details>

---

### Question 8 — Single Choice

A maker wants to embed an interactive canvas app directly inside a model-driven app page. Which page type enables this?

- A. URL
- B. Dashboard
- C. Web resource
- D. Custom page

<details>
<summary>Answer</summary>

**Correct answer:** D. Custom page

**Explanation:** The Custom page type creates a page showing a Power Apps canvas app directly embedded in the model-driven app. You can design and build the canvas app by dragging interactive components onto the canvas.

</details>

---

### Question 9 — Single Choice

When building a model-driven app, a maker organizes the app navigation using Groups and Subareas. How do these elements appear to users?

- A. Group names appear as tabs at the top; Subareas appear in a dropdown menu
- B. Group names appear as navigation elements with Subarea names listed beneath each group
- C. Subareas appear as the main navigation; Groups are hidden from users
- D. Group and Subarea names are merged into a flat navigation list

<details>
<summary>Answer</summary>

**Correct answer:** B. Group names appear as navigation elements with Subarea names listed beneath each group

**Explanation:** In model-driven apps, Group names appear as navigation elements with the subarea names within the group listed beneath them, providing a structured navigation experience.

</details>

---

### Question 10 — Single Choice

An organization is designing a model-driven app and needs the app to work well on both desktop and mobile devices without additional customization. What does model-driven apps provide automatically?

- A. Separate desktop and mobile apps that must be published independently
- B. A responsive UI with a similar interface across various devices
- C. A fixed-width layout optimized only for desktop
- D. Mobile-only support through a separate Power Apps mobile configuration

<details>
<summary>Answer</summary>

**Correct answer:** B. A responsive UI with a similar interface across various devices

**Explanation:** Model-driven apps have a similar user interface across various devices from desktop to mobile and are accessible and responsive automatically, without requiring additional work from the app maker.

</details>

---

### Question 11 — Single Choice

A maker is building a model-driven app using the Asset Checkout sample. They have tables for Product, Reservation, and Review. What type of relationship is established between the Review table and the Product table via the Associated Product column?

- A. One-to-one
- B. One-to-many
- C. Many-to-one
- D. Many-to-many

<details>
<summary>Answer</summary>

**Correct answer:** C. Many-to-one

**Explanation:** In the Asset Checkout app example, a many-to-one relationship is established between the Review table and the Product table using the Associated Product column.

</details>

---

### Question 12 — Single Choice

A maker modifies a view on a Dataverse table that is used by a model-driven app and then publishes the change. What happens to other model-driven apps that use the same Dataverse table as a data source?

- A. Other apps are unaffected until manually refreshed
- B. Other apps must be republished to pick up the changes
- C. Other apps instantly gain access to the modified view
- D. Other apps lose access to the table until they are reconfigured

<details>
<summary>Answer</summary>

**Correct answer:** C. Other apps instantly gain access to the modified view

**Explanation:** Any other model-driven app using that table as a data source will instantly gain access to the views, forms, and charts that you modify or create, as soon as changes are published to the Dataverse table.

</details>

---

### Question 13 — Single Choice

When creating a model-driven app, which of the following best describes the three important areas a maker should focus on?

- A. Licenses, business data, and composing the app
- B. Modeling business data, defining business processes, and composing the app
- C. App design pattern, business data, and defining business processes
- D. Model licensing design, defining business processes, and composing the app

<details>
<summary>Answer</summary>

**Correct answer:** B. Modeling business data, defining business processes, and composing the app

**Explanation:** When creating model-driven apps, it is important to focus on three areas: modeling business data, defining business processes, and composing the app.

</details>

---

### Question 14 — Single Choice

A maker is building a Dataverse-based app and wants to capture a concept that is not covered by out-of-the-box standard tables. What option does Dataverse provide?

- A. External connectors must be used; Dataverse only supports standard tables
- B. Makers can create custom tables specific to their organization
- C. Only administrators can add new tables to Dataverse
- D. Additional standard tables can be purchased from Microsoft AppSource

<details>
<summary>Answer</summary>

**Correct answer:** B. Makers can create custom tables specific to their organization

**Explanation:** Dataverse includes a base set of standard tables that cover typical scenarios, but makers can also create custom tables that are specific to their organization to model unique business data.

</details>

---

### Question 15 — Single Choice

A maker wants to explore design possibilities and learn how to build a model-driven app before creating their own. Which resource within Power Apps is best suited for this purpose?

- A. The Power Apps documentation portal
- B. Sample apps using fictitious data to showcase real-world scenarios
- C. The Dataverse schema designer
- D. The Power Automate flow templates gallery

<details>
<summary>Answer</summary>

**Correct answer:** B. Sample apps using fictitious data to showcase real-world scenarios

**Explanation:** In Power Apps, sample apps can be used to explore design possibilities and discover concepts applicable when developing your own apps. Every sample app uses fictitious data to showcase a real-world scenario.

</details>

---

### Question 16 — Multi-Select

A maker is reviewing the benefits of using Microsoft Dataverse as a data source for Power Apps. Which **three** benefits are described in the source material? (Select **three**.)

- A. Built-in role-based security to control data access
- B. Native integration with GitHub repositories
- C. Rich integration capabilities with Power Apps and the rest of Microsoft Power Platform
- D. Business rules that maintain business data integrity regardless of the tool used to interact with data
- E. Automatic schema migration from on-premises SQL Server
- F. Cloud-based, secure storage for data structured in tables

<details>
<summary>Answer</summary>

**Correct answer:** A, C, D, F (any three of these four is acceptable; the best three most directly stated are A, C, D)

**Explanation:** Dataverse provides role-based security, rich integration capabilities with Power Platform, business rules that maintain data integrity no matter what tool interacts with the data, and secure cloud-based storage in tables. GitHub integration and automatic SQL migration are not mentioned in the source material.

</details>

---

### Question 17 — Multi-Select

An app maker is adding pages to a new model-driven app. Which **two** page types provide direct interaction with rows of data stored in a Dataverse table? (Select **two**.)

- A. Dashboard
- B. A view provided by the Dataverse table page type
- C. URL
- D. A form provided by the Dataverse table page type
- E. Web resource

<details>
<summary>Answer</summary>

**Correct answer:** B, D

**Explanation:** The Dataverse table page type provides two pages per table: a view (which displays the rows and columns of the table) and a form (which lets users interact with the table by editing existing rows or creating new ones).

</details>

---

### Question 18 — Multi-Select

Which **three** statements accurately describe characteristics of model-driven apps in Power Apps? (Select **three**.)

- A. The app layout is component-focused and determined largely by the components added
- B. Makers have complete pixel-level control over every element on every screen
- C. Business process flows can be created to guide users step-by-step through processes
- D. Apps are automatically responsive and work on desktop and mobile devices
- E. Apps are only accessible from a web browser on a desktop computer
- F. All data must be sourced from SharePoint lists

<details>
<summary>Answer</summary>

**Correct answer:** A, C, D

**Explanation:** Model-driven apps use a component-focused approach (A), support business process flows to guide users through business processes (C), and are automatically responsive with a similar UI across desktop and mobile (D). Complete pixel-level control is a characteristic of canvas apps, not model-driven apps.

</details>

---

### Question 19 — Fill-in-the-Blank

In Microsoft Dataverse, data is stored in ___. These structures are used to store records and can be either standard (provided out-of-the-box) or ___, created specifically for an organization's unique needs.

<details>
<summary>Answer</summary>

**Answer:** tables; custom tables

**Explanation:** Dataverse stores all data in tables. A base set of standard tables covers typical scenarios, and makers can create custom tables to model data that is specific to their organization.

</details>

---

### Question 20 — Fill-in-the-Blank

Model-driven apps are built using a ___ approach, which means the app layout is determined by the ___ you add to the app rather than by manually designing each screen.

<details>
<summary>Answer</summary>

**Answer:** component-focused; components

**Explanation:** Unlike canvas apps where you design screens manually, model-driven apps use a component-focused approach where the layout is automatically generated based on the components (such as views, forms, and charts) added to the app.

</details>

---

### Question 21 — Fill-in-the-Blank

When creating a model-driven app, the three key areas to focus on are: modeling ___, defining ___, and composing the app.

<details>
<summary>Answer</summary>

**Answer:** business data; business processes

**Explanation:** The source material explicitly states these three areas as the foundation for creating model-driven apps: modeling business data, defining business processes, and composing the app.

</details>

---

### Question 22 — Fill-in-the-Blank

In model-driven apps, the design is built up from ___ tables in Microsoft Dataverse. When a maker publishes a change to a form, view, or chart on a Dataverse table, any other model-driven app using that table as a data source ___ gains access to the updated components.

<details>
<summary>Answer</summary>

**Answer:** Dataverse; instantly

**Explanation:** Model-driven apps start with Dataverse tables as building blocks. Because of the direct connection to Dataverse, changes published to a table's forms, views, or charts are instantly reflected in all model-driven apps that use that table as a data source.

</details>
