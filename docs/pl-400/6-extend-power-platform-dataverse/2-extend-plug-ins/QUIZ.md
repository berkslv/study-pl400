# Quiz: Extend Power Platform with Dataverse Plug-ins

> **Source material:** 1-introduction.md, 2-usage.md, 3-execution.md, 4-exercise.md, 5-check.md, 6-summary.md
> **Total questions:** 22
> **Question types:** Multiple choice (single), Multiple choice (multi-select), Fill-in-the-blank

---

## Questions

### Question 1 — Single Choice

A developer is evaluating whether to use a plug-in or a declarative tool for a new business requirement. The requirement involves complex conditional branching logic that is difficult to express using standard UI-based tools.

Which statement best describes when a plug-in should be used?

- A. Plug-ins should be the first option considered for any business logic.
- B. Plug-ins should be used only when a declarative process cannot meet the requirements.
- C. Plug-ins should replace Power Automate flows wherever possible.
- D. Plug-ins are preferred over business rules for all field validation scenarios.

<details>
<summary>Answer</summary>

**Correct answer:** B. Plug-ins should be used only when a declarative process cannot meet the requirements.

**Explanation:** A plug-in is described as imperative logic used only when a declarative process, such as a business rule, flow, or workflow, cannot meet requirements. Writing code is considered a last-resort method.

</details>

---

### Question 2 — Single Choice

You are building a Dataverse plug-in and need to implement the required interface. Which NuGet package provides the `IPlugin` interface?

- A. Microsoft.PowerPlatform.Dataverse.Client
- B. Microsoft.Xrm.Data.PowerShell
- C. Microsoft.CrmSdk.CoreAssemblies
- D. Microsoft.Crm.Sdk.Messages

<details>
<summary>Answer</summary>

**Correct answer:** C. Microsoft.CrmSdk.CoreAssemblies

**Explanation:** The `IPlugin` interface is found in the `Microsoft.CrmSdk.CoreAssemblies` NuGet package. Implementing this interface is fundamental to building a Dataverse plug-in.

</details>

---

### Question 3 — Single Choice

A developer needs to add a method to a plug-in class that will contain the custom business logic. Which method does the `IPlugin` interface expose for this purpose?

- A. Run
- B. Start
- C. Execute
- D. Process

<details>
<summary>Answer</summary>

**Correct answer:** C. Execute

**Explanation:** The `IPlugin` interface exposes a single method called `Execute`, where custom logic is placed based on the event being handled.

</details>

---

### Question 4 — Multi-Select

A business analyst asks which tools should be tried before resorting to a plug-in. Which **three** of the following are listed as common alternatives to plug-ins? (Select **three**.)

- A. Workflows
- B. Power Automate flows
- C. Custom connectors
- D. Calculated and rollup fields
- E. Azure Functions
- F. Custom actions

<details>
<summary>Answer</summary>

**Correct answer:** A. Workflows, B. Power Automate flows, D. Calculated and rollup fields

**Explanation:** The documented alternatives to plug-ins include workflows, Power Automate flows, calculated and rollup fields, and custom actions. Azure Functions and custom connectors are not listed as direct alternatives.

</details>

---

### Question 5 — Single Choice

A team needs logic that runs synchronously within a Dataverse operation. Which of the following tools will NOT achieve synchronous execution?

- A. Plug-ins
- B. Workflows
- C. Power Automate
- D. On-demand workflows

<details>
<summary>Answer</summary>

**Correct answer:** C. Power Automate

**Explanation:** Power Automate does not support synchronous execution within the Dataverse event pipeline. Plug-ins and workflows (including on-demand workflows) can run synchronously.

</details>

---

### Question 6 — Single Choice

A developer is comparing plug-ins and workflows for a scenario that requires accessing data from an external REST API during the process.

Which tool supports accessing external data?

- A. Workflows only
- B. Workflows and client scripts
- C. Plug-ins only
- D. Plug-ins and client scripts (with limitations)

<details>
<summary>Answer</summary>

**Correct answer:** D. Plug-ins and client scripts (with limitations)

**Explanation:** According to the comparison table, workflows cannot access external data, while plug-ins can and client scripts can with limitations.

</details>

---

### Question 7 — Single Choice

A business user wants to maintain a custom automation process without developer involvement. Which tool is most appropriate for this scenario based on maintenance ownership?

- A. Plug-in
- B. Client script
- C. Workflow
- D. Custom assembly

<details>
<summary>Answer</summary>

**Correct answer:** C. Workflow

**Explanation:** The comparison table states that workflows are maintained by business users, whereas plug-ins and client scripts require developers to maintain them.

</details>

---

### Question 8 — Single Choice

A plug-in needs to be triggered when a contact record is deleted. Which tool supports the Delete trigger?

- A. Workflow
- B. Client script
- C. Plug-in
- D. Both workflow and plug-in

<details>
<summary>Answer</summary>

**Correct answer:** C. Plug-in

**Explanation:** According to the triggers comparison table, plug-ins support the Delete trigger in addition to many specialized triggers, while workflows do not list Delete as a supported trigger.

</details>

---

### Question 9 — Single Choice

A developer is writing a plug-in and needs to obtain the `IPluginExecutionContext` from within the `Execute` method. Which parameter provides access to this service?

- A. `IOrganizationService`
- B. `ITracingService`
- C. `IServiceProvider`
- D. `CodeActivityContext`

<details>
<summary>Answer</summary>

**Correct answer:** C. `IServiceProvider`

**Explanation:** The `IPluginExecutionContext` is accessed by calling `serviceProvider.GetService(typeof(IPluginExecutionContext))` on the `IServiceProvider` parameter passed to the `Execute` method.

</details>

---

### Question 10 — Single Choice

A developer is writing a custom workflow extension and needs to access the execution context. Which class is used instead of `IPluginExecutionContext` in this scenario?

- A. `IExecutionContext`
- B. `IWorkflowContext`
- C. `IServiceProvider`
- D. `IOrganizationServiceFactory`

<details>
<summary>Answer</summary>

**Correct answer:** B. `IWorkflowContext`

**Explanation:** In custom workflow extensions, the execution context is accessed via `context.GetExtension<IWorkflowContext>()` using the `CodeActivityContext`. Both `IPluginExecutionContext` and `IWorkflowContext` implement `IExecutionContext`.

</details>

---

### Question 11 — Single Choice

A plug-in must validate a phone number before a contact record is saved. At which stage and on which message should the plug-in be registered to read and potentially cancel the operation?

- A. PostOperation on Create
- B. PreOperation on Retrieve
- C. Pre-Validation on Create/Update
- D. PostOperation on Update

<details>
<summary>Answer</summary>

**Correct answer:** C. Pre-Validation on Create/Update

**Explanation:** To validate and cancel an operation, the recommended pattern is to register the plug-in on the Pre-Validation stage for Create/Update, read values from `InputParameters`, and throw an `InvalidPluginExecutionException` if validation fails.

</details>

---

### Question 12 — Single Choice

A plug-in needs to change field values before they are written to the database. Which `IExecutionContext` collection should be modified?

- A. `OutputParameters`
- B. `PreEntityImages`
- C. `SharedVariables`
- D. `InputParameters`

<details>
<summary>Answer</summary>

**Correct answer:** D. `InputParameters`

**Explanation:** To modify data before it is saved, the plug-in should be registered at Pre-Operation stage and edit values in the `InputParameters` collection (retrieving `Target` on Create/Update).

</details>

---

### Question 13 — Single Choice

A developer needs to modify the data returned to the calling application after a Retrieve operation completes. Which collection should be updated, and at which stage must the plug-in be registered?

- A. `InputParameters` at Pre-Validation
- B. `OutputParameters` at PostOperation
- C. `PreEntityImages` at PreOperation
- D. `SharedVariables` at PostOperation

<details>
<summary>Answer</summary>

**Correct answer:** B. `OutputParameters` at PostOperation

**Explanation:** `OutputParameters` is only available in the PostOperation stage. To modify returned values, the plug-in must be registered on PostOperation and edit values in `OutputParameters`.

</details>

---

### Question 14 — Single Choice

A developer wants to capture a snapshot of an entity's field values as they existed before an update operation for custom auditing. Which context feature is most appropriate?

- A. `SharedVariables`
- B. `InputParameters`
- C. `PreEntityImages`
- D. `OutputParameters`

<details>
<summary>Answer</summary>

**Correct answer:** C. `PreEntityImages`

**Explanation:** `PreEntityImages` and `PostEntityImages` are immutable snapshots of data before/after the operation, ideal for logging or custom auditing. They are also more efficient than issuing a `Retrieve` request inside the plug-in.

</details>

---

### Question 15 — Single Choice

A plug-in is triggering itself recursively, causing runaway execution. A developer wants to limit the number of times the plug-in can run in a single pipeline pass. Which context feature is best suited to track the run count across pipeline steps?

- A. `PreEntityImages`
- B. `InputParameters`
- C. `OutputParameters`
- D. `SharedVariables`

<details>
<summary>Answer</summary>

**Correct answer:** D. `SharedVariables`

**Explanation:** `SharedVariables` allows passing data from a plug-in to a later step in the same pipeline execution, making it suitable for tracking a run count to prevent infinite recursion.

</details>

---

### Question 16 — Multi-Select

A developer is building a plug-in to format phone numbers on create and update for the Contact table. Which **two** registration steps are required? (Select **two**.)

- A. Message: Create, Primary Entity: contact, Stage: PreOperation
- B. Message: Create, Primary Entity: contact, Stage: PostOperation
- C. Message: Update, Primary Entity: contact, Attributes: Business Phone, Stage: PreOperation
- D. Message: Update, Primary Entity: contact, Stage: PostOperation
- E. Message: Delete, Primary Entity: contact, Stage: PreOperation

<details>
<summary>Answer</summary>

**Correct answer:** A. Message: Create, Primary Entity: contact, Stage: PreOperation; C. Message: Update, Primary Entity: contact, Attributes: Business Phone, Stage: PreOperation

**Explanation:** The exercise registers the format-on-create/update plug-in at PreOperation for both Create and Update messages on the contact entity. For Update, only the Business Phone attribute is filtered. PostOperation steps would run after the save and could not prevent the unformatted value from being stored.

</details>

---

### Question 17 — Single Choice

After creating a new plug-in class library project in Visual Studio targeting .NET Framework, which version should be selected for Dataverse plug-in compatibility based on the exercise?

- A. .NET Framework 4.5
- B. .NET Framework 4.6.2
- C. .NET 6.0
- D. .NET Framework 4.8

<details>
<summary>Answer</summary>

**Correct answer:** B. .NET Framework 4.6.2

**Explanation:** The exercise specifies selecting .NET Framework 4.6.2 when creating the Class Library project for the Dataverse plug-in.

</details>

---

### Question 18 — Single Choice

A plug-in assembly must be signed before it can be registered with Dataverse. Which file type is created during the signing process in Visual Studio?

- A. `.pfx`
- B. `.snk`
- C. `.cer`
- D. `.p12`

<details>
<summary>Answer</summary>

**Correct answer:** B. `.snk`

**Explanation:** The exercise instructs creating a new key file named `contoso.snk` via the project's Signing properties to sign the assembly before registering it with the Plug-in Registration Tool.

</details>

---

### Question 19 — Single Choice

A plug-in registered on the RetrieveMultiple message needs to reformat phone numbers for every contact returned. Which `OutputParameters` key contains the collection of returned entities?

- A. `BusinessEntity`
- B. `EntityList`
- C. `BusinessEntityCollection`
- D. `ResultSet`

<details>
<summary>Answer</summary>

**Correct answer:** C. `BusinessEntityCollection`

**Explanation:** For the RetrieveMultiple message, the returned entity collection is accessed via `context.OutputParameters["BusinessEntityCollection"]`, which is cast to an `EntityCollection`.

</details>

---

### Question 20 — Multi-Select

Which **two** stages are available for registering a plug-in step for a Retrieve/RetrieveMultiple message when the goal is to modify the data returned to the caller? (Select **two**.)

- A. Pre-Validation
- B. PreOperation
- C. PostOperation
- D. InTransaction
- E. PostCommit

<details>
<summary>Answer</summary>

**Correct answer:** B. PreOperation, C. PostOperation

**Explanation:** Plug-in steps can be registered at Pre-Validation, PreOperation, or PostOperation stages. To modify `OutputParameters` (which are only available after the operation), PostOperation is required. PreOperation is available but `OutputParameters` would not yet be populated there. Pre-Validation, InTransaction, and PostCommit are not all valid stage options.

</details>

---

### Question 21 — Fill-in-the-Blank

A plug-in that fails validation should throw a(n) ___ to cancel the operation and surface an error to the user.

<details>
<summary>Answer</summary>

**Answer:** `InvalidPluginExecutionException`

**Explanation:** Throwing `InvalidPluginExecutionException` is the standard way to cancel the current Dataverse operation and display an error message to the user from within a plug-in.

</details>

---

### Question 22 — Fill-in-the-Blank

In a plug-in, the `InputParameters` collection contains entity values presented to the plug-in ___ the operation executes, while `OutputParameters` is only available in the ___ stage.

<details>
<summary>Answer</summary>

**Answer:** prior to (before) / PostOperation

**Explanation:** `InputParameters` shows entity values before the operation is committed, allowing modification or cancellation. `OutputParameters` is only populated after the operation completes, making it available exclusively in the PostOperation stage.

</details>
