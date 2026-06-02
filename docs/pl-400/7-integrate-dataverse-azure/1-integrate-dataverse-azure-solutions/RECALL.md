# Recall: Integrate Microsoft Dataverse with Azure Solutions

> **Source files:** 1-introduction.md, 2-azure-service-bus.md, 3-event-listener.md, 4-webhooks.md, 5-azure-function.md, 6-check.md

---

## Keywords

| Term | Definition |
|------|-----------|
| Azure Service Bus | Microsoft's cloud messaging-as-a-service (MaaS) platform for point-to-point and publish-subscribe messaging. |
| Service Endpoint Registration | Dataverse feature (configured via Plug-in Registration Tool) to publish events to Azure Service Bus or Event Hubs. |
| RemoteExecutionContext | Object passed by Dataverse in Service Bus/webhook messages containing event execution details. |
| Webhook | HTTP-based mechanism for publishing Dataverse events to any external Web API endpoint. |
| One-way contract | Service Bus contract requiring an active listener; fails and retries if no listener is available. |
| Two-way contract | Service Bus contract that allows a string value to be returned from the listener back to Dataverse. |
| WebhookKey | Webhook authentication method that passes a `?code=` query string parameter to the endpoint. |
| Plug-in Registration Tool | Developer tool (also launchable via `pac tool prt`) used to register service endpoints, steps, and webhooks. |
| Azure Event Hubs | Real-time data ingestion service supporting millions of events per second; primarily an analytics/"big data" solution. |
| Destructive read | Queue read that consumes and removes the message; non-destructive read leaves the message in place. |
| Shared Access Policy | Azure Service Bus credential mechanism providing the Primary Connection String used to configure Dataverse integration. |
| Azure Functions | Serverless compute for small units of work; can consume Dataverse webhook events synchronously via HTTP trigger. |

---

## Main Ideas

- Dataverse has pre-built integration support for Azure Service Bus, Azure Event Hubs, and Azure Logic Apps.
- Use **Logic Apps** to orchestrate workflows across many services; use **Service Bus** for async messaging; use **Event Hubs** for high-throughput real-time data ingestion; use **Event Grid** for event-driven publish-subscribe routing; use **API Management** to publish and manage custom APIs.
- Service Bus endpoint is registered in Dataverse via the **Plug-in Registration Tool** using the namespace's Primary Connection String.
- Supported Service Bus message formats are **.NETBinary**, **JSON**, and **XML**; JSON is recommended for portability.
- Supported Service Bus contract types: **Queue**, **Topic**, **One-way**, **Two-way**, **REST**. Two-way and REST can return a string value back to Dataverse.
- One-way contracts fail immediately if no active listener is present; Dataverse retries with exponential backoff until the System Job is eventually canceled with a **Failed** status.
- Webhooks are registered similarly to Service Endpoints in the Plug-in Registration Tool using **Register New Web Hook**.
- Webhook authentication options: **HttpHeader** (key-value header pairs), **WebhookKey** (`?code=` query param), **HttpQueryString** (query string key-value pairs).
- Use **Service Bus** for high-scale async processing, multiple subscribers, or centralized governance. Use **webhooks** for synchronous external processing, immediate execution, or when SAS auth is not preferred.
- Dataverse only supports **asynchronous** processing against Service Bus endpoints; webhooks support **synchronous** execution.
- Azure Functions do **not** run within the Dataverse event pipeline — data changes made from a Function will not roll back if a plug-in later throws an exception.
- The Azure Function URL format when using WebhookKey auth: `https://[AppService].azurewebsites.net/api/[FunctionName]?code=[WebhookKey]`.
- Integration run status (success or failure) is visible in **System Jobs** under Admin Center > Audit and logs.

---

## Mini Quiz

### Q1 — Single Choice

You need to publish Dataverse account creation events to an external endpoint that must respond synchronously, and the transaction should fail if the endpoint does not respond successfully.

Which mechanism should you use?

- A. Azure Service Bus one-way contract
- B. Azure Event Hubs
- C. Webhook
- D. Azure Logic Apps

<details>
<summary>Answer</summary>

**Correct answer:** C. Webhook

**Explanation:** Webhooks support synchronous processing and can cause the entire Dataverse transaction to fail if the external service does not successfully process the payload. Service Bus only supports asynchronous processing from Dataverse.

</details>

---

### Q2 — Fill-in-the-Blank

When registering a Service Bus endpoint in Dataverse, you use the `___` tool and provide the namespace's `___` as the credential.

<details>
<summary>Answer</summary>

**Answer:** Plug-in Registration Tool; Primary Connection String

**Explanation:** The Plug-in Registration Tool (also launchable with `pac tool prt`) is used to register Service Endpoints. The Primary Connection String from the Azure Service Bus Shared Access Policy is required to authenticate.

</details>

---

### Q3 — Single Choice

A one-way Service Bus contract is configured in Dataverse, but no active listener is running when an event fires.

What happens?

- A. The message is silently dropped
- B. Dataverse retries with exponential backoff until the System Job is canceled with a Failed status
- C. Dataverse switches to a queue contract automatically
- D. The message is stored indefinitely until a listener connects

<details>
<summary>Answer</summary>

**Correct answer:** B. Dataverse retries with exponential backoff until the System Job is canceled with a Failed status

**Explanation:** One-way contracts require an active listener. If the post fails, Dataverse retries in exponentially larger intervals until the async System Job is eventually canceled and marked Failed.

</details>

---

### Q4 — Fill-in-the-Blank

The three supported message formats when configuring a Service Bus endpoint in Dataverse are `___`, `___`, and `___`.

<details>
<summary>Answer</summary>

**Answer:** .NETBinary, JSON, XML

**Explanation:** Dataverse supports .NETBinary, JSON, and XML formats. JSON is recommended due to its portability and lightweight nature.

</details>

---

### Q5 — Single Choice

You want to call an Azure Function from Dataverse using a webhook with the default Azure Function authentication.

Which webhook authentication type should you use?

- A. HttpHeader
- B. HttpQueryString
- C. WebhookKey
- D. OAuth

<details>
<summary>Answer</summary>

**Correct answer:** C. WebhookKey

**Explanation:** WebhookKey passes a `?code=` query string parameter to the URL, which matches the default authentication mechanism used by Azure Functions.

</details>

---

### Q6 — Fill-in-the-Blank

Unlike plug-ins, data operations performed from an Azure Function `___` roll back if a subsequent plug-in throws an exception, because Azure Functions do not run within the Dataverse `___`.

<details>
<summary>Answer</summary>

**Answer:** will not; event pipeline

**Explanation:** Azure Functions execute outside the Dataverse event pipeline, so any data changes they make are independent and are not subject to Dataverse transaction rollback.

</details>

---

### Q7 — Single Choice

You need to consume the same Dataverse event in three separate downstream services. Which Azure integration approach is most appropriate?

- A. Webhook (one per service)
- B. Azure Service Bus with Topic subscriptions
- C. Azure API Management
- D. Azure Event Grid with a Dataverse built-in connector

<details>
<summary>Answer</summary>

**Correct answer:** B. Azure Service Bus with Topic subscriptions

**Explanation:** Topic listeners allow one or more subscribers to receive messages for a given topic, making Service Bus Topics the right choice when multiple consumers need to receive the same event.

</details>

---
