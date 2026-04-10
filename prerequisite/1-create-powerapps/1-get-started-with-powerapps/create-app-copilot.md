# Exercise - Create an app from Excel using Copilot

- 11 minutes

If you're building in an Environment that includes Microsoft Dataverse, you can have Copilot easily create an app from any Excel spreadsheet. Copilot doesn't need to have data formatted into a table to work. Unfortunately, this option is **not** available in an environment without Dataverse, but you can scan through this unit and see how easily an app can be built with Copilot.

If you're building in a Dataverse empowered environment, this is an excellent opportunity to see how this process works. In this case, you can provide a spreadsheet with or without data tables and see how Copilot creates data tables and connections for you, allows you to transform the tables, then produces a fully functioning app.

Start this exercise by downloading and extracting a [sample worksheet](https://github.com/MicrosoftDocs/mslearn-developer-tools-power-platform/raw/master/power-apps/copilot/ProductList.zip). (Or, if you prefer, you can use one of your own.)

> **Important:** To fully take advantage of this feature, you'll need to use an Environment that includes Dataverse, and you may need to sign up for a Power Apps license (or free trial) that includes Dataverse. Without these, you won't be able to complete this exercise.

> **Note:** Copilot builds tables using Artificial Intelligence (AI). AI isn't deterministic, meaning your results will likely be slightly different from what's shown below.

## Begin the exercise

1. Download the [**Product List**](https://github.com/MicrosoftDocs/mslearn-developer-tools-power-platform/raw/master/power-apps/copilot/ProductList.zip) worksheet. Extract all the files.
2. Go to the [Power Apps maker portal](https://make.powerapps.com/).
3. From the Home screen, select the option to **Start with data**. After a moment, the **Start with data** screen will appear with the option to **Create with Excel or .CSV file**. Select that option.
4. Choose **Create new tables**.
5. On the **Choose an option to create tables** screen, select **Import an Excel file or .CSV**.
6. In the **Import file** pop-up window that appears, choose **Select from device**. Find and select the ProductList.xlsx that you downloaded and extracted earlier, ensure that the query(5) table include is toggled on, and then select **Import**.
7. A preview table is being created, and this takes a few moments. Once the new table is created, you can examine it. Select the ellipsis on the **Product Inventory** table and select **View data**.

   Notice how Power Apps added the title **Product Inventory** (or similar) and created our column names, too! The column headers might match the Excel spreadsheet. If not, you can use your Excel headers. There's a toggle to **Use first row as column headers** at the top right that you toggle **on** to use your Excel column names.

8. If you used the downloaded Excel Product List, there should be six columns. Copilot guessed at the data type for each of these columns. The first two (**Title** and **Code name**) should be *Single line of text*, the next three (**Product Line**, **Product Type** and **Color**) should be type *Choice*, and the **Notes** column is also *Single line of text*.
9. If these aren't the column types that Copilot created, you can have Copilot change them. Open Copilot by clicking on the Copilot icon on the top right hand side of the screen.
10. With the Copilot dialog pane open, type: *"Please change the column types for the Product Line, Product Type, and Color columns to be Choice type columns."* Work with Copilot until these three columns are choice type columns.

    You can also change or modify any of the columns by selecting the column header, selecting **Edit column**, and then adjusting the properties in the pop-up window. You can edit the table properties by selecting the ellipsis to the right of the table name and then selecting **Settings**.

11. Now you're ready to create your app! Select the **Save and open app** button in the top right. A pop-up advises you that Power Apps will save the tables and relationships that you've created and open the app in Power Apps Studio. Select **Save and open app**.
12. After a few moments, the app opens in Power Apps Studio in Edit mode. You may get a pop-up window welcoming you to Power Apps Studio; if so, you can select **Skip**. If you receive a notification that your data source was added to your app, you can X out that notification, too.

    > **Note:** Copilot is still in **Preview** mode as it gains knowledge. You can try it out by suggesting some changes such as "Please change the background color of the table name label to purple." You can provide "thumbs up/down" feedback and even detail the issue as feedback to Microsoft.

    When Copilot produces your app, it estimates what data your gallery displays. You can select the most appropriate columns for your gallery, and you can change them in the Power Apps editor.

13. Notice that your app title shows at the top of the screen.
14. Also notice that you have a gallery of products on the left side of the screen, and product details for the selected item in the gallery on the right side of the screen.
15. A Copilot panel appears on the right side of the screen available to assist you with changes you want to make to the app.
16. All that's left is to save and publish. To see the save icon, you'll need to close the Copilot pane by selecting the **X** in the pane's top right corner.

    Select the **Save** icon in the upper right corner (it looks like a floppy disk). You'll need to provide a name, if you haven't already, and select **Save** again. Once the save is complete, select the **Publish** icon on the far upper right corner.

17. Put your app in **Preview mode** to test functionality. You can do that by selecting the **Play** icon to the left of the **Save** icon.

    The search functionality for an app with Dataverse as the data source is robust. It can easily search through any text field. Enter "ultra" into the search input field. Notice how it filters based on the **Title** column for that specific pattern. Clear the input field and enter "aud." Notice how it filters to car audio options choices and it ignores font case as it searches.

18. While your app is still in preview mode, you can try the edit form functionality. Find and select the item "Headphones 2000w." Edit this item by selecting the pencil (Edit) icon at the top right of the form. Under Notes, enter "includes case" and select the check icon at the upper right of the form to save the change. Your item now includes the note.
19. This app is fully responsive, meaning that it adjusts to the form factor that it's running from (for example, tablet or phone). With your app still in preview mode, look in the top right corner and notice there are three form factor options that you can preview. When you select one of them, there are further options where you can match specific type of tablet or mobile phone. You can even change orientation of the target device to see what happens with the user experience. Choose one that resembles a mobile device that you use so you can see how the app screens would behave on your phone.

## Summary

Feeding an Excel spreadsheet into Power Apps by using Copilot is another easy option for creating an app. This technique is a fast way to build a responsive one-screen app, with the same functionality as the three-screen app, on top of a Dataverse data table. Since Dataverse resides in the same cloud as the rest of the Power Platform, there are no time-consuming API calls, and the search functionality is robust. Just like any Power Apps app, you can add more data, screens, and functionality, but there's no faster way to get an app in the hands of your team.
