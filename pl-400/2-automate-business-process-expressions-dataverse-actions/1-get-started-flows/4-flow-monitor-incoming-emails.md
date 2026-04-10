# Exercise - Monitor incoming emails

- 5 minutes

You can create a flow that automatically performs one or more actions after it's triggered by an event. For example, the flow can monitor your Outlook inbox and when an email arrives with a specific subject line and email address, the flow will take the attachment and save it to a SharePoint library.

## Prerequisites

- Microsoft Office 365

## Specify the SharePoint site and library

You can use any SharePoint site of your choice and can also use an existing library.

In this scenario, we'll use a SharePoint site and its default **Documents** library, which is available out-of-box.

## Specify an event to start the flow

First, you must select the trigger (event) that starts the flow.

1. Sign in to [Power Automate](https://flow.microsoft.com) by using your organizational account.
2. Select **My flows**.
3. Select **New flow**, and then select **Automated cloud flow**.
4. Under **Choose your flow's trigger**, enter *Outlook*, select the **When a new email arrives (V3)** trigger and select **Create**.
5. Select the trigger and then select the **Show all** button.
6. Add the following settings:

   | Field | Value |
   |---|---|
   | **From** | your org email |
   | **Include Attachments** | Yes |
   | **Subject Filter** | Daily report |
   | **Importance** | Any |
   | **Only with Attachments** | Yes |
   | **Folder** | Inbox |

## Specify an action

1. Select **Insert a new step** and select **Add an action**.
2. Search for *Create file*, and then select the **SharePoint Create File** action.
3. For **Folder Path** select `/Shared Documents`.
4. Click in the **File Name** field and select the *lightning bolt* to pull up the Dynamic Content.
5. Select **Attachments Name** from **Dynamic Content**.
6. Click in the **File Content** field and then select the *lightning bolt* to pull up the Dynamic Content.
7. Select **Attachments Content** from **Dynamic Content**.
8. Once the **Attachments Name** is added, the **Create file** action is automatically added inside of an **Apply to each** action. This means that if there are multiple attachments with the email, the flow will create a file for each attachment.

---

You have successfully built a **Power Automate** flow that will monitor your **Outlook** inbox for any emails that have the text **Daily report** in their **Subject line** and have **Attachments**, then save those attachments to SharePoint.
