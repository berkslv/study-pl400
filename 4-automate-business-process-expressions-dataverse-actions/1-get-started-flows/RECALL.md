# Recall: Get Started with Power Automate Flows

> **Source files:** 1-introduction.md, 2-create-first-flow.md, 3-flow-scheduled-flows.md, 4-flow-monitor-incoming-emails.md, 5-flow-share-flows.md, 6-troubleshoot-flows.md

---

## Keywords

| Term | Definition |
|------|-----------|
| Power Automate | An online workflow service that automates actions across apps and services. |
| Trigger | The starting event that initiates a flow (e.g., new email, new list item). |
| Action | A task performed when a trigger fires (e.g., create file, send email). |
| Recurrence trigger | A scheduled trigger that runs a flow at defined intervals (e.g., daily). |
| Automated cloud flow | A flow that starts automatically when a specified event occurs. |
| Dynamic Content | Data values sourced from previous flow steps, inserted into later actions. |
| Co-owner | A user or group that shares full management rights over a flow. |
| Embedded connection | An active connection currently used within a flow. |
| Cloud flow activity | A Power Automate page showing run history and failure details for flows. |
| Apply to each | A loop action automatically added when processing collections (e.g., multiple attachments). |
| Resubmit | The action to re-run a previously failed flow run after fixing its issue. |
| Throttling | Power Automate's mechanism to limit flow runs when data usage limits are exceeded. |

---

## Main Ideas

- Every flow has exactly **one trigger** and **one or more actions**; the trigger starts the flow, actions define what happens.
- **Scheduled flows** use the **Recurrence** trigger to run at fixed intervals; Copilot can generate flow steps from a natural-language description.
- The **For Each** loop is used to iterate over rows (e.g., Excel table rows), enabling per-row actions like sending individual emails.
- An **Automated cloud flow** monitoring Outlook can filter by sender, subject, importance, and attachment presence before acting.
- When **Attachments Name** is used as dynamic content in a **Create file** action, Power Automate automatically wraps it in an **Apply to each** loop to handle multiple attachments.
- Shared flows appear on the **Shared with me** tab and disappear from **Cloud flows** for co-owners; the flow creator cannot be removed as an owner.
- Co-owners **cannot** modify credentials for connections created by another owner; shared connections are scoped to the flow they were created in.
- Adding a **Microsoft Lists list** as co-owner grants everyone with Edit access to that list automatic edit access to the flow.
- Authentication errors return HTTP **401** or **403** ("Unauthorized"); fix via **Fix connection** then **Resubmit**.
- Configuration errors return HTTP **400** or **404** ("Bad request" / "Not found"); fix by editing the flow definition.
- Transient errors return HTTP **500** or **502**; resolution is to **Resubmit** the failed run.
- Account limits: **600 flows**, **50 custom connectors**, **100 total connections** (20 per API) per account.
- Free plan flows may run at most every **15 minutes**; runs triggered before that interval are queued.
- Paid plan features require sign-in with an **organizational/school account**, not a personal Microsoft account.

---

## Mini Quiz

### Q1 — Single Choice

A developer wants a flow to start automatically whenever a new email arrives in Outlook. Which flow type should they create?

- A. Scheduled cloud flow
- B. Instant cloud flow
- C. Automated cloud flow
- D. Desktop flow

<details>
<summary>Answer</summary>

**Correct answer:** C. Automated cloud flow

**Explanation:** An automated cloud flow is triggered by an event such as a new email arriving, as described in the "Monitor incoming emails" unit.

</details>

---

### Q2 — Fill-in-the-Blank

Every Power Automate flow has exactly one ___ and one or more ___.

<details>
<summary>Answer</summary>

**Answer:** trigger; actions

**Explanation:** The "Create your first flow" unit states: "Every flow has two main parts: a trigger, and one or more actions."

</details>

---

### Q3 — Single Choice

A flow saves email attachments to SharePoint using the **Attachments Name** dynamic content field. What does Power Automate automatically do as a result?

- A. Creates a subfolder for each attachment
- B. Wraps the Create file action in an **Apply to each** loop
- C. Sends a confirmation email for each attachment
- D. Filters out attachments larger than 10 MB

<details>
<summary>Answer</summary>

**Correct answer:** B. Wraps the Create file action in an **Apply to each** loop

**Explanation:** The "Monitor incoming emails" unit notes that once Attachments Name is added, the Create file action is automatically placed inside an Apply to each action to handle multiple attachments.

</details>

---

### Q4 — Fill-in-the-Blank

A flow run that fails with an HTTP status code of ___ or ___ indicates an **authentication** problem and should be fixed using the **Fix connection** link.

<details>
<summary>Answer</summary>

**Answer:** 401; 403

**Explanation:** The "Troubleshoot flows" unit lists 401 and 403 as the error codes associated with authentication ("Unauthorized") failures.

</details>

---

### Q5 — Single Choice

An owner wants to add a colleague as a co-owner of a flow. Which statement about the new co-owner is TRUE?

- A. They can modify the credentials of connections created by other owners.
- B. They can remove the original flow creator from the owner list.
- C. They can view run history, edit the flow, and delete it.
- D. The flow will appear on their **Cloud flows** tab instead of **Shared with me**.

<details>
<summary>Answer</summary>

**Correct answer:** C. They can view run history, edit the flow, and delete it.

**Explanation:** The "Share flows" unit lists these as valid co-owner actions; however, co-owners cannot alter another owner's connection credentials, cannot remove the creator, and the flow appears under **Shared with me**.

</details>

---

### Q6 — Single Choice

A Power Automate account on the free plan has a flow triggered every 5 minutes. What happens?

- A. The flow runs immediately each time it is triggered.
- B. Runs triggered before 15 minutes have elapsed are queued until 15 minutes pass.
- C. The flow is permanently disabled after three rapid triggers.
- D. Power Automate upgrades the plan automatically to handle the load.

<details>
<summary>Answer</summary>

**Correct answer:** B. Runs triggered before 15 minutes have elapsed are queued until 15 minutes pass.

**Explanation:** The "Troubleshoot flows" unit states that on the free plan flows run at most every 15 minutes; triggers that fire before that interval is up are queued.

</details>

---

### Q7 — Fill-in-the-Blank

Each Power Automate account can have up to ___ flows, ___ custom connectors, and ___ total connections.

<details>
<summary>Answer</summary>

**Answer:** 600; 50; 100

**Explanation:** The "Troubleshoot flows" unit lists these hard limits per account.

</details>

---
