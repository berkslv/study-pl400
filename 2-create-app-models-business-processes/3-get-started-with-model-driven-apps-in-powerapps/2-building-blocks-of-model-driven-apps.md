# Components of model-driven apps

- 8 minutes

A well designed model-driven app consists of several components that you select to build the appearance and functionality of the finished app. The components and component properties that makers use to create an app become the app's metadata.

To understand how each of these components relates to app design, we can categorize them as **data**, **user interface (UI)**, **logic**, and **visualization** components.

## Data components

Use these components to define what data is used to build the app.

Within an environment, you can design data components at either a table-level or within a solution. See the descriptions in the table below of each type.

| Component | Description | Designer |
| --- | --- | --- |
| Table | A table contains records with properties that you track, such as the contact table or account table. Many standard tables are available in Dataverse, and some of these can be customized. Or you can create a custom table from scratch. | Power Apps table designer |
| Column | A column is a property that is associated with a table. For example, in the contact table, email address is a column. Each column has a defined data type (text, number, date and time, currency, or lookup). | Power Apps table designer |
| Relationship | Table relationships define how tables are related to each other. There are 1:N (one-to-many), N:1 (many-to-one), and N:N (many-to-many) types of relationships. Adding a lookup column to a table creates a new 1:N relationship between the two tables. | Power Apps table designer |
| Choice column | A special type of column that provides the app user a set of predetermined options. Each option has a system-assigned value and label. There are two kinds: **choices** (single selection) and **multi-select choices** (allow more than one selection). | Power Apps option set designer |

## UI components

These components determine how users will interact with the app.

| Component | Description | Designer |
| --- | --- | --- |
| App | The app includes fundamental settings, such as components, properties, client type, and the URL for your app. | App designer |
| Site map | The site map specifies the navigation for your app. | Site map designer |
| Form | A form is a defined set of data-entry columns for a given table. | Form designer |
| View | Views define how a list of records for a specific table appears in your app. A view defines the columns shown, the width of each column, the sort behavior, and the default filters. | View designer |
| Custom page (preview) | A canvas app-based page allowing a more flexible layout, low-code Fx functions, and Power Apps connector data. | Canvas designer |

## Logic components

These components define the business processes, rules, and automations the app will have.

| Type of logic | Description | Designer |
| --- | --- | --- |
| Business process flow | An online process that walks users step-by-step through a standard business process. | Business process flow designer |
| Workflow | Workflows automate business processes. Designers use workflows to trigger automations manually, at specific intervals, or automatically based on certain events. | Workflow designer |
| Actions | Actions let you manually invoke actions, including custom actions, directly from a workflow, plugin, custom button, or code. | Process designer |
| Business rule | Business rules are used to apply logic to a form, such as to set column requirements, hide columns, or validate data. | Business rule designer |
| Power Automate Flow | A cloud-based service that lets you create automated workflows between apps and services to get notifications, sync files, collect data, and more. | Power Automate |

## Visualizations

Determines what type of data visualizations and reporting the app will have available.

| Component | Description | Designer |
| --- | --- | --- |
| Chart | A single graphic visualization (such as a bar or pie chart) that can be displayed within a view, on a form, or be added to a dashboard. | Chart designer |
| Dashboard | A palette for one or more graphic visualizations that provide an overview of actionable business data. | Dashboard designer |
| Embedded Power BI | Embedded Power BI tiles and dashboards can be added to your app. Power BI is a cloud-based service that provides business intelligence insight. | Combination of chart designer, dashboard designer, and Power BI |
