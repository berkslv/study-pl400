# Recall: Configure Custom Connectors with API Authentication

> **Source files:** 1-introduction.md, 2-authentication.md, 3-use-api.md, 4-azure-active-directory.md, 6-environments.md, 8-summary.md

---

## Keywords

| Term | Definition |
|------|-----------|
| Custom Connector | A user-defined connector that provides access to custom or partner APIs via public endpoints. |
| Azure API Management Gateway | Microsoft infrastructure that stores API credentials/tokens per connection in a token store. |
| Token Store | Secure storage within API Management gateway that holds per-connection API credentials or tokens. |
| OAuth 2.0 | An authentication scheme available only for online connectors, supporting delegated authorization flows. |
| Microsoft Entra ID (Azure AD) | Microsoft's identity platform used as the recommended OAuth 2.0 provider for custom connectors. |
| Delegated Permissions | Permissions granted to the connector's Azure AD app to call the target API on behalf of the user. |
| paconn | CLI tool used to script and automate custom connector deployment and configuration updates. |
| Connection Reference | A solution component that points to a connection outside the solution, enabling environment portability. |
| Standalone Connector | A custom connector created outside a solution, shared explicitly within the same environment. |
| CORS (Cross-Origin Resource Sharing) | A browser security mechanism; Azure API Management domains must be allow-listed when using Azure AD. |
| Redirect URL | The callback URL generated after saving OAuth connector config, required for identity provider app registration. |
| On-Premises Data Gateway | Required infrastructure for Windows authentication and accessing on-premises APIs via custom connectors. |

---

## Main Ideas

- Custom connectors support five authentication schemes: No authentication, Basic authentication, API Key, OAuth 2.0, and Windows authentication.
- Windows authentication is only available when **Connect via on-premises data gateway** is enabled; OAuth 2.0 is only available for online connectors.
- Azure API Management gateway stores credentials/tokens per-connection; only authenticated users can create connections — no anonymous access to connector instances.
- After a connection is created, users do not need to re-authenticate when using the connector in Power Apps, Power Automate, or Logic Apps.
- Basic authentication and API Key authentication should always use HTTPS to prevent sending credentials unencrypted.
- For API Key auth, the key can be sent via **header** or **query string**; parameter label, name, and location must all be configured.
- Microsoft Entra ID (Azure AD) is the recommended scheme because it authenticates on behalf of the user, preserves user identity at the service level, and supports managed identities.
- Configuring Azure AD auth requires registering **two Azure AD apps**: one for the API service and one for the connector, then granting delegated permissions from the connector app to the service app.
- The connector's Redirect URL is only available after the configuration is saved; it must then be added to the Azure AD app registration.
- Custom connectors in Logic Apps are automatically visible to users in the same Entra ID tenant and Azure subscription; no explicit sharing step is needed.
- Standalone connectors can be shared with individuals, groups, or the entire organization with **Can view**, **Can view + share**, or **Can edit** permissions.
- Connectors in solutions use Dataverse role-based security (Connector and Connection Reference tables) instead of manual sharing.
- Deleting a shared custom connector deletes all associated connections — makers must be aware of dependencies.
- To share a connector outside the organization: certify it, make config files open source, use a solution, or share the downloaded config files.

---

## Mini Quiz

### Q1 — Single Choice

A maker wants to secure a custom connector for an on-premises service using the employee's Windows domain credentials.

Which authentication scheme should they select?

- A. OAuth 2.0
- B. Basic authentication
- C. Windows authentication
- D. API Key

<details>
<summary>Answer</summary>

**Correct answer:** C. Windows authentication

**Explanation:** Windows authentication is only available for connections that use an on-premises data gateway and requires the **Connect via on-premises data gateway** option to be enabled on the General tab.

</details>

---

### Q2 — Fill-in-the-Blank

OAuth 2.0 authentication is only available for ___ connectors, and the connector must be registered as an app in ___ to enable delegated permissions.

<details>
<summary>Answer</summary>

**Answer:** online; Microsoft Entra ID (Azure AD)

**Explanation:** The OAuth 2.0 scheme requires an online connector, and both the connector and the target API must be registered in Azure AD to support on-behalf-of delegated access.

</details>

---

### Q3 — Single Choice

After saving a custom connector's OAuth 2.0 configuration, a maker needs to complete the identity provider app registration. What value must they copy from the saved connector configuration?

- A. Client ID
- B. Client Secret
- C. Redirect URL
- D. Resource URL

<details>
<summary>Answer</summary>

**Correct answer:** C. Redirect URL

**Explanation:** The Redirect URL is initially empty and only becomes available after the connector configuration is saved. It must then be added to the Azure AD app registration as a valid callback URL.

</details>

---

### Q4 — Fill-in-the-Blank

To configure Azure AD authentication for a custom connector, a maker must register ___ Azure AD apps — one to protect the API service and one to identify the ___.

<details>
<summary>Answer</summary>

**Answer:** two; connector

**Explanation:** The setup requires two separate Azure AD app registrations: one for the target API service and one for the custom connector itself, with delegated permissions granted from the connector app to the service app.

</details>

---

### Q5 — Single Choice

A maker shares a custom connector with the entire organization. What permission level does organization-wide sharing provide?

- A. Can edit
- B. Can view + share
- C. Can view
- D. Can view + edit

<details>
<summary>Answer</summary>

**Correct answer:** C. Can view

**Explanation:** Organization sharing only grants the **Can view** option. The **Can view + share** and **Can edit** options are only available when sharing with individual users or user groups.

</details>

---

### Q6 — Single Choice

A team moves a custom connector between environments using a solution. How is user access to the connector controlled in the target environment?

- A. By explicit sharing on the Share tab of the connector
- B. By the connector author manually granting access
- C. By Dataverse role-based security using the Connector and Connection Reference tables
- D. By the Azure subscription and Entra ID tenant membership

<details>
<summary>Answer</summary>

**Correct answer:** C. By Dataverse role-based security using the Connector and Connection Reference tables

**Explanation:** When connectors are included in solutions, access is no longer controlled by manual sharing. Standard Dataverse role-based security governs access through the Connector and Connection Reference tables.

</details>

---

### Q7 — Fill-in-the-Blank

The Azure API Management gateway stores API credentials on a per-___ basis in a ___ store, ensuring that anonymous access to connector instances is never provided.

<details>
<summary>Answer</summary>

**Answer:** connection; token

**Explanation:** The API Management gateway stores credentials or tokens per connection in a token store. Only authenticated users can create connections, so there is no anonymous access to custom connector instances.

</details>

---
