# Exercise - Use graph API from a custom connector

Completed

- 15 minutes

In this exercise, you'll create a custom connector and learn how to configure it to access the Microsoft Graph API by using Microsoft Entra ID authentication. Because the focus is on authentication, this exercise only configures a single action called **Last Used**.

Important

Use a test environment with Microsoft Dataverse provisioned. If you don't have one, you can [sign up for the community plan](https://powerapps.microsoft.com/communityplan/?azure-portal=true).

## Task 1: Create a new solution

To create a new solution, follow these steps:

1. Go to [Power Apps maker portal](https://make.powerapps.com) and make sure that you are in the correct environment.
2. Select **Solutions &gt; + New solution**.
3. Enter **Contoso graph** for **Display name**, select **CDS Default Publisher** for **Publisher**, and then select **Create**. **Note:** When working with a real project, it's best to create your own custom publisher.

[![Screenshot of the Create new solution window.](media/new-solution.png)](media/new-solution.png#lightbox)
4. Don't navigate away from this page after selecting **Create**.

## Task 2: Use Graph Explorer to test the API

In this task, you'll use Graph Explorer to perform an API action that you'll configure in the custom connector.

1. In another new browser tab, go to [Graph Explorer](https://developer.microsoft.com/graph/graph-explorer/?azure-portal=true).
2. Select **Sign in**.

[![Screenshot of the sign in to the graph explorer button.](media/graph-explorer-sign-in.png)](media/graph-explorer-sign-in.png#lightbox)
3. Sign in with your user information.
4. Read the requested permissions and then continue if you agree.
5. Make sure that **GET** is selected for the verb, add **/insights/used** to the **URL**, and then select **Run query**.

[![Screenshot of the Get menu, URL, and Run query button.](media/run-query.png)](media/run-query.png#lightbox)
6. You should get a **403** error indicating that Graph Explorer lacks your permission to perform this action.
7. Select the **Modify permissions** tab to grant Graph Explorer permission.
8. Select **Consent** for **Sites.Read.All**.
9. Read the requested permissions and then continue if you agree.
10. Select **Run query** again.

    You should now get the **OK - 200** status.

[![Screenshot of the query response preview.](media/response-preview.png)](media/response-preview.png#lightbox)
11. Start a new browser session tab.
12. Go to [OneDrive Personal Cloud Storage](https://onedrive.live.com?azure-portal=true) and sign in.
13. Select **+ New** and select **Word document**. You're creating this document so that you have some content in your **Last Used** list.

[![Screenshot of the create new Word document button.](media/new-word-document.png)](media/new-word-document.png#lightbox)
14. Enter some test text in the Word file. The document will be saved automatically for you.
15. Go back to the Graph Explorer.
16. Run the same query again.

    You should now get a response with values. If you don't see a response, go back to the document you created in OneDrive and make changes, then come back and run the query again.
17. Select the response JSON, right-click, select **Copy**, and then save it.

[![Screenshot of the JSON response selected with Copy feature.](media/copy-feature.png)](media/copy-feature.png#lightbox)

    You'll need this response later in this exercise because you'll use it when you configure the response in the custom connector.

## Task 3: Register a new application and add permissions

In this task, you'll configure a new application that will be used to access the Graph API from the custom connector. You'll also configure permissions for the specific graph API actions, similar to when you modified permissions in Graph Explorer.

1. Go to [Microsoft Azure](https://portal.azure.com/?azure-portal=true) and sign in with your admin user credentials.
2. Select **Show portal menu** and then select **Microsoft Entra ID**.

[![Screenshot of the Microsoft Entra ID navigation button.](media/azure-active-directory-portal.png)](media/azure-active-directory-portal.png#lightbox)
3. Select **App registration &gt; + New registration**.

[![Screenshot of the create new application registration button.](media/new-registration.png)](media/new-registration.png#lightbox)
4. Enter **Learn last used connector** for **Name**, select **Web** enter `https://global.consent.azure-apim.net/redirect` for **Redirect URI**, and then select **Register**.

[![Screenshot of the Register an appliation window.](media/register-application.png)](media/register-application.png#lightbox)
5. Select **API permissions** and then select **+ Add a permission**.
6. Select **Microsoft Graph**.
7. Select **Delegated permissions**.
8. Search for sites and then expand **Sites**.
9. Select **Sites.Read.All**, **Sites.ReadWrite.All**, and then select **Add permissions**.

[![Screenshot of the select Permissions window.](media/select-permissions.png)](media/select-permissions.png#lightbox)
10. You should now have three API permissions. Select **Certificates & secrets**.

[![Screenshot of the Certificates and Secrets menu with three API permissions.](media/certificates-secrets.png)](media/certificates-secrets.png#lightbox)
11. Select **+ New client secret**.

[![Screenshot of the New client secret button.](media/new-client-secret.png)](media/new-client-secret.png#lightbox)
12. Enter **Last used connector action** for **Description**, select **90 days** for **Expires**, and then select **Add**.
13. Copy the **Value** and save it for later because it won't be shown again. You'll use this user secret when creating the connector.

[![Screenshot of the Client secrets window.](media/client-secrets.png)](media/client-secrets.png#lightbox)
14. Select **Overview**.
15. Copy the **Application (Client) ID** and save it on a notepad. You'll use this client ID when creating the connector.

[![Screenshot of the Application (Client) ID with copy feature.](media/application-client-id.png)](media/application-client-id.png#lightbox)

## Task 4: Create a custom connector

Follow these steps to create a custom connector:

1. Go to [Power Apps admin portal](https://make.powerapps.com/home/?azure-portal=true) and make sure that you are in the correct environment.
2. Select **Solutions** and then select to open the **Contoso graph** solution that you created in **Task 1: Create a new solution**.
3. Select **+ New &gt; Automation &gt; Custom connector**.

[![Screenshot of the New menu with Custom connector selected.](media/custom-connector.png)](media/custom-connector.png#lightbox)
4. Enter **Contoso graph** for **Connector name**.

[![Screenshot of Contoso graph entered as the connector name.](media/contoso-graph.png)](media/contoso-graph.png#lightbox)
5. Scroll down, enter **graph.microsoft.com** for **Host** and **/v1.0** for **Base URL**.
6. Select **Security**.

[![Screenshot of the Host and Base URL fields with Security button.](media/security.png)](media/security.png#lightbox)
7. Select **OAuth 2.0** for **Authentication**.
8. Select **Microsoft Entra ID** for **Identity Provider**.
9. Paste the **ID** that you copied from Azure in the **Client id** field and then paste the **Value** that you copied from Azure in the **Client secret** field.
10. Enter `https://graph.microsoft.com` for **Resource URL** and then select **Create connector**.

[![Screenshot of the Create connector button.](media/create-connector.png)](media/create-connector.png#lightbox)
11. Don't navigate away from this page.

## Task 5: Add the action

In this task, you'll configure the last used action tip called Graph API.

1. Select **Definition &gt; + New action**.

[![Screenshot of the New action button on the Definition window.](media/new-action.png)](media/new-action.png#lightbox)
2. Enter **Last used** for **Summary** and **LastUsed** for **Operation ID**.
3. Go to the **Request** section and select **+ Import from sample**.

[![Screenshot of the Import from sample button on the Request section.](media/import-sample.png)](media/import-sample.png#lightbox)
4. Select **Get** for the verb, enter **/me/insights/used** for **URL**, and then select **Import**.
5. Scroll down and select the default response.

[![Screenshot of the default response in the Response section.](media/default-response.png)](media/default-response.png#lightbox)
6. Select **+ Import from sample**.

[![Screenshot of the Import from sample button.](media/import-button.png)](media/import-button.png#lightbox)
7. Paste the response that you copied from Graph Explorer in the **Body** field and then select **Import**.

[![Screenshot of the response in the Body field and the Import button.](media/response.png)](media/response.png#lightbox)
8. Select **Update connector**.
9. Don't navigate away from this page.

## Task 6: Test the connector

Follow these steps to test the connector:

1. Select the **Test** tab and then select **+ New connection**.

[![Screenshot of the New connection button on the Test tab.](media/new-connection.png)](media/new-connection.png#lightbox)
2. Provide your credentials.
3. Read the requested permissions and continue.
4. Select **Refresh** connections.
5. Select **Test operation**.

[![Screenshot of the Test operation button highlighted.](media/test-operation.png)](media/test-operation.png#lightbox)

    You should see a **200** status, and the response should look like the following image.

[![Screenshot of the 200 status and the reponse example.](media/response-status.png)](media/response-status.png#lightbox)
