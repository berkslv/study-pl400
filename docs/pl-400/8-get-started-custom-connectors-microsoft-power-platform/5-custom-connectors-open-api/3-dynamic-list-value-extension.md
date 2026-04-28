# Use the dynamic list of values extension

When you configure a parameter for an action on a custom connector, the default maker's experience to enter the parameter value is a simple text box. If you had a parameter on an **Add Invoice** action named **Invoice Type ID**, a maker would need to know the correct values for the field:

| Value | Label |
|-------|-------|
| 1 | Purchase Order |
| 2 | Non-Purchase Order |

A maker would need to enter **1** to indicate that the invoice is of type **Purchase Order**.

## Using enum for static values

To make this an easier OpenAPI definition, you can support the `enum` keyword. You can define an enum with a list of values that the maker can choose from.

You can configure an enum by using the custom connector designer by editing the parameter configuration. On the configuration, if you select **Static** in the **Dropdown type** area, it will let you provide a comma-separated list of values.

Using enums is best for self-describing data, such as if you had a parameter for **Days Due** and used an enum for **30,60,90** that would be simple to understand and use. A limitation of enums is that if the API adds new allowable values, you must edit the custom connector enum definition and publish the updated version of the connector.

## Configure dynamic values

You can configure the **x-ms-dynamic-values** extension on a parameter to have the list of values retrieved from the underlying API.

The benefits of this approach are:

- You can configure a label that the user sees in addition to the value.
- The returned values always represent the correct values from the API.
- The API can trim the list of values based on security or other needs on a per-user or per-connection basis.
- Other parameter values can be passed to the API to allow filtering of the returned list.
- Output of one field can be used as an input parameter for another API call, making it possible to build dependent options, such as country/region and state lists.

The API that you're working with must provide an operation that returns an array of valid values and, optionally, their descriptions.

In the custom connector designer for the **Invoice Type ID** parameter, you can configure the **x-ms-dynamic-values** extension by selecting **Dynamic** and then specifying an **Operation ID** and the **Value** and **Value display name** properties.

The following shows the Swagger YAML for the dynamic values extension:

```yaml
x-ms-dynamic-values:
  operationId: ListInvoiceTypes
  value-path: typeId
  value-title: name
```

Using the Swagger editor or downloading and editing the JSON file is required if you're configuring parameters on the extension.

## x-ms-dynamic-list extension

In addition to the **x-ms-dynamic-values** extension, Microsoft has also implemented a newer extension called **x-ms-dynamic-list**. In concept, both accomplish the same goal of making the action's parameter a drop-down list that the user can select from.

- **x-ms-dynamic-values** - Version 1
- **x-ms-dynamic-list** - Version 2 (improved schema, resolves ambiguous references)

If you're supporting older existing flows, we recommend that you implement both in your definition. If you're only supporting newly created flows, then use only **x-ms-dynamic-list**.

The **x-ms-dynamic-list** extension improves the schema for the action parameters, making it possible to resolve some ambiguous references. For example, if a request has a path parameter ID and a parameter ID as part of the request body, **x-ms-dynamic-list** specification allows you to differentiate the two parameters while **x-ms-dynamic-values** wouldn't be able to support this API.

To configure the **x-ms-dynamic-list** extension, you must directly change the OpenAPI definition because the custom connector designer only configures **x-ms-dynamic-values**.

The following shows both extensions configured together:

```yaml
x-ms-dynamic-values:
  operationId: ListInvoiceTypes
  value-path: typeId
  value-title: name
x-ms-dynamic-list:
  operationId: ListInvoiceTypes
  itemValuePath: typeId
  itemTitlePath: name
```

Configuring dynamic values on parameters for a custom connector can make the custom connector more user-friendly for makers.
