# Quiz: Managing Power Apps — Versions, Sharing, and Environments

> **Source material:** introduction.md, 1-manage-app-versions.md, 2-share-apps.md, 3-understand-environments.md, 4-review-powerapps.md, 5-knowledge-check.md, 6-summary.md
> **Total questions:** 22
> **Question types:** Multiple choice (single), Multiple choice (multi-select), Fill-in-the-blank

---

## Questions

### Question 1 — Single Choice

You save Version 5 of your Power Apps canvas app and want users to immediately see your changes. You then restore the app to Version 3. What additional step must you take before users can see the restored version?

- A. Publish the restored version
- B. Delete the current live version
- C. Notify all users to reinstall the app
- D. Reopen the app in Power Apps Studio

<details>
<summary>Answer</summary>

**Correct answer:** A. Publish the restored version

**Explanation:** Restoring a version and publishing are separate actions. Users see only the published version of the app, regardless of the version currently being edited. After restoring, you must publish the version to make it available to users.

</details>

---

### Question 2 — Single Choice

Your team has five saved versions of a canvas app. You decide to restore Version 2. What version number will the restored copy be assigned in the version list?

- A. Version 2, replacing the original in-place
- B. Version 4, using the next available number
- C. Version 6, created as a new incremented version at the top
- D. Version 1, rolling the app back to its original state

<details>
<summary>Answer</summary>

**Correct answer:** C. Version 6, created as a new incremented version at the top

**Explanation:** Restored versions are saved with a new, incremented version number and never overwrite an existing one. Restoring Version 2 when five versions already exist creates a new entry — Version 6 — at the top of the list.

</details>

---

### Question 3 — Multi-Select

A maker wants to share a Power Apps canvas app with colleagues. From which two locations can they initiate the Share action? (Select **two**.)

- A. From the Power Apps Mobile app settings
- B. From Power Apps Studio while editing the app
- C. From the Power Platform admin center Environments page
- D. From the Apps tab on the Power Apps web page
- E. From the Microsoft Teams admin center

<details>
<summary>Answer</summary>

**Correct answer:** B. From Power Apps Studio while editing the app, D. From the Apps tab on the Power Apps web page

**Explanation:** You can share an app from within Power Apps Studio by selecting **Share** in the upper-right corner of the header ribbon, or from the **Apps** tab on the web page by selecting the app and then choosing **Share** from the command ribbon.

</details>

---

### Question 4 — Fill-in-the-Blank

Power Apps retains saved versions of an app for ___ months. Versions older than this period cannot be restored.

<details>
<summary>Answer</summary>

**Answer:** six (6)

**Explanation:** The source material explicitly states that you should confirm a version isn't older than six months, as Power Apps retains versions for six months. Attempting to restore a version beyond this limit will fail.

</details>

---

### Question 5 — Single Choice

A developer opens the **Versions** tab for her canvas app and reviews the version list. How are the versions displayed?

- A. In ascending order, with the oldest version at the top
- B. Alphabetically by version name
- C. In descending order, with the highest version number at the top
- D. In the order they were published, regardless of version number

<details>
<summary>Answer</summary>

**Correct answer:** C. In descending order, with the highest version number at the top

**Explanation:** The versions list displays versions in descending order with the highest version number at the top. The highest version is the one you edit when you open the app, though it is not always the same as the live (published) version.

</details>

---

### Question 6 — Single Choice

You attempt to restore a previous version of your canvas app, but the restore operation fails. Which of the following is a likely reason for the failure?

- A. The version was created in a different environment
- B. The app is currently open in Power Apps Studio
- C. The app has more than ten versions saved
- D. The app is shared with Co-owners who have not approved the restore

<details>
<summary>Answer</summary>

**Correct answer:** B. The app is currently open in Power Apps Studio

**Explanation:** An app cannot be restored while it is open in Power Apps Studio. The source material specifically lists this as a troubleshooting step: ensure the app isn't open in Power Apps Studio before attempting to restore.

</details>

---

### Question 7 — Single Choice

You share a canvas app with a colleague named Alex. You want Alex to be able to run the app but not edit or share it with others. Which permission level should you assign?

- A. Owner
- B. Editor
- C. Co-owner
- D. User

<details>
<summary>Answer</summary>

**Correct answer:** D. User

**Explanation:** The **User** permission level allows a person to run (use) the app only. The **Co-owner** level allows a person to use, edit, and share the app. There are only two permission levels available when sharing: User and Co-owner.

</details>

---

### Question 8 — Single Choice

A Power Apps Co-owner tries to delete a canvas app they have been maintaining. Which statement correctly describes their delete permissions?

- A. Co-owners can delete an app but cannot change the owner
- B. Co-owners can use, edit, share, and delete the app
- C. Co-owners can use, edit, and share the app, but cannot delete it or change the owner
- D. Co-owners have read-only access unless the owner grants explicit delete permission

<details>
<summary>Answer</summary>

**Correct answer:** C. Co-owners can use, edit, and share the app, but cannot delete it or change the owner

**Explanation:** The Co-owner permission level grants the ability to use, edit, and share the app. However, Co-owners cannot delete the app or change who the owner is — those actions are reserved for the owner.

</details>

---

### Question 9 — Single Choice

Your organization shares a canvas app with a Microsoft Entra security group called "Sales Team." A member of the group, Jordan, leaves the group. What happens to Jordan's access to the app?

- A. Jordan retains access because permissions granted through a group persist after leaving
- B. Jordan loses access unless granted access separately or through another group
- C. Jordan is automatically downgraded to User access
- D. Jordan must submit a new access request through Power Apps

<details>
<summary>Answer</summary>

**Correct answer:** B. Jordan loses access unless granted access separately or through another group

**Explanation:** Members who leave a security group lose access to the app unless they are separately granted access or belong to another group that has been granted access. This is the expected behavior when using security group sharing.

</details>

---

### Question 10 — Multi-Select

An admin is planning to create additional environments in her organization's Power Platform tenant. Which three of the following are valid reasons to create additional environments? (Select **three**.)

- A. Separate app development by department so employees see only relevant apps and data
- B. Reduce the number of Power Apps licenses required per user
- C. Support application lifecycle management (ALM) with distinct development, testing, and production stages
- D. Increase the storage capacity allocated to individual apps
- E. Manage data access by creating environment-specific data connections that cannot be shared across environments
- F. Allow unlicensed users to run apps in an isolated space

<details>
<summary>Answer</summary>

**Correct answer:** A. Separate app development by department, C. Support application lifecycle management (ALM), E. Manage data access

**Explanation:** The three documented reasons for creating additional environments are: separating app development by department, supporting ALM with isolated development stages, and managing data access through environment-specific connections. Environments do not reduce licensing requirements or increase individual app storage.

</details>

---

### Question 11 — Single Choice

Security Group A is shared with **Co-owner** access on a canvas app. User B is a member of Security Group A but has been individually assigned **User** access to the same app. What is User B's effective access level?

- A. User access — individual assignments always take precedence over group assignments
- B. Co-owner access — the higher permission from the group takes effect
- C. No access — conflicting permissions result in an access denial
- D. Read-only access — mixed permissions default to the lowest level

<details>
<summary>Answer</summary>

**Correct answer:** B. Co-owner access — the higher permission from the group takes effect

**Explanation:** When a security group is granted Co-owner access and an individual member is assigned User access, the member can still edit the app. The source material explicitly states this scenario: "if Security Group A is granted Co-owner access, but User B is assigned User access individually, User B can still edit the app."

</details>

---

### Question 12 — Fill-in-the-Blank

To manage environments in Microsoft Power Platform, administrators navigate to the Power Platform admin center at the URL ___.

<details>
<summary>Answer</summary>

**Answer:** https://admin.powerplatform.microsoft.com

**Explanation:** The Power Platform admin center is the dedicated management portal for environments, security, and capacity. Admins can also reach it by selecting the gear (Settings) icon in the Power Apps maker portal and choosing **Admin center**.

</details>

---

### Question 13 — Single Choice

A new maker asks what an environment is in the context of Power Apps. Which of the following best describes an environment?

- A. A version of an app that is ready for deployment to production
- B. A container for apps and other resources such as data connections and flows
- C. A security group used to manage app sharing permissions across a tenant
- D. A development workspace within Power Apps Studio for a single app project

<details>
<summary>Answer</summary>

**Correct answer:** B. A container for apps and other resources such as data connections and flows

**Explanation:** An environment is a container for apps and other resources, such as data connections and flows from Microsoft Power Automate. It is a way for an organization to group items based on business requirements.

</details>

---

### Question 14 — Single Choice

A Power Apps maker asks which role is authorized to create a new environment in the Power Platform admin center. What is the correct answer?

- A. Any Power Apps user who has a per-app plan
- B. Only Microsoft support engineers upon request
- C. Only an admin
- D. Any user with Co-owner access to at least one published app

<details>
<summary>Answer</summary>

**Correct answer:** C. Only an admin

**Explanation:** Only an admin can create environments. The source material notes that if you are not an admin, you should discuss environment setup with one, as non-admin makers cannot create new environments on their own.

</details>

---

### Question 15 — Single Choice

Your organization needs a temporary environment for individual testing and exploration of Power Platform features. The environment must automatically expire after a set period. Which environment type should you select?

- A. Developer
- B. Sandbox
- C. Trial
- D. Production

<details>
<summary>Answer</summary>

**Correct answer:** C. Trial

**Explanation:** A Trial environment supports temporary development and exploration of Microsoft Power Platform features. It is designed for individual use and automatically expires after 30 days, making it ideal for short-term testing.

</details>

---

### Question 16 — Multi-Select

When creating a new environment in the Power Platform admin center, which three environment types allow you to optionally add a Dataverse data store? (Select **three**.)

- A. Developer
- B. Trial
- C. Sandbox
- D. Production
- E. Default

<details>
<summary>Answer</summary>

**Correct answer:** B. Trial, C. Sandbox, D. Production

**Explanation:** The source material states: "You can optionally add Dataverse to Trial, Sandbox, or Production environments." Developer environments include Dataverse by default and do not require an optional toggle to enable it.

</details>

---

### Question 17 — Single Choice

How long does a standard (non-subscription-based) Trial environment automatically remain active before it expires?

- A. 7 days
- B. 14 days
- C. 30 days
- D. 90 days

<details>
<summary>Answer</summary>

**Correct answer:** C. 30 days

**Explanation:** A Trial environment is designed for individual use and automatically expires after 30 days. The subscription-based Trial variant has a different end date that admins can extend, and it supports multiuser scenarios.

</details>

---

### Question 18 — Fill-in-the-Blank

When configuring Dataverse during environment creation, you must choose a ___ and a ___ for the database. These selections cannot be changed after the environment is saved.

<details>
<summary>Answer</summary>

**Answer:** Language; Currency

**Explanation:** In the **Add Dataverse** panel during environment creation, you select a Language and Currency for the Dataverse database. These are permanent settings — they cannot be changed after the environment has been created.

</details>

---

### Question 19 — Single Choice

A developer wants a personal Power Apps environment for building apps with access to premium features. The environment should not expire as long as it is actively used. Which environment type is the best fit?

- A. Trial
- B. Production
- C. Developer
- D. Sandbox

<details>
<summary>Answer</summary>

**Correct answer:** C. Developer

**Explanation:** Developer environments are created by users with a Developer Plan license, are intended for the individual creator, include access to premium features, and remain available without expiration as long as the user actively uses the environment.

</details>

---

### Question 20 — Multi-Select

By default, Power Apps provides two security roles for managing access to an environment. Which two roles are available out of the box? (Select **two**.)

- A. Global Administrator
- B. System Admin
- C. Power Apps User
- D. Environment Maker
- E. Co-owner

<details>
<summary>Answer</summary>

**Correct answer:** B. System Admin, D. Environment Maker

**Explanation:** By default, two roles are available for managing environment access: **System Admin**, which provides full permissions to create and manage environments, and **Environment Maker**, which allows users to view, create, and modify apps and work with Dataverse based on assigned permissions.

</details>

---

### Question 21 — Single Choice

An admin attempts to create a new Power Apps environment but encounters an error preventing creation. What is the minimum amount of available tenant storage capacity required to create a new environment?

- A. 512 MB
- B. 1 GB
- C. 5 GB
- D. 10 GB

<details>
<summary>Answer</summary>

**Correct answer:** B. 1 GB

**Explanation:** Environment creation requires at least 1 GB of available tenant capacity. If the required capacity is not available, the admin must either free up existing space or purchase additional capacity before creating a new environment.

</details>

---

### Question 22 — Fill-in-the-Blank

Environments are available only to app ___ and Power Apps ___. Regular users who run apps do not need to know which environment the app came from, as long as they have the correct permissions.

<details>
<summary>Answer</summary>

**Answer:** creators (makers); admins

**Explanation:** The source material states: "Environments are available only to app creators and Power Apps admins." End users simply run the app without needing awareness of the underlying environment, provided they have the appropriate access permissions.

</details>
