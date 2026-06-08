# Exercise - Create a custom connector from Azure API Management

Completed

- 8 minutes

In this exercise, you're going to create a custom connector by exporting an API from Azure API Management.

In the VanArsdel fusion development scenario, Maria needs to display warehouse locations in her Power Apps application. Kiana and her development team have built several web APIs one of which returns the warehouse locations.

The web APIs are served through [Azure API Management](/en-us/azure/api-management/api-management-key-concepts), which has the ability to create custom connectors for any web APIs it hosts. With the custom connector, Maria's Power Apps app will be able to call the warehouse location API in Azure API Management.

Note

If you want to use Azure API Management and Power Apps throughout the exercises in this module you will need to follow a couple of steps.

The first is to [download the](https://github.com/MicrosoftDocs/mslearn-developer-tools-power-platform/blob/master/fusion-developers/artifacts.zip), unzip the archive, and provision and deploy them to API Management using the instructions included in the README file.

The second is to ensure that you have the right Power Apps licensing. You can sign up for a free Power Platform [developer environment](/en-us/power-platform/developer/create-developer-environment), or use an existing Microsoft 365 license (or a free trial).

## Export a web API from API Management to a custom connector

1. You need a subscription key in order for Power Apps to access any web API hosted in API Management. Go to the `Subscriptions` blade, select the three dots (`...`) and select the `Show/hide keys` menu.

    ![Subscription Blade](media/03-create-custom-connector-with-api-management-01.png)
2. Then, copy the subscription key from either `Primary key` or `Secondary key`.

    ![Copy Subscription Key](media/03-create-custom-connector-with-api-management-02.png)
3. To generate a custom connector from Azure API Management, go to the `APIs` blade and select an appropriate API under the `All APIs` section. In the screenshot, it's **Inventory Management**. Then, you'll be able to see the API for the warehouse locations.

    ![Inventory Management APIs on API Management](media/03-create-custom-connector-with-api-management-03.png)
4. Select the three dots (`...`), and you'll see the context menu. Select the `Export Ô¼ç´©Å` menu.

    ![API Export Menu on API Management](media/03-create-custom-connector-with-api-management-04.png)
5. Select the `Power Apps and Power Automate` panel at the right bottom corner.
6. Choose your Power Apps environment for the custom connector to publish and give the display name, **InventoryManager**. Then select the `Export` button at the bottom.

    ![Export API to Power Apps](media/03-create-custom-connector-with-api-management-06.png)

The inventory management APIs have been exported to Power Apps.

## Create a connection to the custom connector

You need to create a connection to the custom connector in order to use it. Generally speaking, creating the connection requires authentication to the web APIs.

1. After logging into [Power Apps](https://powerapps.microsoft.com/) dashboard, open the `Data` blade and select the `Custom Connectors` menu on the left-hand side. Then, select the `ÔŞò` button on the right-hand side.

    ![New Custom Connector](media/03-create-custom-connector-with-api-management-07.png)
2. When a pop-up modal shows up, you'll see the API Key field enabled. Enter the API key copied at the beginning of this unit. Then select the `Create` button.

    ![New Custom Connector Pop-up Modal](media/03-create-custom-connector-with-api-management-13.png)
3. Go to the `Connections` menu, and you'll see the new connection has been created.

    ![New Connection](media/03-create-custom-connector-with-api-management-14.png)

You have completed creating a custom connector for inventory management.
