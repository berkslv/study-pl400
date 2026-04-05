# Exercise - Create a model-driven app (advanced)

- 10 minutes

In this exercise, you'll use the **Prospects** table data to create a model-driven app. This app will help keep managers up to date on current sales leads and forecasted revenue.

## Scenario

If you don't have the **Prospects** table, refer to the previous exercise from the "Get started with Dataverse" module. Our new app will help keep managers up to date on current sales leads and forecasted revenue.

## Create the model-driven app for the Prospects table

1. Sign in to [Power Apps](https://make.powerapps.com/) using your organizational account.
2. Select the environment where you want the app to reside.
3. On the **Home** page, select **Start with a page design** > **Blank page with navigation**.
4. Enter the name `Prospect Entry` and select **Create**.
5. Select **+ Add page**.
6. Select **Dataverse table**.
7. Find your **Prospects** table (or enter `Prospect` in the search field).
8. Select **Prospects** and then **Add**.
9. Select **Publish** to save and publish your changes.

## Create a chart

1. Inside your app, select the **Data** tab from the left-side navigation ribbon.
2. Select and expand **In your app**, then find/select your *Prospects* table. Select the ellipses (**...**) to the right of the table name and select **Open**.
3. Select **Charts** under **Data experiences**.
4. Select **New chart** from the header ribbon.
5. For the **Chart Name**, enter `Forecasted Revenue by Stage`.
6. For **Legend Entries (Series)**, select the **Forecasted Revenue** column. In the dropdown to the right, select an aggregate (e.g., **Sum**, **Avg**, **Count:All**).
7. For **Horizontal (Category) Axis Labels**, select the **Stage** column.
8. Select **Save and Close**.
9. In the pop-up asking *Currently creating a new chart?*, select **Done**.
10. Return to your App Designer browser tab and select the **Show Chart** button in the App screen header ribbon.
11. In your app editor, select **Publish**.

## Create the form

1. From the Power Apps Home screen, select **Tables**. Select the **Prospects** table.
2. Select **Forms** under **Data experiences**.
3. Select the drop-down arrow next to **+ New form**, then select **Main Form** > **Create**.
4. From the list of table columns on the left, select the **Stage** column to add it to your form. Drag and drop it below the **Owner** column.
5. Select the **Contract Amount** column to add it below the **Stage** column.
6. Select the **Probability** column to add it below the **Contract Amount** column.
7. Select the **Forecasted Revenue** column to add it below the **Probability** column.
8. With **Forecasted Revenue** selected, go to the **Properties** tab on the right side of the screen and select the checkbox for **Read-only column**.
9. Select **Save and Publish** from the ribbon at the top.
10. Select the **Back** button to return to the **Tables > Prospects > Forms** screen.
11. Select **Form settings** from the Forms ribbon, then **Form order** in the pop-up.
    - Make sure **Main Form** is selected in the form set dropdown.
    - Find your new "Prospects" form and drag it above the form named **Information** (to the top of the list).
    - Select **Save and publish**.
12. Open your app builder, go to the **Home** screen with your *Prospects* data, and select **+ New** from the app header to bring up your new Main form.
13. Finally, **Publish** your app.

Congratulations! You have successfully created a new model-driven app based on your data. Your new app includes a chart to visualize your data and a form for users' data entry.
