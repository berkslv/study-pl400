# Write complex expressions

Completed

- 5 minutes

When you combine more than one function to get the result you want, this is known as a **complex expression**. In the Math functions and Date and Time functions sections, you already saw examples of these expressions. You saw that to add three numbers, you need to combine two **add** functions like:

```
add(add(12,13),15)
```

Which resulted in the output of 40.

Then you saw how you use the **utcNow** function to get the current date and time and then use **convertFromUtc** to change it to the Eastern Standard time zone as shown here:

`convertFromUtc(utcNow(), 'Eastern Standard Time', 'dd-MM-yyyy hh:mm tt' )`

This resulted in the output of 09-02-2024 11:28 AM.

When you think of complex expressions, there's always more than one function nested in an expression where you use the output of one function as an input of another. There are no special syntax, operators, or considerations.

For a final example of a complex expression, take the scenario of having a couple of inputs as part of your **Manually trigger a flow** trigger and using that input in a formula to compute a new time. You can use the example flow that you used to test your expressions or to build a new flow that looks like this one.

[![Screenshot of Manually trigger a flow with Compose input.](media/new-flow.svg)](media/new-flow.svg#lightbox)

Now select **Add an input** under **Manually trigger a flow** and add a Number. Then select **Add an input** again and add a Date. Your trigger should now look similar to this:

[![Screenshot of Manually trigger a flow with Number and Trigger date.](media/copilot-add-inputs.svg)](media/copilot-add-inputs.svg#lightbox)

Now, in the **Compose** step create an expression to add the number of days from the trigger to the date.

```
addDays(triggerBody()?['date'], triggerBody()?['number'])
```

This expression uses the Date Time function **addDays** and the Referencing function **triggerBody**.

Note

If you find yourself asking "How do I know what goes in for trigger body?" then you're thinking correctly. The secret is you can combine dynamic content into your expressions. To do so, start your expression by typing addDays() and then with your cursor between the (), select **Dynamic content**. Then you can choose your fields. This is a great way to reference that content while letting Power Automate do the hard work of writing the expression.

If you test your flow and enter the date 2024-02-09 and the number 2, your output is 2024-02-11T00:00:00.0000000. This is the UTC format for February 11, 2024.

Now you can find out what day of the week that is by using another Compose action with the following expression:

```
dayOfWeek(outputs('Compose'))
```

The output from the first Compose action is 2024-02-11T00:00:00.000000. The output of the second Compose action is 0, which represents Sunday. Sunday is 0 and each subsequent day increases by 1. Here's a screenshot of what your flow would look like with the two compose actions and the *dayOfWeek* formula in the second compose action.

[![Screenshot of validate flow built with Manually trigger a flow and two compose actions.](media/flow-built.svg)](media/flow-built.svg#lightbox)

Now add another Compose step to check if the date selected is a Thursday. Enter the following expression:

```
if(equals(outputs('Compose_1'),4), 'You chose a Thursday', 'You didn't choose a Thursday')
```

For February 9, 2024 this will return the string "You didn't choose a Thursday."

This example is a typical build pattern for a complex expression, building piece by piece in separate steps. Now that you have all of the necessary functions worked out, add another Compose step. In the new Compose, write one large expression that does everything in one step. The expression looks like:

```
if(equals(dayOfWeek(addDays(triggerBody()['date'], triggerBody()['number'])),4), 'You chose a Thursday', 'You did not choose a Thursday' )
```

The output for February 9, 2024 will be the string "You didn't choose a Thursday." If this is what you're expecting, you can then remove all of the preliminary compose actions from the flow to clean it up.

Congratulations. You wrote a complex expression by doing small steps and then putting it all together in the end.
