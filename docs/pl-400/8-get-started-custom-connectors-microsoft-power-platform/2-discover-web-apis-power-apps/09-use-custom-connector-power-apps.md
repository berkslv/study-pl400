# Exercise - Use the custom connector in Power Apps canvas app

- 8 minutes

You've created the connector, tested it, and now you'll learn how to use it in a canvas app.

> **Note:** Power Apps requires either a Microsoft 365 license or a free trial.

## Create a canvas app

1. First of all, create a blank canvas app. In Power Apps studio go to the **Create** menu at the left-hand side and click the **Canvas app from blank** panel.
2. When a modal pops up, give the name **Inventory** to the **App name** field and leave the format as default. Then click the **Create** button.
3. Navigate the **Data** menu to add the custom connector.
4. Click the **Add data** button and enter **inventory** in the search box, and you will see the `InventoryManager` custom connector. *(Assuming you named your custom connector `InventoryManager`.)*
5. Click the `InventoryManager` connector, and you will see the `InventoryManagement` connection.
6. Your custom connector is successfully added to your Power Apps. Navigate to the **Insert** menu at the top and click **Button** to add a button control onto the canvas.
7. While `Button1` is selected, choose the property value to **OnSelect** and enter the function formula below. `InventoryManagement` represents the custom connector and `getapiwarehouselocations()` represents an API endpoint. The `warehouses` collection stores the result that the `getapiwarehouselocations()` function returns.

   ```powerappsfl
   ClearCollect(warehouses, InventoryManagement.getapiwarehouselocations())
   ```

8. Click **Gallery** and select the **Vertical** control.
9. Once the **Vertical** control is added, it asks the data source.
10. Select the `warehouses` collection declared above. Then the **Vertical** control changes because the `warehouses` collection currently contains nothing.
11. While holding your **Alt** key on Windows (or **Option** key on Mac), click the **Button** button, and you will see the list of warehouse locations showing up in the **Vertical** control.

You have successfully included the custom connector into your Power Apps app.
