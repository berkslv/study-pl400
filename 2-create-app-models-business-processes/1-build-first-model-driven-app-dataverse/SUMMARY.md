# Summary: Build Your First Model-Driven App with Microsoft Dataverse

> **Source files:** 1-introduction.md, 2-model-driven-apps.md, 3-dataverse-model-driven-apps.md, 4-exercise-explore-sample-apps.md, 5-check.md

---

## Microsoft Dataverse

- Foundational data source of Microsoft Power Platform; provides the most functionality, deepest integrations, and best ease of use of any available data source.
- All data is stored in **tables** — sets of records analogous to database tables.
- Includes a base set of **standard tables** covering typical scenarios; supports **custom tables** specific to an organization.
- Provides secure, cloud-based storage with **role-based security**.
- **Business rules** applied at the data level maintain business integrity regardless of which tool interacts with the data.
- Rich integration capabilities with Power Apps and the rest of Microsoft Power Platform.

---

## Model-Driven Apps — Key Concepts

- Use a **component-focused approach**: layout is determined by the components you add, not designed screen-by-screen.
- Contrast with **canvas apps**, where you have full control over appearance and behavior.
- **WYSIWYG authoring**: selected views and forms from tables reflect instantly in the preview.
- **No code required**; apps are responsive and have a similar UI across desktop and mobile automatically.
- Can be **distributed as solutions**.

### Three Focus Areas When Creating Model-Driven Apps

1. **Modeling business data** — structure your core business data properly in Dataverse before composing the app.
2. **Defining business processes** — identify and configure the business processes that the app will support.
3. **Composing the app** — assemble pages, data sources, and automation into the final app.

### Design Components

- **Pages** — navigation points (screens) users can navigate to.
- **Data** — Dataverse tables included in the app, plus the ability to add other tables from the environment.
- **Automation** — business process flows included in or created for the app.

---

## Page Types in Model-Driven Apps

| Page Type | Description |
|---|---|
| **Dataverse table** | Provides a **view** (rows/columns display) and a **form** (create/edit rows). |
| **Dashboard** | Collection of charts from any connected table; tables do not have to be the same. |
| **URL** | Adds a link to an external URL; opens in a new browser tab. |
| **Web resource** | Displays developer-created files that extend app functionality. |
| **Custom page** | Embeds a Power Apps canvas app directly inside the model-driven app. |

### Navigation Structure

- Pages appear in a **navigation pane** visible to users.
- Navigation organized using **Groups** and **Subareas**: group names appear as top-level elements; subareas are listed beneath their group.

---

## Dataverse as the Data Source for Model-Driven Apps

- Table relationships defined in Dataverse are automatically available in the app designer and easy to incorporate in views.
- Forms, views, and charts are edited directly in the Dataverse table editor from within the app designer.
- **Publishing a change to a table propagates instantly** to all model-driven apps using that table as a data source.
- Example relationship pattern (Asset Checkout app):
  - `Review` → `Product`: many-to-one via **Associated Product** column.
  - `Reservation` → `Product`: many-to-one via **Product Reservation** column.

---

## Business Process Flows

- Created through model-driven apps to guide users through forms step-by-step.
- Start by selecting a table in the environment, then define **stages**.
- Stages appear **graphically above the table page**, providing a visual guide through the business process.

---

## Sample Apps

- Available in [Power Apps](https://make.powerapps.com/) for exploring design patterns.
- Examples: **Fundraiser** app, **Innovation Challenge** app — both use fictitious data to showcase real-world scenarios.

---

## References

- [Create relationships, business rules, calculations, and roll-ups in Dataverse (Learning Path)](https://learn.microsoft.com/en-us/training/paths/create-relationships-common-data-service/)
- [Overview of building model-driven apps](https://learn.microsoft.com/en-us/power-apps/maker/model-driven-apps/model-driven-app-overview/)
- [Power Apps maker portal](https://make.powerapps.com/)
