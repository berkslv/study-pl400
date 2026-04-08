# Exercise - Create a cloud flow with a Dataverse connector

Your organization wants to ensure that when a new contact is created, they're only marked **Active** if no existing contact has the same email. If a duplicate is detected, the status should remain **New** for manual review.

By the end of this exercise, you will be able to:

- Create an automated cloud flow using the Dataverse connector
- Use the **List rows** action with a filter expression
- Update a Dataverse row based on conditions
- Understand how to avoid duplicate data entries in Microsoft Dataverse

## Set up the contacts table (skip if table already exists)

1. Navigate to [Power Apps](https://make.powerapps.com) maker portal.
2. Select **Tables** on the left side.
3. Select **New table** and **Create new tables** in the top left.
4. Choose **Start from blank**.
5. Name the table **Contact**.
6. Change the Primary Column to **Full Name**.
7. Create a new text column called **Email** and set it to required.
8. Create another new column called **Status** and make it a choice column. Change the choices to be **New**, **Active**, and **Inactive**.
9. When done, choose **Save and exit** in the top right corner.

## Create the cloud flow

1. Navigate to [Power Automate](https://make.powerautomate.com) maker portal.
2. Select **Create** from the left side and then choose **Automated cloud flow**.
3. Name your flow: `Check for Duplicate Contacts`.
4. Select trigger: **When a row is added, modified, or deleted** (Microsoft Dataverse).
5. Select **Create**.

### Configure the trigger

6. Select the **When a row is added, modified, or deleted** trigger and change type to **Added**.
7. Choose the **Contacts** table.
8. Change scope to **Organization**.

### Add the List rows action

9. Under the trigger, select the **+** icon to add a new step.
10. Search for **List rows** under **Microsoft Dataverse**.
11. Choose the **Contacts** table, then under **Filter rows** type:

    ```plaintext
    emailaddress1 eq ''
    ```

12. Place your cursor between the two single quotes and select the lightning bolt icon on the right side of the text box. Then choose **Email** from the dynamic data.

### Add a Condition

13. Under the List rows action, select the **+** icon to add a new step.
14. Search for and add the **Condition** action.
15. On the left side of the formula select the **fx** icon to add a function, then copy and paste this function and select **Add**:

    ```plaintext
    length(body('List_rows')?['value'])
    ```

16. Set the value on the right side of the formula to `1`. This checks that only one contact exists with that email (the one just added). If more exist, it's a duplicate.

### Update the row (True branch)

17. Under the **True** branch, select the **+** icon to add a new step.
18. Search for and add the **Update a row** action under Microsoft Dataverse.
19. Choose the **Contacts** table.
20. For the **Row ID**, select the lightning bolt icon to show the dynamic data and search for **Contact**. Choose the **Contact** column under the **When a row is added, modified, or deleted** section. This is the unique identifier of the table.
21. Under **Advanced Parameters**, search for **Status** and set the value to **Active**.

### Save and test

22. Save the flow in the top right corner.
23. In a new tab, navigate to the [Power Apps](https://make.powerapps.com) maker portal.
24. Select **Tables** on the left side, find, and select the **Contacts** table.
25. Select **Edit** on the right side of the table data.
26. Select **+ New row** at the top and enter a new contact with a unique email.
27. Add another contact with the same email to test the duplicate logic.

Check flow runs in **Power Automate > My flows > Run history**.

## Summary

In this exercise, you:

- Created a cloud flow triggered by a Dataverse record creation
- Used a filtered List rows to check for duplicate email addresses
- Conditionally updated the contact's status to Active
