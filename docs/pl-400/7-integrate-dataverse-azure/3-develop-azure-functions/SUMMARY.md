# Summary: Developing Azure Functions

> **Source files:** 1-introduction.md, 2-azure-function-development-overview.md, 3-create-triggers-bindings.md, 4-connect-azure-services.md, 5-create-function-visual-studio-code.md

---

## Function App Concepts

- A **function app** is the unit of deployment and management; all functions in it share the same pricing plan, deployment method, and runtime version.
- In Functions 2.x+, all functions in a function app must use the same language.
- Functions are scaled, deployed, and managed together within a function app.

### Local Project Files

- Every Functions project root contains `host.json` and `local.settings.json`, plus language-specific files.
- `host.json`: metadata file with configuration options affecting all functions in the instance; binding configs apply to every function equally; can be overridden per environment via app settings.
- `local.settings.json`: stores app settings and local development tool settings; used **only** when running locally.
- **Important:** `local.settings.json` may contain secrets (connection strings); never store it in a remote repository.
- When deployed to Azure, configuration is managed via **application settings**; locally via `local.settings.json`.
- Local settings required by the app must also be present in the deployed function app's app settings (sync manually or via tooling).
- Portal editing has limitations; prefer local development and publishing to Azure.

---

## Triggers and Bindings

- A **trigger** defines how a function is invoked; every function must have **exactly one** trigger.
- A **binding** declaratively connects another resource to a function as input, output, or both; bindings are optional.
- Triggers and bindings prevent hardcoding access to other services.
- All triggers and bindings have a `direction` property:
  - Triggers: always `in`
  - Input bindings: `in`; Output bindings: `out`
  - Some bindings support `inout` (requires Advanced editor in portal)

### Trigger and Binding Configuration by Language

| Language | Configuration method |
| --- | --- |
| C# class library | C# attributes on methods/parameters (in-process or isolated worker) |
| Java | Java annotations on methods/parameters |
| JavaScript/TypeScript v4 | Code using `@azure/functions` |
| JavaScript/TypeScript v3 | `function.json` per function |
| Python v2 | Decorators in code |
| Python v1 | `function.json` |
| PowerShell | `function.json` |

- In Node.js v4 and Python v2, the runtime **generates** `function.json` from code — do not edit it directly in portal.
- C# and Java cannot be created/edited in the portal (no `function.json`); C# portal editing uses C# script with `function.json` instead of attributes.
- For dynamically typed languages (JavaScript v3, PowerShell), use `dataType` in `function.json` (`binary`, `stream`, `string`).

### function.json Example (Legacy — Node.js v3, Python v1, PowerShell)

```json
{
    "disabled": false,
    "bindings": [
        {
            "type": "httpTrigger",
            "direction": "in",
            "name": "req",
            "authLevel": "function",
            "methods": ["get","post"]
        },
        {
            "type": "queue",
            "direction": "out",
            "name": "outqueue",
            "queueName": "outqueue",
            "connection": "AzureWebJobsStorage"
        }
    ]
}
```

- `disabled` in `function.json` is legacy; prefer app setting `AzureWebJobs.<FunctionName>.Disabled=true`.

### C# Isolated Worker Example (HTTP trigger → Queue output)

```csharp
using Microsoft.Azure.Functions.Worker;
using Microsoft.Azure.Functions.Worker.Http;

public static class HttpToQueue
{
    [Function("HttpToQueue")]
    public static MultiResponse Run(
        [HttpTrigger(AuthorizationLevel.Function, "get", "post")] HttpRequestData req)
    {
        var message = "Processed request";
        return new MultiResponse
        {
            Messages = new[] { message },
            HttpResponse = req.CreateResponse(System.Net.HttpStatusCode.OK)
        };
    }
}

public class MultiResponse
{
    [QueueOutput("outqueue", Connection = "AzureWebJobsStorage")]
    public string[] Messages { get; set; }
    public HttpResponseData HttpResponse { get; set; }
}
```

### Node.js v4 Example (HTTP trigger → Queue output)

```javascript
import { app, output } from "@azure/functions";

const queueOutput = output.storageQueue({
  queueName: "outqueue",
  connection: "AzureWebJobsStorage"
});

app.http("HttpToQueue", {
  methods: ["GET", "POST"],
  authLevel: "function",
  extraOutputs: [queueOutput],
  handler: async (request, context) => {
    const body = await request.text();
    context.extraOutputs.set(queueOutput, body || "Processed request");
    return { status: 200, body: "Queued" };
  }
});
```

### Python v2 Example (HTTP trigger → Queue output)

```python
import azure.functions as func

app = func.FunctionApp()

@app.route(route="HttpToQueue", auth_level=func.AuthLevel.FUNCTION)
@app.queue_output(arg_name="msg", queue_name="outqueue", connection="AzureWebJobsStorage")
def HttpToQueue(req: func.HttpRequest, msg: func.Out[str]) -> func.HttpResponse:
    body = req.get_body().decode("utf-8") if req.get_body() else "Processed request"
    msg.set(body)
    return func.HttpResponse("Queued", status_code=200)
```

### Local Testing of Triggers

- HTTP triggers: call `http://localhost/` directly.
- Storage-based triggers: use the **Azurite emulator** (Queue, Blob, Table Storage) to avoid connecting to remote services.
- Non-HTTP triggers: use live Azure service connection strings in `local.settings.json` `Values` array, or manually invoke via administrator endpoints.
- Best practice: use separate services for development/testing vs. production.

---

## Connecting Functions to Azure Services

- Azure Functions uses **application settings** (App Service) to securely store connection strings, keys, and tokens — stored encrypted, accessed as environment variables at runtime.
- Set the **application setting name** in binding/trigger `connection` properties — never the actual connection string directly.
- Default configuration provider: environment variables (app settings in Azure, `local.settings.json` locally).

### Identity-Based Connections

- Some connections can use an **identity** instead of a secret (depends on the extension).
- When hosted in Azure Functions, identity-based connections use a **managed identity** (system-assigned by default).
- User-assigned identity can be specified via `credential` and `clientID` properties; configuring with a resource ID is **not** supported.
- In local development, the developer identity is used instead.
- **Note:** Azure Files does not support managed identity for file share access (Consumption/Elastic Premium plans use `WEBSITE_AZUREFILESCONNECTIONSTRING` and `WEBSITE_CONTENTSHARE`).
- Grant identities only required permissions — follow the **principle of least privilege**.
- Permissions are granted via Azure RBAC role assignments or access policies depending on the target service.

---

## Creating a Function with Visual Studio Code

### Prerequisites

- Azure subscription
- Visual Studio Code on a supported platform
- .NET 8 (target framework)
- C# Dev Kit extension for VS Code
- Azure Functions extension for VS Code
- Azure Functions Core Tools v4.x

```
winget uninstall Microsoft.Azure.FunctionsCoreTools
winget install Microsoft.Azure.FunctionsCoreTools
```

### Exercise Steps

1. Create a local C# HTTP-triggered function project in VS Code.
2. Run and test the function locally.
3. Deploy the function to Azure.
4. Test the deployed function in Azure.
5. Clean up resources.

---

## References

- [Azurite emulator (Azure Storage)](https://learn.microsoft.com/en-us/azure/storage/common/storage-use-azurite)
- [Azure Function Core Tools on GitHub](https://github.com/Azure/azure-functions-core-tools?tab=readme-ov-file#installing)
- [Azure Functions extension for VS Code](https://marketplace.visualstudio.com/items?itemName=ms-azuretools.vscode-azurefunctions)
- [C# Dev Kit for VS Code](https://marketplace.visualstudio.com/items?itemName=ms-dotnettools.csdevkit)
- [C# isolated worker guide](https://learn.microsoft.com/en-us/azure/azure-functions/dotnet-isolated-process-guide)
- [Code and test Azure Functions locally](https://learn.microsoft.com/en-us/azure/azure-functions/functions-develop-local)
- [Development limitations in the Azure portal](https://learn.microsoft.com/en-us/azure/azure-functions/functions-how-to-use-azure-function-app-settings#development-limitations-in-the-azure-portal)
- [host.json reference](https://learn.microsoft.com/en-us/azure/azure-functions/functions-host-json)
- [Manually run a non HTTP-triggered function](https://learn.microsoft.com/en-us/azure/azure-functions/functions-manually-run-non-http)
- [Node.js developer guide (v4)](https://learn.microsoft.com/en-us/azure/azure-functions/functions-reference-node?pivots=nodejs-model-v4#inputs-and-outputs)
- [Python developer guide](https://learn.microsoft.com/en-us/azure/azure-functions/functions-reference-python)
