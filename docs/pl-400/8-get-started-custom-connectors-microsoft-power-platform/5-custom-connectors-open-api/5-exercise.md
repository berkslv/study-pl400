# Exercise - Use OpenAPI extensions

In this exercise, you'll be configuring OpenAPI extensions on the Contoso Invoicing custom connector. You'll implement the following extensions:

- **Test connection** - To validate that the entered API key is valid.
- **Dynamic values** - To make input of **Invoice Type ID** a drop-down list of values from the API.
- **Dynamic schema** - To only show the parameters that are valid for the selected invoice type.

> **Important:** Use a test environment with Microsoft Dataverse provisioned. If you do not have one, you can sign up for the [community plan](https://powerapps.microsoft.com/communityplan/).

> **Note:** Download the following file to your local computer to complete this exercise: [Contoso Invoicing Triggers](https://github.com/MicrosoftDocs/mslearn-developer-tools-power-platform/blob/master/power-automate-connectors/ContosoInvoicingTriggers_1_0_0_0.zip). Select the download button on the middle-right of the screen.

## Task 1: Import solution

In this task, you'll import an unmanaged solution that contains a Contoso Invoicing custom connector and then test the connector. You'll use this connector to complete the tasks in this exercise.

1. Go to [Power Apps maker portal](https://make.powerapps.com/) and make sure that you are in the correct environment.
2. Select **Solutions > Import solution**.
3. Select **Browse**.
4. Select the **ContosoInvoicingExtensions\_1\_0\_0\_0.zip** solution and then select **Open**.
5. Select **Next**.
6. Select **Import** and then wait for the import to complete. You should get a success message after the import completes.
7. Select **Publish all customizations** and then wait for the publish to complete.
8. Open the **Contoso Invoicing - Extensions** solution that you imported.

   You should see the **Contoso Invoicing - Extensions** custom connector component.

9. Select the **Contoso Invoicing - Extensions** connector and then select **Edit**.
10. Start a new browser window and then go to [Contoso Invoicing](https://contosoinvoicingtest.azurewebsites.net/).
11. Select the **API Key** link.
12. Copy the **API Key**. Save this key on a notepad; you'll need it for future tasks.
13. Return to the connector, select the **Test** tab, and then select **+ New connection**.
14. Paste the key that you copied in the **API Key** field and then select **Create connection**.
15. Select **Refresh** connections.
16. Scroll down to the **Operations** section, select **ListInvoiceTypes**, and then select **Test operation**.

    You should get a response containing invoice types. Later, you'll use this operation to implement the **Dynamic Values** extension for the **Invoice Type** parameter.

17. Don't navigate away from this page.

## Task 2: Add the test connection extension

In this task, you'll add the test connection extension:

1. Turn on the **Swagger Editor** toggle switch.
2. Add the following fragment after the **produces: []** and then select **Update connector**. Make sure that the text indentation matches the image.

   ```yaml
   x-ms-capabilities:
     testConnection:
       operationId: ListInvoices
       parameters: {}
   ```

3. Select **+ New connection** again.
4. Enter your name or other random value for **API Key** and then select **Create connection**.

   The connection creation should fail.

5. Provide the API key that you copied in Task 1 into the **API Key** field and then select **Create connection**.

   The connection creation should now succeed.

6. Don't navigate away from this page.

## Task 3: Configure dynamic values for invoice type ID

In this task, you'll configure dynamic values for invoice type ID:

1. Select the **Definition** tab.
2. Select **AddInvoice** from the **Actions** section.
3. Scroll down, select the ellipsis (**Chevron**) button of the **typeId** parameter, and then select **Edit**.
4. Enter **Invoice Type** for **Summary**, enter **1** for **Default value**, and then select **Yes** for **Is required**.
5. Scroll down and select **Dynamic** for **Dropdown type**.
6. Select **ListInvoiceTypes** for **Operation ID**, select **typeId** for **Value**, and then select **name** for **Value display name**.
7. Select **Update connector**.
8. Turn on the **Swagger Editor** toggle switch.
9. If you get hash key errors, close the connector browser tab, and then reopen it in edit mode.
10. Locate AddInvoice and see if **x-ms-dynamic-values** was added.
11. Don't navigate away from this page.

## Task 4: Configure the dynamic schema extension

In this task, you'll configure the dynamic schema extension:

1. Select the **Test** tab.
2. Select the **GetInvoiceSchema** operation and then select **Test operation**.
3. Review the response. This response is what an API needs to return to allow **Dynamic Schema** to be configured.
4. Turn on the **Swagger Editor** toggle switch.
5. Locate the **CreateInvoiceRequest** line and replace the **invoice** line with the following Swagger text:

   **Before:**
   ```yaml
   invoice:
     $ref: '#/definitions/Invoice'
   ```

   **After (make sure indentations match):**
   ```yaml
   Invoice:
     x-ms-dynamic-properties:
       operationId: GetInvoiceSchema
       parameters:
         typeId: {parameterReference: typeId}
   ```

6. Turn off the **Swagger Editor** toggle switch.
7. Select the **Definition** tab.
8. Select the **GetInvoiceSchema** action and then select **internal** for **Visibility**.
9. Select **Update connector**.

## Task 5: Test connector

In this task, you'll test the connector:

1. Go to [Power Automate](https://flow.microsoft.com/) and make sure that you are in the correct environment.
2. Select **Solutions** and then open the **Contoso Invoicing - Extensions** solution.
3. Select **+ New** and then select **Automation > Cloud flow > Instant**.
4. Enter **Dynamic metadata** as the Flow name, select **Manually triggered a flow** for trigger, and then select **Create**.
5. Select **+ New step**.
6. Select the **Custom** tab and then select **Contoso Invoicing - Extensions**.
7. Select **AddInvoice** for action.
8. Enter **My connection** for name, enter your name for **API Key**, and then select **Create**. The connection test should fail.
9. Provide the API key that you copied in Task 1 in the **API Key** field and then select **Create** again.

   The connection should be created successfully.

10. In the **Invoice Type** drop-down menu, select **Purchase Order**.

    The **Purchase Order** field should now be visible.

11. Change the **Invoice Type** to **Non - Purchase Order**.

    The **Purchase Order** field should no longer be visible.

12. Save the flow.
