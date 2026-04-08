# Quiz: Get Started with Power Automate

> **Source material:** 1-introduction.md, 2-create-first-flow.md, 3-flow-scheduled-flows.md, 4-flow-monitor-incoming-emails.md, 5-flow-share-flows.md, 6-troubleshoot-flows.md, 7-knowledge-check.md, 8-summary-cleanup.md
> **Total questions:** 25
> **Question types:** Multiple choice (single), Multiple choice (multi-select), Fill-in-the-blank

---

## Questions

### Question 1 — Single Choice

Your organization wants to automate posting a message to a Microsoft Teams channel each time an issue is created in an external planning tool. Which Microsoft product provides this type of cross-service workflow automation?

- A. Microsoft Power BI
- B. Microsoft Power Apps
- C. Power Automate
- D. Microsoft Dataverse

<details>
<summary>Answer</summary>

**Correct answer:** C. Power Automate

**Explanation:** Power Automate is an online workflow service that automates actions across the most common apps and services, including posting messages to Microsoft Teams when events occur in other services like Jira.

</details>

---

### Question 2 — Single Choice

A developer needs to understand the two main structural parts of every Power Automate flow before building one from scratch. Which statement correctly describes both parts?

- A. A condition and one or more loops
- B. A trigger and one or more actions
- C. A connector and one or more conditions
- D. A schedule and one or more triggers

<details>
<summary>Answer</summary>

**Correct answer:** B. A trigger and one or more actions

**Explanation:** Every Power Automate flow has two main parts: a trigger (the starting event) and one or more actions (what happens when the trigger is invoked).

</details>

---

### Question 3 — Single Choice

A team member wants to create a flow that runs every day at 10:00 a.m. to send emails from an Excel workbook. Which trigger type should they use?

- A. Automated cloud flow trigger
- B. Instant cloud flow trigger
- C. When a new email arrives (V3) trigger
- D. Recurrence (Schedule) trigger

<details>
<summary>Answer</summary>

**Correct answer:** D. Recurrence (Schedule) trigger

**Explanation:** The Recurrence trigger (also referred to as the Schedule trigger) is used to build pre-scheduled flows that run at defined intervals such as daily. You set the frequency to "Day" and the interval to 1 to run daily.

</details>

---

### Question 4 — Single Choice

You are building a scheduled flow using Copilot in Power Automate. After Copilot generates the flow and its actions, what should you do before accepting the result?

- A. Immediately save and test the flow without reviewing it.
- B. Delete all Copilot-generated actions and rebuild them manually.
- C. Review the generated actions and, if incorrect, refine the prompt in the top box, then select Next.
- D. Publish the flow to production to verify Copilot's accuracy.

<details>
<summary>Answer</summary>

**Correct answer:** C. Review the generated actions and, if incorrect, refine the prompt in the top box, then select Next.

**Explanation:** After Copilot generates a flow, you should review the actions it created. If they are incorrect, you can refine the flow by updating your description in the input box before selecting Next.

</details>

---

### Question 5 — Single Choice

A flow is configured to monitor an Outlook inbox and save email attachments to SharePoint. When the **Attachments Name** dynamic content is added to the **Create file** action's File Name field, what automatically happens to the action?

- A. The action is moved outside the flow entirely.
- B. The action is converted into a condition.
- C. The action is automatically wrapped inside an **Apply to each** loop.
- D. The flow stops running after the first attachment is saved.

<details>
<summary>Answer</summary>

**Correct answer:** C. The action is automatically wrapped inside an **Apply to each** loop.

**Explanation:** Once Attachments Name is added to the Create file action, Power Automate automatically wraps the action in an Apply to each loop so the flow processes each attachment individually when multiple attachments are present.

</details>

---

### Question 6 — Single Choice

You want to build a flow that monitors your Outlook inbox and saves attachments to SharePoint only when an email contains a specific subject line and has attachments. Which trigger should you use?

- A. Recurrence
- B. When a new email arrives (V3)
- C. When a file is created in SharePoint
- D. When an item is created in Microsoft Lists

<details>
<summary>Answer</summary>

**Correct answer:** B. When a new email arrives (V3)

**Explanation:** The "When a new email arrives (V3)" trigger from Outlook allows you to filter by subject, sender, importance, and whether attachments are present, making it the correct choice for this scenario.

</details>

---

### Question 7 — Single Choice

A colleague created a shared flow but has now left the organization. What happens to the flow?

- A. The flow is automatically deleted when the creator's account is removed.
- B. The flow stops running until a new creator is assigned.
- C. The other owners of the flow can continue to run it.
- D. The flow is transferred to the IT administrator automatically.

<details>
<summary>Answer</summary>

**Correct answer:** C. The other owners of the flow can continue to run it.

**Explanation:** One of the key advantages of shared flows is that if the creator leaves the organization, the other owners can continue to run and manage the flow without interruption.

</details>

---

### Question 8 — Single Choice

An owner of a shared cloud flow wants to update the sign-in credentials for a connection that another owner originally created. Is this allowed?

- A. Yes, any owner can modify credentials for any connection in the flow.
- B. Yes, but only if the original owner has been removed from the flow.
- C. No, owners can use services in the flow but cannot modify credentials for connections created by another owner.
- D. No, only the flow creator can modify credentials for any connection.

<details>
<summary>Answer</summary>

**Correct answer:** C. No, owners can use services in the flow but cannot modify credentials for connections created by another owner.

**Explanation:** Owners can use services within a shared flow, but they cannot change the credentials for a connection that another owner created. This restriction applies to all owners, including non-creator owners.

</details>

---

### Question 9 — Single Choice

A Power Automate flow fails and the error message contains the word "Unauthorized" with an error code of 401. What is the recommended first step to fix this?

- A. Delete the flow and recreate it from scratch.
- B. Select the Edit button and fix issues inside the flow definition, then resubmit.
- C. Open the flow details, find the connection with the error, select Fix connection, and resubmit.
- D. Check the pricing plan for data usage limits.

<details>
<summary>Answer</summary>

**Correct answer:** C. Open the flow details, find the connection with the error, select Fix connection, and resubmit.

**Explanation:** Authentication failures (error codes 401, 403, or the word "Unauthorized") are fixed by navigating to the flow's connection, selecting Fix connection, verifying credentials, and then resubmitting the failed run.

</details>

---

### Question 10 — Single Choice

A flow is failing with the error message "Not found" and error code 404. What category of issue does this represent, and how should you fix it?

- A. Authentication failure — fix the connection credentials.
- B. Temporary issue — select Resubmit to try again.
- C. Action configuration issue — edit the flow definition and resubmit.
- D. Data usage issue — upgrade your pricing plan.

<details>
<summary>Answer</summary>

**Correct answer:** C. Action configuration issue — edit the flow definition and resubmit.

**Explanation:** Error codes 400 ("Bad request") and 404 ("Not found") indicate action configuration issues. The fix is to select Edit, correct the issue inside the flow definition, save, and then resubmit.

</details>

---

### Question 11 — Single Choice

A flow encounters error code 502. What type of issue does this represent, and what is the recommended action?

- A. Authentication failure — update connection credentials.
- B. Transient or temporary failure — select Resubmit to try again.
- C. Configuration error — edit and fix the flow definition.
- D. Plan limitation — upgrade to a paid plan.

<details>
<summary>Answer</summary>

**Correct answer:** B. Transient or temporary failure — select Resubmit to try again.

**Explanation:** Error codes 500 and 502 indicate temporary or transient failures. The recommended fix is simply to select Resubmit to try running the flow again.

</details>

---

### Question 12 — Single Choice

You are using a free Power Automate plan. You notice that your flows seem to be queued and not running immediately after being triggered. What is the most likely cause?

- A. Your flow has exceeded the 600-flow limit per account.
- B. The flow has more than 50 custom connectors.
- C. The free plan runs flows every 15 minutes; flows triggered before 15 minutes have elapsed are queued.
- D. You are signed in with an organizational account instead of a Microsoft account.

<details>
<summary>Answer</summary>

**Correct answer:** C. The free plan runs flows every 15 minutes; flows triggered before 15 minutes have elapsed are queued.

**Explanation:** The pricing plan determines how often flows run. On the free plan, flows run every 15 minutes. If a flow is triggered less than 15 minutes after its last run, it is queued until the interval has passed.

</details>

---

### Question 13 — Single Choice

A user signed in with an `@outlook.com` account wants to access paid Power Automate features. What should they do?

- A. Upgrade the Outlook account to a premium tier.
- B. Download and use only the Power Automate mobile app.
- C. Sign in using their organizational or school email address to access paid features.
- D. Install the on-premises data gateway to unlock paid features.

<details>
<summary>Answer</summary>

**Correct answer:** C. Sign in using their organizational or school email address to access paid features.

**Explanation:** Users signed in with a Microsoft personal account (such as @outlook.com or @gmail.com) can only use the free plan. To access paid features, they must sign in with an organizational or school account.

</details>

---

### Question 14 — Single Choice

After sharing a flow with a new co-owner, where will the shared flow appear for that new owner in Power Automate?

- A. On the **Cloud flows** tab
- B. On the **My flows** tab
- C. On the **Shared with me** tab
- D. On the **Solutions** tab

<details>
<summary>Answer</summary>

**Correct answer:** C. On the **Shared with me** tab

**Explanation:** When a flow is shared with a new owner, it appears on that user's Shared with me tab. It no longer appears on the Cloud flows tab for any of the co-owners.

</details>

---

### Question 15 — Single Choice

In the "Monitor incoming emails" exercise, what SharePoint folder path is used to save email attachments?

- A. `/Documents/Attachments`
- B. `/Shared Documents`
- C. `/Inbox/Files`
- D. `/Sites/Default`

<details>
<summary>Answer</summary>

**Correct answer:** B. `/Shared Documents`

**Explanation:** In the exercise, the Folder Path for the SharePoint Create File action is set to `/Shared Documents`, which is the default Documents library available out-of-the-box on a SharePoint site.

</details>

---

### Question 16 — Multi-Select

You are explaining the advantages of sharing a Power Automate flow to your team. Which of the following are stated advantages of shared flows? (Select **three**.)

- A. All owners can view the run history of the flow.
- B. Only the original creator can delete a shared flow.
- C. Multiple people can own and manage the flow together.
- D. Owners can modify credentials for any connection, regardless of who created it.
- E. If the creator leaves the organization, other owners can continue to run the flow.

<details>
<summary>Answer</summary>

**Correct answer:** A, C, E

**Explanation:** The documented advantages of shared flows are: multiple people can own and manage it, other owners can continue running it if the creator leaves, and all owners can view run history, manage properties, edit, add/remove owners, and delete the flow. Owners cannot modify credentials for connections created by other owners (D is incorrect), and any owner (not just the creator) can delete the flow (B is incorrect).

</details>

---

### Question 17 — Multi-Select

An administrator is reviewing the limits for a Power Automate account. Which of the following are documented per-account limits in Power Automate? (Select **three**.)

- A. Up to 600 flows
- B. Up to 200 custom connectors
- C. Up to 50 custom connectors
- D. Up to 20 connections per API
- E. Up to 100 connections total

<details>
<summary>Answer</summary>

**Correct answer:** A, C, D, E — but since three must be selected: A, C, and either D or E (both D and E are correct). Accept A, C, D or A, C, E.

**Explanation:** Each Power Automate account supports up to 600 flows, 50 custom connectors, 20 connections per API, and 100 connections total. 200 custom connectors (B) is not a documented limit.

</details>

---

### Question 18 — Multi-Select

A maker wants to understand what tasks the Power Automate mobile app supports. Which of the following actions can be performed from the Power Automate mobile app? (Select **two**.)

- A. Turn flows on or off remotely.
- B. Create new custom connectors.
- C. Review detailed run history reports.
- D. Edit the flow definition using a visual designer.
- E. Manage on-premises data gateway settings.

<details>
<summary>Answer</summary>

**Correct answer:** A, C

**Explanation:** The Power Automate mobile app allows users to turn flows on or off from anywhere and review detailed run history reports. Creating custom connectors, editing flows visually, and managing gateways are browser-based tasks.

</details>

---

### Question 19 — Multi-Select

When configuring the "When a new email arrives (V3)" trigger to save attachments, which filter settings are required to ensure the flow only runs for relevant emails? (Select **two**.)

- A. Set **Include Attachments** to **Yes**
- B. Set **Importance** to **High**
- C. Set **Only with Attachments** to **Yes**
- D. Set **Folder** to **Sent Items**
- E. Set **From** to any sender

<details>
<summary>Answer</summary>

**Correct answer:** A, C

**Explanation:** To ensure the flow only triggers on emails with attachments, both **Include Attachments** and **Only with Attachments** must be set to Yes. Importance and folder settings are optional and depend on the scenario; the exercise sets Importance to "Any" and Folder to "Inbox."

</details>

---

### Question 20 — Multi-Select

In Power Automate, connections used in a flow fall into two categories. Which of the following correctly describes both connection categories? (Select **two**.)

- A. **Embedded** — connections actively used in the flow.
- B. **Archived** — connections that have been deleted from the flow.
- C. **Other** — connections defined for the flow but not currently in use.
- D. **Global** — connections shared across all flows in the tenant.
- E. **Shared** — connections created by co-owners that cannot be modified.

<details>
<summary>Answer</summary>

**Correct answer:** A, C

**Explanation:** Connections in a flow are either Embedded (actively used) or Other (defined but not currently used). If you stop using a connection, it moves to the Other list and stays there until an owner includes it in the flow again.

</details>

---

### Question 21 — Fill-in-the-Blank

In Power Automate, the starting event that initiates a flow is called a ___, while the steps that execute in response are called ___.

<details>
<summary>Answer</summary>

**Answer:** trigger; actions

**Explanation:** Every Power Automate flow consists of a trigger (the initiating event) and one or more actions (the steps that execute when the trigger fires).

</details>

---

### Question 22 — Fill-in-the-Blank

To create a recurring flow that runs once per day, you should set the ___ trigger frequency to **Day** and the interval to ___.

<details>
<summary>Answer</summary>

**Answer:** Recurrence (Schedule); 1

**Explanation:** The Recurrence trigger controls scheduled flows. Setting the frequency to "Day" and the interval to "1" causes the flow to run once every day.

</details>

---

### Question 23 — Fill-in-the-Blank

When a flow fails due to an authentication error, the error message will typically include the word ___ or an error code of ___ or 403.

<details>
<summary>Answer</summary>

**Answer:** "Unauthorized"; 401

**Explanation:** Authentication failures are identified by the presence of the word "Unauthorized" in the error message or HTTP error codes 401 or 403. The fix is to use the Fix connection link to update credentials.

</details>

---

### Question 24 — Fill-in-the-Blank

Each Power Automate account supports a maximum of ___ flows and ___ custom connectors.

<details>
<summary>Answer</summary>

**Answer:** 600; 50

**Explanation:** The documented per-account limits are 600 flows, 50 custom connectors, 20 connections per API, and 100 connections total.

</details>

---

### Question 25 — Fill-in-the-Blank

When an Excel table's **Attachments Name** column is added as dynamic content to the File Name field of a SharePoint **Create file** action, Power Automate automatically places the action inside an ___ loop to handle multiple attachments.

<details>
<summary>Answer</summary>

**Answer:** Apply to each

**Explanation:** When array-based dynamic content (such as Attachments Name) is used in an action, Power Automate automatically wraps that action in an Apply to each loop so each item in the array is processed individually.

</details>
