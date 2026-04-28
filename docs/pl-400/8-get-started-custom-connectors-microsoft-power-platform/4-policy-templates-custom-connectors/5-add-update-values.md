# Add or update values

This unit explores the policy templates that you can apply to set data values in the request to and response from the API. The most common scenario is to set values that are required by the API in the body, header, or query of the request so that the maker doesn't have to provide it.

The following policy templates are available and focused on setting data values:

- **Set property** - Add or update a property on an object or collection.
- **Set query string parameter** - Add or update a parameter in the query string.
- **Set HTTP header** - Add or update a value in the request and/or response header.

## Use the Set property policy template

The **Set property** policy template can be used to set or update values in the body of either the request or the response objects. You can set a constant value by using a string value or an expression by using `@body()` to get another existing value from the body object.

For example, if the **ListInvoice** operation returns an object with a property `invoice` that is an array of invoice objects, and you wanted to set the `prefix` property on each invoice, you would change your **Parent object or collection path** to:

```
@body().invoices
```

You can also reference other values in the body that are already set. For example, to set a **FullValue** property that includes the **Prefix** property:

```
{@body().Prefix}
```

> **Note:** You must surround the expression with braces (`{expression}`) for it to work. Only `@body` expressions work in this field; `@connectionProperties`, `@headers`, or `@queryParameters` are not supported.

## Use the Set query string parameter policy template

The **Set query string parameter** template policy can be used to add or update query parameters on the request. Because the query string only matters on the request, you don't have to set the **Run policy on** value.

Unlike the **Set property** policy that always sets the value, this policy is configurable. You can set the **action if the parameter exists** to one of the following options:

- **Override** - Replaces the existing value.
- **Skip** - The existing value isn't replaced (good for providing default values).
- **Append** - The policy template value is appended to the existing value.

An example is the Microsoft Outlook connector, which has a **Set query string parameter** policy to set a default value of **50** for its `$top` parameter using the **skip** option.

## Use the Set HTTP header policy template

The **Set HTTP header** policy template adds or updates values in the header of the request, response, or failure. Similar to the **Set query string** policy template, you can choose the action if the value already exists.

This policy is used most frequently to set header values expected by the API, such as:

- Sender identification
- ETag for change tracking
- Special API key headers not handled by normal connector settings

For example, the Azure Cognitive Services connector uses a **Set header** policy template to set the `X-Ms-Sender` header value to `Microsoft Azure Logic Apps`.

Using these policy templates allows you to set values expected by the API and simplify the maker's task of consuming the data. These policies can also set default values and can be used in a specific order to compose more complex values.
