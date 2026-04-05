# Environment Operations

You can perform operations on environments after they are created in the Power Platform admin center or with the Power Apps PowerShell cmdlets.

Available operations:

- Convert an environment type.
- Delete an environment.
- Recover an environment.
- Reset an environment.
- Copy an environment.
- Back up an environment.
- Restore an environment.
- Place an environment in Administration mode.

> **Note:** Not all operations apply to every environment type.

## Change the Environment Type

You can change the environment from:

- Production to sandbox.
- Sandbox to production.
- Trial to production.

## Add a Microsoft Dataverse Datastore

If you create an environment without a Dataverse datastore, you can later add one.

## Delete an Environment

You can delete an environment to recover storage space and to remove personal data.

## Recover an Environment

You can recover a recently deleted environment within **seven days** of deletion.

## Reset an Environment

You can reset a sandbox environment to delete and re-provision it. Consider a reset when you want to:

- Create a new project.
- Free up storage space.
- Remove an environment containing personal data.

> **Note:** You cannot reset a production environment.

## Copy an Environment

You can copy data between environments at two levels:

- **Everything**
- **Customizations and schemas only**

Restrictions on copy operations:

- You can only copy to an environment in the same tenant and region.
- You can't copy to a production environment.
- Components not added to a solution (canvas apps, flows, custom connectors, connections) might not be included.
- You can't copy from or to a default or trial type environment.
- Copy and restore operations can take up to 8 hours, or up to 24 hours if large amounts of data (including audit data) are involved.

## Backup Environment

### System Backups

System backups occur continuously and aren't counted towards capacity.

- Production environments with Dynamics 365 applications enabled: backups stored up to **28 days**.
- Environments without Dynamics 365 applications: default retention is **7 days**; managed environment admins can extend to 7, 14, 21, or 28 days using PowerShell.
- All environments except Trial environments are backed up.

### Manual Backups

- A backup is created automatically when Microsoft updates your environment.
- You can back up production and sandbox environments.
- You can back up developer environments.
- You can't back up the default environment.
- Sandbox and developer backups are retained for up to **7 days**.
- Manual backups for production environments with Dataverse and Dynamics 365 apps enabled are retained up to **28 days**.

## Restore an Environment

You can restore an environment from a backup.

> **Important:** To restore to a production environment, you must first change its type to sandbox.

## Administration Mode

You can set a sandbox, production, or trial (subscription-based) environment in administration mode so that only users with **System Administrator** or **System Customizer** security roles are able to sign in to that environment.

Administration mode is useful when you want to make operational changes without affecting end users. You can optionally disable background operations such as asynchronous operations, including Dataverse workflows and email server-side synchronization.

## Environment History

Environment history can be found by selecting an environment and clicking the **History** tab in the command bar. It shows a timeline of the full environment lifecycle including all actions performed, such as Edit, Copy, Reset, etc.

History entries include:

- **Action name**: e.g., create
- **Start time**
- **End time**: if applicable
- **Initiated by**: the user
- **Status**: e.g., succeeded or failed
