# Summary: Getting Started with Microsoft Dataverse

> **Source files:** 01-introduction.md, 02-learn-about-entities.md, 03-create-a-cds-entity.md, 04-import-data-into-your-database.md, 05-learn-about-relationships.md, 06-create-table-relationships.md, 07-logic-security.md, 08-4a-use-data-cds-exercise.md, 09-auditing.md, 10-2b-dual-write-vs-virtual-table.md, 11-4b-check.md

---

## Microsoft Dataverse Overview

- Cloud data platform for Microsoft Power Platform
- Compliant, secure, scalable, and globally available
- Used by Microsoft Dynamics 365 apps (Sales, Customer Service)
- **Key benefits:**
  - Metadata support: defined properties accelerate app development in Power Apps
  - Granular data access control: table, row, and column level
  - Built-in logic: rules and calculations at the column level
  - Auditing: tracks changes and access to data
  - Process automation: enforces data quality and automates tasks
  - Cloud-managed: Microsoft handles database configuration and backups
  - Enterprise-grade security: data encrypted at rest and in transit
  - No database administration expertise required
  - Seamless integration with Microsoft 365, Azure, Power Apps, Power Automate, Power BI

---

## Tables: Properties and Types

- Data in Dataverse is stored in records called **tables** (rows and columns)
- Tables can represent physical objects or abstract concepts
- Includes a base set of **standard tables** for common business scenarios; extend or create **custom tables** when needed
- Standard tables cannot be deleted; hide them by modifying security role permissions

### Table Properties

- **Name**: Simple display name (e.g., *Pets*)
- **Rows**: Individual records
- **Columns**: Metadata defining each record
- **Relationships**: Links to other tables
- **Keys**: Columns that uniquely identify each row (GUID by default)
- **Forms**: Used by model-driven apps to view/edit rows
- **Views**: Define how rows and columns are displayed
- **Charts**: Visualize table data
- **Dashboards**: Visual summaries using charts and filters
- **Business rules**: Apply logic to table columns
- **Metadata**: Table-level settings affecting app/flow interaction
- **Commands**: Custom buttons added to model-driven app command bars

### Row Keys

- Primary key is a GUID (e.g., `123e4567-e89b-12d3-a456-426655440000`), auto-generated on row creation
- **Primary column**: Readable text field representing rows in apps/flows; defaults to *Name*
- Define an **alternate key** when integrating with external systems where the GUID is unknown

### Table Types

- **Standard**: Default type for most use cases
- **Activity**: Time-bound interaction records (e.g., tasks, calls)
- **Virtual**: External data surfaced as native Dataverse data without duplication
- **Elastic**: High-scale tables powered by Azure Cosmos DB; suitable for tens of millions of rows

> **Note**: Table type cannot be changed after creation.

### Table Ownership

- **User or team owned**: Row-level permissions are user-specific
- **Organization-owned**: Access controlled at the organization level

> **Note**: Table ownership is fixed after creation.

---

## Creating and Configuring Tables

### Creation Methods (Power Apps Maker Portal → Tables → New table)

- **Start with Copilot**: Describe the scenario in natural language; Copilot generates the table structure
- **Blank table**: Manually define columns and enter data rows
- **Import a SharePoint list**: Enter a SharePoint site URL and select a list
- **Import an Excel file or CSV**: AI assists in generating structure if Copilot is enabled
- **Table (advanced properties)**: Full control over schema name, type, ownership, and primary column

### Advanced Properties (set before creation; cannot be changed after)

- **Schema name**: Internal system name; no spaces allowed
- **Table type**: Standard, Activity, Virtual, or Elastic
- **Record ownership**: User or Team / Organization

> **Best practice**: Create tables inside a Dataverse solution so they inherit the solution's publisher prefix.

### Exercise: Create a Custom Table (Pet Grooming Scenario)

1. Sign in to [Power Apps maker portal](https://make.powerapps.com/).
2. Select **Tables → New table → Table (advanced properties)**.
3. Set **Display name**: *Pet* | **Primary column display name**: *Pet Name* → **Save**.
4. Add columns:
   - *Species* — Data type: *Choice* (values: Dog, Cat)
   - *Pet Breed* — Data type: *Single line of text*
   - *Appointment date* — Data type: *Date and time*
5. Customize the **Active Pets** view: add *Appointment date*, *Pet Breed*, *Species*; remove *Created On*; reorder columns → **Save and publish**.
6. Customize the **Main** form: add *Species*, *Pet Breed*, *Appointment date* to the General section → **Save and publish**.

### Exercise: Create a Prospect Table with Formula Column and Business Rule

1. Create table: **Display name** *Prospect* | **Primary column** *Prospect Name*.
2. Add columns:
   - *Stage* — Choice (Lead=1, Opportunity=2, Won=3, Lost=4); default: *Lead*; required: *Business required*
   - *Contract Amount* — Currency
   - *Probability* — Whole Number
   - *Forecasted Revenue* — Formula:
     ```pfx
     Decimal('Contract Amount') * (Probability / 100)
     ```
     > Column names in the formula must exactly match those created. Use *Decimal()* to convert currency to a usable decimal.
3. Add business rule **Make Probability Required**:
   - Condition: *Contract Amount* **Contains data**
   - Action: Set *Probability* → **Business Required**
   - Activate the rule after saving.

---

## Importing Data

- Supported bulk import sources: Excel, Access, SharePoint, SQL, and others
- Use **Import > Import data** (not the legacy *Import data from Excel*) to activate Power Query

### Import Steps (SharePoint List Example)

1. Go to the **Pet** table → **Import > Import data**.
2. Select **SharePoint list** as the data source; enter the SharePoint site URL (no `/Lists` suffix).
3. Select the list → preview data → **Next**.
4. In Power Query editor, use **Choose columns** to select only needed columns.
5. **Map tables**: select **Load to existing table** → choose destination table.
6. Use **Auto map** for column mapping; manually map mismatches if needed.
7. Set **Refresh manually** → **Publish**.

### Import Steps (Excel File Example)

1. Return to the **Prospect** table → **Import > Import data**.
2. Upload `.xlsx` file → verify column preview → **Next**.
3. Verify/set column data types (e.g., set *ContractAmount* to Currency) → **Next**.
4. **Choose destination settings**: Load to existing table → select *Prospect*.
5. Confirm column mapping; manually map **Name** → *Prospect Name* if needed.
6. **Refresh manually** → **Publish** → refresh browser to verify imported data.

---

## Table Relationships

- Relationships define how table rows are associated with rows from other tables
- A relationship references the primary key via a **lookup column**

### Relationship Types

- **One-to-many (1:N)**: One referenced (parent) row associated with many referencing (child) rows
- **Many-to-many (N:N)**: Many rows associated with many other rows; peers with no parent-child hierarchy
  - Dataverse uses a hidden **intersect table** to manage N:N relationships; not user-editable, no custom forms/columns
- **Many-to-one (N:1)**: Same as 1:N viewed from the child table; displayed separately in the maker portal per table perspective

### Creating Relationships

- **Lookup column**: Simplest method; automatically creates a many-to-one relationship
- **Manual (Relationships screen)**: Tables → Schema → Relationships → **New relationship** → select type
- Adding a 1:N relationship automatically adds a Lookup column to the related (many) table
- Multiple apps can use the same table (unlimited)

### Exercise: Create Relationships

1. Create **Trick** table (primary column: *Trick Name*); add *Level* Choice column (Beginner=1, Proficient=2, Expert=3).
2. Add *Pet* Lookup column to **Trick** table → creates many-to-one Trick→Pet / one-to-many Pet→Trick.
3. In **Account** table → Relationships → **New relationship → One-to-many** → Related (Many): *Pet* → **Done**.
   - A *Account* Lookup column is automatically added to the Pet table.

---

## Business Logic

- Server-side logic and validation reduce redundant code in apps
- **Business rules**: Validate data across multiple columns; display warnings/errors regardless of app used
  - Created in drag-and-drop designer; defined at table level
  - Scope options:
    - *Individual form*: applies to one model-driven app form
    - *All forms*: applies to all model-driven app forms
    - *Entity* (default): applies to all forms and create/update operations on the table
  - Available actions: set/clear column values, change requirement levels, show/hide columns, enable/disable columns, validate input and display errors, create business recommendations
  - Canvas apps do **not** support: show/hide columns, enable/disable columns, business recommendations
- **Business process flows**: Guide users to enter data consistently; model-driven apps only
- **Real-time workflows**: Automate processes without user interaction
- **Business logic with code**: Extend behavior via custom code for advanced developer scenarios

---

## Dataverse Security

- Role-based access control (RBAC) manages access to environments, tables, rows, and features
- Users must be assigned at least one security role to access Dataverse and run apps
- **Security roles** are collections of privileges and access levels

### Standard Security Roles

- **System Administrator**: Full permissions to customize and manage the environment
- **Environment Maker**: Can create apps, flows, and connections
- **Basic user**: Can use apps; standard operations on built-in tables (Account, Contact)

> **Best practice**: Create **custom** roles for apps you build; grant only required privileges. Standard roles cannot be customized—only custom roles can be modified.

### Managing Security Roles

- Power Platform admin center → select environment → **Settings → Users + permissions → Security roles**
- Within a custom role, set access levels per privilege per table (full access, read-only, or no access)

---

## Auditing

- Tracks changes made to records and user access through apps or SDK
- Audit logs stored in Dataverse; consume log storage capacity

### Auditing Levels (hierarchical)

- **Environment level**: Must be enabled first; required for user access auditing (Log access) and activity logging (Read logs)
- **Table level**: Requires environment-level auditing enabled
- **Column level**: Requires both environment-level and table-level auditing enabled

### Prerequisites

- System Administrator or System Customizer role (or equivalent permissions) required to enable/disable auditing
- Can be configured manually (Power Platform admin center or Power Apps portal) or programmatically

### Configure Table and Column Auditing

1. Sign in to Power Apps → select environment → **Tables** → select a table.
2. Select **Properties** → in *Edit table* panel, expand **Advanced options**.
3. Under *For this table*, check **Audit changes to its data** → **Save**.
4. In **Schema** pane → **Columns** → select a column → **Edit column**.
5. Expand **Advanced options** → check **Enable auditing** → **Save**.

### Viewing Audit Logs

- **Audit History** tab on a single record (model-driven apps)
- **Audit Summary View** in the Power Platform admin center (all audited operations in an environment)
- Programmatically via Web API or SDK for .NET

---

## Dual-Write vs. Virtual Tables

### Dual-Write

- Built-in near-real-time bidirectional sync between customer engagement apps and finance and operations apps
- Changes in finance and operations apps are automatically written to Dataverse, and vice versa
- Supports online and offline scenarios
- Aligns with low-code/no-code development principles

**Use Dual-write when:**
- Near-real-time synchronization is required
- Full offline capabilities are needed
- A tightly integrated and replicated dataset is required

### Virtual Tables

- Finance and operations apps exposed in Dataverse as a virtual data source
- Full CRUD (create, read, update, delete) operations from within Dataverse and Power Platform
- Data **remains in the source application**; not duplicated in Dataverse
- All OData tables in finance and operations apps are available as virtual tables
- Power Pages can use virtual tables for external-facing websites

**Use Virtual tables when:**
- Real-time access to external data without duplication is needed
- Working with large datasets to minimize Dataverse storage usage
- Use case involves read-heavy scenarios or light CRUD operations without local storage

> Both Dual-write and virtual tables are part of the shared data layer and are complementary; choice depends on data ownership model, need for replication, and offline requirements.

---

## References

- [Power Apps maker portal](https://make.powerapps.com/)
- [Prospects.csv sample data](https://github.com/MicrosoftDocs/mslearn-developer-tools-power-platform/raw/master/power-apps/Prospects.zip)
- [office.com](https://www.office.com/)
