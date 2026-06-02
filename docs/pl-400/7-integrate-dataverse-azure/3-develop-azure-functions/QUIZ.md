# Quiz: Develop Azure Functions

> **Source material:** 1-introduction.md, 2-azure-function-development-overview.md, 3-create-triggers-bindings.md, 4-connect-azure-services.md, 5-create-function-visual-studio-code.md, 6-knowledge-check.md, 7-summary.md
> **Total questions:** 22
> **Question types:** Multiple choice (single), Multiple choice (multi-select), Fill-in-the-blank

---

## Questions

### Question 1 — Single Choice

A developer is setting up a new Azure Functions project and wants to understand how functions are organized and deployed together. 

Which statement best describes a **function app**?

- A. A single function that runs independently with its own pricing plan
- B. A grouping of functions that share the same pricing plan, deployment method, and runtime version
- C. A configuration file that manages triggers and bindings for all functions
- D. A Visual Studio Code extension used to publish functions to Azure

<details>
<summary>Answer</summary>

**Correct answer:** B. A grouping of functions that share the same pricing plan, deployment method, and runtime version

**Explanation:** A function app is the unit of deployment and management. All functions in a function app share the same pricing plan, deployment method, and runtime version.

</details>

---

### Question 2 — Single Choice

You are developing Azure Functions in Functions runtime version 2.x. Your team wants to use both C# and JavaScript functions in the same function app.

What happens if you attempt this?

- A. It works because Functions 2.x supports multiple languages per app
- B. It fails because Functions 2.x requires all functions in an app to be authored in the same language
- C. It works only if you configure the `host.json` to allow mixed languages
- D. It fails because Functions 2.x does not support JavaScript

<details>
<summary>Answer</summary>

**Correct answer:** B. It fails because Functions 2.x requires all functions in an app to be authored in the same language

**Explanation:** In Functions 2.x, all functions in a function app must be authored in the same language. This restriction did not exist in previous versions of the Azure Functions runtime.

</details>

---

### Question 3 — Single Choice

You are developing Azure Functions locally and want to manage environment-specific settings. Where are app settings configured when running **locally**?

- A. `host.json`
- B. Application settings in the Azure portal
- C. `local.settings.json`
- D. `appsettings.json`

<details>
<summary>Answer</summary>

**Correct answer:** C. `local.settings.json`

**Explanation:** When developing locally, app settings are stored in `local.settings.json`. When deployed to Azure, these settings are managed as application settings in the Azure portal.

</details>

---

### Question 4 — Single Choice

A developer is preparing to commit a Functions project to a remote Git repository. The `local.settings.json` file contains database connection strings.

What should the developer do?

- A. Encrypt the file before committing
- B. Store it only in a private repository branch
- C. Never store `local.settings.json` in a remote repository
- D. Replace the connection strings with placeholder values before committing

<details>
<summary>Answer</summary>

**Correct answer:** C. Never store `local.settings.json` in a remote repository

**Explanation:** Because `local.settings.json` can contain secrets such as connection strings, Microsoft explicitly recommends never storing it in a remote repository.

</details>

---

### Question 5 — Single Choice

A function app is deployed to Azure and needs settings that were previously configured only in `local.settings.json`. What must be done to ensure the deployed function app works correctly?

- A. Upload `local.settings.json` directly to the Azure portal
- B. Add the required settings to the app settings of the deployed function app
- C. Modify `host.json` to include the local settings
- D. Enable the local development mode in the Azure portal

<details>
<summary>Answer</summary>

**Correct answer:** B. Add the required settings to the app settings of the deployed function app

**Explanation:** Settings in `local.settings.json` are used only when running locally. When publishing to Azure, any required settings must also be added to the function app's application settings.

</details>

---

### Question 6 — Single Choice

You need to understand what determines **when** an Azure Function is invoked.

Which component is responsible for this?

- A. Binding
- B. Output binding
- C. Trigger
- D. Connection string

<details>
<summary>Answer</summary>

**Correct answer:** C. Trigger

**Explanation:** A trigger defines how a function is invoked. A function must have exactly one trigger, and triggers have associated data that is often provided as the payload of the function.

</details>

---

### Question 7 — Single Choice

You are designing an Azure Function and want to declaratively connect it to an external resource so data flows into the function as a parameter.

Which type of binding should you use?

- A. Trigger binding
- B. Output binding
- C. Input binding
- D. Connection binding

<details>
<summary>Answer</summary>

**Correct answer:** C. Input binding

**Explanation:** An input binding declaratively connects another resource to a function, providing data to the function as parameters. Output bindings are used to send data out from the function.

</details>

---

### Question 8 — Single Choice

You are testing an Azure Function locally that uses Azure Queue Storage. You want to avoid connecting to remote Azure services during development.

Which tool should you use?

- A. Azure SDK Emulator
- B. Azure Functions Core Tools
- C. Azurite emulator
- D. Azure Storage Explorer

<details>
<summary>Answer</summary>

**Correct answer:** C. Azurite emulator

**Explanation:** The Azurite emulator can be used for storage-based triggers (Queue Storage, Blob Storage, and Table Storage) when testing functions locally without connecting to remote storage services.

</details>

---

### Question 9 — Single Choice

You need to manually trigger a non-HTTP Azure Function during local development for testing purposes.

What is the recommended approach?

- A. Use a scheduled timer trigger set to 1-minute intervals
- B. Use special administrator endpoints
- C. Convert the function to an HTTP trigger temporarily
- D. Deploy the function to Azure and trigger it from the portal

<details>
<summary>Answer</summary>

**Correct answer:** B. Use special administrator endpoints

**Explanation:** Non-HTTP trigger functions can be manually run using special administrator endpoints, as documented in the Azure Functions documentation for manually running non-HTTP-triggered functions.

</details>

---

### Question 10 — Single Choice

A team is using the **PowerShell** runtime for their Azure Functions. How are triggers and bindings configured in this model?

- A. Using PowerShell attributes on cmdlet parameters
- B. Using decorators in the script file
- C. In a `function.json` file
- D. In the `host.json` file

<details>
<summary>Answer</summary>

**Correct answer:** C. In a `function.json` file

**Explanation:** PowerShell uses `function.json` to configure triggers and bindings. This is also the case for Node.js v3 and Python v1, which are considered older or legacy programming models.

</details>

---

### Question 11 — Single Choice

You are reviewing a `function.json` file and see a binding with `"direction": "in"` and `"type": "httpTrigger"`. What does the `direction` property indicate for this entry?

- A. The function accepts only GET requests
- B. The binding is an input binding used to read data
- C. This entry is a trigger
- D. The function sends data out to an HTTP endpoint

<details>
<summary>Answer</summary>

**Correct answer:** C. This entry is a trigger

**Explanation:** Triggers always have a direction of `in`. While input bindings also use `in`, the presence of `"type": "httpTrigger"` confirms this is a trigger definition.

</details>

---

### Question 12 — Single Choice

You are configuring a Storage Queue output binding in `function.json`. The `connection` property is set to `"AzureWebJobsStorage"`.

What does this value represent?

- A. The actual connection string to the storage account
- B. The name of an app setting that holds the storage connection string
- C. The name of the queue to write messages to
- D. The Azure subscription ID for the storage account

<details>
<summary>Answer</summary>

**Correct answer:** B. The name of an app setting that holds the storage connection string

**Explanation:** For triggers and bindings that require a connection property, you set the application setting name, not the actual connection string. `AzureWebJobsStorage` is a common app setting name pointing to the underlying storage connection string.

</details>

---

### Question 13 — Single Choice

A developer wants to disable an Azure Function. They notice the `disabled` property in `function.json`.

What is the recommended approach for disabling a function?

- A. Set `"disabled": true` in `function.json`
- B. Delete the function's `function.json` file
- C. Use the app setting `AzureWebJobs.<FunctionName>.Disabled=true`
- D. Set `"enabled": false` in `host.json`

<details>
<summary>Answer</summary>

**Correct answer:** C. Use the app setting `AzureWebJobs.<FunctionName>.Disabled=true`

**Explanation:** Setting `disabled` in `function.json` is legacy behavior. The recommended approach is to use the app setting `AzureWebJobs.<FunctionName>.Disabled=true`.

</details>

---

### Question 14 — Single Choice

You are building an Azure Function using the **Node.js v4 programming model**. A colleague suggests editing `function.json` directly in the Azure portal to add a new binding.

What is the correct guidance?

- A. Edit `function.json` directly in the portal's Code + test tab
- B. Use the Integration tab in the portal to add bindings visually
- C. Configure bindings in code in your local project and republish; avoid editing function.json directly in the portal
- D. Switch to the Node.js v3 model if portal editing is required

<details>
<summary>Answer</summary>

**Correct answer:** C. Configure bindings in code in your local project and republish; avoid editing function.json directly in the portal

**Explanation:** In Node.js v4 (and Python v2), the runtime generates `function.json` from your code. You should make changes in code and republish rather than editing `function.json` directly in the portal.

</details>

---

### Question 15 — Single Choice

You are using an **isolated worker C#** Azure Function. The function uses an HTTP trigger and needs to write a message to Azure Queue Storage.

Which attribute is used on the output property to define the Queue Storage output binding?

- A. `[StorageOutput]`
- B. `[QueueOutput]`
- C. `[QueueBinding]`
- D. `[OutputBinding]`

<details>
<summary>Answer</summary>

**Correct answer:** B. `[QueueOutput]`

**Explanation:** In the C# isolated worker model, the `[QueueOutput]` attribute is applied to the output property (e.g., `public string[] Messages`) to define the Storage Queue output binding, specifying the queue name and connection setting.

</details>

---

### Question 16 — Single Choice

Your organization requires Azure Functions to connect to Azure services without storing secrets. The function app is hosted in the Azure Functions service.

Which identity type is used **by default** for identity-based connections?

- A. User-assigned managed identity
- B. Service principal
- C. System-assigned managed identity
- D. Developer identity

<details>
<summary>Answer</summary>

**Correct answer:** C. System-assigned managed identity

**Explanation:** When hosted in the Azure Functions service, identity-based connections use a managed identity. The system-assigned identity is used by default, although a user-assigned identity can be specified with the `credential` and `clientID` properties.

</details>

---

### Question 17 — Single Choice

When granting permissions to a managed identity used by Azure Functions to access an Azure service, what security principle should guide the permission assignment?

- A. Grant all available permissions to avoid future access errors
- B. Grant permissions only to the resource group, not the individual service
- C. Adhere to the principle of least privilege, granting only required permissions
- D. Use a shared access signature instead of role assignments

<details>
<summary>Answer</summary>

**Correct answer:** C. Adhere to the principle of least privilege, granting only required permissions

**Explanation:** Microsoft recommends adhering to the principle of least privilege when assigning permissions to an identity — granting only the permissions required for the intended actions, not all available permissions.

</details>

---

### Question 18 — Multi-Select

You are setting up a local Azure Functions development environment using Visual Studio Code to build a C# function targeting .NET 8. 

Which of the following prerequisites are required? (Select **three**.)

- A. Azure Functions Core Tools version 4.x
- B. Azure SDK for .NET
- C. Azure Functions extension for Visual Studio Code
- D. C# Dev Kit for Visual Studio Code
- E. Azure Storage Explorer
- F. PowerShell 7+

<details>
<summary>Answer</summary>

**Correct answer:** A. Azure Functions Core Tools version 4.x, C. Azure Functions extension for Visual Studio Code, D. C# Dev Kit for Visual Studio Code

**Explanation:** To create and run a C# Azure Function locally in VS Code targeting .NET 8, you need Azure Functions Core Tools (to run the runtime locally), the Azure Functions VS Code extension (for project scaffolding and deployment), and the C# Dev Kit extension (for C# language support).

</details>

---

### Question 19 — Multi-Select

You are reviewing the key characteristics of triggers and bindings in Azure Functions.

Which of the following statements are correct? (Select **two**.)

- A. A function can have more than one trigger
- B. Triggers and bindings help avoid hardcoding access to other services
- C. Bindings are required for every function
- D. A function can have multiple input and/or output bindings
- E. The trigger direction is always `out`

<details>
<summary>Answer</summary>

**Correct answer:** B. Triggers and bindings help avoid hardcoding access to other services, D. A function can have multiple input and/or output bindings

**Explanation:** Triggers and bindings decouple your function from direct service access. A function must have exactly one trigger (not more), bindings are optional, and a function can have multiple input and/or output bindings. Trigger direction is always `in`, not `out`.

</details>

---

### Question 20 — Multi-Select

A team is evaluating which languages use `function.json` for trigger and binding configuration (as opposed to code-first approaches).

Which of the following use `function.json` directly? (Select **three**.)

- A. C# class library (isolated worker)
- B. Node.js v3
- C. Python v2
- D. PowerShell
- E. Python v1
- F. Java

<details>
<summary>Answer</summary>

**Correct answer:** B. Node.js v3, D. PowerShell, E. Python v1

**Explanation:** Node.js v3, PowerShell, and Python v1 use `function.json` directly for trigger and binding configuration. Node.js v4 and Python v2 use code-first approaches where the runtime generates `function.json`. C# isolated worker and Java use attributes/annotations.

</details>

---

### Question 21 — Fill-in-the-Blank

In Azure Functions, the `host.json` metadata file contains configuration options that affect ___ functions in a function app instance. When deployed to Azure, additional configuration is managed using ___.

<details>
<summary>Answer</summary>

**Answer:** all; application settings

**Explanation:** `host.json` applies configuration options to all functions in the function app. When deployed to Azure, environment-specific settings are managed through application settings (not `local.settings.json`, which is only for local development).

</details>

---

### Question 22 — Fill-in-the-Blank

In the Python v2 programming model, trigger and binding configuration is defined using ___ in the function code. The runtime then generates the corresponding ___ file automatically.

<details>
<summary>Answer</summary>

**Answer:** decorators; function.json

**Explanation:** In the Python v2 programming model (and Node.js v4), bindings and triggers are defined in code — Python uses decorators, and Node.js v4 uses the `@azure/functions` package. The runtime automatically generates `function.json` from these definitions.

</details>

---
