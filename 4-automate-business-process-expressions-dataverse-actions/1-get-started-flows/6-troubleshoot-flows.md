# Troubleshoot flows

- 8 minutes

In this unit, you'll learn how to troubleshoot common issues that might occur while you run your flows.

## Identify the error

Before you can fix a flow, you must identify why it failed. Power Automate, by default, sends you an email with a list of failures each week. You can also view your *Cloud flow activity* from the Power Automate home page:

1. Select the **More ...** option from the left-side menu, then select **Cloud flow activity** (or select the **Activity** tab in the mobile app). If you don't see that option, select **Discover all** at the bottom of the **More** dialog box, and then find/select **Cloud flow activity**.
2. Select your flow from the list that appears to view the run.
3. Details about the flow appear. Steps that succeeded show green check marks; steps with errors show a red exclamation point (**!**). Open the failed step and review the error message for insight on what happened and how to fix your flow.

## Authentication failures

Flows fail with authentication errors when the error message includes the word **"Unauthorized"** or an error code of **401** or **403**. Fix by updating the connection:

1. Open the flow details by selecting the flow from **My Flows**.
2. Scroll to the connection that showed the "Unauthorized" error.
3. Next to the connection, select the **Fix connection** link.
4. Verify your credentials by following the instructions that appear, then return to your flow-run failure and select **Resubmit**.

## Action configuration issues

Flows fail with configuration issues when the error message includes **"Bad request"** or **"Not found"**, or an error code of **400** or **404**:

1. Select the **Edit** button, and then fix the issues inside the flow definition.
2. Save the updated flow, and then select **Resubmit** to try running the flow again.

## Temporary issues

If error code **500** or **502** appears, the failure is temporary or transient:

- Select **Resubmit** to try to run the flow again.

## Issues with your pricing plan

Sometimes flows might behave unexpectedly because of the wrong plan:

- In Power Automate, select the question mark icon in the header, then select **Pricing** from the *Help* panel. If you arrive at the Power Automate products page, look for the **Pricing** tab.

## Issues with data usage

You might have run out of data that you can use:

- **Free or trial plan:** Select the **Settings** button (gear symbol) to show your current usage against your plan.
- **Paid plan:** Runs are pooled across all users in your organization.

> **Important:** If you exceed your data limit, Power Automate throttles your flow runs.

## You might be running flows too often

Your plan determines how often your flows run. For example, flows might run every 15 minutes on the free plan. If a flow is triggered less than 15 minutes after its last run, it's queued until 15 minutes have passed.

Whenever a flow is triggered (automatically or manually), the action counts as a run. Checks for new data do **not** count as runs.

## You might be using an incorrect account

If you sign in by using a Microsoft account (for example, an account that ends with `@outlook.com` or `@gmail.com`), you can use only the free plan. To take advantage of paid features, sign in by using your organizational account or school email address.

## Some flows run more often than expected

Some flows might run more often than you expect. For example, a flow that sends you a push notification whenever your manager sends you an email must run every time you get an email from **anyone**, because the flow must check whether the email came from your manager. This action counts as a run.

## Other limits and caveats

Each account can have up to:

- 600 flows
- 50 custom connectors
- 20 connections per API and 100 connections total

Additional notes:

- You can install a gateway only in the default environment.
- Some external connectors, like **X (Twitter)**, implement connection throttling to control the quality of service. Your flows might fail when throttling is in effect. Review the run history details to investigate.
