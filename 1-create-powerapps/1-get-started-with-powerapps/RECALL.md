# Recall: Get Started with Power Apps

> **Source files:** 1-powerapps-introduction.md, 2-powerapps-building-blocks.md, 3-powerapps-related-technologies.md, 4-powerapps-ways-to-build.md, 4-5-design-app.md, 5-powerapps-create-first.md, create-app-copilot.md

---

## Keywords

| Term | Definition |
|------|-----------|
| Power Apps | A suite of apps, services, and connectors for building custom business apps without coding. |
| Power Apps Maker Portal | The web interface at make.powerapps.com used to create and manage Power Apps. |
| Canvas App | A Power Apps app type offering full, pixel-level control over the user interface and layout. |
| Three-Screen App | An auto-generated app with Browse, Detail, and Edit screens created from a data source. |
| Power Automate | A Power Platform service for creating automated workflows triggered by events or schedules. |
| Power Automate Desktop | An extension that automates routine interactions on local desktop applications and legacy systems. |
| Power BI | A Power Platform analytics tool for building interactive reports and dashboards from data sources. |
| Microsoft Dataverse | A scalable, cloud-based data platform native to Power Platform with built-in relational support and Copilot integration. |
| Delegation Limit | A SharePoint constraint where queries exceeding the limit may return incomplete results with a warning. |
| Power Fx | The formula language used in Power Apps to express logic and data bindings (e.g., `ThisItem.Price`). |
| Copilot (Power Apps) | An AI assistant in Power Apps that generates apps and data tables from natural language or Excel files. |
| On-premises Data Gateway | A component that enables Power Apps to securely connect to SQL or other data sources hosted locally. |
| Gallery Control | A Power Apps control that displays a scrollable list of records from a connected data source. |
| SubmitForm() | A Power Fx function used on a button's OnSelect property to save form data to the data source. |

---

## Main Ideas

- Power Apps connects to hundreds of data sources; non-premium sources include SharePoint and Excel, while Dataverse and SQL are premium and require a Per App or Per User Plan.
- The Power Apps Maker Portal (make.powerapps.com) is the starting point; apps can be created from Copilot, data, a page design, or a blank canvas.
- Apps created with Copilot are built on Dataverse, which may require additional licensing not included in most plans.
- Power Automate handles complex multi-step workflows (approvals, scheduled tasks, cross-system triggers) that go beyond what Power Apps handles natively.
- Power BI reports are private by default; sharing requires a Power BI Pro license for both creator and viewer.
- A Power BI tile can be embedded in a canvas app, and a canvas app can be embedded in a Power BI dashboard for unified, actionable experiences.
- SharePoint lists do not support relational tables natively; key fields must be created manually if relationships are needed.
- Excel data must be formatted as a table for Power Apps to access it; multi-user concurrent editing is not supported with Excel as a live data source.
- Dataverse offers native API access (no configuration), large dataset support, automatic table relationships, and full Copilot feature support.
- When using Copilot to build from Excel, data does not need to be pre-formatted as a table — Copilot infers column names and types automatically.
- Canvas app design should prioritize simplicity, performance (avoid high-res images on mobile), accessibility, and localization from the start.
- The `ThisItem` keyword in gallery formulas dynamically references the current record, enabling each gallery row to display its own field values.
- Setting a form's `Item` property to `Gallery1.Selected` links the form to whichever record the user selects in the gallery.
- Power Apps Mobile (free app) allows running canvas apps on iOS and Android devices using Microsoft 365 credentials.
- Pre-deployment design planning should address user needs, business/compliance requirements, data model selection, UX, UI mockups, accessibility, and localization.

---

## Mini Quiz

### Q1 — Single Choice

A developer needs to build an app for a field team. The data has tens of thousands of rows, requires relational table support, and must use Copilot for app generation.

Which data source is most appropriate?

- A. SharePoint
- B. Excel
- C. Microsoft Dataverse
- D. OneDrive

<details>
<summary>Answer</summary>

**Correct answer:** C. Microsoft Dataverse

**Explanation:** Dataverse supports large datasets, automatic table relationships, and is the only data source that fully supports Copilot for app generation in Power Apps.

</details>

---

### Q2 — Fill-in-the-Blank

In a gallery control, the formula `___` dynamically refers to the current record and is used to display field values specific to each item in the list.

<details>
<summary>Answer</summary>

**Answer:** `ThisItem`

**Explanation:** `ThisItem` is a Power Fx keyword that refers to the current record within a gallery, allowing each row to display its own data (e.g., `ThisItem.'Machine Name'`).

</details>

---

### Q3 — Single Choice

A canvas app requires a multi-step approval process that triggers each morning and sends email notifications with a link to a Power Apps form.

Which tool should handle this logic?

- A. Power BI
- B. Power Apps formula bar
- C. Power Automate
- D. Dataverse calculated columns

<details>
<summary>Answer</summary>

**Correct answer:** C. Power Automate

**Explanation:** Power Automate is recommended for complex workflows such as scheduled flows, multi-step approvals, and cross-system triggers that go beyond native Power Apps capabilities.

</details>

---

### Q4 — Fill-in-the-Blank

To save form data when a button is pressed, set the button's `OnSelect` property to `___(Form1)`.

<details>
<summary>Answer</summary>

**Answer:** `SubmitForm`

**Explanation:** `SubmitForm(Form1)` is the Power Fx function used on a button to write the form's current data back to the connected data source.

</details>

---

### Q5 — Single Choice

A maker uploads an Excel file to OneDrive but Power Apps cannot read the data.

What is the most likely cause?

- A. The file is too large for OneDrive.
- B. The Excel data is not formatted as a table.
- C. Excel is a premium connector requiring extra licensing.
- D. The OneDrive for Business connection is not supported.

<details>
<summary>Answer</summary>

**Correct answer:** B. The Excel data is not formatted as a table.

**Explanation:** Power Apps requires Excel data to be formatted as a table. Unformatted ranges are not accessible as a data source in Power Apps.

</details>

---

### Q6 — Single Choice

A solution architect wants users to interact with a Power Apps form directly inside a Power BI dashboard without switching tools.

What is the correct integration approach?

- A. Embed a Power BI tile inside a canvas app.
- B. Embed a canvas app inside a Power BI dashboard.
- C. Use Power Automate to sync data between both tools.
- D. Export Power BI data to SharePoint and connect Power Apps to it.

<details>
<summary>Answer</summary>

**Correct answer:** B. Embed a canvas app inside a Power BI dashboard.

**Explanation:** A canvas app can be embedded in a Power BI dashboard, enabling users to take action (such as submitting a purchase request) directly from within the dashboard view.

</details>

---

### Q7 — Fill-in-the-Blank

Power BI reports are ___ by default, and sharing them requires a ___ license for both the creator and the viewer.

<details>
<summary>Answer</summary>

**Answer:** private; Power BI Pro

**Explanation:** Power BI reports are private until explicitly shared. Both the report creator and all viewers must have a Power BI Pro license to share and access shared content.

</details>

---

### Q8 — Single Choice

A maker wants to connect Power Apps to an on-premises SQL Server database.

Which component is required to establish this connection securely?

- A. Power Automate Desktop
- B. A premium connector license only
- C. An on-premises Data Gateway
- D. Microsoft Dataverse

<details>
<summary>Answer</summary>

**Correct answer:** C. An on-premises Data Gateway

**Explanation:** When SQL Server is hosted on-premises, an on-premises Data Gateway is required to securely bridge the connection between Power Apps (cloud) and the local SQL database.

</details>

---
