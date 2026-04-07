# Recall: Getting Started with Microsoft Dataverse

> **Source files:** 01-introduction.md, 02-learn-about-entities.md, 03-create-a-cds-entity.md, 04-import-data-into-your-database.md, 05-learn-about-relationships.md, 06-create-table-relationships.md, 07-logic-security.md, 08-4a-use-data-cds-exercise.md, 09-auditing.md, 10-2b-dual-write-vs-virtual-table.md, 11-4b-check.md

---

## Keywords

| Term | Definition |
|------|-----------|
| Microsoft Dataverse | Cloud data platform for Power Platform; secure, scalable, globally available, no DBA expertise required. |
| Standard table | Predefined Dataverse table supporting common business scenarios; cannot be deleted, only hidden via security roles. |
| Custom table | User-defined Dataverse table created to store data unique to an organization's needs. |
| Virtual table | Dataverse table that surfaces external data via CRUD without duplicating it in Dataverse storage. |
| Elastic table | High-scale Dataverse table type powered by Azure Cosmos DB, suitable for tens of millions of rows. |
| Primary column | Human-readable text column used to represent rows in apps and flows; defaults to "Name". |
| Lookup column | Column of type Lookup that creates a many-to-one relationship between two tables automatically. |
| Business rule | Declarative, no-code logic applied at table or form level to validate, set, or require column values. |
| Security role | Collection of privileges and access levels assigned to users to control Dataverse access (RBAC). |
| Dual-write | Built-in bidirectional, near-real-time sync between customer engagement apps and finance and operations apps. |
| Intersect table | Hidden Dataverse table that manages the underlying structure of many-to-many relationships. |
| Audit log | Dataverse record of changes to table rows and user access, stored in log storage capacity. |
| Power Query | Data transformation tool used during Dataverse imports to shape and map source columns to destination columns. |
| Formula column | Dataverse column whose value is computed by an expression (e.g., `Decimal('Contract Amount') * (Probability / 100)`). |

---

## Main Ideas

- Dataverse stores data in **tables** (rows + columns), similar to database tables, but enriched with forms, views, charts, business rules, and metadata.
- Every Dataverse table row is uniquely identified by an auto-generated **GUID** (primary key); an **alternate key** can be defined for external system integration.
- Table **type** (Standard, Activity, Virtual, Elastic) and **ownership** (User/Team or Organization) are set at creation and **cannot be changed** afterward. Schema name also cannot be changed post-creation.
- **Standard tables** should be reused whenever possible; minor customizations (column renames, hiding via security roles) are preferred over creating new tables.
- Data can be imported into Dataverse in bulk from Excel, CSV, SharePoint, SQL, and other sources using **Power Query**; mapping source columns to destination columns is a required step.
- **One-to-many** (1:N) and **many-to-many** (N:N) are the two supported relationship types. A many-to-one is the same as 1:N viewed from the child table.
- Creating a **Lookup column** on a table is the simplest way to establish a many-to-one relationship; Dataverse automatically reflects the inverse one-to-many on the related table.
- Many-to-many relationships use a hidden **intersect table** managed by Dataverse; it is not user-editable and does not support custom columns or forms.
- **Business rules** apply server-side logic (set values, validate, show/hide, enable/disable) regardless of which app creates or updates the row; some actions (show/hide, enable/disable) are only available in model-driven apps.
- Business rule **scope** options: *Individual form*, *All forms*, or *Entity* (applies to all forms and API create/update operations).
- Dataverse uses **role-based access control (RBAC)**; users must have at least one security role to access Dataverse. Custom roles are recommended for apps you build; standard roles cannot be customized.
- **Auditing** is configurable at three levels (environment → table → column); lower levels require the higher level to be enabled first. Requires System Administrator or System Customizer role.
- **Dual-write** provides near-real-time bidirectional sync between finance and operations apps and Dataverse; best for offline scenarios and tightly replicated datasets.
- **Virtual tables** surface finance and operations OData tables in Dataverse without data duplication; best for read-heavy scenarios or when minimizing Dataverse storage usage.
- An unlimited number of apps can use the same Dataverse table.

---

## Mini Quiz

### Q1 — Single Choice

A maker needs to store data for a solution that may grow to 50 million rows and requires high throughput. Which Dataverse table type is most appropriate?

- A. Standard
- B. Activity
- C. Virtual
- D. Elastic

<details>
<summary>Answer</summary>

**Correct answer:** D. Elastic

**Explanation:** Elastic tables are powered by Azure Cosmos DB and are designed for datasets with tens of millions of rows requiring high scale.

</details>

---

### Q2 — Fill-in-the-Blank

In Dataverse, the two settings that **cannot be changed** after a table is created are the table ___ and the table ___.

<details>
<summary>Answer</summary>

**Answer:** type (table type); ownership (table ownership) — also: schema name

**Explanation:** The source states that schema name, table type, and table ownership are all fixed once the table is created and cannot be modified afterward.

</details>

---

### Q3 — Single Choice

A developer adds a Lookup column on the **Trick** table that points to the **Pet** table. What relationship is automatically created on the Pet table?

- A. Many-to-many
- B. One-to-one
- C. One-to-many
- D. Many-to-one

<details>
<summary>Answer</summary>

**Correct answer:** C. One-to-many

**Explanation:** Adding a Lookup column creates a many-to-one relationship on the Trick table and automatically creates the inverse one-to-many relationship on the Pet table.

</details>

---

### Q4 — Fill-in-the-Blank

Dataverse auditing is configurable at three levels: ___, ___, and ___. Enabling a lower level requires the level above it to be enabled first.

<details>
<summary>Answer</summary>

**Answer:** environment; table; column

**Explanation:** Column-level auditing requires table-level auditing to be enabled, which in turn requires environment-level auditing to be enabled.

</details>

---

### Q5 — Single Choice

You need to integrate finance and operations data into a Power Apps solution. The data is very large and you want to avoid duplicating it in Dataverse storage. Which integration method should you use?

- A. Dual-write
- B. Power Query import
- C. Virtual tables
- D. Standard table import

<details>
<summary>Answer</summary>

**Correct answer:** C. Virtual tables

**Explanation:** Virtual tables surface external data (including OData tables from finance and operations apps) in Dataverse without duplicating the data, making them ideal for large datasets where minimizing storage is important.

</details>

---

### Q6 — Single Choice

A business rule is configured with scope set to **Entity**. Where does it apply?

- A. Only to the specified model-driven app form
- B. Only to all model-driven app forms
- C. To all model-driven app forms and to create/update operations via the API
- D. Only to canvas apps

<details>
<summary>Answer</summary>

**Correct answer:** C. To all model-driven app forms and to create/update operations via the API

**Explanation:** The Entity scope is the broadest scope and applies the business rule to all forms and to create/update table operations, regardless of which app or API call triggers them.

</details>

---

### Q7 — Fill-in-the-Blank

In Dataverse, many-to-many relationships are managed internally using a hidden ___ table that is not user-editable and does not support custom columns or forms.

<details>
<summary>Answer</summary>

**Answer:** intersect

**Explanation:** Relational databases do not natively support N:N relationships; Dataverse creates a hidden intersect table to store the association between the two related tables.

</details>

---

### Q8 — Single Choice

Which security role allows a user to create apps, flows, and connections in a Dataverse environment, but does not grant full customization permissions?

- A. System Administrator
- B. Basic User
- C. Environment Maker
- D. Custom Role

<details>
<summary>Answer</summary>

**Correct answer:** C. Environment Maker

**Explanation:** The Environment Maker role grants the ability to create apps, flows, and connections. System Administrator grants full permissions, and Basic User is limited to standard operations on built-in tables.

</details>

---
