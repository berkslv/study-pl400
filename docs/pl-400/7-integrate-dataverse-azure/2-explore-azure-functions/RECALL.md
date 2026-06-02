# Recall: Explore Azure Functions

> **Source files:** 1-introduction.md, 2-azure-functions-overview.md, 3-compare-azure-functions-hosting-options.md, 4-scale-azure-functions.md

---

## Keywords

| Term | Definition |
|------|-----------|
| Azure Functions | Serverless compute service that runs event-driven code without managing infrastructure. |
| Trigger | A way to start execution of Azure Functions code in response to an event. |
| Binding | A declarative way to simplify coding for input and output data in Azure Functions. |
| Orchestration | A collection of functions or steps executed to accomplish a complex task. |
| Durable Functions | An extension for Azure Functions used to write stateful orchestrations in code. |
| Consumption plan | Default pay-as-you-go hosting plan with automatic scaling and a 10-minute max timeout. |
| Flex Consumption plan | Hosting plan with per-function scaling, virtual networking, and configurable pre-provisioned instances. |
| Premium plan | Hosting plan with prewarmed workers, VNet connectivity, and no maximum timeout. |
| Dedicated plan | Hosting plan running functions within an App Service plan at fixed rates; manual or autoscale. |
| Container Apps | Hosting option for containerized function apps in a fully managed Azure Container Apps environment. |
| functionTimeout | Property in `host.json` that sets the timeout duration for function executions. |
| WebJobs SDK | Underlying SDK on which Azure Functions is built; shares event triggers with Azure Functions. |

---

## Main Ideas

- Azure Functions supports **triggers** (starting code execution) and **bindings** (simplifying input/output data coding).
- Azure Functions vs Logic Apps: Functions is code-first (imperative); Logic Apps is designer-first (declarative) with a large connector library.
- Azure Functions vs WebJobs: Functions adds serverless autoscale, pay-per-use pricing, browser-based dev/test, and Logic Apps integration — WebJobs does not support these.
- Five hosting options: **Consumption**, **Flex Consumption**, **Premium**, **Dedicated**, and **Container Apps**.
- **Consumption plan** default timeout = 5 min, maximum = 10 min; all other plans default = 30 min, maximum = unbounded.
- HTTP-triggered functions have a hard cap of **230 seconds** to respond, regardless of timeout settings, due to Azure Load Balancer idle timeout.
- **Consumption plan** max instances: Windows = 200, Linux = 100; Linux apps are further limited to 500 scale-out instances/subscription/hour.
- **Flex Consumption** scales on a **per-function** basis (more deterministic); limit is total memory usage across all instances in a region.
- **Premium plan** uses **prewarmed workers** to eliminate cold starts and supports VNet connectivity and custom Linux images.
- **Dedicated plan** requires App Service plan set to **Always On**; best for long-running scenarios where Durable Functions can't be used.
- **Container Apps** hosting lets functions run alongside microservices and avoids managing Kubernetes clusters; max instances = 10–300.
- The `functionTimeout` property in `host.json` controls per-app execution timeout; grace period during scale-in is 60 min (Flex/Premium) or 10 min (Dedicated/platform updates).

---

## Mini Quiz

### Q1 — Single Choice

You need a hosting plan that eliminates cold starts by keeping prewarmed workers ready, and also requires VNet connectivity. Which plan should you choose?

- A. Consumption plan
- B. Flex Consumption plan
- C. Premium plan
- D. Dedicated plan

<details>
<summary>Answer</summary>

**Correct answer:** C. Premium plan

**Explanation:** The Premium plan uses prewarmed workers to run applications with no delay after being idle and supports virtual network connectivity. The Consumption plan does not support prewarmed workers or VNet.

</details>

---

### Q2 — Fill-in-the-Blank

Azure Functions is a ___ compute service, whereas Azure Logic Apps is a serverless ___ integration platform.

<details>
<summary>Answer</summary>

**Answer:** serverless; workflow

**Explanation:** The source material explicitly states "Azure Functions is a serverless compute service, whereas Azure Logic Apps is a serverless workflow integration platform."

</details>

---

### Q3 — Single Choice

An HTTP-triggered Azure Function is configured with an unbounded timeout on the Premium plan. What is the maximum time it can take to respond to a request?

- A. 30 minutes
- B. 10 minutes
- C. 230 seconds
- D. Unlimited

<details>
<summary>Answer</summary>

**Correct answer:** C. 230 seconds

**Explanation:** Regardless of the function app timeout setting, the Azure Load Balancer's default idle timeout limits HTTP-triggered function responses to 230 seconds.

</details>

---

### Q4 — Fill-in-the-Blank

The Consumption plan has a default timeout of ___ minutes and a maximum timeout of ___ minutes. All other plans default to ___ minutes with an unbounded maximum.

<details>
<summary>Answer</summary>

**Answer:** 5; 10; 30

**Explanation:** The `host.json` timeout table shows Consumption plan defaults at 5 min with a 10-min cap, while Flex Consumption, Premium, Dedicated, and Container Apps all default to 30 min with no enforced maximum.

</details>

---

### Q5 — Single Choice

Which Azure Functions hosting plan scales on a **per-function** basis, providing more deterministic scaling decisions?

- A. Consumption plan
- B. Flex Consumption plan
- C. Premium plan
- D. Container Apps

<details>
<summary>Answer</summary>

**Correct answer:** B. Flex Consumption plan

**Explanation:** The Flex Consumption plan uses per-function scaling where "event-driven scaling decisions are calculated on a per-function basis, which provides a more deterministic way of scaling the functions in your app."

</details>

---

### Q6 — Single Choice

You want to migrate legacy on-premises code to cloud-native microservices and avoid managing Kubernetes clusters. Which hosting option best fits?

- A. Consumption plan
- B. Premium plan
- C. Dedicated plan
- D. Container Apps

<details>
<summary>Answer</summary>

**Correct answer:** D. Container Apps

**Explanation:** The Container Apps hosting option is specifically recommended when you need to migrate code from on-premises or legacy apps to cloud-native microservices and want to avoid the overhead of managing Kubernetes clusters.

</details>

---

### Q7 — Fill-in-the-Blank

For writing stateful orchestrations in Azure Functions code, you use the ___ extension.

<details>
<summary>Answer</summary>

**Answer:** Durable Functions

**Explanation:** The source states "For Azure Functions, you develop orchestrations by writing code and using the Durable Functions extension."

</details>

---
