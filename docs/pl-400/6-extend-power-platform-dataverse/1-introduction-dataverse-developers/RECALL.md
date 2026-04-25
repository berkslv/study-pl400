# Recall: Introduction to Developing with Microsoft Dataverse

> **Source files:** 1-introduction.md, 2-extensibility.md, 3-framework.md

---

## Keywords

| Term | Definition |
|------|-----------|
| Plug-in | A managed .NET code class registered to execute custom logic when a specific Dataverse event occurs. |
| Event Pipeline | The three-stage execution flow (Pre-Validation, Pre-Operation, PostOperation) that plug-ins run through. |
| Pre-Validation | The first pipeline stage, occurring before security checks; used for advanced validation and permission checks. |
| Pre-Operation | The pipeline stage where you can modify table values before they are saved to Dataverse. |
| PostOperation | The final pipeline stage; asynchronous plug-ins can only be registered here. |
| Dataverse Web API | An OData V4 RESTful endpoint for accessing and manipulating Dataverse data and metadata via HTTP. |
| SDK for .NET | The typed .NET library required for Dataverse plug-in development; cannot be replaced by the Web API for plug-ins. |
| Plugin Registration Tool | The tool used to subscribe plug-ins to Dataverse event messages and configure pipeline stage and execution mode. |
| Custom API | A Dataverse feature allowing developers to create and expose their own custom messages/actions. |
| Metadata-driven architecture | Dataverse design that stores tables, columns, relationships, and UI components as metadata in a solution. |
| Synchronous plug-in | A plug-in that blocks the entire operation until its logic completes execution. |
| Asynchronous plug-in | A plug-in dispatched as a system job that executes after the operation completes; PostOperation only. |

---

## Main Ideas

- Plug-ins are required for synchronous server-side logic that cannot be achieved with low-code tools like Power Automate.
- The Dataverse event pipeline has three stages: Pre-Validation → Pre-Operation → PostOperation.
- Pre-Validation runs before security checks; use it to validate permissions or cancel a transaction before it starts.
- Pre-Operation is used to modify table field values before they are persisted.
- PostOperation is used to modify response properties; avoid direct table updates here as they trigger another event.
- Asynchronous plug-ins can **only** be registered on the PostOperation stage and run via a system job after the operation completes.
- Synchronous plug-ins block the operation until complete; execution order is controlled via the Plugin Registration Tool when multiple plug-ins share a stage.
- Dataverse exposes standard messages: Create, Retrieve, RetrieveMultiple, Update, Delete, Associate, Disassociate.
- Additional contextual messages exist per table type (e.g., `CalculateRollupField` for tables with rollup columns).
- Custom messages can be created using Dataverse **Actions** (Custom API).
- The Dataverse Web API (OData V4) is the broadest API option, requiring only HTTP; the SDK for .NET is mandatory for plug-in development.
- Metadata and customizations are packaged in solutions for transport across environments.
- Cancelling an operation in Pre-Validation is done by throwing `InvalidPluginExecutionException` inside the plug-in.

---

## Mini Quiz

### Q1 — Single Choice

A developer needs to cancel a Dataverse update operation before it is committed, and also before security checks run.

Which pipeline stage should the plug-in be registered to?

- A. Pre-Operation
- B. PostOperation
- C. Pre-Validation
- D. Asynchronous PostOperation

<details>
<summary>Answer</summary>

**Correct answer:** C. Pre-Validation

**Explanation:** Pre-Validation is the first stage in the pipeline, occurring before security checks. It is the correct stage to cancel a transaction before it proceeds by throwing an `InvalidPluginExecutionException`.

</details>

---

### Q2 — Fill-in-the-Blank

Asynchronous plug-ins can only be registered for the ___ stage of the Dataverse Event Pipeline.

<details>
<summary>Answer</summary>

**Answer:** PostOperation

**Explanation:** Per the source material, asynchronous plug-ins are dispatched as system jobs and can only be registered on the PostOperation stage.

</details>

---

### Q3 — Single Choice

A developer wants to modify a field value on a record just before it is saved to Dataverse.

Which pipeline stage is most appropriate?

- A. Pre-Validation
- B. Pre-Operation
- C. PostOperation (synchronous)
- D. PostOperation (asynchronous)

<details>
<summary>Answer</summary>

**Correct answer:** B. Pre-Operation

**Explanation:** Pre-Operation is specifically intended for modifying table values before they are saved; Pre-Validation runs before security checks and is not for data modification.

</details>

---

### Q4 — Fill-in-the-Blank

For Dataverse plug-in development, you must use the ___ rather than the Web API, because plug-ins require typed .NET classes.

<details>
<summary>Answer</summary>

**Answer:** SDK for .NET

**Explanation:** The source states that you must use the SDK for .NET for Dataverse plug-in development; the Web API only requires HTTP and cannot be used for plug-in assembly code.

</details>

---

### Q5 — Single Choice

When multiple synchronous plug-ins are registered to the same pipeline stage, what determines their execution order?

- A. The date the plug-in was registered
- B. The plug-in's assembly name alphabetically
- C. The execution order attribute set in the Plugin Registration Tool
- D. Dataverse automatically picks the most recently updated plug-in first

<details>
<summary>Answer</summary>

**Correct answer:** C. The execution order attribute set in the Plugin Registration Tool

**Explanation:** The source explicitly states that when multiple plug-ins are registered to the same stage, the execution order attribute specified via the Plugin Registration Tool determines which runs first.

</details>

---

### Q6 — Fill-in-the-Blank

Dataverse exposes an ___ V4 RESTful endpoint known as the Dataverse Web API, which can be used to view and manipulate metadata.

<details>
<summary>Answer</summary>

**Answer:** OData

**Explanation:** The source describes the Dataverse Web API as an OData V4 RESTful endpoint used for accessing and manipulating metadata and data within a Dataverse environment.

</details>

---
