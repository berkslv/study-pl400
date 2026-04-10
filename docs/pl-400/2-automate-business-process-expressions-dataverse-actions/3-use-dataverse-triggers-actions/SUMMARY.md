# Summary: Using Dataverse Triggers and Actions in Power Automate

> **Source files:** 1-introduction.md, 2-triggers.md, 3-query-data.md, 4-create-update-delete-relate.md, 5-exercise.md

---

## Connector Setup and Authentication

- The **Microsoft Dataverse connector** enables Power Automate cloud flows to start on Dataverse events and execute Dataverse operations.
- **OAuth** — interactive authentication via Microsoft Entra ID org account; suitable for individual user productivity flows.
- **Service principal** — non-interactive authentication; register a service principal in Microsoft Entra ID and configure an application user in the Dataverse environment; suitable for background/project automations.
- Connect to the **current environment** (recommended for portability across dev/test/prod) or a **specific named environment** (useful for cross-environment integrations).
- Preview: duplicate triggers/actions suffixed with **"from selected environment"** allow targeting different environments from a single flow.
- Rename flow steps to reflect the table/purpose being accessed (e.g., "Get Primary Contact") so dynamic content is unambiguous.

---

## Triggers

### When a Row is Added, Modified, or Deleted

- Fires **after** the change occurs in Dataverse.
- Required settings: **Change type**, **Table name**, **Scope**.
- **Change type** options: Added, Modified, Deleted, or combinations.
  - Add/Modify: full row data available as dynamic content output.
  - Delete: only the row ID is available as output.
- Determine which change type fired using:

```
triggerBody()?['SdkMessage']
```

Returns `create`, `update`, or `delete`.

- Flow may trigger multiple times for repeated updates to a row even if column values don't change — flow logic must handle this.
- **Table name**: filter by typing; not displayed alphabetically.

#### Scope Options

| Scope | Behavior |
|---|---|
| Organization (default) | Triggers for any row owner or modifier; required for org-owned tables |
| User | Only triggers when you own the modified row |
| Business Unit | Triggers for anyone in your business unit |
| Parent: Child Business Unit | Includes child business unit users |

- Organization scope: best for all-user flows.
- User scope: best for personal automations.

#### Advanced Options

- **Select columns** — comma-separated logical column names; flow only runs if one of those columns was modified.

```
firstname,lastname
```

> **Important:** Do not include columns in **Select columns** that your flow updates later — this causes an infinite loop.

- **Filter rows** — OData expression; flow runs only when the expression evaluates to `true` after the save.

```
contoso_amountoverbudget gt 10000
```

- **Delay until** — OData-style UTC timestamp; delays trigger evaluation without expiration (unlike the standard Delay Until action, which can expire).
- **Run as** — executes Dataverse actions in the flow under a different user's context.
  - Options: **Flow owner**, **Row owner**, **Modifying user**.
  - Flow owner must have the **Act on Behalf of Another User** Dataverse privilege (included in the **Delegate** security role).
  - For each action to run as a different user, enable **Use invoker's connection** on the action's **Settings** tab.

### When an Action is Performed

- Fires when a Dataverse action completes.
- Used to trigger flows from custom business events (e.g., an `EmployeeOnboarded` event).

### When a Flow Step is Run from a Business Process Flow

- Fires when a user selects the **Run Flow** button in a business process flow step in a model-driven app.

### When a Row is Selected

- Fires when a user in a Power Apps model-driven app selects a row and runs the flow.

---

## Querying Data

### Get a Row by ID

- Retrieves a single row using its unique GUID.
- Use to fetch additional related data or refresh data after a flow pause (e.g., post-approval).
- **Warning:** If the row ID may be `null`, perform a null check before calling this action — the step fails on a null ID.

### List Rows

- Returns 0–many rows matching filter criteria.
- Default maximum: **5,000 rows**. Enable **Pagination** (Settings tab) to return up to **100,000 rows**.
- Reaching 5,000 rows does not produce an error; excess rows are silently dropped — filter results to the minimum required.
- Tip: set **Row count** to `1` during testing to speed up flow runs.

#### Select Columns (both actions)

- Limits returned columns to only those needed; improves efficiency.
- Use the column's **logical name** (found in Advanced options of column properties).

```
firstname,lastname
```

#### Expand Query

- OData-style expression to include related table data in the output.
- Related columns are **not** shown in the Dynamic Content pane; use workflow expressions to access them.

```
primarycontactid($select=contactid,fullname)
```

#### OData Filter Expressions (List Rows)

Simple equality:
```
firstname eq 'John'
```

Query function:
```
contains(firstname,'John')
```

Range with logical operators:
```
revenue lt 100000 and revenue gt 2000
```

Complex with parentheses:
```
(contains(name,'sample') or contains(name,'test')) and revenue gt 5000
```

Filter on related data:
```
primarycontactid/fullname eq 'Susanna (sample)'
```

- **Sort by**: comma-separated logical column names; append `asc` or `desc`.
- **Row count**: limits number of rows returned.

#### FetchXML Criteria (List Rows)

- Proprietary XML-based query language for Dataverse.
- Compose manually or export from **Advanced find** in a model-driven app.
- Supports equivalent of Select columns, Sort by, Expand Query, and Filter rows.
- **Limitation:** Aggregation queries are not supported with FetchXML in the List rows action.

```xml
<fetch>
  <entity name="account">
    <attribute name="name"/>
    <attribute name="address1_city"/>
    <attribute name="primarycontactid"/>
    <attribute name="telephone1"/>
    <attribute name="accountid"/>
    <order attribute="name" descending="false"/>
    <filter type="and">
      <condition attribute="statecode" operator="eq" value="0"/>
      <condition attribute="name" operator="like" value="%Contoso%"/>
    </filter>
    <link-entity alias="accountprimarycontactidcontactcontactid" name="contact" from="contactid" to="primarycontactid" link-type="outer" visible="false">
      <attribute name="emailaddress1"/>
    </link-entity>
  </entity>
</fetch>
```

---

## Create, Update, Delete, and Relate Actions

### Add a New Row

- Creates a new row in a Dataverse table.
- Required columns (marked **Business Required**) are indicated with a red asterisk; the flow cannot be saved without them.
- If columns are later marked Business Required after flow creation, the flow action must be updated.
- Top columns appear in **Parameters** tab; remaining columns are under **Advanced parameters**.

### Update a Row

- Updates an existing row; can also **upsert** (creates a new row if the provided ID doesn't match any existing row).
- **Row ID** is required — use the column named the same as the table with description "Unique Identifier for the table" (not the OData ID column).
- No columns are required — only include columns whose values are changing.
- To clear a column value, set it to an expression of `null`.

### Relating Data

Two methods depending on relationship type:

| Method | Use Case |
|---|---|
| Lookup columns on Add/Update a row | One-to-many relationships where the lookup is on the row being modified |
| **Relate rows** action | Many-to-many relationships (and optionally one-to-many) |

#### Specifying Row Identifiers

- **GUID** (e.g., `fd140aaf-4df4-11dd-bd17-0019b9312238`) — from dynamic content, select the column matching the table name with description "Unique identifier for *tablename*".
- **Row URL (OData ID)** — search dynamic content for **OData ID**, or compose manually:

```
contoso_projects(fd140aaf-4df4-11dd-bd17-0019b9312238)
```

- To find the entity set name: add a Dataverse action, set the table, then switch to code view — the `EntityName` value is the entity set name.

#### Relate Rows Action — One-to-Many

1. Select the table on the **one** side of the relationship.
2. Provide the **Row ID** (GUID only, not a URL).
3. Select which relationship to establish.
4. Set **Relate With** to a row URL (OData ID or manually composed URL).

#### Relate Rows Action — Many-to-Many

- Determine the table to use: check the **Relate** column in the table's relationship list.
- Set **Relate With** to the row URL for the other table's row.

---

## Exercise: Duplicate Contact Detection Flow

**Scenario:** When a new contact is added, check for duplicate emails. If no duplicate, set status to **Active**; otherwise leave as **New** for manual review.

**Flow configuration:**

1. Trigger: **When a row is added, modified, or deleted** — Change type: **Added**, Table: **Contacts**, Scope: **Organization**.
2. Action: **List rows** — Table: **Contacts**, Filter rows:

```plaintext
emailaddress1 eq '<Email dynamic value>'
```

3. Action: **Condition** — check if the count of returned rows equals `1` (only the just-added contact):

```plaintext
length(body('List_rows')?['value'])
```

4. **True branch** (no duplicate): **Update a row** — Table: Contacts, Row ID: Contact GUID from trigger, Status: **Active**.
5. **False branch** (duplicate detected): no action needed; status remains **New**.

---

## References

- [Manage application users](https://learn.microsoft.com/en-us/power-platform/admin/manage-application-users)
- [Power Apps maker portal](https://make.powerapps.com)
- [Power Automate maker portal](https://make.powerautomate.com)
