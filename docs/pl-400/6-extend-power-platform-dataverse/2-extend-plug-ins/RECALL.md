# Recall: Extend Dataverse with Plug-ins

> **Source files:** 1-introduction.md, 2-usage.md, 3-execution.md, 4-exercise.md

---

## Keywords

| Term | Definition |
|------|-----------|
| Plug-in | A .NET assembly implementing `IPlugin` that adds imperative logic to Dataverse events. |
| `IPlugin` | Interface from `Microsoft.CrmSdk.CoreAssemblies` exposing a single `Execute` method. |
| `IPluginExecutionContext` | Context object accessed via `IServiceProvider` providing input/output data and pipeline metadata. |
| `IWorkflowContext` | Context object for custom workflow extensions, accessed via `CodeActivityContext`. |
| `InputParameters` | Collection holding entity values presented to the plug-in **before** the operation completes. |
| `OutputParameters` | Collection holding result values, available only in the **PostOperation** stage. |
| PreEntityImage | Immutable snapshot of entity data captured **before** the operation; used for auditing. |
| PostEntityImage | Immutable snapshot of entity data captured **after** the operation; used for auditing. |
| SharedVariables | Pipeline dictionary used to pass data between plug-in steps and prevent infinite recursion. |
| `InvalidPluginExecutionException` | Exception thrown inside a plug-in to cancel the operation and surface an error to the user. |
| Plug-in Registration Tool | Tool used to deploy assemblies and register steps (message, entity, stage, mode) in Dataverse. |
| PreOperation stage | Execution stage before Dataverse writes data; used to validate or modify `InputParameters`. |
| PostOperation stage | Execution stage after Dataverse writes data; used to read or modify `OutputParameters`. |

---

## Main Ideas

- A plug-in is a last resort; prefer business rules, workflows, Power Automate flows, calculated/rollup fields, or custom actions first.
- A plug-in implements `IPlugin` (single `Execute(IServiceProvider)` method) from the `Microsoft.CrmSdk.CoreAssemblies` NuGet package.
- Common plug-in scenarios: cancel an event with an error, modify data before save, or invoke the Organization Service to trigger automation.
- Plug-ins support triggers unavailable to workflows: Delete and many specialized Dataverse messages.
- Only plug-ins (not workflows) can access external data directly and require developer maintenance.
- `IPluginExecutionContext` is retrieved from `IServiceProvider`; `IWorkflowContext` is retrieved from `CodeActivityContext`. Both implement `IExecutionContext`.
- `InputParameters["Target"]` gives the entity being created/updated; edit it in **PreOperation** to modify data before save.
- `OutputParameters` is only populated after the operation (PostOperation stage); edit it to change what is returned to the caller.
- Entity images (Pre/Post) are immutable and more efficient than issuing a `Retrieve` request inside a plug-in.
- Use `SharedVariables` to track a run count and throw `InvalidPluginExecutionException` if a plug-in recurses more than an allowed limit.
- Assemblies must be **strong-name signed** (`.snk` key file) before registration with the Plug-in Registration Tool.
- Register a step by specifying: message (e.g., Create, Update, Retrieve), primary entity, execution stage, and optional filtered attributes.
- A retrieve/retrievemultiple plug-in runs at **PostOperation** and modifies `OutputParameters` (`BusinessEntity` or `BusinessEntityCollection`).

---

## Mini Quiz

### Q1 — Single Choice

A developer needs to strip non-numeric characters from a phone number **before** it is saved to Dataverse.

Which stage and parameter should the plug-in use?

- A. PostOperation — `OutputParameters["Target"]`
- B. PreOperation — `InputParameters["Target"]`
- C. PreValidation — `OutputParameters["Target"]`
- D. PostOperation — `PreEntityImages`

<details>
<summary>Answer</summary>

**Correct answer:** B. PreOperation — `InputParameters["Target"]`

**Explanation:** The PreOperation stage fires before the write occurs, and `InputParameters["Target"]` holds the entity values that will be persisted, allowing modification before save.

</details>

---

### Q2 — Fill-in-the-Blank

In a plug-in, the execution context is obtained by calling `serviceProvider.GetService(typeof(___ ))`.

<details>
<summary>Answer</summary>

**Answer:** `IPluginExecutionContext`

**Explanation:** `IPluginExecutionContext` is the type passed to `GetService` inside the `Execute` method to retrieve the context object from the service provider.

</details>

---

### Q3 — Single Choice

A plug-in needs to reformat a phone number on every contact **list** view load. Which message and `OutputParameters` key should it use?

- A. Retrieve — `BusinessEntity`
- B. RetrieveMultiple — `BusinessEntityCollection`
- C. Update — `Target`
- D. Create — `BusinessEntityCollection`

<details>
<summary>Answer</summary>

**Correct answer:** B. RetrieveMultiple — `BusinessEntityCollection`

**Explanation:** List views trigger the `RetrieveMultiple` message, and the result set is available under `OutputParameters["BusinessEntityCollection"]` as an `EntityCollection`.

</details>

---

### Q4 — Fill-in-the-Blank

To cancel a Dataverse operation from within a plug-in, throw a(n) `___` exception.

<details>
<summary>Answer</summary>

**Answer:** `InvalidPluginExecutionException`

**Explanation:** Throwing `InvalidPluginExecutionException` rolls back the operation and surfaces the message as an error to the user or calling code.

</details>

---

### Q5 — Single Choice

A plug-in calls itself recursively due to a data update it triggers. Which `IExecutionContext` collection is the recommended lightweight safeguard to track and limit the run count?

- A. `InputParameters`
- B. `OutputParameters`
- C. `SharedVariables`
- D. `PreEntityImages`

<details>
<summary>Answer</summary>

**Correct answer:** C. `SharedVariables`

**Explanation:** `SharedVariables` persists across pipeline steps in the same transaction, making it suitable for storing a run counter to detect and stop runaway recursion.

</details>

---

### Q6 — Fill-in-the-Blank

Plug-in assemblies must be signed with a strong-name key file (extension `___`) before registration.

<details>
<summary>Answer</summary>

**Answer:** `.snk`

**Explanation:** The exercise signs the assembly using a `.snk` key file created in the project's Signing properties tab, which is required for Dataverse plug-in registration.

</details>

---

### Q7 — Single Choice

A team wants logic that business users can maintain, runs synchronously, and does not need external data access. Which approach is most appropriate?

- A. Plug-in
- B. Client Script
- C. Workflow / Power Automate flow
- D. Custom Workflow Extension

<details>
<summary>Answer</summary>

**Correct answer:** C. Workflow / Power Automate flow

**Explanation:** Workflows can run synchronously and are maintained by business users without developer involvement, unlike plug-ins which require developer skills.

</details>

---
