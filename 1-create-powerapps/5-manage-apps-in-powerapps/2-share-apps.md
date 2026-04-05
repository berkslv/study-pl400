# Exercise - Share apps in Power Apps

You can share an app with specific users, groups, or your entire organization. When you share an app, others can run it in a browser or in Microsoft Power Apps Mobile for Windows, iOS, or Android.

You can also grant someone permission to update and share the app. This unit explains how to share an app.

## Prepare to share an app

There are two ways to share an app: from within Power Apps Studio while editing, or from the **Apps** tab on the web page.

1. To share an app while editing in Power Apps Studio, select **Share** from the upper-right corner of the header ribbon. (Note: You can only share an app that has been saved.)

   Alternatively, from the **Apps** tab, select the app and then select **Share** from the command ribbon.

   After selecting either option, a **Share** pop-up appears with the app's name.

2. In the **Share** window, specify the users or groups to share the app with. To share with your entire organization, type **Everyone** and select **Everyone in [Company Name]**. For large groups, use a Microsoft Entra security group.

   > **Note - Security group considerations:**
   > - If you share an app with a security group, both current members and new members automatically receive the specified permission. Members who leave the group lose access unless granted separately or through another group.
   > - All members inherit the group's app permission. However, you can assign higher permissions to individual members. For example, if Security Group A has **User** access, but User B (a group member) is given **Co-owner** access, User B can also edit the app. Conversely, if Security Group A is granted **Co-owner** access, but User B is assigned **User** access individually, User B can still edit the app.

3. Use the drop-down next to the eye icon (beside each user or group entry) to select the access level:
   - **Co-owner** – Can use, edit, and share the app, but can't delete it or change the owner.
   - **User** – Can use the app only.

4. Optionally, add a message to customize the email that users receive with access and a link to the app.
5. When the configuration is complete, select **Share**. Power Apps applies the changes automatically.

Users will see published updates to a shared app the next time they open it.

## Permissions and licensing

When sharing your app, keep the following in mind regarding permissions and licensing:

- Users and contributors need access to any data connections and gateways used by the app. Some permissions are granted implicitly, but others must be explicitly configured. If the app uses Microsoft Dataverse, ensure users have the correct permissions for relevant tables. Assign users to security roles that match the required create, read, write, or delete actions. Creating custom roles with precise permissions is often recommended.
- Users with **Co-owner** permission also require a Power Apps plan that allows app editing.

Sharing an app is a key way to make it accessible across your organization.
