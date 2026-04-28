# Configure host URL and routing

A common use of policy templates is to allow dynamic configuration of the API endpoint that triggers and actions will use at runtime. The following policy templates are available:

- **Set host URL** - Replaces the full host URL with one that is built by the policy.
- **Route request** - Routes an incoming request to a specified endpoint on the configured host URL.

## Set host URL

By default, the host URL that is used is statically configured for all triggers and actions on your connector. By using the **Set host URL** policy template, you can configure the URL for the triggers and actions individually.

An example of this scenario would be if you had order-related actions at one URL (for example, `ordersapi.contoso.com`) and user-related actions at another (for example, `userapi.contoso.com`). In this scenario, you would configure two policy templates, each selecting the appropriate user or order actions to apply the new host URLs.

The most common use is allowing people to provide the host URL at runtime when they create a new connection by using your custom connector. A property named `hostURL` is added to the `connectionParameters` and the user provides the full host URL at connection time.

Another common approach is dynamically building part of the host URL and making part of it static. By using this approach, the user only has to provide their account name or other key data that would make the full URL. An example is the Azure Key Vault connector, where instead of asking the user to provide the full vault URL (`https://contosokv.vault.azure.net`), you can add a connection property named `keyVaultName` and prompt the user for only that part (`contosokv`). The URL template would then be:

```
https://@{connectionParameters('keyVaultName')}.vault.azure.net
```

You can also include data by using the `@headers` and `@queryParameters` expressions in addition to using `@connectionParameters`.

## Route request

Each action on your custom connector has a fully qualified URL (such as `https://api.contoso.com/AddInvoice`) that is used to make the request to the underlying API. This URL comes from the combination of the **Host** (e.g., `api.contoso.com`) specified on the **General** tab and the **path** (e.g., `/AddInvoice`) from the imported definition or sample request.

- **Set Host URL** allows you to modify the host.
- **Route request** allows you to modify the path.

### Multiple actions pointing to the same path

A scenario where **Route request** is useful: if you had a **List Invoices** action and wanted to create a **List Big Invoices** action with a default value for `fromAmount`, you would get an error because they both point to the same path (`/ListInvoices`). Instead, you can:

1. Define the **List Big Invoices** action with a path of `/ListBigInvoices` (which doesn't exist on the API).
2. Use a **Route request** policy to send calls from `/ListBigInvoices` to `/ListInvoices`.

You can also include parameters and other expressions to help you build the path. For example, the Microsoft Outlook Tasks connector uses **Route request** to route to a new path that includes a parameter reference:

```
/v2/me/taskgroups('{group_id}')/taskfolders
```

Notice that `{group_id}` references one of the parameters on the action, similar to how it was done in the original path.

Using the **Set Host URL** and **Route request** policy templates gives you flexibility to route requests as needed to the underlying API.
