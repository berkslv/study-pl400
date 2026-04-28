# Exercise - Create a custom connector from Azure API Management

- 8 minutes

In this exercise, you're going to create a custom connector by exporting an API from Azure API Management.

In the VanArsdel fusion development scenario, Maria needs to display warehouse locations in her Power Apps application. Kiana and her development team have built several web APIs one of which returns the warehouse locations.

The web APIs are served through [Azure API Management](https://learn.microsoft.com/en-us/azure/api-management/api-management-key-concepts), which has the ability to create custom connectors for any web APIs it hosts. With the custom connector, Maria's Power Apps app will be able to call the warehouse location API in Azure API Management.

> **Note:** If you want to use Azure API Management and Power Apps throughout the exercises in this module you will need to:
> 1. [Download the artifacts](https://github.com/MicrosoftDocs/mslearn-developer-tools-power-platform/blob/master/fusion-developers/artifacts.zip), unzip the archive, and provision and deploy them to API Management using the instructions included in the README file.
> 2. Ensure that you have the right Power Apps licensing. You can sign up for a free Power Platform [developer environment](https://learn.microsoft.com/en-us/power-platform/developer/create-developer-environment), or use an existing Microsoft 365 license (or a free trial).

## Export a web API from API Management to a custom connector

1. You need a subscription key in order for Power Apps to access any web API hosted in API Management. Go to the **Subscriptions** blade, select the three dots (`...`) and select the **Show/hide keys** menu.
2. Copy the subscription key from either **Primary key** or **Secondary key**.
3. To generate a custom connector from Azure API Management, go to the **APIs** blade and select an appropriate API under the **All APIs** section (e.g., **Inventory Management**). You'll be able to see the API for the warehouse locations.
4. Select the three dots (`...`), and from the context menu select **Export**.
5. Select the **Power Apps and Power Automate** panel at the right bottom corner.
6. Choose your Power Apps environment for the custom connector to publish and give the display name **InventoryManager**. Then select the **Export** button at the bottom.

The inventory management APIs have been exported to Power Apps.

## Create a connection to the custom connector

You need to create a connection to the custom connector in order to use it. Generally speaking, creating the connection requires authentication to the web APIs.

1. After logging into [Power Apps](https://powerapps.microsoft.com/) dashboard, open the **Data** blade and select the **Custom Connectors** menu on the left-hand side. Then, select the **+** button on the right-hand side.
2. When a pop-up modal shows up, you'll see the API Key field enabled. Enter the API key copied at the beginning of this unit. Then select the **Create** button.
3. Go to the **Connections** menu, and you'll see the new connection has been created.

You have completed creating a custom connector for inventory management.
