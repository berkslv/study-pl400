# Exercise - Create a custom connector from an OpenAPI document

- 5 minutes

In this exercise you'll learn how to create a custom connector from an OpenAPI document.

> **Note:** To complete this exercise you will need a Power Apps license, an `openapi.json` file and an API access key.
>
> Power Apps requires either a Microsoft 365 license or a free trial.
>
> The `openapi.json` file can be found on [GitHub here](https://github.com/MicrosoftDocs/mslearn-developer-tools-power-platform/blob/master/fusion-developers/artifacts.zip). Unzip the archive, and the `openapi.json` will be included.
>
> The API access key has already been obtained from the previous exercise unit.

## Create a custom connector from an OpenAPI document

There are several ways of creating a custom connector for Power Apps. In this exercise, you will create one using an OpenAPI document. Suppose you have an OpenAPI document named `openapi.json` and an API access key provided by the professional development team.

1. After logging into [Power Apps](https://powerapps.microsoft.com/) dashboard, open the **Data** blade and click the **Custom Connectors** menu on the left-hand side. Then, click the **+ New custom connector** button at the right-top corner and select the **Import an OpenAPI file** menu.
2. When a pop-up modal appears, give the name **InventoryManager** to the **Connector name** field and click the **Import** button to import the OpenAPI document, `openapi.json`. Then, click the **Continue** button.
3. As the OpenAPI document has everything you need to create the custom connector, click the **Create connector** button at the right-top corner.
4. Once the custom connector is created, you will see the message **Custom connector has been successfully created** at the top of the screen.
5. Click the **Custom Connectors** menu on the left-hand side of the page, and you will see the custom connector created. Select the **+** button on the right-hand side.
6. When a pop-up modal shows up, you will see the API Key field. Enter the API key for the web API, which is usually obtained from the web API's developers. Then click the **Create** button.
7. Go to the **Connections** menu, and you will see the new connection has been created.

A new custom connector from the OpenAPI document is now created and ready to be used within a Power Apps application.
