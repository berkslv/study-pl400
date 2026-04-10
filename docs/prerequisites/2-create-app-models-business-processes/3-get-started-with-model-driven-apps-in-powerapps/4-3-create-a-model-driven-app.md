# Exercise - Create a model-driven app (basic)

- 6 minutes

In this unit, you'll create a model-driven app using one of the standard tables available in your Microsoft Power Apps environment. Before creating a model-driven app, you must first create a **Solution**, where your app resides.

## Create a Solution and add an existing data table

1. On the Power Apps home page, select **Solutions** (you might need to select **More** from the left side navigation panel).
2. Select **New solution** from the command bar.
3. In the **New solution** panel, input the following:
   - **Display name:** Learning Account
   - **Publisher:** [select one from the dropdown]
4. Select the **Create** button.
5. In the command bar, select **Add existing** > **Table**.
6. Find and select the **Account** table. Then, select **Next**.
7. Select the box **Include all objects**. Then select the **Add** button.

## Create a model-driven app

1. In the Solution **Objects** menu, select **New** > **App** > **Model-driven app**.
2. Name your app `Learning Accounts` and select **Create**.

Your new app opens in the App Designer.

## Add a page to your app

1. Select **Add Page** from the command bar.
2. In the **Add page** popup window, select **Dataverse table**.
3. Select the **Account** table and select the **Add** button.
4. **Publish** your app using the button in the top right of the command bar.

## Edit your form

1. In the left navigation pane, select **Pages**.
2. Expand **Accounts View** and select the **Accounts form**.
3. Select the pencil icon to the right of the **Accounts form** name to edit the form.
4. From the **Table columns** pane, scroll down and select **Ticker Symbol** to add it to the form.
5. With **Ticker Symbol** selected, select **Delete** from the command bar to remove it.
6. Select **Save and publish** from the top right of the command bar.
7. Select **Back** to exit the form editor.

## Edit views

1. Select **Accounts view** in the **Navigation** menu of the pages panel.
2. Select **Edit view** from the command bar to open the **View editor**.
3. Find **Address 1: State/Province** from the **Table columns** list and select it to add it to the view.
4. Left-click and hold the **Main Phone** column header, then drag and drop it to the right of the **Address 1: State/Province** column.
5. Select **Save and publish** from the top right of the command bar.
6. Select the **Back** button to close the **View editor**.

## View a chart

1. Within your preview canvas, select the **Show Chart** button from the app command bar.
2. Select the dropdown next to **Accounts by Industry** to switch between different chart views such as:
   - Accounts by industry
   - Accounts by owner
   - New Accounts By Month
