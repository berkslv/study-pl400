# Quiz: Explore Azure Functions

> **Source material:** 1-introduction.md, 2-azure-functions-overview.md, 3-compare-azure-functions-hosting-options.md, 4-scale-azure-functions.md, 5-knowledge-check.md, 6-summary.md
> **Total questions:** 22
> **Question types:** Multiple choice (single), Multiple choice (multi-select), Fill-in-the-blank

---

## Questions

### Question 1 — Single Choice

An organization wants to implement a serverless workflow to solve a business problem. One of the requirements is that the solution must use a designer-first (declarative) development model. Which service meets this requirement?

- A. Azure Functions
- B. Azure WebJobs with the WebJobs SDK
- C. Azure Logic Apps
- D. Azure Container Apps

<details>
<summary>Answer</summary>

**Correct answer:** C. Azure Logic Apps

**Explanation:** Azure Logic Apps uses a designer-first (declarative) approach where orchestrations are created using a GUI or configuration files. Azure Functions is code-first (imperative).

</details>

---

### Question 2 — Single Choice

A developer is building an application that needs to react to events such as database changes, IoT data streams, and message queues. The team wants to write minimal code without managing infrastructure. Which Azure service is best suited for this purpose?

- A. Azure App Service
- B. Azure Functions
- C. Azure Logic Apps
- D. Azure Virtual Machines

<details>
<summary>Answer</summary>

**Correct answer:** B. Azure Functions

**Explanation:** Azure Functions is a serverless solution that allows you to write less code and maintain less infrastructure. It supports triggers to start code execution and bindings to simplify input/output coding, making it ideal for event-driven scenarios.

</details>

---

### Question 3 — Single Choice

Your team needs to build complex orchestrations using Azure Functions. Which extension must you use to develop orchestrations by writing code?

- A. Azure Logic Apps connector
- B. WebJobs SDK
- C. Durable Functions extension
- D. Azure Event Grid binding

<details>
<summary>Answer</summary>

**Correct answer:** C. Durable Functions extension

**Explanation:** For Azure Functions, orchestrations are developed by writing code and using the Durable Functions extension. Logic Apps uses a GUI or configuration files for the same purpose.

</details>

---

### Question 4 — Single Choice

A company evaluates Azure Functions against Azure App Service WebJobs. They require automatic scaling with a serverless app model, browser-based development and testing, and pay-per-use pricing. Which service supports all three of these capabilities?

- A. Azure App Service WebJobs with WebJobs SDK
- B. Azure Functions
- C. Both support all three capabilities
- D. Neither supports all three capabilities

<details>
<summary>Answer</summary>

**Correct answer:** B. Azure Functions

**Explanation:** Azure Functions supports a serverless app model with automatic scaling, browser-based development and testing, and pay-per-use pricing. WebJobs with the WebJobs SDK does not support any of these three features.

</details>

---

### Question 5 — Single Choice

Which of the following trigger events is supported by Azure Functions but NOT by Azure App Service WebJobs with the WebJobs SDK?

- A. Azure Storage queues and blobs
- B. Azure Service Bus queues and topics
- C. Azure Cosmos DB
- D. HTTP/WebHook (GitHub, Slack)

<details>
<summary>Answer</summary>

**Correct answer:** D. HTTP/WebHook (GitHub, Slack)

**Explanation:** Azure Functions supports HTTP/WebHook triggers (including GitHub and Slack), which are not listed as supported trigger events for WebJobs with the WebJobs SDK. Both services share support for Storage queues/blobs, Service Bus, and Cosmos DB.

</details>

---

### Question 6 — Single Choice

You are selecting an Azure Functions hosting plan. Your functions run nearly continuously, require virtual network connectivity, and need more CPU and memory than the Consumption plan provides. Which plan should you choose?

- A. Consumption plan
- B. Flex Consumption plan
- C. Premium plan
- D. Container Apps

<details>
<summary>Answer</summary>

**Correct answer:** C. Premium plan

**Explanation:** The Premium plan is recommended when function apps run continuously or nearly continuously, require virtual network connectivity, and need more CPU or memory options than the Consumption plan provides. It uses prewarmed workers to eliminate cold starts.

</details>

---

### Question 7 — Single Choice

An architect needs a hosting plan for Azure Functions that provides fully predictable billing and the ability to manually scale instances. The application also runs on the same plan as several existing web apps. Which plan is the best fit?

- A. Consumption plan
- B. Flex Consumption plan
- C. Premium plan
- D. Dedicated plan

<details>
<summary>Answer</summary>

**Correct answer:** D. Dedicated plan

**Explanation:** The Dedicated plan (App Service plan) is best when you need fully predictable billing, manual scaling, and the ability to run multiple web apps and function apps on the same plan.

</details>

---

### Question 8 — Single Choice

A development team wants to package custom libraries with their function code to support a line-of-business application and avoid managing Kubernetes clusters. Which Azure Functions hosting option best meets these requirements?

- A. Consumption plan
- B. Premium plan
- C. Dedicated plan
- D. Container Apps

<details>
<summary>Answer</summary>

**Correct answer:** D. Container Apps

**Explanation:** Container Apps is the recommended hosting option when you need to package custom libraries with function code, run functions alongside microservices in containers, and avoid the overhead of managing Kubernetes clusters.

</details>

---

### Question 9 — Single Choice

What is the default timeout duration (in minutes) for a function app running on the Consumption plan?

- A. 10
- B. 5
- C. 30
- D. 60

<details>
<summary>Answer</summary>

**Correct answer:** B. 5

**Explanation:** The Consumption plan has a default timeout of 5 minutes and a maximum of 10 minutes. All other plans (Flex Consumption, Premium, Dedicated, Container Apps) default to 30 minutes with unbounded maximums (except for HTTP response limits).

</details>

---

### Question 10 — Single Choice

A function triggered via HTTP is taking longer than expected to respond. Regardless of the function app timeout setting, what is the maximum time an HTTP-triggered function can take to respond to a request?

- A. 10 minutes
- B. 5 minutes
- C. 230 seconds
- D. 60 minutes

<details>
<summary>Answer</summary>

**Correct answer:** C. 230 seconds

**Explanation:** Regardless of the function app timeout setting, 230 seconds is the maximum time an HTTP-triggered function can take to respond, due to the default idle timeout of Azure Load Balancer. For longer processing, use the Durable Functions async pattern or defer the actual work.

</details>

---

### Question 11 — Single Choice

What is the maximum number of instances for a Windows function app hosted on the Consumption plan?

- A. 100
- B. 300
- C. 200
- D. 500

<details>
<summary>Answer</summary>

**Correct answer:** C. 200

**Explanation:** The Consumption plan supports up to 200 instances on Windows and up to 100 instances on Linux. Scale-out is event driven and automatic.

</details>

---

### Question 12 — Single Choice

Which Azure Functions hosting plan scales on a per-function basis, providing a more deterministic way to scale functions within an app?

- A. Consumption plan
- B. Flex Consumption plan
- C. Premium plan
- D. Dedicated plan

<details>
<summary>Answer</summary>

**Correct answer:** B. Flex Consumption plan

**Explanation:** The Flex Consumption plan uses per-function scaling where event-driven scaling decisions are calculated on a per-function basis. Its maximum instances are limited only by total memory usage of all instances across a given region.

</details>

---

### Question 13 — Single Choice

The `functionTimeout` property is configured in which file to control the timeout duration for functions in a function app?

- A. local.settings.json
- B. function.json
- C. host.json
- D. appsettings.json

<details>
<summary>Answer</summary>

**Correct answer:** C. host.json

**Explanation:** The `functionTimeout` property in the *host.json* project file specifies the timeout duration for functions in a function app and applies specifically to function executions.

</details>

---

### Question 14 — Single Choice

Which hosting plan for Azure Functions has a maximum instance count limited only by total memory usage across a given region?

- A. Consumption plan
- B. Premium plan
- C. Dedicated plan
- D. Flex Consumption plan

<details>
<summary>Answer</summary>

**Correct answer:** D. Flex Consumption plan

**Explanation:** The Flex Consumption plan's maximum number of instances is limited only by total memory usage of all instances across a given region, unlike the Consumption plan (200/100) or Premium plan (100/20–100).

</details>

---

### Question 15 — Multi-Select

Which two monitoring tools are used with Azure Functions according to the comparison with Logic Apps? (Select **two**.)

- A. Azure Monitor logs
- B. Azure Application Insights
- C. Azure portal
- D. Power BI
- E. Azure DevOps

<details>
<summary>Answer</summary>

**Correct answer:** B. Azure Application Insights, C. Azure portal

**Explanation:** Azure Functions uses Azure Application Insights for monitoring. Azure Logic Apps uses the Azure portal and Azure Monitor logs. Both tools appear in the comparison table; Application Insights is the primary monitoring tool for Functions.

</details>

---

### Question 16 — Multi-Select

A solution architect is reviewing Azure Functions Premium plan scenarios. Which **three** situations justify choosing the Premium plan over the Consumption plan? (Select **three**.)

- A. The function app must run continuously without cold starts.
- B. Fully predictable billing is required with manual scaling.
- C. The code needs to run longer than the Consumption plan's maximum execution time.
- D. Virtual network connectivity is required.
- E. Custom libraries must be packaged with the function code in containers.

<details>
<summary>Answer</summary>

**Correct answer:** A, C, D

**Explanation:** The Premium plan is appropriate when function apps run continuously (A), when code must run longer than the Consumption plan maximum (C), and when virtual network connectivity is required (D). Predictable billing with manual scaling points to the Dedicated plan (B), and packaging custom libraries in containers points to Container Apps (E).

</details>

---

### Question 17 — Multi-Select

Which **two** Azure Functions hosting plans support Linux containers? (Select **two**.)

- A. Consumption plan
- B. Flex Consumption plan
- C. Premium plan
- D. Dedicated plan
- E. Container Apps

<details>
<summary>Answer</summary>

**Correct answer:** C. Premium plan, D. Dedicated plan

**Explanation:** According to the hosting options table, the Premium plan and Dedicated plan both support Linux containers. The Consumption plan and Flex Consumption plan have no container support. Container Apps uses a different model (containerized function apps) but is listed separately.

</details>

---

### Question 18 — Multi-Select

Which **two** management tools are supported by Azure Functions but NOT by Azure Logic Apps, according to the comparison table? (Select **two**.)

- A. REST API
- B. Visual Studio
- C. Azure portal
- D. PowerShell
- E. Visual Studio Code

<details>
<summary>Answer</summary>

**Correct answer:** A. REST API, B. Visual Studio

**Explanation:** The comparison table shows Azure Functions management via REST API and Visual Studio. Azure Logic Apps management includes Azure portal, REST API, PowerShell, and Visual Studio — so PowerShell and Azure portal are Logic Apps tools. REST API is shared, but Visual Studio is listed for Functions and Visual Studio for Logic Apps too. Strictly from the table, Functions uses "REST API, Visual Studio" and Logic Apps uses "Azure portal, REST API, PowerShell, Visual Studio."

</details>

---

### Question 19 — Fill-in-the-Blank

Azure Functions supports ___ , which are ways to start execution of your code, and ___ , which are ways to simplify coding for input and output data.

<details>
<summary>Answer</summary>

**Answer:** triggers; bindings

**Explanation:** Triggers define how a function starts execution (e.g., HTTP, timer, queue message), while bindings simplify the coding needed to connect to input and output data sources without requiring explicit SDK calls.

</details>

---

### Question 20 — Fill-in-the-Blank

Azure Functions is built on the ___ SDK, so it shares many of the same event triggers and connections to other Azure services.

<details>
<summary>Answer</summary>

**Answer:** WebJobs

**Explanation:** Azure Functions is built on the WebJobs SDK, which is why it shares many event triggers (such as Storage queues and blobs, Service Bus, Cosmos DB, and Event Hubs) with Azure App Service WebJobs.

</details>

---

### Question 21 — Fill-in-the-Blank

On the Consumption plan, a scale-out limit of ___ instances per subscription per hour applies to Linux apps.

<details>
<summary>Answer</summary>

**Answer:** 500

**Explanation:** During scale-out, there is currently a limit of 500 instances per subscription per hour for Linux apps on a Consumption plan. This is a regional rate limit that can constrain burst scaling scenarios.

</details>

---

### Question 22 — Fill-in-the-Blank

The ___ plan requires the App Service plan to be set to ___ to ensure continuous availability.

<details>
<summary>Answer</summary>

**Answer:** Dedicated; Always On

**Explanation:** The Dedicated plan requires the App Service plan to be configured with the Always On setting. Without this, the function app may go idle and stop processing requests during periods of inactivity.

</details>
