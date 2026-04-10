# Collaborate by using Monitor

Monitor offers three collaboration options:

- **Download/Upload** – These options help make it easier to collaborate by saving a Monitor session to a local file that you can reload later or share with someone else. For example, you can save the session locally, then upload and attach it to a work item, and assign it to another developer. The assigned developer can reload the session into Monitor to view the events that occurred on their own schedule.
- **Invite** – With this option, you can collaborate in real time with another person, watching the Monitor event log as you run the app from Power Apps Studio. Because the app runs from Power Apps Studio, this option is intended for development, not for deployed apps. For example, this option might be helpful if a colleague on your team created a custom connector and you're having trouble using it. You could invite that colleague to view your app's use of the connector and monitor it using the **Invite** feature.
- **Connect user** – This option allows you to use Monitor to connect to a remote user who is running a published canvas app from Power Apps. For example, a user might experience a problem that you're unable to reproduce in your development environment. By using the **Connect user** feature, you can invite the user to run the app while you review the event log in Monitor.

Regardless of which option you choose, collaboration can accelerate the resolution of app issues. In these scenarios, users you collaborate with have access to the events and data used in the app.

## Use Download/Upload

Monitor includes a built-in feature that allows you to download the current session's events to a local file. You can reload the downloaded file into any Monitor session using **Upload**. This process doesn't affect the contents of the current session; it only enables reloading the events later. You can start these actions from any Monitor session using the command bar buttons.

The simplest use of the downloaded file is to reload it later into your own Monitor session. For collaboration, you can share the file (for example, via email, OneDrive, GitHub Issues, or Microsoft Azure DevOps work items) with anyone who has Monitor access. They can reload the file even if they don't have edit access to the monitored app. This feature allows you to consult with a colleague who might be more familiar with how specific connectors work.

Additionally, you can use this option to save a baseline of an app for future comparison. For example, if your queries were slow, it would help to identify those queries from a previous test session.

Download and upload work best when real-time collaboration isn't needed. This option is effective when collaborators are in different time zones.

## Use the Invite feature

By selecting **Invite**, you can invite another user in your organization to access Monitor and view the events generated as you preview the app in Power Apps Studio. Initiate the invite by selecting **Invite** from the command bar. Monitor generates the invite link.

Copy the link and send it to the user so they can open Monitor and join your session. The link is valid for 60 minutes. If more time is needed, remove and reinvite the user. If you invite the wrong person, you can remove the invite; they won't be notified.

Each user receives their own copy of the events, meaning you can independently browse, view, and inspect app events without affecting each other's session or needing to transfer control. For example, if you select **Clear data**, it only clears your event log.

While the invited user can view Monitor events, they can't see your activity in the app. It can be helpful to also share your screen so they can observe your actions alongside the event log.

Because the invited user doesn't run the app, you don't need to share the app or assign app permissions to them.

## Use the Connect user feature

**Connect user** allows you to select a published app enabled for debug and invite a user to run the app while you use Monitor to view the events it generates.

To enable the app, turn on the **Debug published app** setting. After enabling, save and republish the app.

Enable this option only when needed, as it adds debug information that may impact performance.

To use **Connect user**, launch Monitor from the app list instead of Power Apps Studio.

When Monitor launches, the **Connect user** button is available in the command bar.

Similar to **Invite**, you'll provide the user information, and Monitor generates a link to share with the user who will run the app.

However, unlike **Invite**, the user must run the app, so you must share the app and assign the necessary permissions.

When the user selects the link to run the app, your Monitor session displays the events they generate. In many cases, screen sharing is useful so you can observe their actions while reviewing the event log.

The collaboration features in Monitor help you work with others to troubleshoot app issues, even when you're not in the same location.
