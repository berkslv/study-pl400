# Quiz: Getting Started with Microsoft Dataverse

> **Source material:** 01-introduction.md, 02-learn-about-entities.md, 03-create-a-cds-entity.md, 04-import-data-into-your-database.md, 05-learn-about-relationships.md, 06-create-table-relationships.md, 07-logic-security.md, 08-4a-use-data-cds-exercise.md, 09-auditing.md, 10-2b-dual-write-vs-virtual-table.md, 11-4b-check.md, 12-5-summary.md
> **Total questions:** 25
> **Question types:** Multiple choice (single), Multiple choice (multi-select), Fill-in-the-blank

---

## Questions

### Question 1 — Single Choice

Your organization stores data in multiple SaaS products, SharePoint sites, and on-premises databases. You want a single cloud-based data platform that provides built-in security, process automation, and no requirement for database administration expertise.

Which Microsoft product is designed to meet these requirements?

- A. Microsoft Azure SQL Database
- B. Microsoft Dataverse
- C. Microsoft SharePoint Lists
- D. Microsoft Fabric

<details>
<summary>Answer</summary>

**Correct answer:** B. Microsoft Dataverse

**Explanation:** Microsoft Dataverse is the cloud data platform for Microsoft Power Platform, designed to be secure, scalable, and globally available without requiring database administration expertise. It provides built-in security, process automation, and data management tools out of the box.

</details>

---

### Question 2 — Single Choice

A developer is configuring a new Dataverse table and wants to ensure each row is uniquely identified. Which type of identifier does Dataverse automatically assign when a new row is created?

- A. An auto-incrementing integer
- B. A composite key made of multiple columns
- C. A Globally Unique Identifier (GUID)
- D. A user-defined alphanumeric code

<details>
<summary>Answer</summary>

**Correct answer:** C. A Globally Unique Identifier (GUID)

**Explanation:** In Dataverse, every table requires a primary key to uniquely identify rows. Dataverse automatically generates a GUID (e.g., 123e4567-e89b-12d3-a456-426655440000) when a new row is created.

</details>

---

### Question 3 — Single Choice

An app maker at Contoso is creating a new Dataverse table. They want to set advanced properties such as table ownership and schema name. Which option should they select after clicking **+ New table**?

- A. Start with Copilot
- B. Import a SharePoint list
- C. Add columns and data
- D. Table (advanced properties)

<details>
<summary>Answer</summary>

**Correct answer:** D. Table (advanced properties)

**Explanation:** To access advanced settings such as schema name, table type, record ownership, and primary column configuration, the maker must choose **Table (advanced properties)** from the New table dropdown in the Power Apps maker portal.

</details>

---

### Question 4 — Single Choice

A solution architect is designing a Dataverse table that must handle tens of millions of records with high-scale performance. Which table type is most appropriate?

- A. Standard
- B. Activity
- C. Virtual
- D. Elastic

<details>
<summary>Answer</summary>

**Correct answer:** D. Elastic

**Explanation:** Elastic tables are powered by Azure Cosmos DB and are designed for high-scale scenarios with datasets containing tens of millions of rows. Standard tables are for typical use cases and are not optimized for this scale.

</details>

---

### Question 5 — Single Choice

An administrator needs to change the table ownership of an existing Dataverse table from **User or team owned** to **Organization-owned**. What happens when they attempt this change?

- A. The change is applied immediately with no data loss.
- B. The change requires an environment reset to take effect.
- C. Table ownership cannot be changed after the table is created.
- D. The change is applied after republishing the table.

<details>
<summary>Answer</summary>

**Correct answer:** C. Table ownership cannot be changed after the table is created.

**Explanation:** According to Dataverse table configuration rules, table ownership (along with schema name and table type) is fixed at creation time and cannot be changed afterward.

</details>

---

### Question 6 — Single Choice

A maker is building a solution and wants to ensure that the custom tables they create inherit the solution publisher prefix automatically. What is the recommended approach?

- A. Manually edit the schema name of each table to include the prefix.
- B. Create tables inside a Dataverse solution.
- C. Use Copilot to generate tables, as it applies the prefix by default.
- D. Import tables from an Excel file to trigger prefix assignment.

<details>
<summary>Answer</summary>

**Correct answer:** B. Create tables inside a Dataverse solution.

**Explanation:** The best practice in Dataverse is to create tables inside a Dataverse solution so they automatically inherit the solution publisher's prefix. This ensures proper naming conventions and portability across environments.

</details>

---

### Question 7 — Single Choice

During a Dataverse table import exercise, a maker uses Power Query to map source columns to destination columns. At the **Refresh settings** step, which refresh option should be selected for a one-time data load?

- A. Refresh automatically every hour
- B. Refresh on schedule (daily)
- C. Refresh manually
- D. Refresh on publish

<details>
<summary>Answer</summary>

**Correct answer:** C. Refresh manually

**Explanation:** For a one-time or ad hoc data import in Dataverse using Power Query, **Refresh manually** is the appropriate setting. It gives the maker full control over when the data refresh occurs.

</details>

---

### Question 8 — Single Choice

A Dataverse developer creates a lookup column named **Pet** on the **Trick** table that points to the **Pet** table. What type of relationship is automatically created between these tables?

- A. One-to-one between Trick and Pet
- B. Many-to-many between Trick and Pet
- C. Many-to-one from Trick to Pet (one-to-many from Pet to Trick)
- D. One-to-many from Trick to Pet

<details>
<summary>Answer</summary>

**Correct answer:** C. Many-to-one from Trick to Pet (one-to-many from Pet to Trick)

**Explanation:** Adding a Lookup column on the Trick table pointing to the Pet table automatically creates a many-to-one relationship from Trick to Pet. This means many Trick rows can be associated with a single Pet row, and the Pet table will show a corresponding one-to-many relationship.

</details>

---

### Question 9 — Single Choice

A business analyst wants to model a scenario where each **Pet** can have multiple **Groomers**, and each **Groomer** can serve multiple **Pets**. Which Dataverse relationship type supports this requirement?

- A. One-to-many
- B. Many-to-one
- C. Many-to-many
- D. Self-referential one-to-many

<details>
<summary>Answer</summary>

**Correct answer:** C. Many-to-many

**Explanation:** A many-to-many (N:N) relationship allows rows in both tables to be associated with multiple rows in the other table. Dataverse manages this using a hidden intersect table behind the scenes.

</details>

---

### Question 10 — Single Choice

A maker needs to enforce a rule in Dataverse that makes the **Probability** field required whenever the **Contract Amount** field contains data. Which Dataverse feature should be used?

- A. A Power Automate cloud flow
- B. A business process flow
- C. A business rule
- D. A real-time workflow

<details>
<summary>Answer</summary>

**Correct answer:** C. A business rule

**Explanation:** Business rules in Dataverse support conditions and actions such as setting column requirement levels. In the exercise, a business rule named "Make Probability Required" uses a condition on Contract Amount containing data to trigger the Set Business Required action on the Probability field.

</details>

---

### Question 11 — Single Choice

A developer wants to apply a business rule that affects all model-driven app forms as well as create and update API operations on the table. Which scope should they configure?

- A. Individual form
- B. All forms
- C. Entity
- D. Global

<details>
<summary>Answer</summary>

**Correct answer:** C. Entity

**Explanation:** Setting the scope to **Entity** applies the business rule to all model-driven app forms and to create/update operations on the table, making it the broadest scope available for business rules in Dataverse.

</details>

---

### Question 12 — Single Choice

A canvas app developer notices that a business rule defined for a table is not showing or hiding columns in their canvas app, even though it works correctly in the model-driven app. What is the most likely reason?

- A. Canvas apps do not support business rules at all.
- B. The business rule scope is set to "Individual form."
- C. Show/hide column actions are not supported in canvas apps.
- D. The canvas app is using an older Dataverse version.

<details>
<summary>Answer</summary>

**Correct answer:** C. Show/hide column actions are not supported in canvas apps.

**Explanation:** While business rules defined at the table level apply to both canvas and model-driven apps, some actions—including show/hide columns, enable/disable columns, and business recommendations—are only supported in model-driven apps.

</details>

---

### Question 13 — Single Choice

An administrator is setting up access control for a new Dataverse-based app. The requirement is that users should only be able to perform standard operations on built-in tables like Account and Contact, but should not be able to customize the environment. Which standard security role should be assigned?

- A. System Administrator
- B. Environment Maker
- C. Basic user
- D. Delegated Administrator

<details>
<summary>Answer</summary>

**Correct answer:** C. Basic user

**Explanation:** The **Basic user** security role allows users to run apps and perform standard operations on built-in tables such as Account and Contact. The System Administrator and Environment Maker roles include elevated privileges for customization and management tasks.

</details>

---

### Question 14 — Single Choice

A security architect wants to grant access to a custom Dataverse app and needs to configure a role that can be fully customized. What is the recommended approach?

- A. Modify the System Administrator role to limit its permissions.
- B. Use the Environment Maker role, which supports full customization.
- C. Create a custom security role with only the required privileges.
- D. Assign the Basic user role and add individual column permissions.

<details>
<summary>Answer</summary>

**Correct answer:** C. Create a custom security role with only the required privileges.

**Explanation:** Standard security roles in Dataverse cannot be customized. The recommended approach is to create a custom security role and configure only the required privileges per table. This ensures the principle of least privilege.

</details>

---

### Question 15 — Single Choice

A compliance officer wants to view a log of all audited operations across an entire Dataverse environment. Where should they navigate to access this information?

- A. The Audit History tab on a specific record in a model-driven app
- B. The Audit Summary View in the Power Platform admin center
- C. The Power Query editor under Import settings
- D. The Security roles management screen

<details>
<summary>Answer</summary>

**Correct answer:** B. The Audit Summary View in the Power Platform admin center

**Explanation:** The **Audit Summary View** in the Power Platform admin center provides a comprehensive list of all audit logs in a Dataverse environment. For record-level audit history, you can use the Audit History tab within a model-driven app.

</details>

---

### Question 16 — Single Choice

An architect is choosing between Dual-write and virtual tables to integrate finance and operations data with Dataverse. The solution requires near-real-time data synchronization and full offline support. Which approach should they use?

- A. Virtual tables only, because they avoid data duplication.
- B. Dual-write, because it supports near-real-time sync and offline scenarios.
- C. A custom Power Automate flow to sync records on a schedule.
- D. Standard Dataverse import with manual refresh.

<details>
<summary>Answer</summary>

**Correct answer:** B. Dual-write, because it supports near-real-time sync and offline scenarios.

**Explanation:** Dual-write provides near-real-time, bidirectional synchronization between finance and operations apps and Dataverse, and also supports offline scenarios. Virtual tables do not replicate data and are better suited for real-time read-heavy access without local storage.

</details>

---

### Question 17 — Single Choice

A developer wants to expose finance and operations data inside Dataverse for use in Power Pages without duplicating the data in Dataverse storage. Which approach should they use?

- A. Dual-write with a one-way sync policy
- B. Virtual tables
- C. Standard Dataverse import from OData feed
- D. An Azure Data Factory pipeline into Dataverse

<details>
<summary>Answer</summary>

**Correct answer:** B. Virtual tables

**Explanation:** Virtual tables expose finance and operations app data in Dataverse without duplicating it. All OData tables in finance and operations apps are available as virtual tables, and Power Pages can use them to power external-facing websites.

</details>

---

### Question 18 — Multi-Select

A maker is planning to create a new Dataverse table using the **Table (advanced properties)** option. Which of the following settings **cannot** be changed after the table is created? (Select **three**.)

- A. Display name
- B. Schema name
- C. Table type
- D. Table ownership
- E. Primary column display name
- F. Description

<details>
<summary>Answer</summary>

**Correct answer:** B. Schema name, C. Table type, D. Table ownership

**Explanation:** Once a Dataverse table is saved, the schema name, table type, and table ownership are locked and cannot be modified. Display name, description, and primary column display name can be updated after table creation.

</details>

---

### Question 19 — Multi-Select

A Dataverse administrator needs to enable auditing for a specific column on a table. Which of the following prerequisites must be met before column-level auditing can be enabled? (Select **two**.)

- A. Auditing must be enabled at the environment level.
- B. The table must be of type Elastic.
- C. Auditing must be enabled at the table level.
- D. The column must be a primary key column.
- E. The user must have the Basic user security role.

<details>
<summary>Answer</summary>

**Correct answer:** A. Auditing must be enabled at the environment level, C. Auditing must be enabled at the table level.

**Explanation:** Dataverse auditing is hierarchical. Column-level auditing requires both environment-level and table-level auditing to be enabled first. The administrator must also have the System Administrator or System Customizer role to configure auditing.

</details>

---

### Question 20 — Multi-Select

A solution designer is reviewing the capabilities of Dataverse business rules compared to model-driven app features. Which of the following actions are supported by business rules in **model-driven apps** but **not** in canvas apps? (Select **three**.)

- A. Set column values
- B. Show or hide columns
- C. Validate input and display error messages
- D. Enable or disable columns
- E. Create business recommendations
- F. Change column requirement levels

<details>
<summary>Answer</summary>

**Correct answer:** B. Show or hide columns, D. Enable or disable columns, E. Create business recommendations

**Explanation:** Business rules support a broad set of actions, but only model-driven apps support showing/hiding columns, enabling/disabling columns, and creating business recommendations. Actions like setting values, validating input, and changing requirement levels work in both canvas and model-driven apps.

</details>

---

### Question 21 — Fill-in-the-Blank

In Dataverse, data is organized into logical structures of rows and columns known as ___. Each record in these structures is uniquely identified by a ___ that Dataverse generates automatically.

<details>
<summary>Answer</summary>

**Answer:** tables; Globally Unique Identifier (GUID)

**Explanation:** Dataverse stores data in tables, which are similar to database tables with rows and columns. Each row is uniquely identified by a GUID that is automatically assigned by Dataverse upon record creation.

</details>

---

### Question 22 — Fill-in-the-Blank

When importing data into a Dataverse table using Power Query, the step where you match source columns to destination columns is called ___ mapping. If columns cannot be matched automatically, you can use the ___ map feature to attempt automatic matching.

<details>
<summary>Answer</summary>

**Answer:** Column; Auto

**Explanation:** During the Power Query import process, the **Column mapping** section allows you to match source columns to Dataverse destination columns. The **Auto map** feature attempts to match them automatically, though manual mapping may still be required for some fields.

</details>

---

### Question 23 — Fill-in-the-Blank

In Dataverse, a ___ relationship is managed using a hidden intersect table that is not user-editable and does not support custom forms or columns. This table type allows rows in both tables to act as ___ without a parent-child hierarchy.

<details>
<summary>Answer</summary>

**Answer:** many-to-many (N:N); peers

**Explanation:** Many-to-many relationships in Dataverse use a hidden intersect table to manage the associations between the two participating tables. Unlike one-to-many relationships, neither table holds a parent or child role—both sets of rows are considered peers.

</details>

---

### Question 24 — Fill-in-the-Blank

Dataverse auditing can be configured at three levels: ___, ___, and column. Enabling auditing at the column level requires that auditing is first enabled at the ___ and ___ levels.

<details>
<summary>Answer</summary>

**Answer:** environment; table; environment; table

**Explanation:** Dataverse auditing is hierarchical. You must enable environment-level auditing first, then table-level auditing, before column-level auditing becomes available. All three levels must be enabled for column-level audit logging to function.

</details>

---

### Question 25 — Fill-in-the-Blank

___ is a Dataverse integration method that provides near-real-time, bidirectional synchronization between finance and operations apps and Dataverse, while ___ tables allow CRUD operations on external data without replicating it in Dataverse storage.

<details>
<summary>Answer</summary>

**Answer:** Dual-write; virtual

**Explanation:** Dual-write enables tightly coupled, bidirectional data sync across Dataverse and finance and operations apps, including offline support. Virtual tables expose external data sources directly within Dataverse without duplicating the data, making them ideal for read-heavy or storage-sensitive scenarios.

</details>
