# Dataverse logic and security

- 6 minutes

Microsoft Dataverse is more than a data store. It includes features to apply business logic and manage secure access to data.

Tables in Dataverse can use rich server-side logic and validation to ensure data quality. This helps reduce redundant code in apps that create or consume table data.

- **Business rules**: Validate data across multiple columns in a table and display warning or error messages, regardless of the app used to enter the data.
- **Business process flows**: Guide users to enter data consistently and follow a standardized process. Currently supported only in model-driven apps.
- **Real-time workflows**: Automate business processes without requiring user interaction.
- **Business logic with code**: Support advanced developer scenarios by extending application behavior through custom code.

## Business rules

Use business rules in common scenarios when creating or updating table rows:

- Set values for columns.
- Perform calculations.
- Validate inputs.
- Enforce data entry requirements.
- Prompt users for input.

Business rules reduce the need for code such as JavaScript in model-driven app forms. They're a key low-code capability in Dataverse.

Business rules are created using a declarative, drag-and-drop interface. The designer allows you to define conditions and the actions triggered when those conditions are met.

Create and manage business rules in the Power Apps maker portal. Rules are defined at the table level and applied based on the rule's *Scope* setting:

- **Individual form**: Applies only to the specified model-driven app form.
- **All forms**: Applies to all model-driven app forms.
- **Entity**: Applies to all model-driven app forms and to create/update operations on the table. This is the default scope.

### Actions

Use combinations of conditions and actions to:

- Set or clear column values.
- Change column requirement levels.
- Show or hide columns.
- Enable or disable columns.
- Validate input and display error messages.
- Create business recommendations based on business intelligence.

### Differences between canvas and model-driven apps

Business rules defined at the table level apply to both canvas apps and model-driven apps that use the table.

Model-driven apps support all business rule actions. Some actions aren't available in canvas apps:

- Show or hide columns.
- Enable or disable columns.
- Create business recommendations.

## Dataverse security

Microsoft Dataverse includes a comprehensive security model that controls access to environments, tables, table rows, and features such as data import/export.

Data is securely stored so users can only view or interact with it if granted access. Dataverse uses role-based access control (RBAC) to manage access. Security roles are collections of privileges and access levels. Rather than assigning individual privileges, assign users one or more roles. This simplifies access management.

> **Note**: Users must be assigned at least one security role to access Dataverse and run apps.

You can assign a standard security role such as:

- **System Administrator**: Full permissions to customize and manage the environment.
- **Environment Maker**: Can create apps, flows, and connections in the environment.
- **Basic user**: Can use apps and perform standard operations on built-in tables like **Account** and **Contact**.

However, it's recommended to create **custom** roles for apps you build to provide only the required privileges. Standard roles can't be customized. You can only modify custom roles.

Manage security roles in the Power Platform admin center. Select the environment, go to **Settings**, expand **Users + permissions**, and select **Security roles**.

Within a **custom** role, set access levels for each privilege per table to control full access, read-only, or no access at all.
