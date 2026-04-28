# Summary

In this module, you've learned how to configure Microsoft OpenAPI extensions to make your custom connector more user-friendly for makers. You learned that the OpenAPI specification allows extensions to be described and how the custom connectors use them. Some Microsoft OpenAPI extensions are configured by using the designer and some require direct OpenAPI definition modification. Additionally, you observed how to use the dynamic values and dynamic schema extensions to configure your action's parameters to be context-sensitive and be determined when a maker is using the action rather than at connector design time.

Some extensions require support by the underlying API. When you're designing the custom connector, you should consider your ability to modify the API to support the necessary operations.

## Key extensions covered

| Extension | Level | Purpose |
|-----------|-------|---------|
| `x-ms-capabilities` (chunkTransfer) | Operation | Enable chunked message transfer for large content |
| `x-ms-capabilities` (testConnection) | Connector | Validate connection credentials on creation |
| `x-ms-url-encoding` | Parameter | Configure single or double URL encoding for path parameters |
| `x-ms-dynamic-values` | Parameter | Populate a drop-down list from an API operation (v1) |
| `x-ms-dynamic-list` | Parameter | Populate a drop-down list from an API operation (v2) |
| `x-ms-dynamic-schema` | Parameter/Response | Load dynamic input parameters from an API schema operation (v1) |
| `x-ms-dynamic-properties` | Parameter/Response | Load dynamic input parameters from an API schema operation (v2) |
