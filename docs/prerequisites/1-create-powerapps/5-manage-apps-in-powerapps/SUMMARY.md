# Summary: Managing Power Apps — Versions, Sharing, and Environments

> **Source files:** introduction.md, 1-manage-app-versions.md, 2-share-apps.md, 3-understand-environments.md, 4-review-powerapps.md, 5-knowledge-check.md

---

## App Version Management

- Power Apps maintains a version history every time you save a cloud-based app.
- Users always see the latest **published** version; the highest version number is the one currently open for editing.
- Restoring a version and publishing a version are **separate actions** — restoring does not auto-publish.
- Restored versions are saved as a new incremented version number; no existing version is overwritten (e.g., restoring Version 3 when 5 exist creates Version 6).
- A version marked **Live** in the **Published** column is the version currently in use by users.
- Power Apps retains versions for **six months**; versions older than six months cannot be restored.
- An app open in Power Apps Studio cannot be restored.

### View App Versions

1. From the Power Apps home page, select **Apps** from the left panel.
2. Select the **Commands** ellipsis (**...**) next to the app name → **Details**.
3. Select the **Versions** tab.

### Restore a Previous Version

1. Select the **More commands** ellipsis (**...**) next to the desired version → **Restore**.
   - If the app hasn't been published, the option may show **Publish this version** instead.
2. Confirm the dialog (a new version entry will be created).
3. Select **Restore**.
4. To make the restored version available to users, **publish it separately**.

> **Note:** Notify users before deploying significant updates, as major changes can disrupt their workflows.

---

## Sharing Apps

- Apps can be shared from within **Power Apps Studio** (via the **Share** button in the header ribbon) or from the **Apps** tab on the web.
- Only a **saved** app can be shared from Power Apps Studio.
- Sharing targets: specific users, Microsoft Entra security groups, or the entire organization (**Everyone in [Company Name]**).

### Permission Levels

| Level | Capabilities |
|---|---|
| **User** | Run the app only |
| **Co-owner** | Use, edit, and share the app; cannot delete it or change the owner |

- Security group behavior:
  - New members of the group automatically inherit the group's permission.
  - Members who leave the group lose access unless granted separately.
  - Individual permissions can override group permissions upward (e.g., a group **User** can be individually elevated to **Co-owner**), but not downward — group **Co-owner** takes precedence over individual **User**.
- Users see published updates automatically the **next time they open** the shared app.

### Permissions and Licensing Considerations

- Users and co-owners need access to any **data connections and gateways** used by the app.
- If the app uses **Microsoft Dataverse**, users must be assigned to appropriate security roles (create, read, write, delete).
- **Co-owners** require a Power Apps plan that allows app editing.
- Some data source permissions are granted implicitly; others must be explicitly configured.
- Creating **custom security roles** with precise permissions is recommended for Dataverse-connected apps.

---

## Environments

- An **environment** is a container for apps, data connections, flows (Power Automate), and other resources within a tenant.
- Environments are visible and manageable by **app creators and Power Apps admins** only — end users don't need to know which environment an app comes from.
- The current environment is shown in the upper-right corner of Power Apps Studio.
- Creating or managing environments requires a **Power Apps Per app** or **Power Apps Per user** plan.
- Working with **Dynamics 365 restricted tables** requires a **Power Apps for Dynamics 365** license.
- Environment creation requires at least **1 GB of available tenant capacity**.

### Reasons to Use Multiple Environments

- **Separate by department** — each department sees only its own apps and data.
- **Support ALM** — isolate development, testing, and production stages; trial environments enable pre-deployment feedback.
- **Manage data access** — each environment has its own data connections that cannot be shared across environments.

### Environment Types

| Type | Description |
|---|---|
| **Developer** | For individual creators with Developer Plan; includes premium features; no expiration while actively used |
| **Production** | For live apps, flows, and data; the Default environment is Production |
| **Trial** | Temporary, individual use; auto-expires after **30 days** |
| **Trial (subscription-based)** | Admin-assigned, multi-user; for department-wide PoC; has an extendable end date |
| **Sandbox** | Non-production Dataverse environment; isolated from production data; safe for testing |

### Create an Environment (Admin only)

1. In Power Apps maker portal → gear icon (**Settings**) → **Admin center** (opens Power Platform admin center), or go directly to https://admin.powerplatform.microsoft.com.
2. Select **Manage** → **Environments** → **+ New**.
3. Enter a name, select a region, and choose an environment type.
4. Toggle **Add a Dataverse data store** to **Yes** if Dataverse is needed (Developer environments include Dataverse by default).
5. Optionally, enable **Pay-as-you-go with Azure** (Production and Sandbox only) to link to an Azure subscription.
6. Use **Create on behalf** toggle to create a Developer environment for another user.
7. If Dataverse is added, select **Next** → configure **Language** and **Currency** (cannot be changed later); optionally enable sample apps/data → **Save**.
8. Without Dataverse, select **Save** directly. Database preparation may take several minutes.

> **Note:** Language and Currency for Dataverse environments are permanent and cannot be changed after creation.

### Manage Environment Access

Default roles:

| Role | Permissions |
|---|---|
| **System admin** | Full permissions to create and manage environments |
| **Environment maker** | View, create, and modify apps; work with Dataverse based on assigned permissions |

- Environment admins can create additional security roles and assign users.
- Users must be **enabled in Microsoft Entra ID**, have a **valid license**, and be in the **appropriate security group**.

### Assign a User Role in an Environment

1. Go to https://admin.powerplatform.microsoft.com.
2. Select **Manage** → **Environments** → choose the environment → **Settings**.
3. Expand **Users + permissions** → **Users** → **Add user**.
4. Enter the user's name or email → **Add**.
5. In the **Manage security roles** panel, select the desired role (e.g., **Environment Maker**) → **Save**.

---

## References

- [Microsoft Power Platform admin center](https://admin.powerplatform.microsoft.com)
