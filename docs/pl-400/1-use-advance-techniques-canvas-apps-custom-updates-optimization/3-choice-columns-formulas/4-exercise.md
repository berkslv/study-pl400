# Exercise - Dataverse choice columns

Completed

- 20 minutes

In this exercise, you help Contoso add choice columns to an existing Dataverse table and modify the **Product Management** app to use the new columns.

## Objectives

The goal for this exercise is for you to learn how to:

- Create choice columns.
- Use filter data in the app by using choice columns.
- Use the Patch() function to update column values.

## Prerequisite

To complete this exercise, you'll need an environment with Microsoft Dataverse.

## Exercise 1: Import a solution

In this exercise, you'll import a solution into your environment. This solution contains a product table and an application for product management.

### Task 1: Import the starting solution

In this task, you'll import a solution into your environment.

1. You need to download the [zip file](https://github.com/MicrosoftDocs/mslearn-developer-tools-power-platform/blob/master/power-apps/choice-columns/ContosoProductChoiceLab_1_0_0_0.zip) to complete this exercise. Select download once the link opens.
2. Go to the [Power Apps maker portal](https://make.powerapps.com/?azure-portal=true) and select the environment you would like to use for this lab.
3. Select **Solutions &gt; Import solution**.

[![Screenshot of the Import solution button in Power Apps.](media/import.png)](media/import.png#lightbox)
4. Select **Browse**.
5. Find/Select the ContosoProductChoiceLab\_1\_0\_0\_0.zip solution, and select **Open**.
6. Select **Next**.
7. Select **Import** and then wait for the solution importing process to complete.

### Task 2: Run the application

In this task, you run the **Contoso Product Manager** application and add product rows.

1. Open the **Contoso Product Choice Lab** solution.

    Note

    Check the **Contoso Product Manager** app *Settings* to ensure that the *Disable formula-level error management* is toggled to *Off*. Open the app in **Edit** mode. In **Settings**, select **Updates**, then search for **Disable formula-level error management** to find it. (If you can't find your settings, select the three ellipses at the top of the page next to *Background color*.) This feature is now in the **Retired** section. Toggle it off. **Save** and close your app.
2. Now select and open the **Contoso Product Manager** app in play mode.
3. From **BrowseScreen1** select the **Create new item** button (the plus **+** icon).

[![Screenshot of the Create new product button.](media/new.png)](media/new.png#lightbox)
4. Enter **Measuring Gadget** for the **Name** and then select **Save**.

[![Screenshot of the Save new product button in Power Apps.](media/save.png)](media/save.png#lightbox)
5. Add a few more product rows.
6. You should now have at least three products.

[![Screenshot of the product rows in Power Apps.](media/products.png)](media/products.png#lightbox)
7. Close the application browser window or tab.

## Exercise 2: Create columns

In this exercise, you create two choice columns: one for **Product visibility** and one for **Sales channels**.

Note

Pay attention to which column is of data type **Choice** and which column is of data type **Choices**.

### Task: Create choice columns

In this task, you create two columns of data type **Choice**.

1. Go to the [Power Apps maker portal](https://make.powerapps.com/?azure-portal=true) and select **Solutions**.
2. Select the **Contoso Choice Lab** solution that you imported.
3. Navigate to **Tables** and select and open the **Product** table.
4. In the **Schema** pane, select **Columns**.

[![Screenshot of the Product table dashboard with Columns selected from under Schema.](media/schema-columns.png)](media/schema-columns.png#lightbox)
5. In the **Columns** view select **+ New column**.

[![Screenshot of the Columns view and the Add new column button.](media/add-column.png)](media/add-column.png#lightbox)
6. In the **New column** pane on the right of your screen, enter **Product visibility** for the **Display name**, select **Choice** under **Data type**, and then select **Choice** again from the dropdown.

[![Screenshot of the Choice column data type in Power Apps.](media/choice-data.png)](media/choice-data.png#lightbox)
7. Under **Sync this choice with**, select **+ New choice**.
8. In the **New choice** pane on the right side of your screen, enter **chProductVisibility** in the **Display name** field. Adding the "ch" in front of the name makes it much easier to determine that this is a Choice set.
9. Enter **Private** for the first item under **Choices** and then select **+ New Choice**.

[![Screenshot of the Add new choice in the New choice pane.](media/add-new-item.png)](media/add-new-item.png#lightbox)
10. Enter **Invite** for the second choice and then select **+ New choice**.
11. Enter **Public** and then select **Save**.

[![Screenshot of the Choice items in Power Apps.](media/public.png)](media/public.png#lightbox)
12. Under **Sync this choice with** enter **chProductVisibility** in the search field to find/select the choice set you created. **chProductVisibility** should now be showing in this field.
13. Select **Save** and the **New column** pane disappears.
14. Select **+ New column** again.
15. Enter **Sales channels** for **Display name**, select **Choice** for **Data type**, and then select **Choice** from the dropdown.
16. Select the box next to **Selecting multiple choices is allowed**. This is the way that our column allows multiple choices. (Don't forget this step because you can't change it later.)

[![Screenshot of the Choices column data type in Power Apps.](media/choices-data.png)](media/choices-data.png#lightbox)
17. Under **Sync this choice with** select **+ New choice**.
18. Enter **chSalesChannels** for the **Display name** and **Wholesale** for the first item and then select **+ New choice**.
19. Enter **Retail** for the second item and then select **+ New choice**.
20. Enter **Direct** and then select **Save**.

[![Screenshot of the Save button in the new Sales channels choices column.](media/save-choices.png)](media/save-choices.png#lightbox)
21. Under **Sync this choice with** enter **chSalesChannels** in the search field to find/select the choice set you created. **chSalesChannels** should now be showing in this field.
22. Select **Save**.

## Exercise 3: Modify form and gallery

In this exercise, you modify the **Edit** form and the gallery of the **Contoso Product Manager** application.

### Task: Edit application

In this task, you edit the **Contoso Product Manager** application.

1. If you've navigated away, find your solutions, and select to open the **Contoso Product Choice Lab** solution. If you're still in the solution, in the **Objects** navigation pane, find/select **Apps**
2. Select to open the **Contoso Product Manager** application in *Edit* mode. (Select on the three ellipses next to the app name, and then select **Edit**.)

[![Screenshot of Solutions > Contoso Product Choice Lab section, showing the Contoso Product Manager application highlighted.](media/manager.png)](media/manager.png#lightbox)

    The application opens in the app studio.
3. From the **Tree view** tab, expand **EditScreen1**, and then select **EditForm1**.

[![Screenshot of the EditForm1 control highlighted on the Tree view tab in Power Apps.](media/edit-form.png)](media/edit-form.png#lightbox)
4. Select **Edit fields** from the **Properties** pane on the right side of the canvas.

[![Screenshot of the Edit fields option on the Properties tab of EditForm1.](media/edit-fields.png)](media/edit-fields.png#lightbox)
5. Select the **More actions** ellipsis (**...**) button of the **Created On** column and then select **Remove**.

[![Screenshot of the Remove button selected from the Created On column dropdown list.](media/remove.png)](media/remove.png#lightbox)
6. Select **+ Add field**.

[![Screenshot of the Add field button in the Fields pane of Power Apps.](media/add-field.png)](media/add-field.png#lightbox)
7. Select the **Product visibility** and **Sales channel** columns and then select **Add**.

[![Screenshot of the Choose a field section, with columns selected and the Add button.](media/add-fields.png)](media/add-fields.png#lightbox)
8. Close the **Fields** pane.
9. Back in the **Tree View** on the left hand side of the canvas, expand **BrowseScreen1** and select **BrowseGallery1**.

[![Screenshot of the BrowseGallery1 control highlighted in the Tree view.](media/browse.png)](media/browse.png#lightbox)
10. Select the **Edit** icon in the gallery.

[![Screenshot of the Edit icon in the gallery.](media/edit-gallery.png)](media/edit-gallery.png#lightbox)
11. Change the **TemplateSize** to **230**.

[![Screenshot of the TemplateSize changed to 230.](media/size.png)](media/size.png#lightbox)
12. Select the **Title** label inside the top item in the gallery and move it to the top of the template.

[![Screenshot of the label control position highlighted in Power Apps.](media/top.png)](media/top.png#lightbox)
13. While editing the gallery, select the top card again so that no text, icon, or dropdown is selected. Then select **Insert** from the top menu bar, expand **Input**, then select **Drop down**.
14. Resize and reposition the dropdown control immediately below the name field that you positioned at the top. Change the **Items** value of the dropdown list to the following formula.

    `Choices(Products.'Product visibility')`

[![Screenshot of the Items formula value in Power Apps.](media/drop-down.png)](media/drop-down.png#lightbox)
15. Set the **Default** value of the dropdown control to the following formula.

    `ThisItem.'Product visibility'`
16. While still editing the gallery, select the top item again (so that no text, icon, or dropdown is selected). Go to the **Insert** tab and select **Text label**.
17. Rename the label **Channels**.
18. Move the **Channels** label below the dropdown control and then resize it.
19. Set the **Text** value of the **Channels** label that you added to the following formula. This formula concatenates the selected options.

    `Concat(ThisItem.'Sales channels',Text(Value),",")`
20. Make sure that you're still editing the gallery. Select **+ Insert &gt; Rectangle**.

[![Screenshot of Insert selected and the Rectangle option highlighted.](media/rectangle.png)](media/rectangle.png#lightbox)
21. Set the **X** and **Y** values of the rectangle to **0**.
22. Set the **Width** of the rectangle to **6**.
23. Set the **Height** of the rectangle to **220**.
24. Set the **Fill** value of the rectangle to the following formula. This formula gives a different fill color for each choice of the **Product visibility** column value.

    `Switch(ThisItem.'Product visibility', chProductVisibility.Private, Color.Red, chProductVisibility.Public, Color.Green, chProductVisibility.Invite, Color.Blue, Color.Black)`
25. Select the Gallery and then delete the **OnSelect** value, so that the fx formula field is blank.

[![Screenshot of the OnSelect value showing as empty.](media/on-select.png)](media/on-select.png#lightbox)
26. Select **NextArrow1** inside the top item in the gallery.

[![Screenshot of the NextArrow2 control in the gallery.](media/next.png)](media/next.png#lightbox)
27. Set the **OnSelect** value of **NextArrow1** to the following formula.

    `Navigate(DetailScreen1, ScreenTransition.None)`
28. In the upper right corner of the screen, select **Save**.

[![Screenshot of the Save button in the Contoso Product Manager application.](media/file-save.png)](media/file-save.png#lightbox)
29. Select **Preview the app** (or F5).

[![Screenshot of the Preview the application button in Power Apps.](media/preview.png)](media/preview.png#lightbox)

    The application should load.
30. Select the **Next** arrow for one of the products.
31. Select the **Edit** button.
32. For **Sales channels** select **Retail** and **Direct**. Then for **Product visibility** select **Private**, and then select **Save**.

[![Screenshot of the Save button selected in Products to save the entered information.](media/save-changes.png)](media/save-changes.png#lightbox)
33. Select the **back** button.
34. Select to open another product.
35. Select **Edit**.
36. For **Sales channels** select **Retail** and for **Product visibility** select **Public**, and then select **Save**.
37. Select the **back** button.
38. Select to open another product.
39. Select **Edit**.
40. For **Sales channels** select **Direct**, and select **Invite** for **Product visibility**, and then select **Save**.
41. Select the **back** button.
42. The gallery should look like the following image. When you're done viewing the results, close the preview by selecting the **X** in the upper right corner.

[![Screenshot of the edited gallery, with the Close application preview button highlighted.](media/products-preview.png)](media/products-preview.png#lightbox)
43. Don't navigate away from this page.

## Exercise 4: Use filters

In this exercise, you filter the gallery rows by product visibility.

### Task: Use a filter

In this task, you filter the gallery rows by product visibility.

1. On **BrowseScreen1**, select **TextSearchBox1**.

[![Screenshot of the TextSearchBox1 control in Tree view in Power Apps.](media/text-search.png)](media/text-search.png#lightbox)
2. Change the **Width** of the search box to the following formula.

    `Parent.Width/2`
3. Select **Browse Screen 1** in the **Tree view** menu on the left. Then, from the ribbon at the top, select **Insert**, expand **Input**, and then select **Drop down**.

[![Screenshot of the Insert dropdown control, showing Input selected with the Drop down option highlighted.](media/drop.png)](media/drop.png#lightbox)
4. Rename the dropdown item to **Visibility filter**.

[![Screenshot of the Rename control in Power Apps.](media/visibility.png)](media/visibility.png#lightbox)
5. Resize and reposition the **Visibility filter** and then place it to the right of the search box.

[![Screenshot of the control position next to search in Power Apps.](media/resize.png)](media/resize.png#lightbox)
6. Set the **Items** value of the **Visibility filter** to the following formula.

    `Choices(Products.'Product visibility')`
7. Set the **AllowEmptySelection** value of the **Visibility filter** to **true**.
8. Set the **Default** value of the **Visibility filter** to the following formula.

    `Blank()`
9. Select **BrowseScreen1** in the **Tree view** on the left side once again. Then, from the ribbon, select **Insert**, expand **Icons**, and then select **Cancel**.
10. Reposition the canceled icon to the right of the dropdown arrow, and then resize it.

[![Screenshot of the control position of the icon in Power Apps.](media/icon.png)](media/icon.png#lightbox)
11. Set the **OnSelect** value of the icon to the following formula.

    `Reset('Visibility filter')`
12. Set the **Visible** value of the icon to the following formula.

    `If(IsBlank('Visibility filter'),false,true)`
13. Select **BrowseGallery1** and then change the **Items** value to the following formula. This formula changes the existing formula to include a Filter() function that uses the user-selected values.

    ```powerappsfl
    SortByColumns(
        Search(
            Filter([@Products],IsBlank('Visibility filter'.Selected) || 'Product visibility' = 'Visibility filter'.Selected.Value),
            TextSearchBox1.Text,
            Name
        ),
        "contoso_name",
        If(
            SortDescending1,
            SortOrder.Descending,
            SortOrder.Ascending
        )
    )
    ```

[![Screenshot of the gallery OnSelect formula in the Items field.](media/formula.png)](media/formula.png#lightbox)
14. Select **Preview the app** (or press F5).
15. Change the **Visibility filter** to **Private**. The gallery should show only the private products.

[![Screenshot of the products filtered to Private in Power Apps.](media/filtered.png)](media/filtered.png#lightbox)
16. Select the **X** icon. The gallery should show all products.

[![Screenshot of the gallery showing all products.](media/all.png)](media/all.png#lightbox)
17. Close the preview.
18. Don't navigate away from this page.

## Exercise 5: Use the Patch formula

In this exercise, you use the Patch formula to update product table rows.

### Task: Use the Patch() formula

1. Expand **BrowseGallery1** and select the **Dropdown1** control.

[![Screenshot of the Dropdown1 control in the BrowseGallery1 menu.](media/drop-down-1.png)](media/drop-down-1.png#lightbox)
2. Set the **OnChange** value of the dropdown control to the following formula. This formula updates the row when the value of the dropdown control changes.

    `Patch(Products,ThisItem,{'Product visibility':Self.Selected.Value})`
3. Select the gallery and then select the **Edit** icon.

[![Screenshot of the Edit button in the Power Apps gallery.](media/edit-icon.png)](media/edit-icon.png#lightbox)
4. From the ribbon, select **Insert** and expand **Icons**, and then select **Cancel**.
5. Place the icon in the lower right.

[![Screenshot of the icon placement in the lower right.](media/bottom.png)](media/bottom.png#lightbox)
6. Set the **Visible** value of the icon to the following formula.

    `If(IsBlank(Channels.Text),false,true)`
7. Set the **OnSelect** value of the icon to the following formula. This formula removes all selected sales channels when the icon is selected.

    `Patch(Products,ThisItem,{'Sales channels':Blank()})`
8. Select **Preview the app**.
9. Change the product visibility of one of the products. The product should update.

[![Screenshot of the updated row in Power Apps.](media/preview-visibility.png)](media/preview-visibility.png#lightbox)
10. Select the **X** icon of the first product. The sales channels of the product should be cleared, and the **X** button should become hidden for that item.

[![Screenshot of the updated row in Power Apps, showing a blank spot.](media/clear.png)](media/clear.png#lightbox)
11. Close the preview.
12. Select **Save**.
