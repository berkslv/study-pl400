# Exercise - Create a custom table and import data

- 15 minutes

## Scenario

Your current sales process is manual, and updates occur only on Fridays. You want to simplify the process, reduce the likelihood of errors, and improve visibility. To do this, you'll build an app that tracks sales leads and automatically calculates forecasted revenue. You'll use Microsoft Dataverse to store the list of potential customers.

## Use Microsoft Dataverse to store data

In this exercise, you'll use a custom table in Microsoft Dataverse to store the list of potential customers.

You'll learn how to:

- Create a custom table
- Add custom columns to the table
- Create a formula column (calculated)
- Configure a business rule
- Import data from a Microsoft Excel workbook

### Create a custom table

1. Go to the [Power Apps maker portal](https://make.powerapps.com/) and sign in.
2. From the left navigation pane, select **Tables**.
3. In the command bar, select **+ New table**, then select **Table (advanced properties)**.
4. Under **Properties**, set the **Display name** to *Prospect*.
5. Select the **Primary column** tab and set the **Display name** to *Prospect Name*.
6. Select **Save**.
7. Once saved, the *Tables > Prospect* screen appears.
8. Select **New > Column** to create a new column.
9. In the *New column* panel, enter the following:
   - **Display name**: *Stage*
   - **Data type**: *Choice*
   - **Required**: *Business required*
10. Under **Sync this choice with**, select **New choice**. In the *New choice* pane, enter the following and select **Save**:
    - **Display name**: *Prospect Stage*
    - Under **Label**, enter and save the following:
      - *Lead* (Value: **1**)
      - *Opportunity* (Value: **2**)
      - *Won* (Value: **3**)
      - *Lost* (Value: **4**)
11. After saving the choice, select **Prospect Stage** from the **Sync this choice with** dropdown.
12. Under **Default choice**, select **Lead**.
13. Select **Save**.
14. Repeat the steps to add two additional columns:
    - **Display name**: *Contract Amount* | **Data type**: *Currency*
    - **Display name**: *Probability* | **Data type**: *Whole Number* (select *Number*, then *Whole number*)
15. Add another column with the following:
    - **Display name**: *Forecasted Revenue*
    - **Data type**: *Formula*
16. Enter the formula:

    ```pfx
    Decimal('Contract Amount') * (Probability / 100)
    ```

    > **Note**: Ensure that the column names used in the formula exactly match those created earlier. Use the *Decimal* function to convert the *Contract Amount* from currency to a usable decimal value.

17. Select **Save**.

### Add a business rule

1. In the table designer, select **Business rules** from the *Customizations* pane on the right.
2. Select **New business rule** from the command bar. A new browser tab opens.
3. Select the **Condition New Condition** step in the design canvas. The *Properties* panel appears on the right.
4. In the *Properties* panel under *Rules*, verify that **Contract Amount** is selected for the **Field**.
5. Change the **Operator** value to **Contains data**.
6. Select **Apply**.
7. Select the **Components** tab.
8. Drag the **Set Business Required** component to the plus symbol to the right of the purple checkbox in the canvas.
9. With *Set Business Required New Action* selected, go to the *Properties* panel and:
   - Set the **Field** to **Probability**
   - Set the **Status** to **Business Required**
10. Select **Apply**.
11. In the command bar, select the chevron next to **Prospect New business rule** to expand the name and description fields.
12. Enter **Make Probability Required** for the **Business rule name**.
13. Select **Save** from the command bar.
14. Select **Activate**.
15. When the *Process Activate Confirmation* window appears, select **Activate** again.
16. Close the business rule browser tab.
17. In the pop-up, select **Done** to confirm the creation.
18. Verify that the new business rule appears in the Business rules list. Then select **Prospect** at the top to return to the table editor.

### Import data from an Excel file

1. Download the exercise file [Prospects.csv](https://github.com/MicrosoftDocs/mslearn-developer-tools-power-platform/raw/master/power-apps/Prospects.zip) and extract the CSV.
2. Open *Prospects.csv* in Excel and enter the following values in the **Stage** column:
   - Contoso Flooring: Won
   - Fabrikam Inc: Won
   - Adventure Works: Lead
   - VanArsdel: Lost
   - Adatum: Lead
   - Relecloud: Opportunity
3. Save the file as *Prospects.xlsx* and close Excel.
4. In the Power Apps maker portal, return to the **Prospect** table.
5. Select **Import > Import data**.

   > **Note**: Select **Import data**, not **Import data from Excel**, which is a legacy function. The correct option activates Power Query.

6. In the Power Query window, upload the *Prospects.xlsx* file.
7. When the **Preview file data** screen appears, confirm that the table shows *ContractAmount*, *Probability*, *Name*, and *Stage*. Select **Next**.
8. In the Power Query editor, verify column data types. Set *ContractAmount* to **Currency**. Select **Next**.
9. Under **Choose destination settings**, select **Load to existing table** and choose the *Prospect* table.
10. In **Column Mapping**, confirm that columns are matched. Map **Name** to **Prospect Name** manually if needed.
11. Select **Next**, then choose **Refresh manually** for refresh settings.
12. Select **Publish** to import the data.
13. Refresh the browser to view the imported data.
14. Confirm the data appears correctly in the **Prospect** table.

Congratulations! You've created a custom Dataverse table, configured a business rule, and imported data from Excel.
