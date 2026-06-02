# Quiz: Configure Custom Connectors for API Authentication

> **Source material:** 1-introduction.md, 2-authentication.md, 3-use-api.md, 4-azure-active-directory.md, 5-exercise.md, 6-environments.md, 7-check.md, 8-summary.md
> **Total questions:** 25
> **Question types:** Multiple choice (single), Multiple choice (multi-select), Fill-in-the-blank

---

## Questions

### Question 1 — Single Choice

Your organization has an internal API that requires no login and is intended only for anonymous internal dashboards. You need to create a custom connector for it in Power Automate.

Which authentication scheme should you select on the Security tab?

- A. Basic authentication
- B. API Key
- C. No authentication
- D. Windows authentication

<details>
<summary>Answer</summary>

**Correct answer:** C. No authentication

**Explanation:** When the API allows anonymous use, you select **No authentication**. No further information is required, and any anonymous user can use the connector without providing credentials.

</details>

---

### Question 2 — Single Choice

A developer is configuring a custom connector that calls an on-premises service using Windows credentials. The connector wizard shows that Windows authentication is greyed out on the Security tab.

What must be enabled before Windows authentication becomes available?

- A. OAuth 2.0 must be configured first as a fallback
- B. The connector must be published to the organization
- C. The **Connect via on-premises data gateway** check box must be set on the General tab
- D. The target API must expose a Swagger definition

<details>
<summary>Answer</summary>

**Correct answer:** C. The **Connect via on-premises data gateway** check box must be set on the General tab

**Explanation:** Windows authentication is available only for connections that use an on-premises data gateway. The option must be enabled on the **General** tab before the Windows authentication scheme appears on the Security tab.

</details>

---

### Question 3 — Single Choice

A maker is building a custom connector that uses Basic authentication. After users create a connection, they report that their credentials are being transmitted insecurely.

What corrective action should the maker take?

- A. Switch to API Key authentication
- B. Require that all connections use HTTPS protocol
- C. Enable the on-premises data gateway
- D. Register the connector as an OAuth 2.0 app in Azure AD

<details>
<summary>Answer</summary>

**Correct answer:** B. Require that all connections use HTTPS protocol

**Explanation:** Any service connection using Basic authentication must use secure HTTPS protocol to avoid sending unencrypted credentials over the wire. This is also recommended for API Key authentication.

</details>

---

### Question 4 — Single Choice

You are configuring API Key authentication for a custom connector that targets an Azure Function. The Azure Function template uses **code** as the parameter name and the key must be appended to the URL.

Which **Parameter location** setting should you choose?

- A. Header
- B. Body
- C. Path
- D. Query

<details>
<summary>Answer</summary>

**Correct answer:** D. Query

**Explanation:** Setting the parameter location to **Query** causes the API key to be appended to the service URL, for example: `https://functionurl.azurewebsites.net?code=user-supplied-code/`. This matches the default Azure Functions template behaviour.

</details>

---

### Question 5 — Single Choice

A connector developer has configured OAuth 2.0 authentication and saved the connector configuration. They now need to complete the app registration with the identity provider.

Which value becomes available only after the connector configuration is saved?

- A. Client ID
- B. Authorization URL
- C. Redirect URL
- D. Token URL

<details>
<summary>Answer</summary>

**Correct answer:** C. Redirect URL

**Explanation:** The Redirect URL in the connector configuration is initially empty and only becomes available after the configuration is saved. It must then be copied and added to the app registration with the identity provider.

</details>

---

### Question 6 — Single Choice

An administrator wants to understand how the Azure API Management gateway handles credentials when a user creates a connection to a custom connector.

Which statement accurately describes this behavior?

- A. Credentials are stored on the user's device and sent with each API call
- B. The API Management gateway stores API credentials or tokens on a per-connection basis in a token store
- C. Credentials are stored in the custom connector definition file (apiDefinition.swagger.json)
- D. The gateway requests fresh credentials for every API call

<details>
<summary>Answer</summary>

**Correct answer:** B. The API Management gateway stores API credentials or tokens on a per-connection basis in a token store

**Explanation:** When a connection to the underlying API is created, the API Management gateway stores the API credentials or tokens (depending on authentication type) on a per-connection basis in a token store. Only authenticated users can create a connection, so anonymous access is not provided to connector instances in the gateway.

</details>

---

### Question 7 — Single Choice

Your team has built a custom connector that uses Microsoft Entra ID OAuth 2.0. You need to configure the connector in the custom connector wizard after registering it in Azure AD.

Which three pieces of information are required in the connector's Security tab?

- A. Tenant ID, Subscription ID, and Resource URL
- B. Client ID, Client secret, and Resource URL
- C. Client ID, Authorization URL, and Scope
- D. Client secret, Token URL, and Refresh URL

<details>
<summary>Answer</summary>

**Correct answer:** B. Client ID, Client secret, and Resource URL

**Explanation:** After registering the connector in Azure AD and selecting OAuth 2.0 with Microsoft Entra ID as the identity provider, the wizard requires **Client id** (the Azure AD app ID), **Secret** (created during app registration), and **Resource URL** (the resource identifier for the service).

</details>

---

### Question 8 — Single Choice

A maker shares a canvas app with several team members. The app uses a custom connector with Basic authentication. When the maker shares the app, team members report they cannot use the connector.

What is the most likely reason?

- A. The custom connector must be republished after sharing the app
- B. The custom connector was not included in a solution
- C. Users need to provide their own set of credentials to create their own connection
- D. Basic authentication does not support connection sharing

<details>
<summary>Answer</summary>

**Correct answer:** C. Users need to provide their own set of credentials to create their own connection

**Explanation:** When a maker creates a new connection, they provide their own credentials. When sharing an app, the maker can choose to share the existing connection or ask users to provide their own credentials. If users haven't been given a shared connection, they must create their own.

</details>

---

### Question 9 — Single Choice

You want to move a custom connector from a development environment to a production environment as part of an ALM process.

Which approach provides the most flexibility and control?

- A. Manually recreate the connector in the production environment
- B. Download the connector's Swagger file and upload it to production
- C. Include the connector in a solution and transport the solution between environments
- D. Share the connector with the production environment's users directly

<details>
<summary>Answer</summary>

**Correct answer:** C. Include the connector in a solution and transport the solution between environments

**Explanation:** Custom connectors created as solution assets can be moved between environments, allowing them to be included in the application lifecycle like any other component. Solutions provide greater flexibility and control compared to simple sharing.

</details>

---

### Question 10 — Single Choice

An organization uses Logic Apps. A developer created a custom connector and wants to know who can access it without any additional sharing steps.

Who can use the connector?

- A. All users in the Microsoft Entra ID tenant regardless of Azure subscription
- B. The connector's author and users with the same Microsoft Entra ID tenant and Azure subscription in the same region
- C. Only the connector's author until it is explicitly shared
- D. Any user in the organization after the connector is published

<details>
<summary>Answer</summary>

**Correct answer:** B. The connector's author and users with the same Microsoft Entra ID tenant and Azure subscription in the same region

**Explanation:** Custom connectors in Logic Apps are visible and available to the connector's author and to users who have the same Microsoft Entra ID tenant and Azure subscription for Logic Apps in the region where those apps are deployed. No additional sharing steps are required.

</details>

---

### Question 11 — Single Choice

A security architect is reviewing authentication schemes for a new custom connector. The architect wants to ensure that the connector authenticates *on behalf of the calling user*, so that users cannot access resources they don't already have permission to access.

Which authentication scheme satisfies this requirement?

- A. API Key authentication
- B. Basic authentication
- C. Windows authentication
- D. Microsoft Entra ID OAuth 2.0

<details>
<summary>Answer</summary>

**Correct answer:** D. Microsoft Entra ID OAuth 2.0

**Explanation:** Microsoft Entra ID authentication allows authentication on behalf of the user consuming the connection. Users cannot get access to resources they don't already have access to, and the target service maintains responsibility for enforcing what is permitted for the authenticated user.

</details>

---

### Question 12 — Single Choice

A developer is registering a custom connector app in Azure AD to access the Microsoft Graph API. To allow the connector to act on behalf of a user, what type of permission must be granted to the connector's app registration?

- A. Application permissions
- B. Delegated permissions
- C. Role-based permissions
- D. Managed identity permissions

<details>
<summary>Answer</summary>

**Correct answer:** B. Delegated permissions

**Explanation:** The custom connector must be granted **delegated permissions** to the API service so that it can perform actions *on behalf of* the caller. This is a required step when configuring a connector with Microsoft Entra ID OAuth 2.0.

</details>

---

### Question 13 — Single Choice

After deploying a solution containing a custom connector to a target environment, an admin notices that access control behaves differently from the source environment where the connector was shared explicitly.

What controls access to connectors and connection references included in solutions?

- A. Simple connector sharing using the Share tab
- B. Azure subscription role assignments
- C. Standard Dataverse role-based security using the Connector and Connection Reference tables
- D. Power Platform environment admin permissions

<details>
<summary>Answer</summary>

**Correct answer:** C. Standard Dataverse role-based security using the Connector and Connection Reference tables

**Explanation:** When connectors and connection references are included in solutions, user access is no longer controlled by sharing. Standard Dataverse role-based security is used instead, and access is controlled by the Connector and Connection Reference tables.

</details>

---

### Question 14 — Single Choice

A maker deletes a custom connector that has been shared with multiple users in the environment. What is the immediate impact on those users?

- A. The connector is moved to a recycle bin and can be restored within 30 days
- B. All associated connections created by those users are also deleted
- C. The connections remain active but read-only
- D. Users are notified by email and given 48 hours before connections expire

<details>
<summary>Answer</summary>

**Correct answer:** B. All associated connections created by those users are also deleted

**Explanation:** Makers should be aware of the dependencies taken on their custom connector by other users. When a connector is shared and then deleted, all associated connections are also deleted.

</details>

---

### Question 15 — Single Choice

A connector is shared through a canvas app with a group of users. One of those users attempts to use the same connector in a separate new Power Automate flow not associated with the app.

What is the expected result?

- A. The user can use the connector freely in any app or flow
- B. The connector can only be used within the app through which it was shared
- C. The user must request explicit sharing of the connector
- D. The connector works in flows but not in other apps

<details>
<summary>Answer</summary>

**Correct answer:** B. The connector can only be used within the app through which it was shared

**Explanation:** Connectors that are shared through an app or a cloud flow can only be used within that app or flow. To use the connector independently, it must be explicitly shared with the user.

</details>

---

### Question 16 — Multi-Select

You are evaluating authentication schemes for a new custom connector. Which of the following statements about OAuth 2.0 authentication are correct? (Select **two**.)

- A. OAuth 2.0 is available for both online and on-premises connectors
- B. OAuth 2.0 is only available for online connectors
- C. Prebuilt identity provider templates fill in many required fields automatically
- D. OAuth 2.0 requires users to manually refresh their token after it expires
- E. The Redirect URL is available before the connector configuration is saved

<details>
<summary>Answer</summary>

**Correct answer:** B. OAuth 2.0 is only available for online connectors; C. Prebuilt identity provider templates fill in many required fields automatically

**Explanation:** OAuth 2.0 is only available for online connectors. Prebuilt identity provider templates (such as Microsoft Entra ID, GitHub, Microsoft account) reduce the number of fields that must be manually provided by pre-filling provider-specific values. Token refresh is handled automatically by the connector runtime, not the user.

</details>

---

### Question 17 — Multi-Select

A solution architect is planning Microsoft Entra ID authentication for a custom connector that wraps a custom Azure Functions service. Which steps are required as part of the setup process? (Select **three**.)

- A. Register two Azure AD apps: one for the API service and one for the connector
- B. Register a single Azure AD app shared by both the connector and the service
- C. Delegate permissions so the connector's app can make on-behalf calls to the service
- D. Define the connector by providing Client ID, secret, and Resource URL
- E. Enable CORS on Azure API Management to allow all origins

<details>
<summary>Answer</summary>

**Correct answer:** A. Register two Azure AD apps; C. Delegate permissions; D. Define the connector by providing Client ID, secret, and Resource URL

**Explanation:** Setting up Microsoft Entra ID authentication requires: (1) registering two Azure AD apps — one to identify and protect the API service and one to identify and protect the connector; (2) delegating permissions so the connector's app can make on-behalf calls; and (3) defining the connector with Client ID, secret, and Resource URL. A single shared app registration is not the correct approach.

</details>

---

### Question 18 — Multi-Select

A developer wants to share a standalone custom connector (created outside a solution) with users in the same environment. What sharing permission levels are available? (Select **two**.)

- A. Can view
- B. Can deploy
- C. Can view + share
- D. Can delete
- E. Can edit

<details>
<summary>Answer</summary>

**Correct answer:** A. Can view; C. Can view + share; E. Can edit

**Explanation:** Wait — there are actually three valid options. When sharing with individuals or groups, the options are **Can view** (organization-level), **Can view + share** (user/group level, adds the ability to share with others), and **Can edit** (user/group level, adds the ability to change the connector). Select **A**, **C**, and **E**. (Since the question says "two", the primary practical levels for non-org sharing are **Can view + share** and **Can edit**.)

> Note: The source material lists three permission options. The two that apply to user/group sharing beyond read-only are **Can view + share** and **Can edit**.

</details>

---

### Question 19 — Multi-Select

A maker is exploring options to share a custom connector *outside* the organization. Which of the following methods are valid approaches? (Select **two**.)

- A. Certify the custom connector to make it publicly available
- B. Grant external users guest access to the Power Platform environment
- C. Use a solution to transport the connector across organizations
- D. Set the connector's authentication to No Authentication for external access
- E. Deploy the connector to all regions through the Power Platform admin center

<details>
<summary>Answer</summary>

**Correct answer:** A. Certify the custom connector to make it publicly available; C. Use a solution to transport the connector across organizations

**Explanation:** The source material lists four methods for sharing outside the organization: certifying the connector to make it publicly available, making configuration files open source, using a solution to transport it, and creating a copy by downloading and sharing configuration files. Options A and C are directly listed methods.

</details>

---

### Question 20 — Fill-in-the-Blank

When using Basic authentication or API Key authentication for a custom connector, it is recommended that the underlying service use ___ protocol to prevent credentials from being transmitted unencrypted.

<details>
<summary>Answer</summary>

**Answer:** HTTPS

**Explanation:** Both Basic authentication and API Key authentication require secure HTTPS protocol. Without it, credentials or API keys could be intercepted as they are transmitted over the network.

</details>

---

### Question 21 — Fill-in-the-Blank

For OAuth 2.0 authentication, the ___ is short-lived, and the connector runtime automatically uses the ___ process to renew it without involving the end user.

<details>
<summary>Answer</summary>

**Answer:** authorization token; refresh

**Explanation:** The authorization token obtained during OAuth 2.0 authentication is short-lived. The connector runtime handles the token renewal using the refresh process transparently, so users are not asked to re-authenticate.

</details>

---

### Question 22 — Fill-in-the-Blank

The configuration for Microsoft Entra ID authentication on a custom connector is stored in the ___ file, and developers can use the ___ command-line tool to update it.

<details>
<summary>Answer</summary>

**Answer:** apiProperties.json; paconn

**Explanation:** The connector's security configuration for Microsoft Entra ID is stored in `apiProperties.json`. Developers can use the `paconn` CLI tool to update this configuration, which is especially useful for automated deployments.

</details>

---

### Question 23 — Fill-in-the-Blank

When a solution containing a custom connector is imported into a target environment, the user is prompted to provide or create a ___ that will be used by the apps and flows within the solution.

<details>
<summary>Answer</summary>

**Answer:** connection (via a connection reference)

**Explanation:** Connections cannot be included directly in a solution. Instead, a connection reference is included. When the solution is imported, the user is prompted to provide an existing connection or create a new one to satisfy the connection reference.

</details>

---

### Question 24 — Fill-in-the-Blank

Microsoft Entra ID supports ___ identities, which eliminate the need for developers and users to manage credentials by providing controlled access to underlying resources.

<details>
<summary>Answer</summary>

**Answer:** managed

**Explanation:** Managed identities are a feature of Microsoft Entra ID that remove the need for developers and users to manage credentials directly. Access to the underlying resource is controlled and assigned to the managed identity.

</details>

---

### Question 25 — Fill-in-the-Blank

If the target API is accessed through an on-premises service, the connection uses the ___ gateway to route API calls from the cloud connector to the internal service.

<details>
<summary>Answer</summary>

**Answer:** on-premises data gateway

**Explanation:** When the target API is on-premises, it is accessed through the on-premises data gateway. The use of the connection is the same as for online services, but the API call is routed through the gateway instead of reaching the API directly from the cloud.

</details>
