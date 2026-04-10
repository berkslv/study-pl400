# Table characteristics

- 10 minutes

In Microsoft Dataverse, you create and edit tables by using the Power Apps maker portal. You don't need to use an external table editor; instead, you maintain tables and their properties directly through the user interface in the maker portal.

Before you create a table in Dataverse, it's important to understand the table capabilities and configuration options available.

## Table properties

Tables are the key building blocks of Microsoft Dataverse. In Dataverse, a table is more than just a database table with columns and relationships. A Dataverse table includes additional components that support app development and process automation. Tables in Dataverse include the following properties:

- **Name**: The simple name that defines your table, such as *Pets*
- **Rows**: Individual records in your data (such as a cat named *Ashley*)
- **Columns**: Metadata that defines each record (such as pet *Species* and *Breed*)
- **Relationships**: Define links to other tables (such as a pet belonging to an owner)
- **Keys**: Columns that uniquely identify each row (such as an ID number)
- **Forms**: Used by model-driven apps to view and edit table rows
- **Views**: Define how rows and columns are displayed
- **Charts**: Visualize table data
- **Dashboards**: Provide visual summaries of data using charts and filters
- **Business rules**: Apply logic to table columns
- **Metadata**: Table-level settings that affect how apps and flows interact with the table
- **Commands**: Custom buttons added to model-driven app command bars

## Row keys

All database tables require a **primary key** to uniquely identify rows. In Dataverse, this key is a Globally Unique Identifier (GUID), such as *123e4567-e89b-12d3-a456-426655440000*. Dataverse automatically generates the GUID when a new row is created.

To improve usability, each table also includes a **primary column**—a readable text field used to represent rows in apps and flows. By default, this column is labeled *Name*.

> **Note**: When integrating with external systems, the GUID is often not known. In such cases, you can define an alternate key.

## Create a table in Dataverse

To create a Dataverse table, select **Tables** in the left-hand navigation of the Power Apps maker portal, then select the **New table** dropdown from the command bar, and choose **Create new tables**.

### Start with Copilot

Describe the data, columns, rows, or scenario using everyday language. Copilot will generate the table structure and open the editor for further changes.

### Start from a blank table

- **Add columns and data**: Manually define columns and enter data rows.
- **Describe the new table**: Use the Copilot side pane to describe your needs, and Copilot builds the table accordingly.

### Import a SharePoint list

Enter a SharePoint site URL or choose from recently used sites. Then select your list to import. You can edit and finalize the table in the Create new tables editor.

### Import an Excel file or .CSV

Use Excel or CSV files to populate a table. If Copilot is enabled, AI assists in generating the table structure.

### Set advanced properties

To use advanced options, go to the **Home** page, select **Tables**, then select **+ New table** and choose **Table (advanced properties)**.

The *Properties* tab includes:

- **Display name**: For example, *Pet*
- **Plural name**: Auto-filled as *Pets*, but you can modify it
- **Description**: Internal use only
- **Enable attachments**: Option to allow file uploads to rows

The *Primary column* tab includes:

- **Display name**: Defaults to *Name*, editable to values like *Pet name*
- **Description**: Internal note
- **Schema name**: Internal system name, auto-generated from the Display name (editable before creation)
- **Column requirement**: Default is *Business required*
- **Maximum character count**: Default is 100; adjustable

### Advanced options

In the *Properties* tab, select **Advanced options** to expose more settings.

Key options:

- **Schema name**: Internal system name; must be set before creation and can't include spaces
- **Type**: Options include *Standard*, *Activity*, *Virtual*, or *Elastic*
- **Record ownership**: Options include *User or Team* or *Organization*

> **Important**: The following settings can't be changed after creation:
> - Schema name
> - Table type
> - Table ownership

> **Best practice**: Create tables inside a Dataverse solution so they inherit the solution's publisher prefix.

### Create a virtual table

Virtual tables enable CRUD operations on external data sources. To create one, return to **Tables**, select **+ New table**, and then choose **Create a virtual table**.

## Table types

Dataverse supports several types of custom tables:

- **Standard**: Default table type for most use cases
- **Activity**: Used for records with time-bound interactions (e.g., tasks, calls)
- **Virtual**: External data presented as if native to Dataverse
- **Elastic**: High-scale tables powered by Azure Cosmos DB, suitable for datasets with tens of millions of rows

> **Note**: Table types are set during creation and can't be changed later.

## Table ownership

Choose from *User or team owned* or *Organization-owned*. Ownership affects how permissions and data access are handled.

- **User or team owned**: Row-level permissions are user-specific
- **Organization-owned**: Access is controlled at the organization level

> **Note**: Table ownership is fixed once the table is created.

## When to use standard tables, and when to create new tables

Microsoft Dataverse includes standard tables to support business scenarios. These come with predefined metadata and system behavior. Whenever possible, reuse standard tables to ensure compatibility and reduce configuration overhead.

Minor modifications often don't require custom tables:

- You can rename columns for clarity without creating new tables
- Standard tables can't be deleted, but you can hide them by modifying security role permissions

If standard tables can't meet your needs through customization, consider creating a custom table, column, or relationship.
