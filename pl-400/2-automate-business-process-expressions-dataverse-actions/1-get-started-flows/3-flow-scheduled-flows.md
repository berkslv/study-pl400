# Exercise - Create recurring flows

- 5 minutes

In this unit, you'll learn how to build prescheduled flows by using a trigger called *recurrence*. Contoso has an annual event and they receive phone calls inquiring about the details. The Contoso team answering the phone calls places the contact information in a Microsoft Excel workbook on Microsoft OneDrive. You'll build a flow for the Contoso event team that automatically pulls customer email addresses from a Microsoft Excel workbook on Microsoft OneDrive. You'll then set up the flow so that any email addresses that anyone adds to the workbook will receive an event information email once a day.

## Prerequisites

For this scenario, you'll create an Excel file with a table that contains the following columns: `ContactEmail`, `FirstName`, and `LastName`. Save the Excel file in OneDrive. You'll connect to this file in step 9. Use your organization email address as the ContactEmail — using your email will make testing the flow easier.

### Format an Excel Table

1. Highlight all the cells that contain data.
2. Select the **Insert** tab.
3. Select the **Table** option.
4. Make sure **My table has headers** is checked.
5. Select **Ok**.
6. Save the file in OneDrive.

## Create a scheduled flow

1. Sign in to [Power Automate](https://make.powerautomate.com/) by using your organizational account.
2. Make sure you are in the correct environment.
3. In the input field in the middle of the screen, type:
   > *Create a flow that runs daily, gets a list of excel rows and for each row, send an email.*
   
   Select **Generate**.
4. Copilot will generate a flow and its actions from the description.
   - If Copilot provided incorrect actions, refine the flow actions in the top box.
   - In this example, Copilot added a **List rows present in a table (Excel)** action, a **For Each** action and, within the For Each, a **Send an Email** action.
   - Review the actions Copilot generated and select **Next**.

5. Select the **Recurrence** trigger to open the properties panel on the left and verify Copilot set the correct parameters.

   > **Note:** Be mindful of the repeating interval you select and how often you would like the flows to run. In the example below, the flow runs daily at 10:00 a.m.

6. Select the **List rows present in the table** action to open the properties panel on the left.
   - In the **Location** field, select **OneDrive for Business**.
   - In the **Document Library** field, select the drop-down arrow and select **OneDrive**.
   - In the **File name** field, select the folder button, and then select the Excel file to use.
   - In the **Table name** box, select the drop-down arrow, and then select the table to use.

7. Configure the **Send an email** action inside the **For Each** loop:
   - Select the **Send an email** action to open the properties panel on the left.
   - Click inside the **To** field and select **Enter custom value**.
   - Type `/` and then select **Insert Dynamic Content**, or select the lightning bolt icon.
   - Select **ContactEmail** from the available dynamic content under the *List rows present in a table* step.
   - Enter **Contoso Event Information** for **Subject**.
   - Type **Dear** in the **Body**, type `/`, and select the **Insert Dynamic Content** button.
   - Select **FirstName** from the dynamic content.
   - Press **ENTER** and then type:
     > *Thank you for your interest in Contoso's annual event. As information becomes available, you'll be the first to know!*

8. Select **Save** and wait for the flow to be saved.
9. Select **Test**.
10. Select **Manually** and then select the **Test** button.
11. Select **Run flow**.
12. Select **Done**.
13. The flow should run successfully — green checks appear over the steps and a success banner appears at the top.
14. You should receive an email sent by the cloud flow.

---

As written, this flow will now run once a day. It will:

- Get the rows from the Excel worksheet
- Grab the email address and name from each row
- Enter the email address and name in the email, and send an event information email
- Save you from manually composing emails to each interested caller
