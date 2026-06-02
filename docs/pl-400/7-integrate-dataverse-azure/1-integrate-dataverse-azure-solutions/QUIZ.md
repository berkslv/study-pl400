# Quiz: Integrating Microsoft Dataverse with Azure Solutions

> **Source material:** 1-introduction.md, 2-azure-service-bus.md, 3-event-listener.md, 4-webhooks.md, 5-azure-function.md, 6-check.md, 7-summary.md
> **Total questions:** 25
> **Question types:** Multiple choice (single), Multiple choice (multi-select), Fill-in-the-blank

---

## Questions

### Question 1 — Single Choice

Your organization needs to create workflows that orchestrate business processes and connect hundreds of cloud and on-premises services using a visual interface.

Which Azure integration solution should you use?

- A. Azure Service Bus
- B. Azure Event Hubs
- C. Azure Logic Apps
- D. Azure API Management

<details>
<summary>Answer</summary>

**Correct answer:** C. Azure Logic Apps

**Explanation:** Logic Apps provides a robust visual interface for orchestrating complex integrations across environments and supports pre-built and custom connectors, making it ideal for workflow orchestration across many services.

</details>

---

### Question 2 — Single Choice

A developer needs to continuously ingest data in real time from hundreds of thousands of sources and stream a million events per second from a Dataverse application.

Which Azure service is best suited for this requirement?

- A. Azure Service Bus
- B. Azure Logic Apps
- C. Azure Event Grid
- D. Azure Event Hubs

<details>
<summary>Answer</summary>

**Correct answer:** D. Azure Event Hubs

**Explanation:** Azure Event Hubs is Microsoft's real-time data ingestion service that supports millions of events per second and is designed for large-scale streaming scenarios, including application telemetry.

</details>

---

### Question 3 — Single Choice

You want to publish custom APIs for internal and external developers to use when connecting to backend systems hosted anywhere, including Dataverse.

Which Azure service should you use?

- A. Azure Event Grid
- B. Azure API Management
- C. Azure Service Bus
- D. Azure Logic Apps

<details>
<summary>Answer</summary>

**Correct answer:** B. Azure API Management

**Explanation:** Azure API Management is designed for managing and publishing APIs for developers to use. You can export your API definition to create a Power Platform custom connector.

</details>

---

### Question 4 — Single Choice

A developer is setting up a Dataverse-to-Service Bus integration using the Plug-in Registration Tool. After creating the Azure Service Bus namespace, which value must they copy and store to configure the Service Endpoint in Dataverse?

- A. The Service Bus namespace URL
- B. The Primary Connection String from the Shared access policy
- C. The Service Bus resource group ID
- D. The Azure subscription ID

<details>
<summary>Answer</summary>

**Correct answer:** B. The Primary Connection String from the Shared access policy

**Explanation:** The Primary Connection String from the Shared access policy is needed to authenticate and connect Dataverse to the Azure Service Bus queue when registering a Service Endpoint.

</details>

---

### Question 5 — Single Choice

When registering a Service Bus endpoint in the Plug-in Registration Tool, a developer selects **Queue** as the Designation Type and **JSON** as the Message Format. Why is JSON chosen as the message format?

- A. JSON is the only format supported by Dataverse
- B. JSON is a proprietary Microsoft format required for Service Bus queues
- C. JSON is an industry-standard format valued for its portability and lightweight nature
- D. JSON enables two-way communication between Dataverse and the Service Bus

<details>
<summary>Answer</summary>

**Correct answer:** C. JSON is an industry-standard format valued for its portability and lightweight nature

**Explanation:** While Dataverse supports .NETBinary, JSON, and XML message formats, JSON is recommended because it has become an industry-standard messaging format due to its portability and lightweight nature.

</details>

---

### Question 6 — Single Choice

After registering a Service Bus integration step in Dataverse, a developer creates a test account row. Where should they go to verify that the integration step ran successfully?

- A. Azure Monitor logs
- B. Dataverse System Jobs view in the Admin center
- C. The Azure Service Bus namespace diagnostics
- D. The Plug-in Registration Tool's trace log

<details>
<summary>Answer</summary>

**Correct answer:** B. Dataverse System Jobs view in the Admin center

**Explanation:** To verify that the integration step ran, you navigate to Admin center, expand Audit and logs, then System Jobs. A successful run shows a Status Reason of "Succeeded."

</details>

---

### Question 7 — Single Choice

A developer registers a Service Bus integration step for testing and clears the **Delete AsyncOperation if StatusCode = Successful** flag. What is the effect of this action?

- A. It causes the integration step to run synchronously
- B. It allows the created System Job rows to remain so you can verify the step ran successfully
- C. It permanently prevents the async operation from being deleted
- D. It forces all failed operations to be retried indefinitely

<details>
<summary>Answer</summary>

**Correct answer:** B. It allows the created System Job rows to remain so you can verify the step ran successfully

**Explanation:** Clearing this flag is done only for testing purposes so that System Job records are preserved, making it possible to verify that the Service Bus integration step ran successfully. In production, this flag should be left selected.

</details>

---

### Question 8 — Single Choice

A developer uses a **Queue** contract type when configuring a Service Bus listener. What is a key characteristic of this contract type?

- A. It requires an active listener to be running at all times
- B. It can return a string value back to Dataverse
- C. Messages can be consumed on your own timeline without requiring an active listener
- D. It supports multiple subscribers for a single message

<details>
<summary>Answer</summary>

**Correct answer:** C. Messages can be consumed on your own timeline without requiring an active listener

**Explanation:** Queue contracts do not require an active listener; messages can be read (destructively or non-destructively) at any point in time, making them useful for "send-and-forget" scenarios.

</details>

---

### Question 9 — Single Choice

You are writing a Service Bus queue listener and need to retrieve a `RemoteExecutionContext` from a message with `ContentType = "application/json"`. Which deserialization approach should you use?

- A. `message.GetBody<RemoteExecutionContext>()`
- B. `message.GetBody<RemoteExecutionContext>(new DataContractJsonSerializer(typeof(RemoteExecutionContext)))`
- C. `message.GetBody<RemoteExecutionContext>(new DataContractSerializer(typeof(RemoteExecutionContext)))`
- D. `message.GetBody<string>()`

<details>
<summary>Answer</summary>

**Correct answer:** B. `message.GetBody<RemoteExecutionContext>(new DataContractJsonSerializer(typeof(RemoteExecutionContext)))`

**Explanation:** When the message ContentType is `application/json`, you must use `DataContractJsonSerializer` to deserialize the body into a `RemoteExecutionContext` object.

</details>

---

### Question 10 — Single Choice

A developer registers a **one-way** Service Bus contract. No active listener is running when Dataverse attempts to post a message. What happens?

- A. The message is stored and delivered the next time a listener connects
- B. The post succeeds silently and the message is discarded
- C. The post fails, Dataverse retries with exponentially increasing intervals, and eventually the System Job is canceled with status Failed
- D. Dataverse immediately cancels the System Job without retrying

<details>
<summary>Answer</summary>

**Correct answer:** C. The post fails, Dataverse retries with exponentially increasing intervals, and eventually the System Job is canceled with status Failed

**Explanation:** One-way contracts require an active listener. If no listener is available, the post fails and Dataverse retries with exponentially larger time spans until the async system job is eventually canceled with a status of Failed.

</details>

---

### Question 11 — Single Choice

You need an integration where Dataverse publishes an event and the receiving system must return data (such as a newly created external row ID) back to Dataverse via a custom plug-in.

Which Service Bus contract type supports this scenario?

- A. Queue
- B. Topic
- C. One-way
- D. Two-way

<details>
<summary>Answer</summary>

**Correct answer:** D. Two-way

**Explanation:** Two-way contracts allow the listener to return a string value back to Dataverse. If a custom Azure-aware plug-in is registered to post the message, it can then consume this returned data within the plug-in.

</details>

---

### Question 12 — Single Choice

Your team needs a Dataverse integration where the external operation must complete synchronously, the entire transaction should fail if the external service fails, and a third-party Web API endpoint already exists.

Which integration mechanism should you use?

- A. Azure Service Bus
- B. Azure Event Hubs
- C. Webhooks
- D. Azure Logic Apps

<details>
<summary>Answer</summary>

**Correct answer:** C. Webhooks

**Explanation:** Webhooks support synchronous processing against an external system, allow the transaction to fail if the external service fails, and can target any existing third-party Web API endpoint. Service Bus only supports asynchronous processing from Dataverse.

</details>

---

### Question 13 — Single Choice

A developer wants to use Azure Service Bus for a Dataverse integration because multiple subscribers need to consume a given event.

Which characteristic of Service Bus specifically supports this requirement?

- A. Queue contracts with destructive reads
- B. One-way contracts
- C. REST contracts
- D. Topic listeners that allow multiple consumers to subscribe to a given message

<details>
<summary>Answer</summary>

**Correct answer:** D. Topic listeners that allow multiple consumers to subscribe to a given message

**Explanation:** Topic listeners are similar to queue listeners but allow one or more listeners to subscribe to receive messages for a given topic, making them ideal when multiple consumers need to process a given Dataverse event.

</details>

---

### Question 14 — Single Choice

A developer registers a webhook in the Plug-in Registration Tool and selects **WebhookKey** as the authentication method. How is the key passed to the endpoint?

- A. As a header value with a key named `Authorization`
- B. As a query string parameter in the format `?code=[web hook key]`
- C. As a JSON body property named `webhookKey`
- D. As a custom HTTP header named `x-webhook-key`

<details>
<summary>Answer</summary>

**Correct answer:** B. As a query string parameter in the format `?code=[web hook key]`

**Explanation:** When WebhookKey is selected as the authentication method, a query string is passed to the URL with the given key in the format `?code=[web hook key]`. This is the default authentication method used by Azure Functions.

</details>

---

### Question 15 — Single Choice

Which HTTP header sent by Dataverse as part of a webhook call is specifically used by the platform for infinite loop prevention?

- A. `x-request-id`
- B. `x-ms-dynamics-organization`
- C. `x-ms-correlation-request-id`
- D. `x-ms-dynamics-request-name`

<details>
<summary>Answer</summary>

**Correct answer:** C. `x-ms-correlation-request-id`

**Explanation:** The `x-ms-correlation-request-id` header is a unique identifier used by the platform for infinite loop prevention. It can also be used with technical support to query telemetry about a specific operation.

</details>

---

### Question 16 — Single Choice

A developer builds an Azure Function to process Dataverse events. After completing a data operation in the Azure Function, a plug-in in the same pipeline throws an exception and rolls back the transaction.

What happens to the data changes made by the Azure Function?

- A. They are automatically rolled back along with the plug-in
- B. They are committed because Azure Functions runs outside the Dataverse event pipeline
- C. They are queued for retry
- D. They are rolled back only if the Azure Function registered in synchronous mode

<details>
<summary>Answer</summary>

**Correct answer:** B. They are committed because Azure Functions runs outside the Dataverse event pipeline

**Explanation:** Azure Functions do not run within Dataverse's event pipeline. Any data operations performed from an Azure Function will not roll back if a plug-in later has an exception and rolls back, since they are separate execution contexts.

</details>

---

### Question 17 — Single Choice

A developer creates an Azure Function project in Visual Studio 2022 and needs to set the Authorization level for an HTTP trigger to match the default authentication method used by Dataverse webhooks.

Which Authorization level should be selected?

- A. Anonymous
- B. Admin
- C. Function
- D. User

<details>
<summary>Answer</summary>

**Correct answer:** C. Function

**Explanation:** The Function authorization level uses a `code` query string parameter for authentication, which matches the WebhookKey authentication method that Dataverse webhooks use when calling Azure Functions.

</details>

---

### Question 18 — Single Choice

When registering a Dataverse webhook step to call an Azure Function, a developer needs to configure the webhook in the Plug-in Registration Tool. Where should the `code` query string value from the Azure Function URL be placed?

- A. In the URL field of the WebHook Registration dialog
- B. In the Value section of the WebHook Registration dialog (with `code=` removed)
- C. In the HTTP Headers section as a key-value pair
- D. In the step's Unsecure Configuration field

<details>
<summary>Answer</summary>

**Correct answer:** B. In the Value section of the WebHook Registration dialog (with `code=` removed)

**Explanation:** When registering a webhook for an Azure Function, you cut the code query string value from the copied function URL and paste it into the Value section of the WebHook Registration dialog, making sure to remove the `code=` portion.

</details>

---

### Question 19 — Multi-Select

Your company is evaluating when to use **webhooks** versus **Azure Service Bus** for Dataverse integrations. Which scenarios favor using webhooks? (Select **three**.)

- A. High-scale asynchronous processing is required
- B. Synchronous processing against an external system is required
- C. The entire transaction should fail unless the external service processes the payload successfully
- D. Multiple subscribers need to consume a given Dataverse event
- E. A third-party Web API endpoint already exists for the integration
- F. You want centralized governance of integration architecture

<details>
<summary>Answer</summary>

**Correct answer:** B, C, E

**Explanation:** Webhooks are preferred when synchronous processing is required (B), when the transaction should fail if the external service fails (C), or when an existing third-party Web API endpoint is targeted (E). High-scale async processing, multiple subscribers, and centralized governance are reasons to use Service Bus instead.

</details>

---

### Question 20 — Multi-Select

A developer is registering a Service Bus endpoint in Dataverse using the Plug-in Registration Tool. Which message formats does Dataverse support for publishing to a Service Bus queue? (Select **three**.)

- A. CSV
- B. .NETBinary
- C. YAML
- D. JSON
- E. XML
- F. Protobuf

<details>
<summary>Answer</summary>

**Correct answer:** B, D, E

**Explanation:** Dataverse supports .NETBinary, JSON, and XML message formats when publishing messages to a Service Bus endpoint. CSV, YAML, and Protobuf are not supported formats.

</details>

---

### Question 21 — Multi-Select

A developer is choosing between an **Azure Function** and a **plug-in** to run custom business logic when a Dataverse record is updated. Which factors favor using a plug-in over an Azure Function? (Select **two**.)

- A. The logic needs to run outside the Dataverse application host to reduce load
- B. The logic needs to run within the Dataverse event pipeline to auto-format a string before it posts
- C. The logic should roll back if the overall transaction fails
- D. The logic must call an external REST API
- E. The logic needs a synchronous response from an external system

<details>
<summary>Answer</summary>

**Correct answer:** B, C

**Explanation:** Plug-ins are recommended when logic must run within the Dataverse event pipeline (e.g., autoformatting a string before it posts), and when data operations must roll back if the transaction fails — neither of which Azure Functions support since they run outside the pipeline.

</details>

---

### Question 22 — Multi-Select

A developer needs to configure an Azure Service Bus integration for a Dataverse environment. Which two tools can be used to install and launch the Plug-in Registration Tool? (Select **two**.)

- A. NuGet
- B. Azure DevOps Marketplace
- C. Power Platform CLI (`pac tool prt`)
- D. Visual Studio Extension Manager
- E. Microsoft AppSource

<details>
<summary>Answer</summary>

**Correct answer:** A, C

**Explanation:** The Plug-in Registration Tool is available through NuGet as part of Microsoft's Dataverse developer tooling, and can also be installed and launched using the Power Platform CLI command `pac tool prt`.

</details>

---

### Question 23 — Fill-in-the-Blank

Azure Service Bus is Microsoft's cloud ___ as a service (MaaS) platform used to send messages between queues for point-to-point communications.

<details>
<summary>Answer</summary>

**Answer:** messaging

**Explanation:** Azure Service Bus is described as Microsoft's cloud messaging as a service (MaaS) platform, supporting point-to-point communication via queues.

</details>

---

### Question 24 — Fill-in-the-Blank

When a Dataverse webhook call's HTTP payload size exceeds ___ KB, the `x-ms-dynamics-msg-size-exceeded` header is sent to the endpoint.

<details>
<summary>Answer</summary>

**Answer:** 256

**Explanation:** The `x-ms-dynamics-msg-size-exceeded` HTTP header is only sent when the HTTP payload size exceeds 256 KB, alerting the receiving service that the message was truncated or oversized.

</details>

---

### Question 25 — Fill-in-the-Blank

In a Service Bus queue listener written in C#, the `___` method is used to process a queue message in an event-driven message pump.

<details>
<summary>Answer</summary>

**Answer:** OnMessage

**Explanation:** The `OnMessage` method on the `QueueClient` object is used to consume Service Bus queue messages in an event-driven message pump pattern, as demonstrated in the queue listener exercise.

</details>
