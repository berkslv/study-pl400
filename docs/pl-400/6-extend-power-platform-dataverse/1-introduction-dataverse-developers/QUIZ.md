# Quiz: Introduction to Developing with Microsoft Dataverse

> **Source material:** 1-introduction.md, 2-extensibility.md, 3-framework.md, 4-check.md, 5-summary.md  
> **Total questions:** 22  
> **Question types:** Multiple choice (single), Multiple choice (multi-select), Fill-in-the-blank

---

## Questions

### Question 1 — Single Choice

Your organization needs to implement a business rule that must execute synchronously within a model-driven application. Power Automate flows have been considered but ruled out. What is the appropriate extensibility mechanism?

- A. Custom connector
- B. Plug-in
- C. Power Automate cloud flow
- D. Azure Logic App

<details>
<summary>Answer</summary>

**Correct answer:** B. Plug-in

**Explanation:** Plug-ins are required when you need to implement synchronous operations within a model-driven application. Flow and other options enable asynchronous automation but cannot fully replicate the capabilities of plug-ins for synchronous rules.

</details>

---

### Question 2 — Single Choice

A developer wants to browse metadata stored in a Dataverse environment, including table definitions, columns, and relationships. Which of the following tools can be installed directly into a model-driven Power App for this purpose?

- A. Power Platform CLI
- B. XrmToolbox Plugin Registration Tool
- C. Metadata Browser solution provided by Microsoft
- D. Azure Data Studio

<details>
<summary>Answer</summary>

**Correct answer:** C. Metadata Browser solution provided by Microsoft

**Explanation:** Microsoft provides the Metadata Browser as a solution that can be installed into any model-driven Power App to browse solution metadata. XrmToolbox also has a community metadata browser, but the Microsoft-provided solution is designed to install directly into a model-driven app.

</details>

---

### Question 3 — Single Choice

A plug-in needs to modify column values on a record before it is saved to the database. Which pipeline stage should the plug-in be registered against?

- A. Pre-Validation
- B. Pre-Operation
- C. PostOperation (synchronous)
- D. PostOperation (asynchronous)

<details>
<summary>Answer</summary>

**Correct answer:** B. Pre-Operation

**Explanation:** The Pre-Operation stage is used when you want to change values of a table prior to it being saved. Pre-Validation is for cancellation/permission checks, and PostOperation runs after the save has already occurred.

</details>

---

### Question 4 — Single Choice

A plug-in registered at PostOperation is executing business logic and applies an update to the same table that triggered the event. What is the most likely consequence?

- A. The update is ignored silently
- B. The plug-in execution fails with an authentication error
- C. Another update event is triggered
- D. The transaction is rolled back automatically

<details>
<summary>Answer</summary>

**Correct answer:** C. Another update event is triggered

**Explanation:** The documentation explicitly warns that applying updates to the corresponding table at the PostOperation stage will trigger another update event, which can lead to recursive execution.

</details>

---

### Question 5 — Single Choice

Which of the following is NOT a first-party application that Microsoft has built on Microsoft Dataverse?

- A. Dynamics 365 Sales
- B. Dynamics 365 Customer Service
- C. SharePoint
- D. Dynamics 365 Field Service

<details>
<summary>Answer</summary>

**Correct answer:** C. SharePoint

**Explanation:** Microsoft has built Dynamics 365 Sales, Dynamics 365 Customer Service, and Dynamics 365 Field Service on the Dataverse platform. SharePoint is a separate Microsoft product not built on Dataverse.

</details>

---

### Question 6 — Single Choice

A developer registers two synchronous plug-ins on the same pipeline stage for the same message. What determines the order in which they execute?

- A. The order in which they were registered
- B. The alphabetical order of the plug-in class names
- C. The execution order attribute set via the Plug-in Registration tool
- D. The size of the plug-in assembly

<details>
<summary>Answer</summary>

**Correct answer:** C. The execution order attribute set via the Plug-in Registration tool

**Explanation:** If multiple plug-ins are registered against the same pipeline stage, the execution order attribute specified via the Plug-in Registration tool determines which one runs first.

</details>

---

### Question 7 — Single Choice

A developer wants to use Dataverse APIs from a Node.js web application. Which API style is most appropriate?

- A. SDK for .NET
- B. Dataverse Web API (OData V4 RESTful)
- C. SOAP endpoint
- D. Azure Service Bus SDK

<details>
<summary>Answer</summary>

**Correct answer:** B. Dataverse Web API (OData V4 RESTful)

**Explanation:** The Web API is the most broadly applicable API because it only requires the ability to make HTTP requests and consume HTTP responses, making it suitable for any platform including Node.js. The SDK for .NET is required only for plug-in development.

</details>

---

### Question 8 — Single Choice

A developer needs to cancel a Dataverse operation before it completes due to a failed validation check inside a plug-in. Which method should be thrown to accomplish this?

- A. `OperationCanceledException`
- B. `InvalidPluginExecutionException`
- C. `SecurityException`
- D. `NotSupportedException`

<details>
<summary>Answer</summary>

**Correct answer:** B. `InvalidPluginExecutionException`

**Explanation:** To cancel an operation from within a plug-in, you throw an `InvalidPluginExecutionException`. This is described in the context of the Pre-Validation stage, where it can be used to cancel the operation before the transaction occurs.

</details>

---

### Question 9 — Single Choice

Which of the following Dataverse pipeline stages occurs BEFORE security checks are performed?

- A. Pre-Operation
- B. PostOperation
- C. Pre-Validation
- D. Async-Operation

<details>
<summary>Answer</summary>

**Correct answer:** C. Pre-Validation

**Explanation:** The Pre-Validation event occurs first in the pipeline, before any security checks are performed. It is intended for ensuring the user has the correct permissions or for running advanced validation logic.

</details>

---

### Question 10 — Single Choice

An asynchronous plug-in is registered in Dataverse. At which pipeline stage can it be registered?

- A. Pre-Validation only
- B. Pre-Operation only
- C. PostOperation only
- D. Any pipeline stage

<details>
<summary>Answer</summary>

**Correct answer:** C. PostOperation only

**Explanation:** Asynchronous plug-ins can only be registered for the PostOperation stage of the Event Pipeline. They are dispatched as system jobs to the asynchronous service after the operation completes.

</details>

---

### Question 11 — Single Choice

A developer wants to create a custom message that other developers can subscribe to via plug-ins. What Dataverse feature enables this?

- A. Custom connectors
- B. Custom Actions
- C. Custom tables
- D. Virtual tables

<details>
<summary>Answer</summary>

**Correct answer:** B. Custom Actions

**Explanation:** Developers can create and expose their own messages in Dataverse by creating custom Actions. Other plug-ins can then subscribe to these custom messages.

</details>

---

### Question 12 — Single Choice

A team is building a model-driven app and needs to distribute customizations (such as tables, forms, and views) between environments. Which Dataverse concept supports this?

- A. Azure DevOps pipelines
- B. Dataverse solutions
- C. Power Automate exports
- D. Azure Resource Manager templates

<details>
<summary>Answer</summary>

**Correct answer:** B. Dataverse solutions

**Explanation:** Dataverse uses a metadata-driven architecture and packages customizations (tables, columns, relationships, UI components) into solutions that can be transported across environments.

</details>

---

### Question 13 — Multi-Select

A developer is reviewing Dataverse's basic data operation messages. Which of the following are among the basic data operations exposed by Dataverse? (Select **three**.)

- A. Create
- B. Publish
- C. RetrieveMultiple
- D. Merge
- E. Disassociate
- F. Import

<details>
<summary>Answer</summary>

**Correct answers:** A. Create, C. RetrieveMultiple, E. Disassociate

**Explanation:** The basic data operations exposed by Dataverse include Create, Retrieve, RetrieveMultiple, Update, Delete, Associate, and Disassociate. Publish, Merge, and Import are not listed among the basic operations.

</details>

---

### Question 14 — Multi-Select

A developer is choosing an API approach for a new integration. Which of the following statements about Dataverse APIs are correct? (Select **two**.)

- A. The Web API is based on the OData V4 RESTful standard
- B. The SDK for .NET must be used for plug-in development
- C. The Web API requires .NET runtime on the client
- D. The SDK for .NET is the only way to read metadata
- E. SOAP is the recommended protocol for new integrations

<details>
<summary>Answer</summary>

**Correct answers:** A. The Web API is based on the OData V4 RESTful standard, B. The SDK for .NET must be used for plug-in development

**Explanation:** The Dataverse Web API is an OData V4 RESTful endpoint, and the SDK for .NET is required specifically for plug-in development. The Web API works over HTTP, not .NET, and is the most broadly applicable approach.

</details>

---

### Question 15 — Multi-Select

When registering a plug-in step, which of the following must a developer specify? (Select **three**.)

- A. The specific message (event) to subscribe to
- B. The pipeline stage at which the plug-in should execute
- C. The Azure subscription to bill processing costs to
- D. The execution mode (synchronous or asynchronous)
- E. The table column that triggers the plug-in
- F. The Dataverse environment region

<details>
<summary>Answer</summary>

**Correct answers:** A. The specific message (event) to subscribe to, B. The pipeline stage at which the plug-in should execute, D. The execution mode (synchronous or asynchronous)

**Explanation:** According to the event framework documentation, handling events involves subscribing to a specific message, indicating where in the pipeline to execute (stage), and specifying the execution mode (synchronous or asynchronous).

</details>

---

### Question 16 — Multi-Select

Which of the following are valid benefits of building applications on Microsoft Dataverse? (Select **two**.)

- A. A built-in security model to control access for different sets of users
- B. Automatic AI model training for all stored data
- C. Easy interoperability with other Dataverse-based applications such as Dynamics 365
- D. Free Azure compute resources for all Dataverse environments
- E. Built-in source control integration with GitHub

<details>
<summary>Answer</summary>

**Correct answers:** A. A built-in security model to control access for different sets of users, C. Easy interoperability with other Dataverse-based applications such as Dynamics 365

**Explanation:** Dataverse provides a built-in security model and enables easy interoperability with other applications built on the same platform (such as Dynamics 365 Sales and Customer Service). Free Azure compute and automatic GitHub integration are not listed as Dataverse benefits.

</details>

---

### Question 17 — Fill-in-the-Blank

Dataverse plug-ins are managed code classes registered to run when specific Dataverse ___ occur. The plug-in execution pipeline consists of three stages: ___, Pre-Operation, and PostOperation.

<details>
<summary>Answer</summary>

**Answer:** events (or messages); Pre-Validation

**Explanation:** Plug-ins are triggered by Dataverse events/messages. The three pipeline stages are Pre-Validation, Pre-Operation, and PostOperation, as described in the extensibility model unit.

</details>

---

### Question 18 — Fill-in-the-Blank

The Dataverse ___ is an OData V4 RESTful endpoint that can be leveraged to view and manipulate metadata within a Dataverse environment.

<details>
<summary>Answer</summary>

**Answer:** Web API

**Explanation:** The Dataverse Web API is the OData V4 RESTful endpoint exposed by Dataverse for viewing and manipulating metadata and data. It is the most broadly applicable interface as it only requires HTTP.

</details>

---

### Question 19 — Fill-in-the-Blank

Asynchronous plug-ins are dispatched as a ___ job to the asynchronous service and can only be registered for the ___ stage.

<details>
<summary>Answer</summary>

**Answer:** system; PostOperation

**Explanation:** Asynchronous plug-ins are executed via a system job after the operation completes. They are restricted to the PostOperation stage of the event pipeline.

</details>

---

### Question 20 — Fill-in-the-Blank

To discover which custom messages are available in a Dataverse environment, a developer can search the ___ namespace for classes whose name ends in `*Request`, or use the ___ tool to navigate table-message combinations.

<details>
<summary>Answer</summary>

**Answer:** Microsoft.Sdk.Messages (or Microsoft.Xrm.Sdk.Messages); Plugin Registration Tool

**Explanation:** The documentation describes searching the Microsoft.Sdk.Messages namespace for `*Request` classes, and using the Plugin Registration tool to browse available messages for a given table type.

</details>

---

### Question 21 — Fill-in-the-Blank

When a developer needs to package and distribute customizations for a model-driven app across environments, they use Dataverse ___. This mechanism stores table definitions, relationships, forms, and views as ___ in the Dataverse environment.

<details>
<summary>Answer</summary>

**Answer:** solutions; metadata

**Explanation:** Dataverse uses a metadata-driven architecture where all customizations are stored as metadata and transported across environments using solutions.

</details>

---

### Question 22 — Single Choice

A developer is implementing a plug-in that should update a related record after a primary record is successfully saved, and the operation does not need to block the user's response. Which configuration is most appropriate?

- A. Synchronous plug-in at the Pre-Operation stage
- B. Synchronous plug-in at the PostOperation stage
- C. Asynchronous plug-in at the PostOperation stage
- D. Asynchronous plug-in at the Pre-Validation stage

<details>
<summary>Answer</summary>

**Correct answer:** C. Asynchronous plug-in at the PostOperation stage

**Explanation:** Since the operation does not need to block the user's response, an asynchronous plug-in is appropriate. Asynchronous plug-ins run as system jobs after the operation completes and can only be registered at the PostOperation stage.

</details>
