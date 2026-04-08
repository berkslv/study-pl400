# Recall: Extending Microsoft Power Platform

> **Source files:** 01-introduction.md, 02-extensibility.md, 03-service-extensibility.md, 04-exercise.md, 05-configure-code.md

---

## Keywords

| Term | Definition |
|------|-----------|
| Power Apps Component Framework (PCF) | Framework for building reusable custom UI controls for canvas and model-driven apps using HTML, CSS, and TypeScript. |
| Client Scripting | JavaScript used in model-driven app forms to implement business rules programmatically at runtime. |
| IPlugin | Dataverse SDK interface requiring an `Execute` method that custom plugin classes must implement. |
| Event Pipeline | Dataverse message-processing pipeline with Pre-Validation, Pre-Operation, Main Operation, and Post-Operation stages. |
| Custom API | Code-first mechanism to define new Dataverse messages that extend web services with custom business logic. |
| Organization Service | .NET SDK for interacting with Dataverse data, available as `IOrganizationService` or `ServiceClient`. |
| Web API | Dataverse OData v4 RESTful endpoint supporting any language that can make HTTP requests with OAuth 2.0. |
| FetchXML | Proprietary Dataverse query language for crafting complex queries across related tables. |
| StandardControl | PCF interface (`ComponentFramework.StandardControl`) that code components must implement for lifecycle management. |
| Plugin Registration Tool | Tool used to register a compiled plugin assembly against specific Dataverse messages and pipeline stages. |
| IPluginExecutionContext | Service available in a plugin's `Execute` method that provides access to the message and requestor information. |
| Power Automate Connector | Integration mechanism that allows makers to connect flows to external systems without writing code. |

---

## Main Ideas

- Extensibility points are intentionally placed so custom code is used only when low-code approaches are insufficient.
- PCF code components implement the `StandardControl` interface with required methods: `init`, `updateView`, `destroy`, and optional `getOutputs`.
- PCF manifest file declares component resources, bindable properties, and required device/API features (e.g., `Device.captureAudio`, `WebAPI`).
- Client scripting only applies to model-driven apps and responds to form load, column change, and form save events; direct DOM manipulation is not allowed.
- All Dataverse data access is processed through the event pipeline — custom logic cannot be bypassed regardless of how data is accessed.
- Plugin pipeline stages: Pre-Validation → Pre-Operation → Main Operation → Post-Operation; plugins attach to all stages except Main Operation (unless using Custom API).
- Plugins are .NET classes implementing `IPlugin`; services available via `IServiceProvider` include `IPluginExecutionContext`, `ITracingService`, and `IOrganizationServiceFactory`.
- Custom APIs define new Dataverse messages via a custom API record + request parameters + response properties + a plugin registered on the Main Operation stage.
- Custom API plugins are the **only** scenario where a plugin can be registered on the Main Operation stage.
- `ServiceClient` implements `IOrganizationService` and supports .NET full framework 4.6.2–4.8 and .NET Core 3.0–6.0 for external use.
- Business rules are preferred for simple no-code logic; client script is preferred for complex nested conditions or dynamic form values not accessible by rules.
- Power Automate flows are asynchronous only; workflows and plugins support both synchronous and asynchronous execution.
- PCF controls have replaced HTML web resources in model-driven apps due to better reusability and extensibility.
- Power Pages support liquid templating and JavaScript extensions; fully custom portals require ASP.NET and skilled developers.

---

## Mini Quiz

### Q1 — Single Choice

A developer needs to capture audio from a device inside a PCF code component.

What must be declared in the component manifest to enable this capability?

- A. A `<property>` element with type `Audio`
- B. A `<uses-feature name="Device.captureAudio" required="true" />` element
- C. An `init` method parameter for audio access
- D. A JavaScript `navigator.mediaDevices` call in `updateView`

<details>
<summary>Answer</summary>

**Correct answer:** B. A `<uses-feature name="Device.captureAudio" required="true" />` element

**Explanation:** The manifest's `<feature-usage>` section must declare each device feature with `required="true"` before the component's code can invoke the associated native API.

</details>

---

### Q2 — Single Choice

A plugin must intercept a Create message and modify the data before it is written to the database.

Which pipeline stage should the plugin be registered on?

- A. Pre-Validation
- B. Pre-Operation
- C. Main Operation
- D. Post-Operation

<details>
<summary>Answer</summary>

**Correct answer:** B. Pre-Operation

**Explanation:** Pre-Operation runs after validation but before the main database write, making it the correct stage to modify input data before it is persisted. Main Operation is reserved for Custom API plugins only.

</details>

---

### Q3 — Fill-in-the-Blank

The Dataverse `___` API is an OData v4 RESTful endpoint that supports any programming language capable of HTTP requests and OAuth 2.0 authentication.

<details>
<summary>Answer</summary>

**Answer:** Web API

**Explanation:** The Dataverse Web API is an OData v4 RESTful endpoint, contrasted with the Organization Service which is a .NET SDK.

</details>

---

### Q4 — Single Choice

A maker portal user needs to implement business logic that automatically sets related column values when an account name changes in a model-driven form.

Which approach requires a developer and supports complex nested conditional logic?

- A. Business Rules
- B. Power Automate Cloud Flow
- C. Client Script
- D. Power Pages Liquid Template

<details>
<summary>Answer</summary>

**Correct answer:** C. Client Script

**Explanation:** Client scripting handles form events (including column change) and supports arbitrary JavaScript logic including nested conditions — scenarios where declarative business rules fall short.

</details>

---

### Q5 — Fill-in-the-Blank

A Dataverse plugin class must implement the `___` interface, which requires a single method named `___`.

<details>
<summary>Answer</summary>

**Answer:** `IPlugin`; `Execute`

**Explanation:** The Dataverse SDK defines `IPlugin` with one required method, `Execute(IServiceProvider serviceProvider)`, which serves as the entry point for all plugin business logic.

</details>

---

### Q6 — Single Choice

A team wants to expose a reusable "find customer" operation in Dataverse that encapsulates multiple query steps and can be called from Power Automate, Power Apps, and external code.

What is the correct approach?

- A. Create a scheduled Power Automate flow
- B. Register a plugin on the Pre-Validation stage of the Retrieve message
- C. Define a Custom API with a plugin registered on the Main Operation stage
- D. Create an HTML web resource with embedded fetch logic

<details>
<summary>Answer</summary>

**Correct answer:** C. Define a Custom API with a plugin registered on the Main Operation stage

**Explanation:** Custom APIs define new Dataverse messages and are the only scenario where a plugin can run on the Main Operation stage; the resulting message is callable from the Web API, Power Automate, and Power Apps.

</details>

---

### Q7 — Fill-in-the-Blank

When deciding between Power Automate, classic Workflows, and Plugins: only ___ can access external data using connectors, while only ___ can trigger synchronously before a database write.

<details>
<summary>Answer</summary>

**Answer:** Power Automate Flow; Plugin (or Workflow)

**Explanation:** Power Automate flows access external systems via connectors but run asynchronously. Plugins (and classic Workflows) support synchronous before/after execution stages and can run logic prior to the database write.

</details>

---
