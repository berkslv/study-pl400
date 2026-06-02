# Summary: Integrating Microsoft Dataverse with Azure Solutions

> **Source files:** 1-introduction.md, 2-azure-service-bus.md, 3-event-listener.md, 4-webhooks.md, 5-azure-function.md

---

## Azure Integration Options for Dataverse

- **Logic Apps** — Visual workflow orchestration; includes a Dataverse connector to trigger on row create/update events; shares capabilities with Power Automate.
- **Azure Service Bus** — Cloud messaging as a service (MaaS); point-to-point via queues; publish-subscribe via Topics; Dataverse has pre-built Service Endpoint Registration for it.
- **Azure API Management** — Manage custom APIs; can expose Dataverse API; export API definition to create Power Platform custom connectors.
- **Event Grid** — Event-driven, publish-subscribe framework; no out-of-the-box Dataverse integration, but viable for event-driven scenarios.
- **Event Hubs** — Real-time data ingestion (Apache Kafka equivalent); millions of events per second; primarily an analytics/big data solution; Dataverse can publish events to an event hub.

### Decision Table

| Goal | Solution |
| --- | --- |
| Orchestrate business processes across cloud and on-premises services | Logic Apps |
| Connect on-premises and cloud apps with messaging workflows | Service Bus |
| Publish APIs for internal/external developer use | API Management |
| Event-routing with publish-subscribe model for Azure/third-party services | Event Grid |
| Continuously ingest real-time data from hundreds of thousands of sources | Event Hubs |

---

## Azure Service Bus Integration with Dataverse

### Setup: Azure Service Bus Namespace and Queue

1. Sign in to the Azure portal and select **+ Create a resource**.
2. Search for **Service Bus** and select **Create**.
3. Enter namespace details and select **Next** → **Review + create** → **Create**.
4. After provisioning, navigate to the namespace and create a new queue.
5. From the Shared Access Policy, copy the **Primary Connection String** for use in Dataverse configuration.

### Register Service Bus Endpoint in Dataverse

- Use the **Plug-in Registration Tool** (`pac tool prt` via Power Platform CLI, or install via NuGet).
1. Open the Plug-in Registration Tool and connect to your Dataverse environment.
2. Select **Register** → **Register New Service Endpoint**.
3. Paste the **Primary Connection String** and select **Next**.
4. Set **Designation Type** to **Queue**, enter the queue name, set **Message Format** to **JSON**.
   - Supported message formats: `.NETBinary`, `JSON`, `XML`.
5. Optionally set **User Information Sent** to **UserId**.

### Register a Service Bus Integration Step

- An integration step defines which table + message combination triggers publishing to Service Bus.
1. Right-click the Service Endpoint → **Register New Step**.
2. Configure the table (e.g., account), message (e.g., Create), and execution mode.
3. For testing: clear the **Delete AsyncOperation if StatusCode = Successful** flag (re-enable in production).

### Testing

- Create a row in Dataverse → check **System Jobs** in Admin Center (Audit and logs → System jobs).
- Successful run shows **Status Reason: Succeeded**; failures display error info inside the System Job record.
- Verify the message arrived in the Azure portal queue view.

---

## Service Bus Contracts and Event Listener

### Supported Contract Types

| Type | Description |
| --- | --- |
| **Queue** | No active listener required; supports destructive (removes message) or non-destructive reads; "send-and-forget" pattern. |
| **Topic** | One or more subscribers can receive messages for a topic; useful for multiple consumers. |
| **One-way** | Requires an active listener; if none available, post fails; Dataverse retries with exponential backoff; System Job set to **Failed** if exhausted. |
| **Two-way** | Like one-way, but listener can return a string value back to Dataverse; useful for capturing external IDs in custom Azure-aware plug-ins. |
| **REST** | Like two-way, but published to a REST endpoint. |

### Writing a Queue Listener (C#)

- NuGet packages required: `WindowsAzure.ServiceBus`, `Microsoft.CrmSdk.CoreAssemblies`

```csharp
string connectionString = @"[ENDPOINT URL]";
string queueName = "mslearnsamplequeue";
QueueClient queueClient = QueueClient.CreateFromConnectionString(connectionString, queueName, ReceiveMode.PeekLock);
```

```csharp
queueClient.OnMessage(message =>
{
  RemoteExecutionContext context = null;

  if (message.ContentType == "application/msbin1") //.NETBinary
    context = message.GetBody<RemoteExecutionContext>();
  else if (message.ContentType == "application/json") //JSON
    context = message.GetBody<RemoteExecutionContext>(new DataContractJsonSerializer(typeof(RemoteExecutionContext)));
  else if (message.ContentType == "application/xml") //XML
    context = message.GetBody<RemoteExecutionContext>(new DataContractSerializer(typeof(RemoteExecutionContext)));

  try
  {
    var target = context.InputParameters["Target"] as Entity;
    foreach (var field in target.Attributes)
      Console.WriteLine($"Name: {field.Key} Value: {field.Value}");
  }
  catch (Exception ex)
  {
    Console.WriteLine(ex.ToString());
  }
});
Console.ReadLine();
```

- `Console.ReadLine()` keeps the process alive for multiple messages; not production-scalable — use Azure Durable Functions or similar for production.

---

## Webhooks

### Webhooks vs. Azure Service Bus

**Use Azure Service Bus when:**
- High-scale asynchronous processing/queueing is required.
- Multiple subscribers need to consume the same Dataverse event.
- Centralized integration architecture governance is needed.

**Use Webhooks when:**
- Synchronous processing against an external system is required (Service Bus only supports async).
- The external operation must occur immediately.
- The entire transaction must fail if the external service fails to process the payload.
- A third-party Web API endpoint already exists.
- SAS authentication is not preferred (webhooks support HTTP headers and query string parameter keys).

### Webhook Authentication Options

| Type | Description |
| --- | --- |
| **HttpHeader** | Key-value pairs in the HTTP request header. Example: `Key1: Value1, Key2: Value2` |
| **WebhookKey** | Query string with `code` as the key. Example: `?code=00000000-0000-0000-0000-000000000001` — default for Azure Functions. |
| **HttpQueryString** | Key-value pairs as query string parameters. Example: `?Key1=Value1&Key2=Value2` |

### Webhook HTTP Headers Sent to Endpoint

| Header Key | Description |
| --- | --- |
| `x-request-id` | Unique identifier for the request |
| `x-ms-dynamics-organization` | Tenant name that sent the request |
| `x-ms-dynamics-entity-name` | Logical name of the entity in execution context |
| `x-ms-dynamics-request-name` | Name of the event the webhook step was registered for |
| `x-ms-correlation-request-id` | Used for infinite loop prevention and telemetry tracing |
| `x-ms-dynamics-msg-size-exceeded` | Sent only when HTTP payload exceeds 256 KB |

### Registering a Webhook

- Use the **Plug-in Registration Tool**: **Register** → **Register New Web Hook**.
- Configure endpoint URL and authentication option in the **WebHook Registration** dialog.

---

## Azure Functions for Dataverse Webhook Processing

### Azure Functions vs. Plug-ins

- Azure Functions: suitable for offloading small units of work; can run synchronously via Dataverse webhooks (receives `RemoteExecutionContext`).
- **Not** inside Dataverse's event pipeline — data operations do not roll back if the pipeline later throws an exception.
- Plug-ins are still preferred for high-performance in-pipeline operations (e.g., auto-formatting field values before save).

### Create an Azure Function Project (Visual Studio 2022)

1. Create new project using the **Azure Functions** template.
2. Select latest **.NET Core LTS**, **Http trigger**, uncheck **Use Azurite**, set Authorization level to **Function**.

Template code generated:

```csharp
public static class Function1
{
    [FunctionName("Function1")]
    public static async Task<IActionResult> Run(
        [HttpTrigger(AuthorizationLevel.Function, "get", "post", Route = null)] HttpRequest req,
        ILogger log)
    {
        // ...
    }
}
```

### Publish to Azure (Visual Studio)

1. Right-click project → **Publish...** → select **Azure** → **Azure Function App (Windows)**.
2. Select subscription → **Create new** → provide App Service name, resource group, and other settings → **Create** → **Finish** → **Publish**.

### Publish via Azure Portal (manual)

1. **+ Create a resource** → search **Function app** → **Create**.
2. Choose hosting plan, specify name, runtime stack, subscription, resource group, region → **Review + create** → **Create**.

### Update Function Logic to Process Dataverse Events

```csharp
using Newtonsoft.Json.Linq;
```

```csharp
log.LogInformation("C# HTTP trigger function processed a request.");

string queryParams = "";
foreach (var q in req.Query)
    queryParams += $"Key: {q.Key} Value: {q.Value}\n";

string requestBody = await new StreamReader(req.Body).ReadToEndAsync();
dynamic data = JsonConvert.DeserializeObject(requestBody);

string requestHeader = "";
foreach (var h in req.Headers)
    requestHeader += $"Key: {h.Key} Value: {h.Value}\n";

log.LogInformation("Query Parameters:\n" + queryParams);
log.LogInformation("Request Header: \n" + requestHeader);
log.LogInformation("Request Body:\n" + requestBody);
string requestBodyFormatted = JValue.Parse(requestBody).ToString(Formatting.Indented);
log.LogInformation("Request Body Formatted:\n" + requestBodyFormatted);

try
{
    dynamic target = data.InputParameters["Target"];
    foreach (dynamic field in target.Attributes)
        log.LogInformation($"Name: {field.Key} Value: {field.Value}");
}
catch (Exception ex)
{
    log.LogInformation(ex.ToString());
}

return (ActionResult)new OkObjectResult(data.InitiatingUserId);
```

### Register Dataverse Webhook Pointing to Azure Function

1. Get the Function URL from Azure portal (**Get function URL**):
   ```
   https://[AppServiceUrl].azurewebsites.net/api/MsLearnFunction?code=[WebhookKey]
   ```
2. In the Plug-in Registration Tool, register a **New Web Hook**, paste the base URL, and set authentication to **WebhookKey** with the `code` value (without `code=`).
3. Register a new step: Message = **Create**, Primary Entity = **account**, Execution Mode = **Synchronous**.

---

## References

- [Choose between Azure messaging services - Event Grid, Event Hubs, and Service Bus](https://learn.microsoft.com/en-us/azure/event-grid/compare-messaging-services)
- [Download tools from NuGet](https://learn.microsoft.com/en-us/power-apps/developer/common-data-service/download-tools-nuget)
