# Exercise - Use a policy template to dynamically set the host URL

In this exercise, you'll create a policy template to set the host URL at connection creation. This process will allow a connection to work with either test or production.

> **Important:** Use a test environment with Microsoft Dataverse provisioned. If you don't have one, you can sign up for the [community plan](https://powerapps.microsoft.com/communityplan/).

> **Note:** Download the following file to your local computer to complete this exercise: [Contoso Invoicing Triggers](https://github.com/MicrosoftDocs/mslearn-developer-tools-power-platform/blob/master/power-automate-connectors/policy/ContosoInvoicingPolicyTemplates_1_0_0_2.zip). Select the download button on the middle-right of the screen.

## Task 1: Import a solution

In this task, you'll import an unmanaged solution that contains a Contoso Invoicing custom connector.

1. Go to [Power Apps maker portal](https://make.powerapps.com/) and make sure that you are in the correct environment.
2. Select **Solutions > Import solution**.
3. Select **Browse**.
4. Select the **ContosoInvoicingPolicyTemplates_1_0_0_2.zip** solution and then select **Open**.
5. Select **Next**.
6. Select **Import** and then wait for the import to complete. You should get a success message after the import completes.
7. Select **Publish all customizations** and then wait for the publish to complete.
8. Open the **Contoso Invoicing - Policy Templates** solution that you imported.

   You should see the **Contoso Invoicing - Policy** custom connector component.

## Task 2: Install Microsoft Power Platform CLI

Microsoft Power Platform CLI includes the `paconn` command-line tool for custom connector development. The `paconn` tool uses the Python runtime.

1. Go to [Download Python](https://www.python.org/downloads/) and select **Download Python**. You can use any version greater than 3.5.
2. Select the downloaded `.exe` file to start installation.
3. Select the **Add Python xx to Path** check box, select **Install**, and then wait for the installation to complete.
4. Close the installation wizard after the installation completes.
5. Start the command prompt and run the following command to install paconn:

   ```
   pip install paconn
   ```

6. Wait for the installation to complete.

## Task 3: Download the connector locally

In this task, you'll download the connector definition files locally so that you can add the **Host URL** property.

1. Run the login command:

   ```
   paconn login
   ```

2. Copy the provided **Code**.
3. In a browser, sign in with the same credentials as your environment. Go to [Microsoft Device Login](https://microsoft.com/devicelogin/), paste the **Code** that you copied, and then select **Next**.
4. Provide your credentials.
5. Select **Continue**.
6. You should get a successful sign-in message.
7. Go back to the command prompt and run the download command:

   ```
   paconn download
   ```

8. When prompted to select an environment, enter the number for the environment where you installed the solution, and then press the **Enter** key.
9. Only one connector should be listed: **Contoso Invoicing Policy**. Press the **Enter** key again to select that connector.
10. The download should complete successfully. Note the location where the connector was downloaded.

## Task 4: Edit apiProperties.json to add the Host URL property

In this task, you'll edit the `apiProperties.json` file to configure the `hostUrl` property. When the property is configured, users who are creating a connection will be prompted for this value along with the API key.

1. Go to the folder that you downloaded in the previous task, and then open the **apiProperties.json** file.
2. Paste the following JSON inside the **connectionParameters**, before the `api_key` property:

   ```json
   "hostUrl": {
     "type": "string",
     "uiDefinition": {
       "constraints": {
         "required": "true"
       },
       "description": "Specify your API Url e.g. https://test.contoso.com",
       "displayName": "API URL",
       "tooltip": "Specify your API Url e.g. https://test.contoso.com"
     }
   },
   ```

3. Save your changes.
4. Go to the command prompt and change the directory to the folder that you downloaded.
5. Run the update command:

   ```
   paconn update --api-def apiDefinition.swagger.json --api-prop apiProperties.json --icon icon.png
   ```

6. Select the correct environment where you installed the solution.
7. Select the **Contoso Invoicing - Policy** connector.

The update should complete successfully.

## Task 5: Add the Set Host Name policy

In this task, you'll configure a **Set Host Name** policy template to use the connection property that you configured in the previous task.

1. Go to [Power Apps maker portal](https://make.powerapps.com/) and make sure that you have the correct environment selected.
2. Select **Solutions** and then open the **Contoso Invoicing - Policy Templates** solution that you imported.
3. Select the **Contoso Invoicing - Policy** custom connector and then select **Edit**.
4. Select the **Definition** tab.
5. Scroll down to the **Policies** section and then select **+ New policy**.
6. Enter **Host URL Policy** for **Name** and then select **Set host URL** for **Template**.
7. Enter `@connectionParameters('hostUrl')` for **URL Template** and then select **Update connector**.

   The connector should update successfully.

8. Don't navigate away from this page.

## Task 6: Test

In this task, you'll create a connection by using the new configuration and then test it.

1. Start a new browser window and then go to [Contoso Invoicing](https://contosoinvoicingtest.azurewebsites.net/).
2. Select the **API Key** link.
3. Copy the **API Key**.
4. Return to the connector.
5. Select the **Test** tab.
6. Select **+ New connection**.
7. Enter `https://contosoinvoicingtest.azurewebsites.net/` for **API URL**, paste the **API Key** that you copied, and then select **Create connection**.
8. Select **Refresh connections**.
9. Select **ListInvoice > Test operation**.

   The test should return invoices.
