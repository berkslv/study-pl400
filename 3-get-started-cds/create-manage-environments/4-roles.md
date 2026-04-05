# Add Users and Roles Within an Environment

After you have created an environment, users from Microsoft Entra ID that are associated with your tenant and have a selected security role are automatically added to the environment.

> **Tip:** It might take several hours to add all users if you have a large number of them.

User security roles control a user's access to data through a set of access levels and permissions. The combination of access levels and permissions that are included in a security role sets limits on the user's view of and interactions with that data.

Security roles can also be associated with a Microsoft Entra ID group. It's recommended to create Microsoft Entra ID groups and associate roles with those security groups to simplify permissions and data access.

> **Tip:** The user security roles control run-time access to data and are separate from the environment roles that govern system administrators and environment makers. The two environment roles built into every environment are **System Administrator** and **Environment Maker**. All other roles are user security roles.

## Add a User to an Environment

1. Sign in to the [Power Platform admin center](https://admin.powerplatform.microsoft.com/).
2. Select the environment you want to administer.
3. In the **Access** pane, select **See all** under **Users** to verify or add users.
4. Select **Add user** and enter the user's name or email address.
5. Once you have a user in the entry field, select **Add**, wait for confirmation, then select at least one security role for the new user and select **Save**.
6. Refresh the **Users** screen by selecting **Refresh** in the command bar.
7. Select the user's name, then select the **Manage Roles** link at the bottom of the **Roles** pane to adjust roles.
8. Select the desired role (e.g., **System Administrator**) and select **Save**.

## Create a Custom Security Role

If you need a custom security role, use the following steps:

1. Sign in to the [Power Platform admin center](https://admin.powerplatform.microsoft.com/).
2. Select the environment.
3. In the **Access** section, select **See all** under **Security Roles**.
4. Select **New role** at the top left of the command ribbon.
5. In the **Create New Role** pane, add a **Role Name**, select a **Business unit**, then select **Save**. This creates a role with minimum permissions.
6. The permissions screen appears with a list of tables. Customize permissions for each table by adjusting **Create**, **Read**, **Write**, **Delete**, **Append**, **Append to**, **Assign**, and **Share** settings.
7. Select **Save and close** when done.

You can edit or modify any of your existing security roles by selecting the role from the **Security Roles** list to bring up the permissions screen.
