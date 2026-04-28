# Exercise - Use graph API from a custom connector

In this exercise, you'll create a custom connector and learn how to configure it to access the Microsoft Graph API by using Microsoft Entra ID authentication. Because the focus is on authentication, this exercise only configures a single action called **Last Used**.

> **Important:** Use a test environment with Microsoft Dataverse provisioned. If you don't have one, you can sign up for the community plan.

## Task 1: Create a new solution

To create a new solution, follow these steps:

1. Go to [Power Apps maker portal](https://make.powerapps.com) and make sure that you are in the correct environment.
2. Select **Solutions > + New solution**.
3. Enter **Contoso graph** for **Display name**, select **CDS Default Publisher** for **Publisher**, and then select **Create**.

   > **Note:** When working with a real project, it's best to create your own custom publisher.

4. Don't navigate away from this page after selecting **Create**.

## Task 2: Use Graph Explorer to test the API

In this task, you'll use Graph Explorer to perform an API action that you'll configure in the custom connector.

1. In another new browser tab, go to [Graph Explorer](https://developer.microsoft.com/graph/graph-explorer/).
2. Select **Sign in** and sign in with your user information.
3. Read the requested permissions and then continue if you agree.
4. Make sure that **GET** is selected for the verb, add **/insights/used** to the **URL**, and then select **Run query**.
5. You should get a **403** error indicating that Graph Explorer lacks your permission to perform this action.
6. Select the **Modify permissions** tab to grant Graph Explorer permission.
7. Select **Consent** for **Sites.Read.All**.
8. Read the requested permissions and then continue if you agree.
9. Select **Run query** again. You should now get the **OK - 200** status.
10. Start a new browser session tab.
11. Go to [OneDrive](https://onedrive.live.com) and sign in.
12. Select **+ New** and select **Word document**. You're creating this document so that you have some content in your **Last Used** list.
13. Enter some test text in the Word file. The document will be saved automatically for you.
14. Go back to the Graph Explorer.
15. Run the same query again. You should now get a response with values.
16. Select the response JSON, right-click, select **Copy**, and then save it. You'll need this response later in this exercise.

## Task 3: Register a new application and add permissions

In this task, you'll configure a new application that will be used to access the Graph API from the custom connector.

1. Go to [Microsoft Azure](https://portal.azure.com/) and sign in with your admin user credentials.
2. Select **Show portal menu** and then select **Microsoft Entra ID**.
3. Select **App registration > + New registration**.
4. Enter **Learn last used connector** for **Name**, select **Web**, enter `https://global.consent.azure-apim.net/redirect` for **Redirect URI**, and then select **Register**.
5. Select **API permissions** and then select **+ Add a permission**.
6. Select **Microsoft Graph**.
7. Select **Delegated permissions**.
8. Search for sites and then expand **Sites**.
9. Select **Sites.Read.All**, **Sites.ReadWrite.All**, and then select **Add permissions**.
10. You should now have three API permissions. Select **Certificates & secrets**.
11. Select **+ New client secret**.
12. Enter **Last used connector action** for **Description**, select **90 days** for **Expires**, and then select **Add**.
13. Copy the **Value** and save it for later because it won't be shown again. You'll use this user secret when creating the connector.
14. Select **Overview**.
15. Copy the **Application (Client) ID** and save it on a notepad. You'll use this client ID when creating the connector.

## Task 4: Create a custom connector

Follow these steps to create a custom connector:

1. Go to [Power Apps admin portal](https://make.powerapps.com/home/) and make sure that you are in the correct environment.
2. Select **Solutions** and then select to open the **Contoso graph** solution that you created in Task 1.
3. Select **+ New > Automation > Custom connector**.
4. Enter **Contoso graph** for **Connector name**.
5. Scroll down, enter **graph.microsoft.com** for **Host** and **/v1.0** for **Base URL**.
6. Select **Security**.
7. Select **OAuth 2.0** for **Authentication**.
8. Select **Microsoft Entra ID** for **Identity Provider**.
9. Paste the **ID** that you copied from Azure in the **Client id** field and then paste the **Value** that you copied from Azure in the **Client secret** field.
10. Enter `https://graph.microsoft.com` for **Resource URL** and then select **Create connector**.
11. Don't navigate away from this page.

## Task 5: Add the action

In this task, you'll configure the last used action tip called Graph API.

1. Select **Definition > + New action**.
2. Enter **Last used** for **Summary** and **LastUsed** for **Operation ID**.
3. Go to the **Request** section and select **+ Import from sample**.
4. Select **Get** for the verb, enter **/me/insights/used** for **URL**, and then select **Import**.
5. Scroll down and select the default response.
6. Select **+ Import from sample**.
7. Paste the response that you copied from Graph Explorer in the **Body** field and then select **Import**.
8. Select **Update connector**.
9. Don't navigate away from this page.

## Task 6: Test the connector

Follow these steps to test the connector:

1. Select the **Test** tab and then select **+ New connection**.
2. Provide your credentials.
3. Read the requested permissions and continue.
4. Select **Refresh** connections.
5. Select **Test operation**.

   You should see a **200** status with a response containing your recently used items.
