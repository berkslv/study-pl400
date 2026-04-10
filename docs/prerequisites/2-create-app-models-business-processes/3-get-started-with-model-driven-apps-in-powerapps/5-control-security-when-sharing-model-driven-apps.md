# Exercise - Control security when sharing model-driven apps

- 15 minutes

To access a Dataverse table, a user must have an assigned security role. Assigning security roles controls who can access restricted or sensitive data in your model-driven app. Security roles define users' access to different types of records.

Every table must have a defined security role for access. Once you create and configure a security role, you can use that same role for multiple tables. A user can have multiple security roles, but every app user must have at least one assigned security role.

You can assign security roles to single users or to teams of users.

In this unit, you learn how to:

- Create a security role.
- Assign users to the security role.
- Share the app with users.

> **Note:** To share an app, you must have the Environment Admin or System Admin role.

## Scenario

This unit uses the example of a company named Contoso, which has a pet grooming business that services dogs and cats. An app that has a custom table for tracking the pet grooming business has already been created and published.

Two security roles are required, specific to the pet grooming app:

- **Pet grooming technicians** need to read, update, and attach other rows. Their security role has *read, write*, and *append* privileges.
- **Pet grooming schedulers** need all technician privileges plus the ability to create, append to, delete, and share rows. Their security role has *create, read, write, append, delete, assign, append to*, and *share* privileges.

## Security privilege reference

| Privilege | Description |
| --- | --- |
| Create | Required to make a new record. |
| Read | Required to open an existing record to view the contents. |
| Write | Required to make changes to a record. |
| Delete | Required to permanently remove a record. |
| Append | Required to associate the current record with another record. |
| Append to | Required to associate a record with the current record. |
| Assign | Required to give ownership of a record to another user. |
| Share | Required to give access to a record to another user while keeping your own access. |

## Create a security role

1. Sign into the [Power Platform admin center](https://admin.powerplatform.microsoft.com/) and select an environment.
2. Select **Settings** > **Users + permissions** > **Security roles**.
3. Select **+ New role** from the command bar.
4. In the **Create New Role** pane, enter:
   - **Role Name:** `Pet Grooming Technicians`
   - **Business unit:** [Pick one from the dropdown]
   - **Member's privilege inheritance:** Team privileges only
5. **Save** the role.
6. In the table search field, type `pet` to filter. Find and select your **Pet** table.
7. Change the **Read**, **Write**, and **Append** dropdowns from **None** to **Organization**.
8. Search for `account` and select the **Account** table. Change only the **Read** dropdown to **Organization**.
9. Select **Save + close**.
10. Select **+ New role** again.
11. Enter:
    - **Role Name:** `Pet Grooming Schedulers`
    - **Business unit:** [pick one from the dropdown]
    - **Member's privilege inheritance:** Team privileges only
12. **Save** the role.
13. Find the *Pet* table and change all dropdowns under *Create, Read, Write, Delete, Append, Append to, Assign*, and *Share* from **None** to **Organization**.
14. Find the **Account** table and change all dropdowns under *Create, Read, Write, Delete, Append, Append to, Assign, and Share* from **None** to **Organization**.
15. Select **Save + close**.

## Assign security roles to users

### Assign the Pet Grooming Technicians role

1. From the Power Platform admin center, select **Environments** and choose your environment.
2. Select **Settings** > **Users + permissions** > **Security roles**.
3. Search for **Pet Grooming Technicians**, select the role, then select **Members** from the command bar.
4. Select **+ Add people** from the command bar.
5. In the **Add people** panel, search for and select the users to add.
6. Select **Add**.

### Assign the Pet Grooming Schedulers role

1. Return to your list of **Security roles** and select **Pet Grooming Schedulers**.
2. Select **Members** from the command bar.
3. Select **+ Add people**, search for and select users, then select **Add**.

## Share the app with your users

1. Go to [make.powerapps.com](https://make.powerapps.com/).
2. Select **Apps** in the left side navigation, find and select your *Pet Grooming* app, and select the **Share** button from the command bar.
3. Add groups or users to share the app with. When sharing the app, assign a security role to enable app access.
4. Select **Share**.
