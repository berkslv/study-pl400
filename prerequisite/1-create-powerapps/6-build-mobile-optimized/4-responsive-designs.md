# Create a mobile-optimized app that uses responsive designs

In this exercise, you'll build a mobile-optimized, single-screen app using Microsoft Power Apps and data from Contoso Coffee Machines. This hands-on task helps make it easier to understand how to use auto-layout containers and observe how responsive design behaves across devices.

You'll start from the Power Apps home page. Follow these steps:

1. Download the [App in a Day files](https://github.com/MicrosoftDocs/mslearn-developer-tools-power-platform/raw/master/in-a-day/AIAD/AppinADayStudentFiles.zip) and extract them. Open the Excel file named **Machine-Order-Data.xslx**.
2. Go to **make.powerapps.com**. Select **Create** > **Start with a blank canvas** > **Responsive**. If a welcome popup appears, select **Skip**.
3. In the command bar, select the **Settings** button. If it's not visible, select **App** in the **Tree view** panel to reveal it.
4. In the **Settings** popup panel, select the **Display** tab, then scroll down and make sure the **Scale to fit** option is toggled **Off**. (This switches the **Lock aspect ratio** to **Off**.)
5. Close the **Settings** popup.
6. Create a **New screen** by selecting **+ New screen** in the Tree view pane. Select a **Sidebar** layout for your new screen. Name it `Catalog Screen` by double clicking on the screen name (Screen2), and then typing "Catalog Screen."
7. Create another new screen; for this screen use the **Success** template. Name the new screen `Success Screen`.
8. Delete **Screen1** by clicking on the screen in the Tree view, selecting the ellipsis to the right of the screen, and then selecting **Delete**.
9. Next select the **Catalog Screen's** sidebar container. (You'll need to expand several layers of containers to find the sidebar container.) Add a vertical gallery by selecting **+ Insert** and then **Vertical gallery** with SidebarContainer1 selected.
10. The **Select a data source** pane should automatically open. If it doesn't, select the **Add data** button from the command bar with your gallery control selected in the Tree view pane.
11. Find and select **OneDrive for Business** and create the connection.
12. The **Choose an Excel file** panel appears on the right side of your screen. Select the **Machine-Order-Data.xlsx** file, then select the **Machines** table. Connect the table by selecting **Connect** at the bottom of the panel.
13. You may need to update the data being displayed in your gallery. If the correct fields aren't displaying, follow the next steps.
14. Expand the gallery, and select the title field. In the formula bar, change the Text property for the title text label to:

    ```
    ThisItem.'Machine Name'
    ```

15. Next select the subtitle field. In the formula bar, change the Text property for the subtitle text label to:

    ```
    ThisItem.Price
    ```

16. Then, select the image field. In the formula bar, change the Image property for the image control's Image property to:

    ```
    ThisItem.Photo
    ```

17. In the Tree view, select the drop-down next to the sidebar container to collapse its contents.
18. Select the main container on the right side of your screen, called **MainContainer2**.
19. Select the plus **(+)** icon (or the Insert button from the command bar) to insert an **Edit form**. Select the **Machines** table as the data source.
20. In the Properties panel on the right, select the **Edit fields** option under the Data source.
21. In the **Fields** panel, select **Add field** and add the following fields by checking the box next to each field name in this order: Photo, Machine ID, Machine Name, Color, Description, Feature, Price, Machine Type, Machine Type ID, Avg. Cups/Week, and Avg. Espressos/Week. Then select the **Add** button at the bottom.
22. Close the **Fields** panel.
23. With **Form1** still selected, in the **Property** drop down menu at the top left of the screen, select the **Item** property, and in the formula field input:

    ```
    Gallery1.Selected
    ```

    *(If your gallery isn't named Gallery1, use your actual gallery name.)*

24. With your form still selected, set the **Fill** property to:

    ```
    Color.LightSteelBlue
    ```

25. Select the **HeaderContainer2** control and use the plus **(+)** icon to insert a **Text label** control. Adjust the text label's properties as follows:

    - **Text**: `"Contoso Coffee Catalog"`
    - **Size**: `20`
    - **Height**: `Parent.Height`
    - **Width**: `200`

26. Using the **Align** drop down in the command bar, change the **Align** to **Justify**.
27. Select the Header container outside the text label to deselect. Insert an **Image** control to **HeaderContainer2**, and adjust the properties as follows:

    - **Image**: `User().Image`
    - **Height**: `Parent.Height`

28. Insert a **Globe** icon into **HeaderContainer2** to create a connection icon. Adjust the properties as follows:

    - **Height**: `20`
    - **Width**: `20`
    - **Color**: `If(Connection.Connected, Color.Green, Color.LightSteelBlue)`

29. Select **HeaderContainer2** in the Tree view. In the Properties panel, find the **Justify (horizontal)** option and select the **End** option (third option) to right-justify the header container items.
30. Adjust the header container **Fill** property to:

    ```
    Color.LightSteelBlue
    ```

31. Select **MainContainer2**. Insert a **Button** control with the following properties:

    - **Text**: `"Save"`
    - **Width**: `Parent.Width`
    - **OnSelect**: `SubmitForm(Form1)`

32. Select the form inside of MainContainer2, and adjust the **OnSuccess** property to:

    ```
    Navigate('Success Screen')
    ```

33. From your **Tree view** panel, select the **Success Screen**.
34. Select the **Check** icon (iconCheck1), and update the OnSelect property to:

    ```
    Back()
    ```

35. Enter preview mode. Adjust the display to the iPhone 12 by selecting the Phone dropdown. Observe how the layout adjusts across devices and orientations.
36. Save your app if you want to use or revisit it later.

You've now created a responsive app usable across platforms.
