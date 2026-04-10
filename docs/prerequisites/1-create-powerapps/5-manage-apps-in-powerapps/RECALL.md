# Recall: Managing Power Apps — Versions, Sharing, and Environments

> **Source files:** introduction.md, 1-manage-app-versions.md, 2-share-apps.md, 3-understand-environments.md, 4-review-powerapps.md

---

## Keywords

| Term | Definition |
|------|-----------|
| Version history | A cloud-maintained log of every saved state of a Power Apps canvas app. |
| Restore | Action that creates a new incremented version from a prior version without overwriting existing ones. |
| Published version | The app version that users see; separate from the version currently open for editing. |
| Co-owner | Share permission allowing a user to use, edit, and share an app, but not delete it. |
| User (permission) | Share permission granting run-only access to a Power Apps app. |
| Microsoft Entra security group | A group used to share an app with many users; members inherit the group's permission level. |
| Environment | A tenant-level container that groups apps, data connections, and flows by purpose or audience. |
| Sandbox environment | A nonproduction Dataverse environment isolated from production data, used for safe testing. |
| Trial environment | A temporary environment that expires after 30 days, intended for individual exploration. |
| Environment Maker | A security role that can view, create, and modify apps within an environment. |
| System Admin | A security role with full permissions to create and manage environments. |
| Power Platform admin center | The web portal at admin.powerplatform.microsoft.com used to create and manage environments. |
| Application Lifecycle Management (ALM) | Practice of using separate environments (dev, test, production) to manage the app development pipeline. |

---

## Main Ideas

- Power Apps saves a version each time you save; only the **published** version is visible to users — restoring a version does not auto-publish it.
- Restoring a version always creates a **new, higher version number**; existing versions are never overwritten.
- Version restore fails if the app is open in Power Apps Studio or if the version is older than **six months**.
- Apps can be shared from Power Apps Studio (Share button) or the Apps tab in the maker portal.
- Sharing permissions: **Co-owner** can use, edit, and share (not delete/change owner); **User** can only run the app.
- Security group sharing: all current and new members inherit the group permission; higher individual permissions override the group's lower permission, but lower individual permissions do **not** override the group's higher permission.
- Co-owners require a **Power Apps plan** that supports app editing; users need access to all data connections and gateways the app uses.
- Environments are **tenant-level** containers; data connections are environment-specific and cannot be shared across environments.
- Environment types: **Developer** (no expiration, premium features, for creator), **Production** (default type), **Trial** (30-day expiry, individual), **Trial subscription-based** (multi-user, extendable), **Sandbox** (non-production Dataverse).
- Only **admins** (Environment Admin or Power Platform Admin role) can create environments; creation requires at least **1 GB** of available tenant capacity.
- Dataverse Language and Currency settings chosen at environment creation **cannot be changed later**.
- Developer environments include Dataverse by default; other types require toggling **Add a Dataverse data store** to Yes.

---

## Mini Quiz

### Q1 — Single Choice

A maker saves their app five times, then restores Version 2. No versions have been published yet.

What version number is assigned to the restored copy?

- A. 2
- B. 5
- C. 6
- D. 1

<details>
<summary>Answer</summary>

**Correct answer:** C. 6

**Explanation:** Restoring a version always creates a new, incremented version at the top of the list. Restoring Version 2 when five versions exist creates Version 6.

</details>

---

### Q2 — Fill-in-the-Blank

Users always see the ___ version of an app, regardless of which version is currently open for editing.

<details>
<summary>Answer</summary>

**Answer:** published

**Explanation:** Restoring a version makes it available for editing but does not automatically publish it; only the published version is visible to end users.

</details>

---

### Q3 — Single Choice

Security Group A is granted **User** access to an app. User B is a member of Group A but is individually granted **Co-owner** access.

What can User B do?

- A. Run the app only, because group permissions take precedence.
- B. Use, edit, and share the app, because the higher individual permission applies.
- C. Delete the app, because Co-owner grants full control.
- D. Nothing, because conflicting permissions revoke all access.

<details>
<summary>Answer</summary>

**Correct answer:** B. Use, edit, and share the app, because the higher individual permission applies.

**Explanation:** When an individual is granted a higher permission than their group, the higher permission applies. Co-owner allows use, edit, and share, but not deletion or ownership changes.

</details>

---

### Q4 — Fill-in-the-Blank

A version restore will fail if the app is open in ___ or if the version is older than ___.

<details>
<summary>Answer</summary>

**Answer:** Power Apps Studio; six months

**Explanation:** Power Apps retains version history for six months, and an app that is currently open in Power Apps Studio cannot be restored.

</details>

---

### Q5 — Single Choice

Which environment type is specifically designed for safe, isolated testing using Microsoft Dataverse without affecting production data?

- A. Trial
- B. Developer
- C. Sandbox
- D. Production

<details>
<summary>Answer</summary>

**Correct answer:** C. Sandbox

**Explanation:** A Sandbox environment is a nonproduction Dataverse environment isolated from production data, making it ideal for safe testing and development.

</details>

---

### Q6 — Single Choice

A Power Platform admin wants to create a new environment. Which minimum resource requirement must be met?

- A. At least 10 GB of available tenant capacity
- B. At least 1 GB of available tenant capacity
- C. A Dynamics 365 license
- D. An active Trial subscription

<details>
<summary>Answer</summary>

**Correct answer:** B. At least 1 GB of available tenant capacity

**Explanation:** Environment creation requires at least 1 GB of available tenant capacity; if insufficient, admins must free up space or purchase more.

</details>

---

### Q7 — Fill-in-the-Blank

When creating a Dataverse-enabled environment, the ___ and ___ settings cannot be changed after the environment is saved.

<details>
<summary>Answer</summary>

**Answer:** Language; Currency

**Explanation:** The Language and Currency chosen during Dataverse configuration at environment creation are permanent and cannot be modified afterward.

</details>

---
