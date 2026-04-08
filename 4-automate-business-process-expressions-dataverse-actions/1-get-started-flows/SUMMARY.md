# Summary: Getting Started with Power Automate Flows

> **Source files:** 1-introduction.md, 2-create-first-flow.md, 3-flow-scheduled-flows.md, 4-flow-monitor-incoming-emails.md, 5-flow-share-flows.md, 6-troubleshoot-flows.md

---

## What is Power Automate

- Online workflow service that automates actions across common apps and services.
- Connects to hundreds of services; supports cloud data and on-premises sources (SharePoint, SQL Server).
- Common use cases:
  - Instantly respond to high-priority notifications or emails
  - Capture, track, and follow up with new sales leads
  - Copy email attachments to OneDrive for Business
  - Collect and share business data with a team
  - Automate approval workflows
  - Monitor social media mentions and log results to databases or spreadsheets
  - Connect data to Power BI for trend analysis

---

## Power Automate UI Navigation

- **Create** — start a new flow
- **Templates** — browse popular pre-built flows
- **Learn** — ramp-up documentation
- **My flows** — where personal flows reside
- **Approvals** — manage approvals and business process flows
- **Solutions** — containers holding multiple components including flows
- **Process mining** — identify workflow streamlining opportunities

### Help Menu (?) Options

- Documentation, Learn, Support, Roadmap, Community, Give Feedback, Blog
- Desktop flows, Pricing, Power Automate for desktop (download), Data Gateway

### Mobile App Capabilities

- Turn flows on or off remotely
- See when a flow has failed
- Review detailed run history reports
- View and filter runs by notification type

---

## Core Flow Concepts

- Every flow has exactly **one trigger** and **one or more actions**.
- **Trigger** — the starting event that initiates the flow (e.g., new email arriving, new list item added).
- **Actions** — operations executed when the trigger fires (e.g., create a file on OneDrive, send an email, post a tweet, start an approval).

---

## Exercise: Scheduled Flow (Recurrence Trigger)

**Scenario:** Send daily event-information emails to contacts stored in an Excel workbook on OneDrive.

### Prerequisites

- Excel file on OneDrive with a table containing columns: `ContactEmail`, `FirstName`, `LastName`.

### Format an Excel Table

1. Highlight all cells containing data.
2. Select the **Insert** tab.
3. Select the **Table** option.
4. Ensure **My table has headers** is checked.
5. Select **Ok** and save the file in OneDrive.

### Create the Flow

1. Sign in to [Power Automate](https://make.powerautomate.com/) with your organizational account and verify the correct environment.
2. In the Copilot input field, type a description such as:
   > *Create a flow that runs daily, gets a list of excel rows and for each row, send an email.*
3. Select **Generate**. Copilot creates the flow with: **Recurrence** trigger, **List rows present in a table (Excel)** action, **For Each** action, and **Send an Email** action inside the loop.
4. Review generated actions; refine if needed. Select **Next**.
5. Select the **Recurrence** trigger and verify interval parameters (e.g., daily at 10:00 a.m.).
6. Configure **List rows present in the table** action:
   - **Location:** OneDrive for Business
   - **Document Library:** OneDrive
   - **File name:** select the Excel file
   - **Table name:** select the table
7. Configure **Send an email** action inside **For Each**:
   - **To:** Insert Dynamic Content → `ContactEmail` (from *List rows present in a table*)
   - **Subject:** `Contoso Event Information`
   - **Body:** `Dear [FirstName]` + event message text
8. Select **Save**, then **Test** → **Manually** → **Run flow** → **Done**.
9. Verify green check marks on all steps and that an email is received.

---

## Exercise: Monitor Incoming Emails (Automated Cloud Flow)

**Scenario:** Monitor Outlook inbox for emails with a specific subject and attachments; save attachments to SharePoint.

### Prerequisites

- Microsoft Office 365

### Create the Flow

1. Sign in to [Power Automate](https://flow.microsoft.com) with your organizational account.
2. Select **My flows** → **New flow** → **Automated cloud flow**.
3. Search for `Outlook`, select **When a new email arrives (V3)**, then select **Create**.
4. Select the trigger → **Show all** and configure:

   | Field | Value |
   |---|---|
   | From | your org email |
   | Include Attachments | Yes |
   | Subject Filter | Daily report |
   | Importance | Any |
   | Only with Attachments | Yes |
   | Folder | Inbox |

5. Select **Insert a new step** → **Add an action**.
6. Search for `Create file`, select **SharePoint Create File**.
7. Set **Folder Path** to `/Shared Documents`.
8. Set **File Name** → Dynamic Content → **Attachments Name**.
9. Set **File Content** → Dynamic Content → **Attachments Content**.
10. When **Attachments Name** is added, the **Create file** action is automatically wrapped in an **Apply to each** loop (handles multiple attachments).

---

## Sharing Flows

### Advantages

- Multiple people can own and manage a flow together.
- If the creator leaves the organization, other owners can continue running it.
- All owners can: view run history, manage properties, edit the flow, add/remove owners, and delete the flow.

### Prerequisites

- A paid Power Automate plan is required to create shared flows.
- Only the creator or an existing owner can add or remove owners.

### Create a Shared Flow

1. Sign in to [Power Automate](https://flow.microsoft.com).
2. Select **My flows**.
3. Select the **Share** button for the target flow.
4. In the **Co-owners** section, enter the name, email, or group name.
5. Select the user or group from the list — they become an owner.
6. The flow moves from the **Cloud flows** tab to the **Shared with me** tab.

### Adding Microsoft Lists as a Co-owner

- Adding a Microsoft Lists list as co-owner grants edit access to the flow for everyone with edit access to the list.
- SharePoint users need **Edit** permission or membership in the **Members** or **Owners** group to run flows in SharePoint.

### Owner Permissions and Restrictions

- Owners **can**: view run history, manage properties, edit the flow definition, add/remove other owners (not the creator), delete the flow.
- Owners **cannot**: modify credentials for a connection created by another owner.
- Shared connections can only be used in the flow in which they were created.

### Remove an Owner

1. On the **Shared with me** tab, select **Share** for the flow.
2. Select the **Delete** button next to the owner to remove.
- **Warning:** If the removed owner's credentials are used by connections in the flow, update those connection credentials to keep the flow running.

### Connection Types

- **Embedded** — connections actively used in the flow.
- **Other** — connections defined for the flow but not currently in use; remain listed until re-included by an owner.

---

## Troubleshooting Flows

### Identifying Errors

- Power Automate sends a weekly email summarizing failures.
- View **Cloud flow activity** from the home page: **More ... → Cloud flow activity**.
- Green check marks = success; red exclamation point (**!**) = error.
- Open the failed step to read the error message.

### Authentication Failures (401 / 403 / "Unauthorized")

1. Open the flow from **My Flows**.
2. Scroll to the connection with the "Unauthorized" error.
3. Select **Fix connection** and re-enter credentials.
4. Select **Resubmit** to retry the run.

### Action Configuration Issues (400 / 404 / "Bad request" / "Not found")

1. Select **Edit** and fix the flow definition.
2. Save the flow, then select **Resubmit**.

### Temporary / Transient Issues (500 / 502)

- Select **Resubmit** to retry.

### Pricing Plan Issues

- Check the plan via the **?** menu → **Pricing**.

### Data Usage Issues

- **Free/trial plan:** Check usage via **Settings** (gear icon).
- **Paid plan:** Runs are pooled across all users in the organization.
- Exceeding the data limit causes Power Automate to **throttle** flow runs.

### Run Frequency Issues

- Free plan: flows run at most every 15 minutes; runs triggered sooner are queued.
- Trigger checks for new data do **not** count as runs; only actual trigger firings do.
- Some flows run more often than expected because they must evaluate every event (e.g., checking every email to see if it's from the manager).

### Account Type Issues

- Microsoft accounts (`@outlook.com`, `@gmail.com`) are limited to the free plan only.
- Use an organizational or school email account to access paid features.

### Account Limits

- Up to **600 flows** per account
- Up to **50 custom connectors** per account
- Up to **20 connections per API** and **100 connections total**
- Gateways can only be installed in the **default environment**
- External connectors (e.g., X/Twitter) may implement **connection throttling**; check run history details when flows fail

---

## References

- [Power Automate](https://flow.microsoft.com)
- [Power Automate (make)](https://make.powerautomate.com/)
