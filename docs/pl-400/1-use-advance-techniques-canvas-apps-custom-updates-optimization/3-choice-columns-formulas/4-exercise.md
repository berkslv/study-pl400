# Exercise - Dataverse choice columns

In this exercise, you help Contoso add choice columns to an existing Dataverse table and modify the **Product Management** app to use the new columns.

## Objectives

- Create choice columns.
- Filter data in the app by using choice columns.
- Use the `Patch()` function to update column values.

## Prerequisite

An environment with Microsoft Dataverse.

---

## Exercise 1: Import a solution

### Task 1: Import the starting solution

1. Download the [ContosoProductChoiceLab_1_0_0_0.zip](https://github.com/MicrosoftDocs/mslearn-developer-tools-power-platform/blob/master/power-apps/choice-columns/ContosoProductChoiceLab_1_0_0_0.zip) file.
2. Go to the [Power Apps maker portal](https://make.powerapps.com/) and select the environment you would like to use.
3. Select **Solutions > Import solution**.
4. Select **Browse**, find/select the zip file, and select **Open**.
5. Select **Next**, then **Import**, and wait for the import to complete.

### Task 2: Run the application

1. Open the **Contoso Product Choice Lab** solution.

   > **Note:** Check the **Contoso Product Manager** app *Settings* to ensure that *Disable formula-level error management* is toggled to **Off**. Open the app in **Edit** mode > **Settings** > **Updates** > search for **Disable formula-level error management**. Toggle it off. **Save** and close.

2. Open the **Contoso Product Manager** app in play mode.
3. From **BrowseScreen1**, select the **Create new item** button (the **+** icon).
4. Enter **Measuring Gadget** for the **Name** and then select **Save**.
5. Add a few more product rows (at least three products total).
6. Close the application browser window or tab.

---

## Exercise 2: Create columns

### Task: Create choice columns

> **Note:** Pay attention to which column is of data type **Choice** and which is of data type **Choices**.

1. Go to the [Power Apps maker portal](https://make.powerapps.com/) and select **Solutions**.
2. Open the **Contoso Choice Lab** solution.
3. Navigate to **Tables** and open the **Product** table.
4. In the **Schema** pane, select **Columns**, then select **+ New column**.
5. Enter **Product visibility** for the **Display name**, select **Choice** under **Data type**, then select **Choice** again from the dropdown.
6. Under **Sync this choice with**, select **+ New choice**.
7. In the **New choice** pane, enter **chProductVisibility** in the **Display name** field.
8. Enter the following choices:
   - **Private**
   - **Invite**
   - **Public**
9. Select **Save**.
10. Under **Sync this choice with**, search for and select **chProductVisibility**.
11. Select **Save**.

12. Select **+ New column** again.
13. Enter **Sales channels** for **Display name**, select **Choice** for **Data type**, then select **Choice** from the dropdown.
14. Check the box **Selecting multiple choices is allowed**. *(This cannot be changed after column creation.)*
15. Under **Sync this choice with**, select **+ New choice**.
16. Enter **chSalesChannels** for the **Display name** with the following choices:
    - **Wholesale**
    - **Retail**
    - **Direct**
17. Select **Save**.
18. Under **Sync this choice with**, search for and select **chSalesChannels**.
19. Select **Save**.

---

## Exercise 3: Modify form and gallery

### Task: Edit application

1. Open the **Contoso Product Choice Lab** solution and select **Apps**.
2. Open **Contoso Product Manager** in Edit mode.
3. In the **Tree view**, expand **EditScreen1** and select **EditForm1**.
4. Select **Edit fields** from the **Properties** pane.
5. Remove the **Created On** column (select the **...** ellipsis > **Remove**).
6. Select **+ Add field**, then select **Product visibility** and **Sales channels**, and select **Add**.
7. Close the **Fields** pane.

8. In the **Tree view**, expand **BrowseScreen1** and select **BrowseGallery1**.
9. Select the **Edit** icon in the gallery.
10. Change the **TemplateSize** to **230**.
11. Move the **Title** label to the top of the template.

12. While editing the gallery, insert **Input > Drop down** from the **Insert** menu.
13. Resize and reposition the dropdown below the name field.
14. Set the **Items** value:

    ```powerappsfl
    Choices(Products.'Product visibility')
    ```

15. Set the **Default** value:

    ```powerappsfl
    ThisItem.'Product visibility'
    ```

16. While still editing the gallery, insert a **Text label** and rename it **Channels**.
17. Move **Channels** below the dropdown and resize it.
18. Set the **Text** value of **Channels**:

    ```powerappsfl
    Concat(ThisItem.'Sales channels', Text(Value), ",")
    ```

19. Insert a **Rectangle** (still editing the gallery).
20. Set the rectangle properties:
    - **X**: `0`
    - **Y**: `0`
    - **Width**: `6`
    - **Height**: `220`
21. Set the **Fill** value:

    ```powerappsfl
    Switch(
      ThisItem.'Product visibility',
      chProductVisibility.Private, Color.Red,
      chProductVisibility.Public, Color.Green,
      chProductVisibility.Invite, Color.Blue,
      Color.Black
    )
    ```

22. Select the Gallery and clear the **OnSelect** value (leave it blank).
23. Select **NextArrow1** inside the gallery item.
24. Set the **OnSelect** value:

    ```powerappsfl
    Navigate(DetailScreen1, ScreenTransition.None)
    ```

25. Select **Save** in the upper right corner.
26. Select **Preview the app** (or press F5).
27. For each product, select the **Next** arrow > **Edit**, enter values for **Sales channels** and **Product visibility**, then select **Save**.
28. Close the preview (**X** in the upper right corner).

---

## Exercise 4: Use filters

### Task: Use a filter

1. On **BrowseScreen1**, select **TextSearchBox1**.
2. Change the **Width** of the search box to:

    ```powerappsfl
    Parent.Width/2
    ```

3. Select **Browse Screen 1** in the **Tree view**. From the ribbon, select **Insert > Input > Drop down**.
4. Rename the dropdown to **Visibility filter**.
5. Resize and reposition **Visibility filter** to the right of the search box.
6. Set the **Items** value:

    ```powerappsfl
    Choices(Products.'Product visibility')
    ```

7. Set the **AllowEmptySelection** value to `true`.
8. Set the **Default** value:

    ```powerappsfl
    Blank()
    ```

9. From the ribbon, select **Insert > Icons > Cancel**.
10. Reposition the cancel icon to the right of the dropdown arrow.
11. Set the **OnSelect** value of the icon:

    ```powerappsfl
    Reset('Visibility filter')
    ```

12. Set the **Visible** value of the icon:

    ```powerappsfl
    If(IsBlank('Visibility filter'), false, true)
    ```

13. Select **BrowseGallery1** and change the **Items** value:

    ```powerappsfl
    SortByColumns(
        Search(
            Filter(
                [@Products],
                IsBlank('Visibility filter'.Selected)
                || 'Product visibility' = 'Visibility filter'.Selected.Value
            ),
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

14. Select **Preview the app** (or press F5).
15. Change the **Visibility filter** to **Private** — the gallery should show only private products.
16. Select the **X** icon — the gallery should show all products.
17. Close the preview.

---

## Exercise 5: Use the Patch formula

### Task: Use the Patch() formula

1. Expand **BrowseGallery1** and select the **Dropdown1** control.
2. Set the **OnChange** value:

    ```powerappsfl
    Patch(Products, ThisItem, {'Product visibility': Self.Selected.Value})
    ```

3. Select the gallery and select the **Edit** icon.
4. From the ribbon, select **Insert > Icons > Cancel**.
5. Place the icon in the lower right of the gallery template.
6. Set the **Visible** value of the icon:

    ```powerappsfl
    If(IsBlank(Channels.Text), false, true)
    ```

7. Set the **OnSelect** value of the icon:

    ```powerappsfl
    Patch(Products, ThisItem, {'Sales channels': Blank()})
    ```

8. Select **Preview the app**.
9. Change the product visibility of one product — the product should update immediately.
10. Select the **X** icon of a product — its sales channels should be cleared, and the **X** button should become hidden.
11. Close the preview.
12. Select **Save**.
