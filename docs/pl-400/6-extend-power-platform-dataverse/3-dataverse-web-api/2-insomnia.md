# Insomnia

Insomnia is a tool for composing unplanned Web API queries and verifying Web API operations without writing a program.

## Register an App in Microsoft Entra ID

To connect Insomnia to Microsoft Dataverse, you must first have an application registered in your Microsoft Entra ID environment.

## Get the Current Version of Your Web API Endpoint

Find the version number of your Web API endpoint via your environment's **Developer Resources** in the maker portal. Note the endpoint and the version.

## Set Up Insomnia

1. Install [Insomnia](https://docs.insomnia.rest/insomnia/install/).
2. Launch the Insomnia desktop application.
3. Select **New Collection**.
4. Enter **Dataverse Collection** for name and select **Create**.
5. Select the Environment settings button.
6. Rename the environment **Dataverse Environment** and replace `{}` with:

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

7. Replace `[ORG NAME]` with your Dataverse environment org name.
8. Resolve any variable errors by selecting each variable and clicking **Done**.
9. Select **Close**.

## Generate an Access Token

1. Select **New HTTP Request**.
2. Select the **Auth** tab.
3. Select the chevron icon next to **Auth** and select **OAuth 2.0**.
4. Verify the correct environment is selected.
5. Set:
   - **Grant Type**: Implicit
   - **AUTHORIZATION URL**: `{{authurl}}`
   - **CLIENT ID**: `{{clientid}}`
   - **REDIRECT URL**: `{{callback}}`
6. Select **Fetch Token** and sign in with your Microsoft Entra ID credentials.

## Test Your Connection

1. Select **GET** as the HTTP method and add `{{webapiurl}}WhoAmI` in the editing space.
2. Select **Send**.
3. A successful request returns data from the `WhoAmIResponse` ComplexType.
