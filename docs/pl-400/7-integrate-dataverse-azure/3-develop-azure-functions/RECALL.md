# Recall: Develop Azure Functions

> **Source files:** 1-introduction.md, 2-azure-function-development-overview.md, 3-create-triggers-bindings.md, 4-connect-azure-services.md, 5-create-function-visual-studio-code.md

---

## Keywords

| Term | Definition |
|------|-----------|
| Function App | The unit of deployment and management grouping one or more Azure Functions sharing the same plan and runtime. |
| Trigger | Defines how a function is invoked; every function must have exactly one trigger. |
| Input Binding | A declarative connection that provides data to a function as a parameter. |
| Output Binding | A declarative connection that directs data out of a function to another service. |
| host.json | Metadata file containing configuration options that apply to all functions in a function app instance. |
| local.settings.json | Local-only file storing app settings and connection strings used during local development; never commit to source control. |
| Azurite | Local emulator for Azure Storage (Queue, Blob, Table) used to test storage-based triggers without connecting to Azure. |
| function.json | Per-function configuration file used by legacy models (Node.js v3, Python v1, PowerShell) to define triggers and bindings. |
| Identity-Based Connection | Connection using a managed identity instead of a secret/connection string to authenticate to Azure services. |
| Managed Identity | Azure-assigned identity used by a hosted function app for identity-based connections; system-assigned by default. |
| Azure Functions Core Tools | CLI toolset (v4.x) enabling local creation, running, and deployment of Azure Functions. |
| dataType property | Property in function.json for dynamically typed languages (JavaScript v3, PowerShell) to declare binary, stream, or string data types. |

---

## Main Ideas

- A function app is the unit of deployment; all functions in it share the same pricing plan, deployment method, and runtime version.
- In Functions 2.x and later, all functions in a function app must be authored in the same language.
- `host.json` affects all functions in the app; `local.settings.json` is used only for local development and must never be stored in a remote repository.
- Every function must have exactly one trigger; bindings are optional and can be zero or more inputs/outputs.
- Triggers always have direction `in`; input bindings use `in`, output bindings use `out`; some bindings support `inout` (Advanced editor only).
- Modern programming models (Node.js v4, Python v2) define triggers and bindings in code using decorators/fluent APIs; the runtime generates `function.json` automatically.
- Older models (Node.js v3, Python v1, PowerShell) require manual `function.json` authoring; you can edit bindings in the Azure portal Integration tab.
- .NET and Java use C#/Java attributes to configure bindings; they do not rely on `function.json` and cannot be created/edited in the portal.
- For local testing of non-HTTP triggers, use live connection strings in `local.settings.json` Values array or the Azurite local storage emulator.
- Connection strings and keys are stored as encrypted application settings in Azure and accessed as environment variables at runtime; you reference them by name in binding configuration, not by value.
- Identity-based connections use a system-assigned managed identity by default; user-assigned identity can be specified via `credential` and `clientID` properties (resource ID is not supported).
- Adhere to the principle of least privilege when granting permissions to managed identities used by function connections.
- Azure Functions Core Tools v4.x is required to develop and deploy functions locally with Visual Studio Code (.NET 8 target framework).

---

## Mini Quiz

### Q1 — Single Choice

A developer is building a function app with multiple functions in C#. They want to ensure consistent behavior across all functions.

Which file should they modify to apply configuration options that affect all functions in the function app?

- A. local.settings.json
- B. function.json
- C. host.json
- D. appsettings.json

<details>
<summary>Answer</summary>

**Correct answer:** C. host.json

**Explanation:** The `host.json` metadata file contains configuration options that affect all functions in a function app instance. `local.settings.json` is only for local development, and `function.json` is per-function.

</details>

---

### Q2 — Fill-in-the-Blank

Every Azure Function must have exactly one ___, while ___ are optional and a function may have zero or more of them.

<details>
<summary>Answer</summary>

**Answer:** trigger; bindings

**Explanation:** A trigger defines how a function is invoked and is mandatory (exactly one per function). Bindings are declarative connections to other resources and are optional.

</details>

---

### Q3 — Single Choice

A developer using Python v2 wants to add an output binding to their Azure Function. How should they configure it?

- A. Edit the function.json file directly in the Azure portal Integration tab.
- B. Use Python decorators in code; the runtime generates function.json automatically.
- C. Configure the binding in local.settings.json under the Values array.
- D. Add a JSON entry to host.json under the bindings property.

<details>
<summary>Answer</summary>

**Correct answer:** B. Use Python decorators in code; the runtime generates function.json automatically.

**Explanation:** The Python v2 programming model uses decorators to define bindings in code; the runtime generates the corresponding `function.json`. Editing `function.json` directly is the legacy v1 approach.

</details>

---

### Q4 — Fill-in-the-Blank

When an Azure Function app is hosted in Azure, identity-based connections use a ___ identity by default. When developing locally, the ___ identity is used instead.

<details>
<summary>Answer</summary>

**Answer:** system-assigned managed; developer's

**Explanation:** Azure Functions uses the system-assigned managed identity by default for hosted apps. During local development, the developer's own identity is used for identity-based connections.

</details>

---

### Q5 — Single Choice

A team wants to test their Azure Function with a Storage Queue output binding locally without connecting to live Azure Storage services. What is the recommended approach?

- A. Set the connection string to an empty string in local.settings.json.
- B. Use the Azurite local storage emulator.
- C. Deploy to Azure and test directly in the portal.
- D. Use an HTTP trigger instead to simulate the queue.

<details>
<summary>Answer</summary>

**Correct answer:** B. Use the Azurite local storage emulator.

**Explanation:** The Azurite emulator supports Azure Queue Storage, Blob Storage, and Table Storage bindings locally, allowing testing without connecting to remote Azure Storage services.

</details>

---

### Q6 — Single Choice

A function's `function.json` includes a binding with `"dataType": "binary"`. Which languages does this `dataType` property apply to?

- A. C# and Java only, since they are statically typed
- B. Dynamically typed languages such as JavaScript (v3 model) and PowerShell
- C. All languages including C#, Java, Python, and JavaScript
- D. Only Python v1 and PowerShell

<details>
<summary>Answer</summary>

**Correct answer:** B. Dynamically typed languages such as JavaScript (v3 model) and PowerShell

**Explanation:** The `dataType` property in `function.json` is used for dynamically typed languages like JavaScript (v3 model) and PowerShell. Statically typed languages like C# and Java use parameter types to define data types instead.

</details>

---

### Q7 — Fill-in-the-Blank

The `local.settings.json` file must never be stored in a ___ because it may contain secrets such as ___.

<details>
<summary>Answer</summary>

**Answer:** remote repository; connection strings

**Explanation:** `local.settings.json` can contain sensitive secrets like connection strings. Storing it in a remote/source control repository would expose those secrets.

</details>

---
