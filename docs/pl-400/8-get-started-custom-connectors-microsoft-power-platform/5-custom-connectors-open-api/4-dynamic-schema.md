# Use dynamic schema

When you configure an action on a custom connector, you can also configure parameters. These parameters are configured by importing either an OpenAPI definition or a sample request. Regardless of the approach used, the list of parameters is fixed. When that action is used, the maker will be presented with the static list of parameters as defined by the connector.

In some cases, the parameters that should be presented for input are variable. The most common use cases are:

- List of parameters vary based on a type, such as a category or a type of invoice.
- The state of the record could determine which parameters can be changed. For example, a shipped order could have different available parameters than a non-shipped order.
- The parameter list could be trimmed by security.
- A common action implementation across a few different data types. For example, API might implement a **Create** action that applies to accounts, contacts, orders, or invoices. Input parameters will be defined by the object type that the maker selects.

Custom connectors support these scenarios by allowing you to configure dynamic schema OpenAPI extensions. When the dynamic schema OpenAPI extensions are configured, the custom connector runtime will call an operation to retrieve the schema that defines which parameters should be visible for that given action.

The custom connector runtime supports two different extensions for dynamic schema:

- **x-ms-dynamic-schema** - Version 1
- **x-ms-dynamic-properties** - Version 2

If you need to support older flows by using your action, you can configure both versions. If you only support new flows, you can configure the **x-ms-dynamic-properties** extension only.

## API support

For you to configure dynamic schema, the underlying API must provide support by defining the operation that returns the schema. If the API doesn't already have a suitable action, and you don't have the ability to modify the API or request the changes, you might not be able to implement dynamic schema.

The operation that returns the schema can take one or more parameters that are passed from the custom connector runtime. These parameters can be constants or can represent other data that is collected on the action card.

The response from the operation that is used for dynamic schema must be a valid JSON schema. For example:

```json
{
  "type": "object",
  "properties": {
    "amount": {
      "type": "number",
      "x-ms-summary": "Amount",
      "description": "Invoice amount"
    },
    "purchaseOrder": {
      "type": "string",
      "x-ms-summary": "Purchase Order",
      "description": "Purchase order number",
      "x-ms-visibility": "important"
    }
  },
  "required": ["amount"]
}
```

Notice the following key points about the content:

- **type** must be provided and is used to identify the parameter data type.
- **summary** and **description** are used in the Power Automate designer to identify the parameters to the maker.
- The **x-ms-visibility** extension property can be provided to indicate where you think this parameter should always be shown (`"important"`) or if a user action is required to reveal it to the maker (`"advanced"`).
- The **required** array provides the list of required parameters.

## Configure the dynamic schema extension

To configure the **x-ms-dynamic-schema** or the **x-ms-dynamic-properties** extensions, you must directly edit the custom connector's OpenAPI definition. Currently, custom connector designer support isn't available for editing these values.

The following shows the **x-ms-dynamic-properties** extension configured in YAML:

```yaml
x-ms-dynamic-properties:
  operationId: GetInvoiceSchema
  parameters:
    typeId: {parameterReference: typeId}
```

Instead of having a hard-coded list of properties, the `GetInvoiceSchema` operation will be called to get the list based on the `typeId` parameter.

As the maker changes the invoice type (for example from **Purchase Order** to **Non-Purchase Order**), the **Purchase Order** parameter is hidden or shown as appropriate.

By implementing dynamic schema on your custom connector, you can clarify for the maker which parameters need to be used for the action.
