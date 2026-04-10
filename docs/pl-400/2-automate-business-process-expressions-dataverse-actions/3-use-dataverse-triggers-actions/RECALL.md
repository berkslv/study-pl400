# Recall: Dataverse Triggers and Actions in Power Automate

> **Source files:** 1-introduction.md, 2-triggers.md, 3-query-data.md, 4-create-update-delete-relate.md, 5-exercise.md

---

## Keywords

| Term | Definition |
|------|-----------|
| Dataverse connector | Power Automate connector enabling cloud flows to interact with Microsoft Dataverse tables and events. |
| OAuth | Interactive authentication type using a Microsoft Entra ID organization account for user-driven flows. |
| Service principal | Non-interactive authentication via a registered Entra ID app user, suited for background automations. |
| SdkMessage | Trigger output property containing `create`, `update`, or `delete` to identify which change type fired the flow. |
| Scope | Trigger option controlling which row-ownership groups (Organization, User, Business Unit) can fire the flow. |
| Select columns | Option limiting returned or triggering columns to a comma-separated list of logical column names. |
| OData filter | URL-style query language used in **Filter rows** and **Expand Query** to restrict or join Dataverse data. |
| FetchXML | Dataverse-proprietary XML query language supporting filters, sorting, column selection, and linked entities. |
| Pagination | **List rows** setting enabling retrieval beyond the default 5,000-row cap, up to 100,000 rows per page. |
| Upsert | **Update a row** behavior that creates a new row when the supplied ID does not match an existing record. |
| Run as | Trigger advanced option executing Dataverse actions in the context of the flow owner, row owner, or modifying user. |
| Relate rows action | Dataverse action that establishes many-to-many (or one-to-many) relationships between two existing rows. |
| Row URL | OData entity set reference (e.g., `contoso_projects(<GUID>)`) used to identify a row in relate/update operations. |

---

## Main Ideas

- The Dataverse connector supports four triggers: **When a row is added, modified or deleted**, **When an action is performed**, **When a flow step is run from a business process flow**, and **When a row is selected**.
- The `triggerBody()?['SdkMessage']` expression returns `create`, `update`, or `delete` to distinguish which change type fired a multi-change-type trigger.
- **Select columns** on the trigger (modify change type only) prevents infinite loops — do not include columns that the flow will later update.
- **Filter rows** uses OData expressions evaluated after a row save; only rows satisfying the expression trigger the flow.
- **Delay until** on a trigger never expires, making it preferable to a standard **Delay until** action for long-wait scenarios.
- The **Run as** advanced option requires the **Act on Behalf of Another User** privilege (included in the **Delegate** security role); per-action opt-in via **Use invoker's connection** in the action's Settings tab.
- **Get a row by ID** fails if the supplied row ID is null — always null-check before calling it.
- **List rows** silently truncates at 5,000 rows without error; enable **Pagination** and set a page size up to 100,000 to receive full results.
- FetchXML aggregation queries are not supported in the **List rows** action.
- **Expand Query** includes related table data in action output but does not surface those columns in the Dynamic content pane — a workflow expression is required to access them.
- **Update a row** supports upsert; set a column to the expression `null` to clear its value.
- For one-to-many relationships, use a lookup column on **Add a new row** / **Update a row**; for many-to-many relationships, use the **Relate rows** action with a row URL in **Relate With**.
- Connecting to a specific environment (instead of current) is useful for cross-environment integrations; this feature is currently in preview.

---

## Mini Quiz

### Q1 — Single Choice

A developer wants a flow to trigger only when the `revenue` column of an Account row is modified, not when other columns change.

Which trigger advanced option should they configure?

- A. Filter rows
- B. Delay until
- C. Select columns
- D. Run as

<details>
<summary>Answer</summary>

**Correct answer:** C. Select columns

**Explanation:** The **Select columns** option, available when the change type includes modified rows, restricts the trigger to fire only when one of the listed columns is included in the update. It should not list columns that the flow will itself update, to prevent infinite loops.

</details>

---

### Q2 — Fill-in-the-Blank

To detect which change type (add, modify, or delete) triggered a flow configured for multiple change types, use the expression `triggerBody()?['___']`.

<details>
<summary>Answer</summary>

**Answer:** SdkMessage

**Explanation:** The `SdkMessage` property on the trigger body returns `create`, `update`, or `delete`, identifying the specific data event that fired the flow.

</details>

---

### Q3 — Single Choice

A flow uses **List rows** to retrieve matching contacts. After enabling Pagination, what is the maximum page size that can be configured?

- A. 5,000
- B. 10,000
- C. 50,000
- D. 100,000

<details>
<summary>Answer</summary>

**Correct answer:** D. 100,000

**Explanation:** When Pagination is enabled on the **List rows** action's Settings tab, the page size can be set up to 100,000 rows. Without pagination the action silently caps results at 5,000.

</details>

---

### Q4 — Fill-in-the-Blank

The **Update a row** action can act as an ___ operation: if the provided row ID does not match an existing record, it creates a new row instead.

<details>
<summary>Answer</summary>

**Answer:** upsert

**Explanation:** The **Update a row** action supports upsert behavior — update if a matching ID exists, insert (create) if it does not.

</details>

---

### Q5 — Single Choice

A flow must relate an Account row to multiple Project rows using a many-to-many relationship. Which approach is correct?

- A. Set a lookup column on the **Add a new row** action for Account.
- B. Use the **Relate rows** action and provide a row URL in the **Relate With** property.
- C. Use the **Expand Query** option to join the tables.
- D. Use **Get a row by ID** to fetch the project and then update a lookup column.

<details>
<summary>Answer</summary>

**Correct answer:** B. Use the **Relate rows** action and provide a row URL in the **Relate With** property.

**Explanation:** Many-to-many relationships require the **Relate rows** action. Lookup columns on Add/Update only handle one-to-many relationships where the foreign key lives on the row being written.

</details>

---

### Q6 — Single Choice

A flow owner wants each Dataverse action to execute in the context of the user who last modified the triggering row. Which **Run as** option should they select?

- A. Flow owner
- B. Row owner
- C. Modifying user
- D. Invoker

<details>
<summary>Answer</summary>

**Correct answer:** C. Modifying user

**Explanation:** The **Modifying user** option executes actions as the user whose action caused the trigger to fire, distinct from the **Row owner** (who owns the row) or **Flow owner** (who created the flow).

</details>

---

### Q7 — Fill-in-the-Blank

FetchXML ___ queries are not supported when using the **List rows** action in Power Automate.

<details>
<summary>Answer</summary>

**Answer:** aggregation

**Explanation:** The **List rows** action explicitly does not support aggregation queries in FetchXML; OData or plain FetchXML filters without aggregate functions must be used instead.

</details>

---
