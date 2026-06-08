# Get started with expressions

Completed

- 3 minutes

To write an expression in Power Automate, select any action that has an input, then select the input field to open the formula options menu. Notice that you'll see a blue option button appear on the right side of the input field. The button's upper half shows a lightning bolt icon, and the lower half shows ***fx***. The lower half of this button opens up the expression editor. Selecting the ***fx*** button takes you to the expression pop-up which is depicted in the image below. You can also type a forward slash or "/" in the input field to bring up the options as a drop-down selection. Either way gets you to the expression editor.

[![Screenshot of opening the Dynamic content menu and selecting Expression.](media/write-expression.svg)](media/write-expression.svg#lightbox)

Don't be confused: although the input field shows the options **Function** and **Dynamic content** below it, you craft an expression here that uses Azure Logic Apps functions. You can also add any dynamic content available in this flow into the expression as you craft it.

The formula box provides a place where you can type your expressions by combining one or more functions. Before you learn about the different types of functions and their usage, there are some commonalities you should learn first. Function names aren't case-sensitive.

Tip

Notice in the screenshot above we used a **Manually trigger a flow** trigger and a **Compose** action. This allows you to have a simple setup for writing and testing your expressions without worrying about other inputs or actions. Use this setup to follow along in this app or anytime you want to try out something new.

## Auto suggest, hints, and links in the formula bar

When you enter a function in the formula bar, you see a pop-up with syntax suggestions.

[![Screenshot of pop-up with syntax suggestions.](media/pop-up.svg)](media/pop-up.svg#lightbox)

Here you can see for the **convertFromUtc** function that it has two required inputs and one optional input.

- **Timestamp** is required and expects a string.
- **destinationTimeZone** is required and expects a string.
- **format?** is optional and expects a string.

    Note

    The question mark at the end of **format** tells you that it is an optional input.

After you enter a Timestamp as a string then type a comma, the flow prompts for the destinationTimeZone:

[![Screenshot of prompt for the destinationTimeZone.](media/prompt.svg)](media/prompt.svg#lightbox)

This can be daunting. What does it want for the time zone? If you look in the pop-up, you see that it provides a URL you can copy that references the [list of time zone values](https://msdn.microsoft.com/library/gg154758.aspx/?azure-portal=true). Following the link provides you with the string for the **destinationTimeZone** **Time zone name**. With this information, we can now complete the expression.

`convertFromUtc('2024-02-09T12:00:00Z','Eastern Standard Time')`

Once the expression is completed, you can select the **Add** button at the bottom of the expression editor to save your changes. Always be sure to select **Add** when editing an expression. If you select out of the inputs, you will lose your changes. Power Automate doesn't have AutoSave.

Note

If you're using the legacy designer, you will select **Update** to save your formula.

With your first expression complete, you can now select **Test** in the top right-hand corner. Then select **Test**&gt;**Run flow**&gt;**Done**.

Once the test is complete, you should see the green bar at the top that says, "Your flow ran successfully." Expand the **Compose** action and you can see the result of our formula converting date & time to the new time zone in the **OUTPUTS**.

[![Screenshot of successful flow bar with the message Your flow ran successfully.](media/flow-successful.svg)](media/flow-successful.svg#lightbox)

This same process will help you see the output of any test expressions you create.
