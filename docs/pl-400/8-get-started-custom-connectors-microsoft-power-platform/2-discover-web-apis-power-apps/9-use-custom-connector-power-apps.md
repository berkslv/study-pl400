# Exercise - Use the custom connector in Power Apps canvas app

Completed

- 8 minutes

You've created the connector, tested it, and now you'll learn how to use it in a canvas app.

Note

Power Apps requires either an Microsoft 365 license or a free trial. Learn more about your licensing options. [Microsoft products include Microsoft Power Apps and Power Automate](/en-us/power-apps/administrator/pricing-billing-skus/?azure-portal=true).

## Create a canvas app

1. First of all, create a blank canvas app. In Power Apps studio go to the `Create` menu at the left-hand side and click the `Canvas app from blank` panel.

    ![Create Power Apps](media/08-use-custom-connector-in-power-apps-01.png)
2. When a modal pops up, give the name, **Inventory**, to the `App name` field and leave the format as default. Then click the `Create` button.

    ![Create Power Apps Modal](media/08-use-custom-connector-in-power-apps-02.png)
3. Navigate the `Data` menu to add the custom connector. You will see nothing in the Data pane.

    ![Data Pane](media/08-use-custom-connector-in-power-apps-03.png)
4. Click the `Add data` button and enter **inventory** in the search box, and you will see the `InventoryManager` custom connector. *(Assuming you named your custom connector `InventoryManager`.)*

    ![Custom Connector Search](media/08-use-custom-connector-in-power-apps-04.png)
5. Click the `InventoryManager` connector, and you will see the `InventoryManagement` connection.

    ![Connection Added](media/08-use-custom-connector-in-power-apps-05.png)
6. Your custom connector is successfully added to your Power Apps. Navigate to the `Insert` menu at the top and click `Button` to add a button control onto the canvas.

    ![Add Button](media/08-use-custom-connector-in-power-apps-06.png)
7. While `Button1` is selected, choose the property value to **OnSelect** and enter the function formula below. `InventoryManagement` represents the custom connector and `getapiwarehouselocations()` represents an API endpoint. The `warehouses` collection stores the result that the `getapiwarehouselocations()` function returns.

    ```powerappsfl
    ClearCollect(warehouses, InventoryManagement.getapiwarehouselocations())
    ```

    ![Add Formula](media/08-use-custom-connector-in-power-apps-07.png)
8. Click `Gallery` and select the `Vertical` control.

    ![Add Vertical Gallery](media/08-use-custom-connector-in-power-apps-08.png)
9. Once the `Vertical` control is added, it asks the data source.

    ![Vertical Gallery  Added](media/08-use-custom-connector-in-power-apps-09.png)
10. Select the `warehouses` collection declared above. Then the `Vertical` control changes below because the `warehouses` collection currently contains nothing.

    ![Vertical Gallery Data Source Mapped](media/08-use-custom-connector-in-power-apps-10.png)
11. While holding your `Alt` key on Windows (or `Option` key on Mac), click the `Button` button, and you will see the list of warehouse locations showing up in the `Vertical` control.

    ![Custom Connector Result in Vertical Gallery](media/08-use-custom-connector-in-power-apps-11.png)

You have successfully included the custom connector into your Power Apps app.
