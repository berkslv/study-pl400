# Exercise - Creating a manual flow and using expressions

Completed

- 6 minutes

Let's say you need to find out how much it would cost to carpet a room based on its square footage. In this exercise, you create a manual flow that uses your input to do those calculations.

1. Sign into [Power Automate](https://flow.microsoft.com/?azure-portal=true).
2. In the Copilot box, type *Create an instant flow with two compose actions*. Then select **Generate**.

[![Screenshot of select manually trigger a flow.](media/trigger-flow.svg)](media/trigger-flow.svg#lightbox)
3. Copilot automatically generates a flow. Review the flow to make sure it has a *Manually trigger a flow* trigger and two *Compose* actions.
4. Select the **Manually trigger a flow** trigger. The properties pane expands on the left. Select **Add an input**.
5. Choose **Number** and name it **Square Footage**.
6. Select **Add an input**, choose **Number** again, and name it **Cost**. This input will represent the cost per square foot.
7. Select the first **Compose** action.
8. Select the **Inputs** field and notice the blue button with a lightning bolt on top and *fx* on the bottom appears on the right side of the input field. Select ***fx*** to bring up the expression editor.
9. In the formula input field, type in `mul(`. Power Automate knows that you're using the multiply expression and automatically adds a `)` at the end for you.
10. Select the **Dynamic content** tab below the formula input field in the expression editor.
11. Place your cursor between the two parentheses in the expression field and select **Square Footage** from the dynamic content. You can also begin entering "square" into the Search field, and the dynamic content will filter to *Square Footage*. When you do, notice your formula adds the referencing function `triggerBody()?['number']` to your formula.

    Tip

    If you don't see Square Footage, select **See More** next to the action's title in the Dynamic Content box to show more property options.
12. To complete our *mul* formula, add a comma (,) and find/choose **Cost** in the dynamic content.
13. The complete expression should look like this:

    ```
    mul(triggerBody()?['number'],triggerBody()?['number_1'])
    ```

    In this expression, *number* indicates the first input for our trigger (the square footage), and *number\_1* refers to the second trigger input (the cost).
14. Select **Add** to save the expression into the Compose step.

[![Screenshot of add the expression into the Compose step.](media/add-expression.svg)](media/add-expression.svg#lightbox)
15. You know your expression is correct if it's added into the Compose step. If you hover over it you should see code resembling the image below (which matches what we just saved):

[![Screenshot of correct expression in Compose step.](media/correct-expression.png)](media/correct-expression.png#lightbox)

    This Compose step will now calculate the square footage of the area multiplied by the cost per square foot based upon inputs you provide. However, we still need to convert the final result to currency to get the output we desire.
16. Select the second Compose action and select the **Inputs** field. Select the blue *fx* button to open the expression editor.
17. Place your cursor in the edit field and type in **formatNumber(**.
18. With your cursor between the parentheses, select the **Dynamic content** tab and choose **Outputs** from the previous Compose step.
19. Next finish the expression with **, 'C2'**.

    The C formats the number as currency, with the 2 representing how many decimal places. Refer to [Standard numeric format strings](/en-us/dotnet/standard/base-types/standard-numeric-format-strings/?azure-portal=true) for more number formats.
20. The complete expression is:

    ```
    formatNumber(outputs('Compose'), 'C2')
    ```

    Important

    You may need to rename your *Compose*. In our example images, Copilot named the first Compose in the flow as *Compose1*. In your flow, Copilot may have named the first Compose without the '1' (such as our formula above). If this is the case, remove the 1 in Compose1 in your formula.
21. Select **Add** to save this expression in the inputs of the second Compose step.

[![Screenshot of add expression to Compose 2 step.](media/add-expression-compose.svg)](media/add-expression-compose.svg#lightbox)

    Now after our flow is triggered, it first multiplies the two numbers, then converts the result into the correct currency format. This gives you a quick way to get the cost associated with carpeting a room.
22. Your completed flow should look similar to this:

[![Screenshot of completed flow with Manually trigger a flow, Compose1, and Compose 2.](media/complete-flow.svg)](media/complete-flow.svg#lightbox)
23. In the top-right of the flow editor, select the **Save** button. Once it's saved select **Test**.
24. Choose **Manually**, and then select **Test**.
25. Enter the two number inputs, **Square Footage** and **Cost**, and then select **Run flow** at the bottom. Select **Done** to continue.
26. The page reloads, and you will see green check marks next to each step of your flow.
27. Selecting each step expands the details, showing you the inputs and outputs of each step.
28. Selecting the first Compose shows the multiplied value of the two numbers you entered, while selecting the second Compose shows the currency format of that multiplied value.

Great job on using expressions in your flow! Let's recap the steps we used in this exercise.

**Manually trigger a flow** - Allowed us to press a button to trigger a flow, and then enabled us to provide manual inputs. In this case our two inputs were *Square Footage* and *Cost* (per square foot), which we're using to find out the total price to carpet a room.

**Compose** - We used this action to write expressions using the data input into in the flow. First, we multiplied the two inputs from the trigger. This gave us the correct result numerically, but we still needed to convert it to currency. We then used another Compose action to format the multiplied result into currency, giving us the answer to how much it would cost to carpet a room.

Hopefully, you now feel confident that you can use expressions to manipulate data in your flow. If not, please review the content in the previous units. Then proceed to the knowledge check so you can complete this module.
