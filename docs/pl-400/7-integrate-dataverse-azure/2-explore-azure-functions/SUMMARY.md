# Summary: Explore Azure Functions

> **Source files:** 1-introduction.md, 2-azure-functions-overview.md, 3-compare-azure-functions-hosting-options.md, 4-scale-azure-functions.md

---

## Azure Functions Overview

- Serverless compute service on Microsoft Azure — write only the code needed, no infrastructure management.
- Supports **triggers** (ways to start code execution) and **bindings** (ways to simplify input/output data coding).
- Built on the WebJobs SDK; shares many event triggers and Azure service connections.

---

## Azure Functions vs. Azure Logic Apps

| Topic | Azure Functions | Logic Apps |
| --- | --- | --- |
| **Development** | Code-first (imperative) | Designer-first (declarative) |
| **Connectivity** | ~12 built-in binding types; write code for custom bindings | Large collection of connectors; Enterprise Integration Pack for B2B; build custom connectors |
| **Actions** | Each activity is an Azure function; write code for activity functions | Large collection of ready-made actions |
| **Monitoring** | Azure Application Insights | Azure portal, Azure Monitor logs |
| **Management** | REST API, Visual Studio | Azure portal, REST API, PowerShell, Visual Studio |
| **Execution context** | Azure or locally | Azure, locally, or on-premises |

- Both support complex **orchestrations** (collection of functions/steps executed to accomplish a complex task).
- Functions orchestrations: write code using the **Durable Functions extension**.
- Logic Apps orchestrations: GUI or configuration files.

---

## Azure Functions vs. WebJobs (WebJobs SDK)

| Factor | Functions | WebJobs with WebJobs SDK |
| --- | --- | --- |
| **Serverless app model with automatic scaling** | Yes | No |
| **Develop and test in browser** | Yes | No |
| **Pay-per-use pricing** | Yes | No |
| **Integration with Logic Apps** | Yes | No |
| **Trigger events** | Timer, Storage queues/blobs, Service Bus queues/topics, Cosmos DB, Event Hubs, HTTP/WebHook, Event Grid | Timer, Storage queues/blobs, Service Bus queues/topics, Cosmos DB, Event Hubs, File system |

---

## Hosting Plans

| Hosting Option | Service | Container Support |
| --- | --- | --- |
| **Consumption plan** | Azure Functions | None |
| **Flex Consumption plan** | Azure Functions | None |
| **Premium plan** | Azure Functions | Linux |
| **Dedicated plan** | Azure Functions | Linux |
| **Container Apps** | Azure Container Apps | Linux |

- Hosting choice determines: scaling behavior, resources per instance, advanced features (VNet, Linux containers), and cost.

### Consumption Plan
- Default plan. Pay-as-you-go — only billed when functions are running.
- Instances dynamically added/removed based on incoming events.

### Flex Consumption Plan
- High scalability with compute choices, virtual networking, pay-as-you-go billing.
- **Per-function scaling** — scaling decisions calculated per function for deterministic scaling.
- Supports pre-provisioned (always-ready) instances to reduce cold starts.

### Premium Plan
- Prewarmed workers — no delay after idle periods.
- Runs on more powerful instances; connects to virtual networks.
- Use when: continuous/near-continuous execution, need VNet connectivity, need more CPU/memory, execution time exceeds Consumption plan max, need custom Linux image.

### Dedicated Plan
- Runs within an App Service plan at regular App Service rates.
- Best for long-running scenarios where Durable Functions can't be used.
- Use when: predictable billing, manual scaling, multiple web/function apps on same plan, large compute sizes, full isolation via App Service Environment (ASE).
- Requires **Always On** setting enabled.

### Container Apps
- Fully managed environment hosted by Azure Container Apps.
- Run functions alongside microservices, APIs, websites, and workflows as container-hosted programs.
- Use when: packaging custom libraries, migrating on-premises/legacy apps to cloud-native containers, avoiding Kubernetes cluster management, needing dedicated CPU compute.

---

## Function App Timeout Duration

- Configured via `functionTimeout` property in **host.json**.
- Applies to function executions; function must return/respond within this duration after trigger fires.

| Plan | Default (min) | Maximum |
| --- | --- | --- |
| **Flex Consumption plan** | 30 | Unbounded |
| **Premium plan** | 30 | Unbounded |
| **Dedicated plan** | 30 | Unbounded |
| **Container Apps** | 30 | Unbounded |
| **Consumption plan** | 5 | 10 |

- **HTTP-triggered functions** max response time: **230 seconds** (Azure Load Balancer idle timeout), regardless of `functionTimeout` setting. For longer processing, use Durable Functions async pattern or return an immediate response.
- Scale-in grace period: **60 minutes** (Flex Consumption and Premium), **10 minutes** during platform updates.
- Container Apps: default timeout depends on specific triggers when minimum replicas = 0.

---

## Scaling Behaviors

| Plan | Scale Out | Max Instances |
| --- | --- | --- |
| **Consumption plan** | Event-driven; auto-scales CPU and memory | Windows: 200, Linux: 100 |
| **Flex Consumption plan** | Per-function event-driven scaling | Limited by total memory across all instances in a region |
| **Premium plan** | Event-driven | Windows: 100, Linux: 20–100 |
| **Dedicated plan** | Manual or autoscale | 10–30; 100 with ASE |
| **Container Apps** | Event-driven | 10–300 |

- Linux apps on Consumption plan: limit of **500 instances per subscription per hour** during scale-out.
- Linux apps on Premium plan (some regions): can scale to 100 instances.
- Container Apps: maximum replicas can be configured (subject to cores quota availability).
