# Get started with expressions

> Module: Introduction to expressions in Power Automate | Unit 2 of 8 | 3 minutes

To write an expression in Power Automate, select any action that has an input, then select the input field to open the formula options menu. Notice that you'll see a blue option button appear on the right side of the input field. The button's upper half shows a lightning bolt icon, and the lower half shows ***fx***. The lower half of this button opens up the expression editor. Selecting the ***fx*** button takes you to the expression pop-up. You can also type a forward slash or "/" in the input field to bring up the options as a drop-down selection. Either way gets you to the expression editor.

Although the input field shows the options **Function** and **Dynamic content** below it, you craft an expression here that uses Azure Logic Apps functions. You can also add any dynamic content available in this flow into the expression as you craft it.

The formula box provides a place where you can type your expressions by combining one or more functions. Function names aren't case-sensitive.

> **Tip:** Use a **Manually trigger a flow** trigger and a **Compose** action as a simple setup for writing and testing expressions without worrying about other inputs or actions.

## Auto suggest, hints, and links in the formula bar

When you enter a function in the formula bar, you see a pop-up with syntax suggestions.

For example, the **convertFromUtc** function has two required inputs and one optional input:

- **Timestamp** – required, expects a string
- **destinationTimeZone** – required, expects a string
- **format?** – optional, expects a string

> **Note:** The question mark at the end of **format** tells you that it is an optional input.

The formula bar pop-up provides a URL to the [list of time zone values](https://msdn.microsoft.com/library/gg154758.aspx/). With that information you can complete the expression:

```
convertFromUtc('2024-02-09T12:00:00Z','Eastern Standard Time')
```

Once the expression is completed, select the **Add** button at the bottom of the expression editor to save your changes. Always be sure to select **Add** when editing an expression — if you select out of the inputs, you will lose your changes. Power Automate doesn't have AutoSave.

> **Note:** If you're using the legacy designer, you will select **Update** to save your formula.

After saving, select **Test** → **Run flow** → **Done** to verify. Expand the **Compose** action to see the output of the expression.
