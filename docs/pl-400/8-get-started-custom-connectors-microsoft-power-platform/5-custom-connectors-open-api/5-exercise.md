# Exercise - Use OpenAPI extensions

Completed

- 8 minutes

In this exercise, you'll be configuring OpenAPI extensions on the Contoso Invoicing custom connector. You'll implement the following extensions:

- **Test connection** - To validate that the entered API key is valid.
- **Dynamic values** - To make input of **Invoice Type ID** a drop-down list of values from the API.
- **Dynamic schema** - To only show the parameters that are valid for the selected invoice type.

Important

Use a test environment with Microsoft Dataverse provisioned. If you do not have one, you can sign up for the [community plan](https://powerapps.microsoft.com/communityplan/?azure-portal=true).

Note

Download the following file to your local computer to complete this exercise [Contoso Invoicing Triggers](https://github.com/MicrosoftDocs/mslearn-developer-tools-power-platform/blob/master/power-automate-connectors/ContosoInvoicingTriggers_1_0_0_0.zip). Select the download button on the middle-right of the screen.

## Task 1: Import solution

In this task, you'll import an unmanaged solution that contains a Contoso Invoicing custom connector and then test the connector. You'll use this connector to complete the tasks in this exercise.

1. Go to [Power Apps maker portal](https://make.powerapps.com/?azure-portal=true) and make sure that you are in the correct environment.
2. Select **Solutions &gt; Import solution**.
3. Select **Browse**.
4. Select the **ContosoInvoicingExtensions\_1\_0\_0\_0.zip** solution and then select **Open**.
5. Select **Next**.
6. Select **Import** and then wait for the import to complete. You should get a success message after the import completes.
7. Select **Publish all customizations** and then wait for the publish to complete.
8. Open the **Contoso Invoicing - Extensions** solution that you imported.

    You should see the **Contoso Invoicing - Extensions** custom connector component.
9. Select the **Contoso Invoicing - Extensions** connector and then select **Edit**.

[![Screenshot of an arrow pointing to the Edit solution button.](media/edit.png)](media/edit.png#lightbox)
10. Start a new browser window and then go to [Contoso Invoicing](https://contosoinvoicingtest.azurewebsites.net/?azure-portal=true).
11. Select the **API Key** link.
12. Copy the **API Key**. Save this key on a notepad; you'll need it for future tasks.
13. Return to the connector, select the **Test** tab, and then select **+ New connection**.

[![Screenshot of the add new connection button.](media/new-connection.png)](media/new-connection.png#lightbox)
14. Paste the key that you copied in the **API Key** field and then select **Create connection**.
15. Select **Refresh** connections.
16. Scroll down to the **Operations** section, select **ListInvoiceTypes**, and then select **Test operation**.

[![Screenshot of an arrow pointing to the Test operation button.](media/test-operation.png)](media/test-operation.png#lightbox)

    You should get a response containing invoice types. Later, you'll use this operation to implement the **Dynamic Values** extension for the **Invoice Type** parameter.

[![Screenshot of the response body content displayed.](media/invoice-types-response.png)](media/invoice-types-response.png#lightbox)
17. Don't navigate away from this page.

## Task 2: Add the test connection extension

In this task, you'll add the test connection extension:

1. Turn on the **Swagger Editor** toggle switch.

[![Screenshot of the turn on swagger editor toggle button.](media/swagger-editor-on.png)](media/swagger-editor-on.png#lightbox)
2. Add the following fragment after the **produces: []** and then select **Update connector**. Make sure that the text indentation matches the following image.

    ```
    x-ms-capabilities:
       testConnection:
         operationId: ListInvoices
         parameters: {}
    ```

    Make sure the indentation looks like the image below.

[![Screenshot of an arrow pointing to the Update connector button.](media/update-connector.png)](media/update-connector.png#lightbox)
3. Select **+ New connection** again.

[![Screenshot of an arrow pointing to the add new connection button.](media/new-connection-again.png)](media/new-connection-again.png#lightbox)
4. Enter your name or other random value for **API Key** and then select **Create connection**.

    The connection creation should fail.

[![Screenshot of the connection failure message.](media/fail-message.png)](media/fail-message.png#lightbox)
5. Provide the API key that you copied in Task 1 into the **API Key** field and then select **Create connection**.

    The connection creation should now succeed.
6. Don't navigate away from this page.

## Task 3: Configure dynamic values for invoice type ID

In this task, you'll configure dynamic values for invoice type ID:

1. Select the **Definition** tab.
2. Select **AddInvoice** from the **Actions** section.
3. Scroll down, select the ellipsis (**Chevron**) button of the **typeId** parameter, and then select **Edit**.

[![Screenshot of an arrow pointing to the edit query parameter button.](media/type-id-edit.png)](media/type-id-edit.png#lightbox)
4. Enter **Invoice Type** for **Summary**, enter **1** for **Default value**, and then select **Yes** for **Is required**.

[![Screenshot of the query parameter properties.](media/required.png)](media/required.png#lightbox)
5. Scroll down and select **Dynamic** for **Dropdown type**.
6. Select **ListInvoiceTypes** for **Operation ID**, select **typeId** for **Value**, and then select **name** for **Value display name**.

[![Screenshot of the properties of the query parameter.](media/type-id-value-name.png)](media/type-id-value-name.png#lightbox)
7. Select **Update connector**.
8. Turn on the **Swagger Editor** toggle switch.
9. If you get hash key errors, close the connector browser tab, and then reopen it in edit mode.
10. Locate AddInvoice and see if **x-ms-dynamic-values** was added.

[![Screenshot of the added dynamic values.](media/dynamic-values-added.png)](media/dynamic-values-added.png#lightbox)
11. Don't navigate away from this page.

## Task 4: Configure the dynamic schema extension

In this task, you'll configure the dynamic schema extension:

1. Select the **Test** tab.
2. Select the **GetInvoiceSchema** operation and then select **Test operation**.

[![Screenshot of an arrow pointing to the test get invoice schema operation button.](media/test-operation-again.png)](media/test-operation-again.png#lightbox)
3. Review the response. This response is what an API needs to return to allow **Dynamic Schema** to be configured.

[![Screenshot of the get invoice schema response.](media/returned-response.png)](media/returned-response.png#lightbox)
4. Turn on the **Swagger Editor** toggle switch.
5. Locate the **CreateInvoiceRequest** line and replace the **invoice** line with the following Swagger text.

    Invoice:

    x-ms-dynamic-properties:

    operationId: GetInvoiceSchema

    parameters:

    typeId: {parameterReference: typeId}

    **Before:**

[![Screenshot of the Swagger text before editing.](media/before.png)](media/before.png#lightbox)

    **After:**

    Make sure that the indentations match the following image.

[![Screenshot of the Swagger text after editing.](media/after.png)](media/after.png#lightbox)
6. Turn off the **Swagger Editor** toggle switch.
7. Select the **Definition** tab.
8. Select the **GetInvoiceSchema** action and then select **internal** for **Visibility**.

[![Screenshot of the get invoice schema action visibility.](media/internal-visibility.png)](media/internal-visibility.png#lightbox)
9. Select **Update connector**.

## Task 5: Test connector

In this task, you'll test the connector:

1. Go to [Power Automate](https://flow.microsoft.com/?azure-portal=true) and make sure that you are in the correct environment.
2. Select **Solutions** and then open the **Contoso Invoicing - Extensions** solution.
3. Select **+ New** and then select **Automation &gt; Cloud flow &gt; Instant**.

[![Screenshot of an arrow pointing to the create new cloud flow button.](media/cloud-flow.png)](media/cloud-flow.png#lightbox)
4. Enter **Dynamic metadata** and Flow name, select **Manually triggered a flow** for trigger, and then select **Create**.
5. Select **+ New step**.
6. Select the **Custom** tab and then select **Contoso Invoicing - Extensions**.
7. Select **AddInvoice** for action.
8. Enter **My connection** for name, enter your name for **API Key**, and then select **Create**. The connection test should fail.

[![Screenshot of an arrow pointing to the custom connector.](media/create.png)](media/create.png#lightbox)

1. Provide the API key that you copied in Task 1 in the **API Key** field and then select **Create** again.

    The connection should be created successfully.
2. In the **Invoice Type** drop-down menu, select **Purchase Order**.

[![Screenshot of an arrow pointing to the Purchase Order invoice type.](media/purchase-order.png)](media/purchase-order.png#lightbox)

    The **Purchase Order** field should now be visible.

[![Screenshot of the custom connector action with Purchase Order field visible.](media/purchase-order-field.png)](media/purchase-order-field.png#lightbox)
3. Change the **Invoice Type** to **Non - Purchase Order**.

    The **Purchase Order** field should no longer be visible.

[![Screenshot of the custom connector action with Purchase Order field hidden.](media/field-removed.png)](media/field-removed.png#lightbox)
4. Save the flow.
