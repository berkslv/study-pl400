# Exercise - Import data into your Microsoft Dataverse database

- 10 minutes

You can import data into your **Microsoft Dataverse** database in bulk from sources such as Excel, Access, SharePoint, SQL, and others.

> **Note**: The Dataverse **Pet** table referenced in this unit was created in the previous exercise. If you need sample data to import, the steps below show how to quickly create a SharePoint list to use for practice.

## Create sample import data

1. Before importing data into your Dataverse table, create a SharePoint list to use as your source. Go to [office.com](https://www.office.com/) and sign in with your work or school account.
2. In the top-left corner, select the app launcher (waffle icon), and then select **SharePoint**. Navigate to the SharePoint site where you want to create the list.
3. Select **New > List** from the command bar.
4. In the **Create from blank** dialog, select **List**.
5. Name the list "SharePoint Pets" and select **Create**.
6. In your new list, create the following columns to match your **Pets** Dataverse table:

   | Name | Data type |
   | --- | --- |
   | PetSpecies | Single line of text |
   | Breed | Single line of text |
   | AppointmentDate | Date and time |

7. Add sample data to your list.
8. Return to your SharePoint site home page and copy the site URL, stopping at the site name.

   > **Important**: Do not include any suffixes (such as `/Lists`) in the URL. Example: `https://yourOrganization.sharepoint.com/sites/yourSharePointsite`

## Import data into your Dataverse table

1. In a new browser tab, go to the [Power Apps home page](https://make.powerapps.com/), and select **Tables** from the left navigation panel.
2. Select the **Pet** table, then choose **Import > Import data** from the command bar.
3. In the **Power Query** data importer, select **SharePoint list** as the data source.
4. In the **Connect to data source** window, enter your SharePoint site URL in the **Site URL** field. Once authenticated, select **Next**.
5. In the **Choose data** step, select the **SharePoint Pets** list. A data preview will appear.
6. Select **Next** to continue.
7. The Power Query editor allows you to shape the data before importing it into Dataverse. You can choose the columns you want to import using **Choose columns**, or remove columns using **Remove columns**. The **Applied steps** on the right side tracks your changes and allows you to undo.
8. Select **Choose columns** from the "Manage columns" tab in the header.
9. Select only the columns **Title**, **PetSpecies**, **Breed**, **AppointmentDate**, and select **OK** to continue.

   > **Tip**: If you made an error, select the "X" next to the step in **Applied steps** to undo it.

10. Once your query table has the columns *Title*, *PetSpecies*, *Breed*, and *AppointmentDate*, select **Next** to continue.
11. At the **Map tables** step under **Load settings**, choose **Load to existing table**.
12. From the **Destination table** dropdown, select your *Pet* table (it may appear with a prefix, e.g., `cref2_Pet`).
13. In the **Column mapping** section, select **Auto map** to match source and destination columns automatically. You may need to manually map **Title** to **PetName** and **PetSpecies** to **Species**.
14. After mapping all columns, select **Next**.
15. In the **Refresh settings** step, choose **Refresh manually**. Then select **Publish**.
16. Once published, the data should load into the **Pet** table. Refresh the browser if needed to view the data.

This process used SharePoint as a data source, but similar steps apply when importing data from other supported sources.
