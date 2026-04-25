# Authenticate against Microsoft Dataverse using OAuth

Microsoft Dataverse uses **OAuth 2.0** as its authentication standard.

## Authentication vs. Authorization

- **Authentication**: Verifying the identity of a user or process. Microsoft's solution is **Microsoft Entra ID** (formerly Azure Active Directory).
- **Authorization**: Verifying whether an authenticated user is authorized to access the resource. Dataverse authorization is at the Entra ID tenant level; detailed permissions are managed by the application based on the signed-in user via Dataverse security roles.

## Register Dataverse Apps with Entra ID

Register an app in the [Azure portal](https://portal.azure.com/) via **App Registrations > New Registration**.

**Account type options:**
- **Single tenant** — All users and guests in your directory. Use for internal organization apps.
- **Multitenant (Entra ID)** — All users with work/school accounts from Microsoft. Use for business/educational customers.
- **Multitenant + personal Microsoft accounts** — All users with work, school, or personal Microsoft accounts (Xbox, Skype, etc.).

For web apps, specify a Redirect URI under **Authentication > Web**.

## Access Dataverse Using the Web API

All access to Dataverse is done in the context of a signed-in user (interactive or non-interactive via S2S).

### Configure API Permissions (Delegated Access)

For apps accessing Dataverse on behalf of a signed-in user, go to **API permissions** and grant **user_impersonation** delegated access to Dynamics CRM (Dataverse).

### Configure a Dataverse Application User (S2S)

For S2S authentication, create a Dataverse Application User in each environment via the [Power Platform admin center](https://admin.powerplatform.microsoft.com/):
- Create a new application user.
- Associate with the Entra ID app or managed identity.
- Assign appropriate Dataverse security roles.

## Use Authentication Libraries to Connect

Use [Microsoft identity platform authentication libraries](https://learn.microsoft.com/en-us/azure/active-directory/develop/reference-v2-libraries/) (e.g., MSAL) to acquire access tokens.

### OAuthMessageHandler (MSAL example)

```csharp
class OAuthMessageHandler : DelegatingHandler
{
  private AuthenticationHeaderValue authHeader;
  public OAuthMessageHandler(string serviceUrl, string clientId, string redirectUrl, string username, string password, HttpMessageHandler innerHandler)
  : base(innerHandler)
  {
    var clientApplication = PublicClientApplicationBuilder.Create(clientId)
      .WithAuthority(AadAuthorityAudience.AzureAdMultipleOrgs)
      .WithRedirectUri(redirectUrl)
      .Build();
    var scope = serviceUrl + "//.default";
    string[] scopes = { scope };
    AuthenticationResult authBuilderResult;
    if (username != string.Empty && password != string.Empty)
    {
      var securePassword = new SecureString();
      foreach (char ch in password) securePassword.AppendChar(ch);
      authBuilderResult = clientApplication.AcquireTokenByUsernamePassword(scopes, username, securePassword).ExecuteAsync().Result;
    }
    else
    {
      authBuilderResult = clientApplication.AcquireTokenInteractive(scopes).ExecuteAsync().Result;
    }
    authHeader = new AuthenticationHeaderValue("Bearer", authBuilderResult.AccessToken);
  }
  protected override Task<HttpResponseMessage> SendAsync(HttpRequestMessage request, System.Threading.CancellationToken cancellationToken)
  {
    request.Headers.Authorization = authHeader;
    return base.SendAsync(request, cancellationToken);
  }
}
```

### Helper Method to Get HttpClient

```csharp
static HttpClient GetHttpClient(string url, string clientId, string redirectUrl, string version = "v9.2")
{
  HttpMessageHandler messageHandler = new OAuthMessageHandler(url, clientId, redirectUrl, "", "",
    new HttpClientHandler());
  HttpClient httpClient = new HttpClient(messageHandler)
  {
    BaseAddress = new Uri(string.Format("{0}/api/data/{1}/", url, version)),
    Timeout = new TimeSpan(0, 2, 0) // 2 minutes
  };
  return httpClient;
}
```

### Make a Web API Call

```csharp
using (HttpClient client = GetHttpClient("https://yourenvname.api.crm.dynamics.com", "51f81489-12ee-4a9e-aaae-a2591f45987d", "http://localhost:8080"))
{
  var response = client.GetAsync("WhoAmI").Result;
  if (response.IsSuccessStatusCode)
  {
    JObject body = JObject.Parse(response.Content.ReadAsStringAsync().Result);
    Guid userId = (Guid)body["UserId"];
    Console.WriteLine("Your UserId is {0}", userId);
  }
  else
  {
    Console.WriteLine("The request failed with a status of '{0}'", response.ReasonPhrase);
  }
}
```
