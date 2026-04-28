# Exercise - Create a new connector in a solution

In this exercise, you create your first custom connector for an existing API called Contoso Invoicing.

> **Important:** Use a test environment with Microsoft Dataverse provisioned. If you don't have a test environment, you can sign up for the [Power Apps Community Plan](https://powerapps.microsoft.com/communityplan/).

## Task 1: Review the API

To review the API, follow these steps:

1. Go to [Contoso Invoicing](https://contosoinvoicingtest.azurewebsites.net/).
2. Select the documentation link.
3. Review the available operations.
4. Select to expand and review each operation.
5. Close the documentation browser tab or window.
6. Select the **Open API definition** link.
7. Right-click and select **Save as**.
8. Save the file locally. You use this file later in the exercise.
9. Close the definition browser tab or window.
10. Select the **API Key** link.
11. Copy and save your API key because you need it later.
12. Select **Return to home**.
13. Select **Download Logo**.
14. Save the logo image locally; you use it later.

## Task 2: Create a new solution

To create a new solution, follow these steps:

1. Go to [Power Apps maker portal](https://make.powerapps.com/) and make sure that you are in the correct environment.
2. Select **Solutions > + New solution**.
3. Enter **Contoso invoicing** for the **Display name**, select **CDS Default Publisher** for **Publisher**, and then select **Create**. When you're working on a real project, it's best to create your own publisher.
4. Don't navigate away from this page after selecting **Create**.

## Task 3: Create a new connector

To create a new connector, follow these steps:

1. Open the **Contoso invoicing** solution that you created.
2. Select **+ New > Automation > Custom connector**.
3. Enter **Contoso invoicing** for the **Connector name** and then select to **Upload** the image.
4. Select the connector logo image that you downloaded in **Task 1: Review the API**.
5. Enter **#175497** for **Icon background color**.
6. Enter **contosoinvoicingtest.azurewebsites.net** for **Host**.
7. Select **Create connector**.
8. Don't navigate away from this page.

## Task 4: Import the OpenAPI definition

To import the OpenAPI definition, follow these steps:

1. Select the arrow next to **Connector Name**.
2. Select the ellipsis (**...**) button of the connector and then select **Update from OpenAPI file**.
3. Select **Import**.
4. Select the **swagger.json** file that you downloaded in **Task 1: Review the API** and then select **Open**.
5. Select **Continue**.
6. Fill in the host URL as **`contosoinvoicingtest.azurewebsites.net`** and then select **Security**.
7. Notice that the field is filled out from the imported file.
8. Don't navigate away from this page.

## Task 5: Review and adjust definitions

To review and adjust definitions, follow these steps:

1. Select the **Definition** tab.
2. Take a few minutes to review the operations that were imported.
3. Notice the blue information icon next to **GetInvoice** that indicates there's something that needs attention.
4. Select the **GetInvoice** operation.
5. Notice that the operation indicates a missing **Summary**.
6. Enter **Get Invoice** as the **Summary** to improve the usability.
7. Notice the blue information circle on the **PayInvoice** operation and that it indicates a missing **Description**.
8. Enter **Pay an invoice** as the **Description**.
9. Delete both **NewInvoice** operations because you don't use them.
10. Select the **GetInvoiceSchema** operation.
11. Modify the **Visibility** option to **internal** so that people don't see it in their action list.
12. Select **Update connector**.
13. Don't navigate away from this page.

## Task 6: Test the connector

To test the connector, follow these steps:

1. Select the **Test** tab.
2. Select **+ New connection**.
3. Paste in the **API Key** that you saved in **Task 1: Review the API** and then select **Create connection**.
4. Select the **Refresh** button.
5. Select **ListInvoiceTypes > Test Operation**.

> You should see some invoice data in the body area.
