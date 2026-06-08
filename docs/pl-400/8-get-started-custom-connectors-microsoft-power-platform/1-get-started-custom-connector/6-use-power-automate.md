# Exercise - Use a connector from Power Automate

Completed

- 4 minutes

In this exercise, you create a manually triggered Power Automate cloud flow that uses the Contoso invoicing custom connector that you created in the previous exercise in this module.

Important

Complete the **Exercise: Create a new connector in a solution** unit before starting this exercise.

### Task 1: Create a Power Automate cloud flow

In this task, you create a Power Automate flow inside the Contoso invoicing solution that you previously created.

Note

If you still have the API key from the previous unit, it would still be usable at this time. If not, you can get a new one.

1. Get an API key from [Contoso Invoicing](https://contosoinvoicing.azurewebsites.net/?azure-portal=true).

[![Screenshot of the API key buttons.](media/contoso-invoicing.png)](media/contoso-invoicing.png#lightbox)
2. Select the **API Key** link.
3. Copy and save your API key because you need it later.
4. Go to [Microsoft Power Platform maker portal](https://make.powerapps.com/?azure-portal=true) and select the environment that you used in the **Exercise: Create a new connector in a solution** unit.
5. Select **Solutions** and then select to open the **Contoso invoicing** solution.
6. Select **+ New &gt; Automation &gt; Cloud flow &gt; Instant**.

[![Screenshot that shows the selection of a new cloud flow button.](media/cloud.png)](media/cloud.png#lightbox)
7. Name the flow **Email invoice list**, select **Manually trigger a flow**, then **Create**.

[![Screenshot that shows the selection of the manual trigger for a cloud flow.](media/manually.png)](media/manually.png#lightbox)
8. Select **+ New step**.
9. Select the **Custom** tab and then select the **Contoso invoicing** custom connector. Using the **Custom** tab to locate custom connectors is the fastest way to find them.

[![Screenshot of an arrow pointing to the contoso invoicing custom connector.](media/choose.png)](media/choose.png#lightbox)
10. Select **List invoices** for the action.

[![Screenshot of Create connection.](media/list-invoices-action.png)](media/list-invoices-action.png#lightbox)
11. Enter **Invoice connection** as Connection name.
12. Paste your API Key. and select **Create**

    Important

    Leave the **List Invoices** fields blank. This will allow us to pull all the information.
13. Select **Flow checker** to confirm there are no mistakes.
14. Select **Save**.
15. Select the arrow button located next to the flow name to go back to the solution with the flow.
16. Select **OK** if prompted.
17. Don't navigate away from this page.

### Task 2: Test the cloud flow

In this task, you test the cloud flow that you created in **Task 1: Create a Power Automate cloud flow**.

1. Open the **Email invoice list** cloud flow if not already open.
2. Select **Run**.
3. Select **Continue**.
4. Select **Run flow**.
5. Select **Done**.
6. Refresh the run history.

    The flow run should succeed.

[![Screenshot of an arrow pointing to the refresh run history button.](media/succeed.png)](media/succeed.png#lightbox)

When you open the flow, it opens in the copilot power automate designer. Select the **List Invoices** action and on the left hand side, scroll down to the **Outputs** section and then select **Show raw outputs**. A panel from the right hand side pops out so you can see the invoice information more clearly.

[![Screenshot of copilot designer flow run outputs.](media/flow-run.svg)](media/flow-run.svg#lightbox)
