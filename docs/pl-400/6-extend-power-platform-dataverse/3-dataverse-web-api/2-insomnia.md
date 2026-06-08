# Insomnia

Completed

- 15 minutes

Insomnia is a valuable tool for composing unplanned Web API queries and verifying the behavior of Web API Operations without having to write a program to do so. If you're new to Insomnia, see the [Introduction to Insomnia](https://docs.insomnia.rest/insomnia/get-started/?azure-portal=true) for an introduction to Insomnia.

## Register an app in Microsoft Entra ID

To connect Insomnia to Microsoft Dataverse, you must first ensure that you have an application registered in your Microsoft Entra ID environment.

## Get the current version of your Web API endpoint

You can find the version number of your Web API endpoint by going to your environment's **Developer resources** in the maker portal.

[![Screenshot of developer resources from the maker portal.](media/resources.png)](media/resources.png#lightbox)

From the **Developer Resources** page. Your version number is indicated under the Web API endpoint, as shown in the following image. Make note of the endpoint and the version.

[![Screenshot of the Developer Resources page with Web API endpoint.](media/endpoint.png)](media/endpoint.png#lightbox)

## Set up Insomnia

To start the setup process, install [Insomnia](https://docs.insomnia.rest/insomnia/install/?azure-portal=true).

After Insomnia has been installed, you use a feature that Insomnia has to manage environment variables so that you can cleanly manage entities such as your endpoint URLs and client IDs.

To create an Insomnia environment that you can use to connect with your Dataverse instance, follow these steps:

1. Launch the Insomnia desktop application.
2. Select **New Collection**.

[![Screenshot showing the new collection button.](media/new-collection.png)](media/new-collection.png#lightbox)
3. Enter **Dataverse Collection** for name and then select **Create**.
4. Select the Environment settings button.

[![Screenshot showing the environment settings button.](media/environment-settings.png)](media/environment-settings.png#lightbox)
5. Rename the environment **Dataverse Environment** and replace {} with the JSON text below.

    ```json
     {
     	"url": "https://[ORG NAME].api.crm.dynamics.com",
     	"clientid": "51f81489-12ee-4a9e-aaae-a2591f45987d",
     	"version": "9.2",
     	"webapiurl": "{{url}}/api/data/v{{version}}/",
     	"callback": "https://callbackurl",
     	"authurl": "https://login.microsoftonline.com/common/oauth2/authorize?resource={{url}}"
     }
    ```
6. Replace the URL placeholder **[ORG NAME]** with of your Dataverse environment org name.
7. If the variables show errors, select the **url**.

[![Screenshot showing the URL variable.](media/url-variable.png)](media/url-variable.png#lightbox)
8. Select **Done** on the edit variable popup.
9. Do the same for the **Version** and the second **url** variables.
10. The variable should now look like the image below. Select **Close**.

[![Screenshot showing the variables.](media/variables.png)](media/variables.png#lightbox)

## Generate an access token to use with your environment

To connect by using OAuth 2.0, you must have an access token. To get a new access token, follow these steps:

1. Select **New HTTP Request**.

[![Screenshot showing the add new HTTP request button.](media/new-request.png)](media/new-request.png#lightbox)
2. Select the **Auth** tab.
3. Select the chevron icon next to the **Auth** tab name and then select **OAuth 2.0**.

[![Screenshot showing the OAuth 2.0 selection.](media/oauth-2.png)](media/oauth-2.png#lightbox)
4. Verify that you've selected the environment you created.
5. Select **Implicit** from the **Grant Type** drop-down menu, set **AUTHORIZATION URL** to `{{authurl}}`, **CLIENT ID** to `{{clientid}}`, and **REDIRECT URL** to `{{callback}}`.

[![Screenshot of Get New Access Token with values set.](media/token.png)](media/token.png#lightbox)
6. Select **Fetch Token**. When you make this selection, a Microsoft Entra ID sign-in page appears. Enter your username and password.
7. You should see the created Token.

## Test your connection

Create a new Web API request to test the connection with your Dataverse instance. Use the WhoAmI function by following these steps:

1. Select GET as the HTTP method and add `{{webapiurl}}WhoAmI` in the editing space.

[![Screenshot of GET HTTP as method and WhoAmI added in editing space.](media/get-http.png)](media/get-http.png#lightbox)
2. Select **Send** to send this request.

    If your request is successful, you see the data from the WhoAmIResponse ComplexType that is returned by the WhoAmI Function.

[![Screenshot of successful request with data returned.](media/success.png)](media/success.png#lightbox)
