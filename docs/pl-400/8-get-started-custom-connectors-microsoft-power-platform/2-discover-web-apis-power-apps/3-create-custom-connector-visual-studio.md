# Exercise - Create a custom connector from Visual Studio

Completed

- 5 minutes

In this exercise, you'll create a custom connector in your Power Platform environment from your web API in Visual Studio.

Power Platform enables web API developers to quickly build mobile or web applications using a Power Apps canvas app as a front end. With the Power Platform Connected Service in Visual Studio 2022, ASP.NET web API developers can easily create a custom connector for use with Power Apps.

Note

If you want to use Visual Studio and Power Apps in this exercise, you will need to:

- Install Visual Studio 2022 with the ASP.NET and web development workload installed. You need to be signed in to Visual Studio to create and use dev tunnels. The feature is not available in Visual Studio for Mac.
- Create a free Power Platform [developer environment](/en-us/power-platform/developer/create-developer-environment).
- Download the samples.

## Add Power Platform as a connected service

1. Open this [sample API from GitHub](https://github.com/marcelbf/CitiesDemo) with Visual Studio. This is an ASP.NET Core Web API project.
2. In your project, from **Solution Explorer**, right-click the **Connected Services** node and select **Add &gt; Microsoft Power Platform**

[![Screenshot of the connected services to add. Focus is on the Microsoft Power Platform option.](media/create-custom-connector-visual-studio-1.png)](media/create-custom-connector-visual-studio-1.png)
3. Select or input the following values:

    - **Power Platform environments**: `select your developer environment`
    - **Power Platform Solutions**: `Common Data Service Default Solution`
    - **Custom Connector**: select the + icon and enter `InventoryLocations_Connector`

[![Screenshot of the connected services configuration.](media/create-custom-connector-visual-studio-2.png)](media/create-custom-connector-visual-studio-2.png)
4. For the field **Select a public dev tunnel**, select the + icon and the following values:

    - **Name**: `devtunnel`
    - **Tunnel Type**: `Persistent`
    - **Access**: `Public`

[![Screenshot of the dev tunnel configuration.](media/create-custom-connector-visual-studio-3.png)](media/create-custom-connector-visual-studio-3.png)
5. Select **OK** and **Finish**. Once the connected service is configured, you may select **Close**.

[![Screenshot of the connected service configuration process completing.](media/create-custom-connector-visual-studio-4.png)](media/create-custom-connector-visual-studio-4.png)

You have now created a custom connector for inventory locations, which leverages [dev tunnels](/en-us/aspnet/core/test/dev-tunnels) to connect your API to Power Platform. Here in the inner loop you're running your API in your local environment.

## Run your API

When Visual Studio runs a web app and a tunnel is active, the web browser opens to a tunnel URL instead of a localhost URL.

1. Run your Visual Studio solution and start debugging.

[![Screenshot of the debug run icon.](media/create-custom-connector-visual-studio-5.png)](media/create-custom-connector-visual-studio-5.png)
2. When the browser opens, a warning page opens with the first request sent to the tunnel URL. Select **Continue**.

[![Screenshot of the initial warning page.](media/create-custom-connector-visual-studio-6.png)](media/create-custom-connector-visual-studio-6.png)

Important

Remember to keep the API running (in a browser tab) while building your Power App.

## Create an app from the API

Note

To use the sample app provided in this step, you will need to install [Power Platform tools for Visual Studio Code.](https://marketplace.visualstudio.com/items?itemName=microsoft-IsvExpTools.powerplatform-vscode)

1. Open Visual Studio Code and create a new authentication for your user using the Power Platform CLI command. Change the url to your developer environment URL found in the [admin center](https://admin.powerplatform.microsoft.com/environments).

    ```powershell
    pac auth create --url https://yourenvironment.crm.dynamics.com
    ```
2. Get the custom connector you created. Copy the connector ID.

    ```powershell
    pac connector list
    ```
3. Generate a canvas app (\*.msapp file), based on the operations of your API.

    ```powershell
    pac canvas create --connector-id your connector id --msapp your file name.msapp
    ```

## Preview the app

1. Open [Power Apps.](https://make.powerapps.com/templates)
2. Select **Blank app**. From **Canvas app from blank** select **Create**.

[![Screenshot of the Create app wizard.](media/create-custom-connector-visual-studio-7.png)](media/create-custom-connector-visual-studio-7.png)
3. Enter the app name `Inventory app` and select **Tablet** format. Select **Create**.

[![Screenshot of the Create app wizard to input an app name.](media/create-custom-connector-visual-studio-8.png)](media/create-custom-connector-visual-studio-8.png)
4. From the command bar, select **...** and **Open**.

[![Screenshot of how to open an existing app.](media/create-custom-connector-visual-studio-9.png)](media/create-custom-connector-visual-studio-9.png)
5. Browse to open the \*.msapp file you created in Step 3. This will load your sample app in the studio.

[![Screenshot of the Browse files option.](media/create-custom-connector-visual-studio-10.png)](media/create-custom-connector-visual-studio-10.png)
6. From the left bar, select the data icon and **Add data**. Search for `InventoryLocations_Connector` to select **Connect**. This is the custom connector that was created from the web API.

[![Screenshot of how to add the customer connector.](media/create-custom-connector-visual-studio-11.png)](media/create-custom-connector-visual-studio-11.png)
7. To preview this app, select the play icon.

[![Screenshot of the app preview icon.](media/create-custom-connector-visual-studio-12.png)](media/create-custom-connector-visual-studio-12.png)
8. Select the **GET** app button to view a list of inventory locations.

[![Screenshot of the app preview.](media/create-custom-connector-visual-studio-13.png)](media/create-custom-connector-visual-studio-13.png)
9. Select the close icon on the top-right of the app to return to the Studio. Select the publish icon to save your work.

[![Screenshot of the publish icon.](media/create-custom-connector-visual-studio-14.png)](media/create-custom-connector-visual-studio-14.png)

Tip

- Not returning any countries/regions from the sample API? Make sure the API is running as you build your app.
- Since you are using dev tunnels here, you can iterate on your API in real-time, including debugging and hot reload.

You have completed creating an app and custom connector from a web API.
