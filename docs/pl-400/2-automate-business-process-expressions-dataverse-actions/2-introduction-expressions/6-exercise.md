# Exercise - Creating a manual flow and using expressions

> Module: Introduction to expressions in Power Automate | Unit 6 of 8 | 6 minutes

In this exercise, you create a manual flow that calculates the cost to carpet a room based on square footage and cost per square foot.

## Steps

1. Sign into [Power Automate](https://flow.microsoft.com/).
2. In the Copilot box, type *Create an instant flow with two compose actions*, then select **Generate**.
3. Verify the generated flow has a **Manually trigger a flow** trigger and two **Compose** actions.
4. Select the **Manually trigger a flow** trigger. Select **Add an input**, choose **Number**, and name it **Square Footage**.
5. Select **Add an input** again, choose **Number**, and name it **Cost** (cost per square foot).
6. Select the first **Compose** action. Select the **Inputs** field, then select the ***fx*** button to open the expression editor.
7. In the formula input field, type `mul(`. Power Automate automatically adds the closing `)`.
8. Select the **Dynamic content** tab. Place your cursor between the parentheses and select **Square Footage**.

   > **Tip:** If you don't see Square Footage, select **See More** next to the action's title in the Dynamic Content box.

9. Add a comma (`,`), then select **Cost** from Dynamic content.
10. The complete expression should be:

    ```
    mul(triggerBody()?['number'],triggerBody()?['number_1'])
    ```

    Here, `number` = Square Footage (first trigger input) and `number_1` = Cost (second trigger input).

11. Select **Add** to save the expression.
12. Select the second **Compose** action. Select the **Inputs** field, then select ***fx***.
13. Type `formatNumber(`. With your cursor inside the parentheses, select the **Dynamic content** tab and choose **Outputs** from the previous Compose step.
14. Finish the expression with `, 'C2'`. `C` formats as currency; `2` sets decimal places.
15. The complete expression should be:

    ```
    formatNumber(outputs('Compose'), 'C2')
    ```

    > **Important:** If Copilot named your first Compose as `Compose1`, adjust the formula accordingly (e.g., `outputs('Compose1')`).

16. Select **Add** to save.
17. Select **Save**, then **Test** → **Manually** → **Test**.
18. Enter values for **Square Footage** and **Cost**, then select **Run flow** → **Done**.
19. Expand each step to see inputs and outputs:
    - First Compose: shows the multiplication result (square footage × cost).
    - Second Compose: shows the currency-formatted total.

## Summary

| Step | Action | Purpose |
|------|--------|---------|
| Trigger | Manually trigger a flow | Accept Square Footage and Cost as number inputs |
| Compose 1 | `mul(...)` | Multiply square footage × cost per sq ft |
| Compose 2 | `formatNumber(..., 'C2')` | Format result as currency |
