# Exercise - Manage app versions in Power Apps

Microsoft Power Apps can help if you accidentally save changes to an app or if something else goes wrong. For apps saved in the cloud, Power Apps maintains a version history. You can view each saved version and restore the app to a previous version if needed.

Restoring a version and publishing a version are separate actions. Users see only the published version of the app, regardless of the version currently being edited. Restoring a version makes it available for editing, but it doesn't automatically publish it.

## View versions of your app

1. From the Power Apps home page, select **Apps** from the left panel.
2. In the list of apps, select the **Commands** ellipsis (**...**) next to the app name and then select **Details**.
3. Select the **Versions** tab.

This tab lists all the versions saved during app development. You might see a version marked as **Live** in the **Published** column, indicating the version currently in use by users.

If the app hasn't been published, the top version is the one currently available for editing.

The list displays versions in descending order, with the highest version number at the top. This is the version you edit when you open the app. The highest version and the live version aren't always the same.

## Restore a previous version

1. Select the **More commands** ellipsis (**...**) next to the desired version and then select **Restore**.

   > **Note:** If the app hasn't yet been published, you may see the option to **Publish this version** instead of **Restore**. Both options enable you to edit the selected version.

2. A dialog appears to confirm that this version will be saved as a new version. For example, restoring Version 3 when five versions already exist will create a new entry, Version 6.
3. Select **Restore** to confirm.

   Power Apps creates a new version at the top of the list.

Restored versions are saved with a new, incremented version number. A restored version never overwrites an existing one.

To make the restored version available to users, you must publish it. If restoring a previous version fails, consider the following steps:

- Ensure the app isn't open in Power Apps Studio. An open app can't be restored.
- Confirm that the version isn't older than six months. Power Apps retains versions for six months.

> **Note:** Updates often improve an app, but significant changes can disrupt user workflows. Consider implementing a notification plan to inform users about major updates.
