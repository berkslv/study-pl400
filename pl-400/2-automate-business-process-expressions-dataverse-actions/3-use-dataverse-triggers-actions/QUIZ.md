# Quiz: Using Dataverse Triggers and Actions in Power Automate

> **Source material:** 1-introduction.md, 2-triggers.md, 3-query-data.md, 4-create-update-delete-relate.md, 5-exercise.md, 6-check.md, 7-summary.md
> **Total questions:** 25
> **Question types:** Multiple choice (single), Multiple choice (multi-select), Fill-in-the-blank

---

## Questions

### Question 1 — Single Choice

Your organization needs to build a Power Automate cloud flow that runs as a background automation representing work done by the overall application, rather than by any interactive user.

Which authentication type should you use when setting up the Dataverse connector connection?

- A. OAuth
- B. Service principal
- C. Basic authentication
- D. Windows authentication

<details>
<summary>Answer</summary>

**Correct answer:** B. Service principal

**Explanation:** Service principal authentication is designed for non-interactive, background automations that represent work done for the overall application. You register a service principal with Microsoft Entra ID and configure an application user in the Dataverse environment.

</details>

---

### Question 2 — Single Choice

A maker is building a cloud flow using the Dataverse connector and wants to deploy the same flow across development, test, and production environments without modification.

Which environment connection option should the maker choose?

- A. A specific named environment
- B. The current environment
- C. A service principal environment
- D. A cross-environment integration

<details>
<summary>Answer</summary>

**Correct answer:** B. The current environment

**Explanation:** Connecting to the current environment is recommended for portability. The flow automatically adjusts to use whichever environment it is deployed to, without requiring any changes to the flow configuration.

</details>

---

### Question 3 — Single Choice

A developer has a cloud flow that uses multiple Dataverse **Get a row by ID** steps, each targeting a different table. Users are finding it difficult to identify which step retrieves which data when selecting dynamic content in later steps.

What is the recommended approach to resolve this confusion?

- A. Use separate flows for each table.
- B. Rename each step to reflect the table or purpose it is accessing.
- C. Use only one Get a row by ID action per flow.
- D. Switch to FetchXML queries to avoid dynamic content overlap.

<details>
<summary>Answer</summary>

**Correct answer:** B. Rename each step to reflect the table or purpose it is accessing.

**Explanation:** Renaming flow steps (e.g., "Get Primary Contact") ensures that when you use the output in dynamic content later in the flow, you can clearly identify the correct output items for each step.

</details>

---

### Question 4 — Single Choice

You configure a **When a row is added, modified or deleted** trigger with the change type set to **Deleted**. A colleague asks what data from the deleted row is available as output in subsequent steps.

What is the correct answer?

- A. The full row data, including all column values
- B. Only the row ID of the deleted row
- C. Only the primary key and the table name
- D. No data is available; deleted rows produce no output

<details>
<summary>Answer</summary>

**Correct answer:** B. Only the row ID of the deleted row

**Explanation:** When the change type includes a delete event, only the row ID of the Dataverse row is available as output for subsequent steps. Full row data is only available when the change type includes add or modify.

</details>

---

### Question 5 — Single Choice

You need to determine which change type (create, update, or delete) triggered a flow that is configured to run on multiple change types.

Which expression retrieves this information?

- A. `triggerOutputs()?['body/ChangeType']`
- B. `triggerBody()?['SdkMessage']`
- C. `triggerBody()?['ChangeType']`
- D. `triggerOutputs()?['SdkMessage']`

<details>
<summary>Answer</summary>

**Correct answer:** B. `triggerBody()?['SdkMessage']`

**Explanation:** The `SdkMessage` property in the trigger body contains the value `create`, `update`, or `delete`, indicating which change type fired the trigger. This is useful when you need conditional logic based on the type of change.

</details>

---

### Question 6 — Single Choice

A flow owner wants personal automation that only triggers when the flow owner modifies their own rows in a Dataverse table. Users in the same business unit should not trigger this flow.

Which scope option should the owner configure on the trigger?

- A. Organization
- B. Business Unit
- C. Parent: Child Business Unit
- D. User

<details>
<summary>Answer</summary>

**Correct answer:** D. User

**Explanation:** The User scope is the most restrictive option and ensures the flow only runs when the flow owner owns the modified row. It is best suited for personal automations where you want to minimize triggers from other users' data.

</details>

---

### Question 7 — Single Choice

A maker has a cloud flow that updates several columns on a row after it is modified. The **When a row is added, modified or deleted** trigger is configured with the **Select columns** advanced option listing the same columns that the flow updates. Users report the flow is running indefinitely.

What is causing this behavior?

- A. The flow is missing a termination condition.
- B. The OData filter expression is incorrect.
- C. Including columns updated by the flow in the Select columns option creates an infinite loop.
- D. The scope is set to Organization instead of User.

<details>
<summary>Answer</summary>

**Correct answer:** C. Including columns updated by the flow in the Select columns option creates an infinite loop.

**Explanation:** If you list columns in **Select columns** that your flow subsequently updates, every time the flow updates those columns it triggers the flow again, creating an infinite loop. You must exclude from **Select columns** any columns the flow will update.

</details>

---

### Question 8 — Single Choice

You want your flow to trigger only when a Dataverse row is modified and the `contoso_amountoverbudget` column value exceeds 10,000.

Which advanced option and expression should you use?

- A. Select columns: `contoso_amountoverbudget gt 10000`
- B. Delay until: `contoso_amountoverbudget gt 10000`
- C. Filter rows: `contoso_amountoverbudget gt 10000`
- D. Run as: `contoso_amountoverbudget gt 10000`

<details>
<summary>Answer</summary>

**Correct answer:** C. Filter rows: `contoso_amountoverbudget gt 10000`

**Explanation:** The **Filter rows** advanced option accepts an OData expression. The flow only runs when the expression evaluates to true after the change is saved in Dataverse. This lets you restrict trigger execution based on column values.

</details>

---

### Question 9 — Single Choice

A flow must pause for an extended period—potentially several weeks—before resuming. Using the standard **Delay until** action has caused issues with expiration.

Which trigger advanced option solves this problem?

- A. Select columns
- B. Run as
- C. Filter rows
- D. Delay until (trigger property)

<details>
<summary>Answer</summary>

**Correct answer:** D. Delay until (trigger property)

**Explanation:** The **Delay until** advanced option on the Dataverse trigger uses an OData-style UTC timestamp and never expires, allowing a flow run to wait for long periods. This is a key advantage over the standard **Delay until** action, which can expire.

</details>

---

### Question 10 — Single Choice

A flow owner needs each Dataverse action in the flow to execute under the context of the user who modified the row that triggered the flow, rather than the flow owner's context.

What configuration is required? (Select the most complete answer.)

- A. Set **Run as** to **Modifying user** on the trigger, and enable **Use invoker's connection** on each action.
- B. Set **Run as** to **Modifying user** on the trigger only.
- C. Enable **Use invoker's connection** on each action only.
- D. Set **Run as** to **Row owner** on the trigger, and enable **Use invoker's connection** on each action.

<details>
<summary>Answer</summary>

**Correct answer:** A. Set **Run as** to **Modifying user** on the trigger, and enable **Use invoker's connection** on each action.

**Explanation:** To run actions as the modifying user, you must set **Run as** to **Modifying user** on the trigger AND enable **Use invoker's connection** on the Settings tab of each individual Dataverse action. The flow owner must also have the **Act on Behalf of Another User** privilege.

</details>

---

### Question 11 — Single Choice

You are using the **Get a row by ID** action in a flow. The row ID is derived from a lookup column that might not always be populated.

What should you do before executing the Get a row by ID step?

- A. Enable pagination on the action.
- B. Set the row ID to an empty string if null.
- C. Perform a conditional null check on the row ID value.
- D. Use FetchXML instead to handle null IDs gracefully.

<details>
<summary>Answer</summary>

**Correct answer:** C. Perform a conditional null check on the row ID value.

**Explanation:** The **Get a row by ID** action fails if the row ID is null. You should always check whether the ID value is null with a conditional step before calling the action to avoid flow failures.

</details>

---

### Question 12 — Single Choice

A **List rows** action in a flow is configured without pagination. The Dataverse table being queried contains 8,000 rows that match the filter criteria.

What happens when the flow runs?

- A. The flow fails with an error indicating too many rows.
- B. The flow returns exactly 5,000 rows with no error or warning.
- C. The flow automatically enables pagination and returns all 8,000 rows.
- D. The flow returns the first 100 rows by default.

<details>
<summary>Answer</summary>

**Correct answer:** B. The flow returns exactly 5,000 rows with no error or warning.

**Explanation:** By default, the **List rows** action has a maximum of 5,000 rows. Reaching this limit does not produce an error — you simply do not receive the remaining rows. You must enable **Pagination** in the Settings tab and specify a page size (up to 100,000) to retrieve more than 5,000 rows.

</details>

---

### Question 13 — Single Choice

You need to filter a **List rows** query to return all accounts where the primary contact's full name equals "Susanna (sample)".

Which OData filter expression achieves this?

- A. `fullname eq 'Susanna (sample)'`
- B. `contact/fullname eq 'Susanna (sample)'`
- C. `primarycontactid/fullname eq 'Susanna (sample)'`
- D. `expand(primarycontactid) eq 'Susanna (sample)'`

<details>
<summary>Answer</summary>

**Correct answer:** C. `primarycontactid/fullname eq 'Susanna (sample)'`

**Explanation:** When filtering on related table data in OData, you reference the lookup column name followed by a slash and the related column's logical name. In this case, `primarycontactid` is the lookup column and `fullname` is the column on the related Contact table.

</details>

---

### Question 14 — Single Choice

A maker wants to include data from the related primary contact (contact ID and full name) in the output of a **Get a row by ID** action on the Account table.

Which option and expression should the maker use?

- A. Filter rows: `primarycontactid($select=contactid,fullname)`
- B. Expand Query: `primarycontactid($select=contactid,fullname)`
- C. Select columns: `primarycontactid,contactid,fullname`
- D. FetchXML with a link-entity for the contact table

<details>
<summary>Answer</summary>

**Correct answer:** B. Expand Query: `primarycontactid($select=contactid,fullname)`

**Explanation:** The **Expand Query** option under Advanced parameters accepts an OData-style expression to include related table data. Note that expanded data does not appear in the Dynamic Content pane and must be accessed via workflow expressions.

</details>

---

### Question 15 — Single Choice

Which of the following filtering methods is NOT supported by the **List rows** action in the Dataverse connector?

- A. OData filter expressions
- B. FetchXML
- C. SQL queries
- D. Row count limiting

<details>
<summary>Answer</summary>

**Correct answer:** C. SQL queries

**Explanation:** The **List rows** action supports OData-style filter expressions and FetchXML criteria. SQL queries are not supported by the Dataverse connector's List rows action.

</details>

---

### Question 16 — Single Choice

You are using the **Update a row** action and need to remove an existing value from a column, setting it back to empty.

What should you do?

- A. Leave the column field blank on the action.
- B. Set the column value to an empty string `""`.
- C. Set the column value to an expression of `null`.
- D. Delete and recreate the row without that column value.

<details>
<summary>Answer</summary>

**Correct answer:** C. Set the column value to an expression of `null`.

**Explanation:** To clear an existing column value using the **Update a row** action, you must explicitly set that column to the expression `null`. Leaving the field blank does not clear the value — it simply means no change will be made to that column.

</details>

---

### Question 17 — Single Choice

You want to create a new row in Dataverse if no matching row ID exists, or update the existing row if it does. Which action supports this behavior?

- A. Add a new row
- B. List rows
- C. Update a row (upsert)
- D. Relate rows

<details>
<summary>Answer</summary>

**Correct answer:** C. Update a row (upsert)

**Explanation:** The **Update a row** action supports upsert behavior: if the provided row ID does not match any existing row, the action creates a new row instead. This makes it suitable for scenarios where you want to ensure a row exists without knowing whether it was already created.

</details>

---

### Question 18 — Single Choice

You need to use the **Relate rows** action to establish a many-to-many relationship between two Dataverse tables.

How do you determine which table to specify on the action?

- A. Always use the table with more rows.
- B. Check the **Relate** column in the table's relationship list; that table is the one to specify.
- C. Use the table listed first alphabetically.
- D. Use whichever table has the lookup column defined.

<details>
<summary>Answer</summary>

**Correct answer:** B. Check the **Relate** column in the table's relationship list; that table is the one to specify.

**Explanation:** For many-to-many relationships, you determine the correct table to use on the **Relate rows** action by looking at the table properties and checking which table appears in the **Relate** column of the relationship list. The other table's row URL is then set in the **Relate With** property.

</details>

---

### Question 19 — Multi-Select

A flow uses the **When a row is added, modified or deleted** trigger. Which of the following statements about this trigger are correct? (Select **three**.)

- A. The trigger fires before the change is saved to Dataverse.
- B. If the change type is Delete, only the row ID is available as output.
- C. The trigger may fire multiple times for repeated updates to a row even if column values do not change.
- D. The **Select columns** option filters the columns returned in the trigger output.
- E. Organization scope triggers the flow for any user who modifies a row in an org-owned table.
- F. The trigger can only be configured for a single change type at a time.

<details>
<summary>Answer</summary>

**Correct answer:** B, C, E

**Explanation:** B is correct — delete events only surface the row ID. C is correct — the flow can fire multiple times for repeated updates even without value changes, so flow logic must account for this. E is correct — Organization scope triggers for any modifier of an org-owned row. A is incorrect (triggers fire *after* the change). D is incorrect — Select columns specifies *which column modifications* cause the flow to run, not which columns are returned. F is incorrect — multiple change types can be combined.

</details>

---

### Question 20 — Multi-Select

You are configuring the **Run as** advanced option on the **When a row is added, modified or deleted** trigger. Which of the following are valid **Run as** values? (Select **three**.)

- A. Flow owner
- B. Service principal
- C. Row owner
- D. Modifying user
- E. System administrator
- F. Delegate role user

<details>
<summary>Answer</summary>

**Correct answer:** A, C, D

**Explanation:** The three valid **Run as** options are **Flow owner** (the user who created the flow), **Row owner** (the user who owns the Dataverse row that triggered the flow), and **Modifying user** (the user who took the action causing the trigger). Service principal, System administrator, and Delegate role user are not valid **Run as** values.

</details>

---

### Question 21 — Multi-Select

Which of the following statements about the **List rows** action and FetchXML are correct? (Select **two**.)

- A. FetchXML supports aggregation queries in the List rows action.
- B. FetchXML can be exported from **Advanced find** in a Power Apps model-driven app.
- C. FetchXML is an OData-based query language.
- D. FetchXML supports filtering, sorting, column selection, and expand (link-entity) in the List rows action.
- E. FetchXML and OData filter expressions can be combined in the same List rows action.

<details>
<summary>Answer</summary>

**Correct answer:** B, D

**Explanation:** B is correct — FetchXML can be composed manually or exported from Advanced find in a model-driven app. D is correct — FetchXML provides the equivalent of Select columns, Sort by, Expand Query, and Filter rows. A is incorrect — aggregation queries are not supported with FetchXML in the List rows action. C is incorrect — FetchXML is a proprietary XML-based language, not OData-based. E is incorrect — you use either OData or FetchXML, not both at once.

</details>

---

### Question 22 — Multi-Select

You need to relate two Dataverse rows together using the **Relate rows** action for a one-to-many relationship. Which of the following steps are required? (Select **two**.)

- A. Select the table on the **many** side of the relationship.
- B. Provide the **Row ID** (GUID only) for the table on the **one** side.
- C. Set the **Relate With** property to a row URL (OData ID or manually composed URL).
- D. Set the **Relate With** property to a GUID only.
- E. Use a lookup column on the child table row instead of the Relate rows action.

<details>
<summary>Answer</summary>

**Correct answer:** B, C

**Explanation:** For a one-to-many relationship using the **Relate rows** action, you select the table on the **one** side, provide its **Row ID** as a GUID (not a URL), pick the relationship, and set **Relate With** to the row URL (OData ID or manually composed). The table on the many side is referenced via the row URL in Relate With.

</details>

---

### Question 23 — Fill-in-the-Blank

When configuring the **When a row is added, modified or deleted** trigger, you can use the `___` property to identify whether the flow was triggered by a create, update, or delete operation.

<details>
<summary>Answer</summary>

**Answer:** `triggerBody()?['SdkMessage']`

**Explanation:** The `SdkMessage` property in the trigger body returns `create`, `update`, or `delete`. This is particularly useful when you configure the trigger for multiple change types and need conditional logic based on the type of change that occurred.

</details>

---

### Question 24 — Fill-in-the-Blank

By default, the **List rows** action returns a maximum of ___ rows. To return up to ___ rows, you must enable the ___ feature from the action's Settings tab.

<details>
<summary>Answer</summary>

**Answer:** 5,000 / 100,000 / Pagination

**Explanation:** The List rows action has a built-in limit of 5,000 rows. Exceeding this limit does not generate an error — rows beyond the limit are silently dropped. Enabling Pagination in the Settings tab allows you to specify a page size of up to 100,000 rows.

</details>

---

### Question 25 — Fill-in-the-Blank

To execute Dataverse actions in a flow under a different user's context, you must configure the ___ advanced option on the trigger, and on each individual action you must enable ___ from the action's Settings tab. The flow owner must hold the ___ Dataverse privilege to do this.

<details>
<summary>Answer</summary>

**Answer:** Run as / Use invoker's connection / Act on Behalf of Another User

**Explanation:** The **Run as** trigger option specifies whose context to use (Flow owner, Row owner, or Modifying user). To apply this to individual actions, each action must have **Use invoker's connection** enabled on its Settings tab. The flow owner must have the **Act on Behalf of Another User** privilege, which is included in the **Delegate** security role by default.

</details>
