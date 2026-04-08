# Quiz: Extending Microsoft Power Platform

> **Source material:** 01-introduction.md, 02-extensibility.md, 03-service-extensibility.md, 04-exercise.md, 05-configure-code.md, 06-check.md, 07-summary.md
> **Total questions:** 25
> **Question types:** Multiple choice (single), Multiple choice (multi-select), Fill-in-the-blank

---

## Questions

### Question 1 — Single Choice

A developer wants to build a custom visual control that can be used interchangeably with out-of-the-box controls in both canvas and model-driven apps.

Which extensibility mechanism should the developer use?

- A. Client scripting
- B. Power Apps Component Framework (PCF) code component
- C. Dataverse plugin
- D. Custom API

<details>
<summary>Answer</summary>

**Correct answer:** B. Power Apps Component Framework (PCF) code component

**Explanation:** PCF code components are implemented using HTML, CSS, and TypeScript and can be used by canvas or model-driven apps just like any out-of-the-box control. Client scripting is not visual, and plugins/custom APIs operate on the server side.

</details>

---

### Question 2 — Single Choice

A developer needs to implement JavaScript business logic that runs when a user changes a column value on a model-driven app form.

Which form event should the client script respond to?

- A. Form load
- B. Form is saved
- C. Data in a column changes
- D. Command bar button press

<details>
<summary>Answer</summary>

**Correct answer:** C. Data in a column changes

**Explanation:** Client scripting in model-driven apps responds to three form events: form load, data in a column changes, and form is saved. A command bar button can also invoke a script but is configured separately, not a standard form event.

</details>

---

### Question 3 — Single Choice

A developer is implementing client scripting and wants to hide certain columns based on user input. The developer attempts to directly manipulate the form's HTML elements.

Why is this approach incorrect?

- A. JavaScript cannot run inside model-driven apps.
- B. Direct HTML manipulation is blocked by the browser's content security policy.
- C. Client scripting provides an object model for interacting with form components, and direct HTML manipulation is not allowed.
- D. The form is rendered server-side and cannot be accessed from JavaScript.

<details>
<summary>Answer</summary>

**Correct answer:** C. Client scripting provides an object model for interacting with form components, and direct HTML manipulation is not allowed.

**Explanation:** Even though the form is HTML, developers are not allowed to directly manipulate the form contents. Client scripting provides an object model with method calls to interact with form components, insulating business logic from layout or HTML changes.

</details>

---

### Question 4 — Single Choice

You are building a Power Apps Component Framework control that needs to access the device microphone to record audio.

What must you do in the component manifest to enable this capability?

- A. Call `Device.captureAudio()` directly in the `init` method.
- B. Add `Device.captureAudio` as a required feature in the manifest's `<feature-usage>` section.
- C. Register an event listener for audio capture in `updateView`.
- D. Import the audio capture library as an npm package.

<details>
<summary>Answer</summary>

**Correct answer:** B. Add `Device.captureAudio` as a required feature in the manifest's `<feature-usage>` section.

**Explanation:** The manifest allows you to enable features. When a feature is marked as required in the `<feature-usage>` section, the code component logic can use the native API associated with that feature, such as `Device.captureAudio`.

</details>

---

### Question 5 — Single Choice

A code component's `updateView` method is called by the app runtime.

When is this method invoked?

- A. Only when the hosting page first loads.
- B. When any value in the property bag has changed, including column values, datasets, and global values.
- C. Only when the user explicitly triggers a refresh action.
- D. When the component is removed from the DOM.

<details>
<summary>Answer</summary>

**Correct answer:** B. When any value in the property bag has changed, including column values, datasets, and global values.

**Explanation:** The `updateView` method is called when any value in the property bag has changed. This includes column values, datasets, global values such as container height and width, offline status, and component metadata values.

</details>

---

### Question 6 — Single Choice

A developer needs to interact with Dataverse data from within a plugin class.

Which API should the developer use, and why?

- A. Dataverse Web API, because it supports all programming languages.
- B. Organization Service, because it is instantiated and available without needing to authenticate inside a plugin.
- C. FetchXML directly, because it is the only query language supported in plugins.
- D. REST API, because plugins run in a .NET environment.

<details>
<summary>Answer</summary>

**Correct answer:** B. Organization Service, because it is instantiated and available without needing to authenticate inside a plugin.

**Explanation:** When using the Organization Service from a Dataverse plugin, the service is instantiated and available to the plugin code without the need to authenticate, making it the correct choice for plugin development.

</details>

---

### Question 7 — Single Choice

A business analyst reports that a record can be created in Dataverse by directly writing to the database, bypassing all custom plugins and business logic.

Is this statement accurate?

- A. Yes, database administrators can write directly to Dataverse tables.
- B. Yes, this is possible using the Bulk Delete feature.
- C. No, all data access is processed as a message through the event pipeline and custom logic always executes.
- D. No, but only Web API calls are guaranteed to trigger plugins.

<details>
<summary>Answer</summary>

**Correct answer:** C. No, all data access is processed as a message through the event pipeline and custom logic always executes.

**Explanation:** A key concept in Dataverse is that regardless of how data is accessed, it is always processed as a message through the event pipeline. There is no way to modify Dataverse data directly that would bypass running system or registered custom logic.

</details>

---

### Question 8 — Single Choice

A developer registers a plugin and wants it to execute before the main database operation so that the plugin can cancel the operation if certain conditions are not met.

Which pipeline stage should the plugin be registered on?

- A. Post-Operation
- B. Main Operation
- C. Pre-Validation
- D. Pre-Operation

<details>
<summary>Answer</summary>

**Correct answer:** D. Pre-Operation

**Explanation:** The Dataverse event pipeline stages are Pre-Validation, Pre-Operation, Main Operation, and Post-Operation. Registering a plugin on Pre-Operation allows it to run before the main database operation and cancel it if needed.

</details>

---

### Question 9 — Single Choice

A developer wants to create a reusable Dataverse operation called `findcustomer` that can be called from both the Web API and Power Automate flows.

Which extensibility mechanism is most appropriate?

- A. Workflow
- B. Power Automate cloud flow
- C. Custom API
- D. Client script

<details>
<summary>Answer</summary>

**Correct answer:** C. Custom API

**Explanation:** Custom APIs provide a code-first way to define new messages that extend Dataverse web services. These messages can be invoked like system messages from the Dataverse APIs, Power Apps, and Power Automate flows.

</details>

---

### Question 10 — Single Choice

A developer is defining a Custom API plugin and wants to register it for the pipeline stage.

On which stage can a plugin for a Custom API be registered?

- A. Pre-Validation
- B. Pre-Operation
- C. Main Operation
- D. Post-Operation

<details>
<summary>Answer</summary>

**Correct answer:** C. Main Operation

**Explanation:** Custom API implementation is the only scenario where a plugin can be registered on the Main Operation stage of the pipeline.

</details>

---

### Question 11 — Single Choice

A company wants to implement column-level security in Dataverse to restrict access to sensitive fields.

What is the recommended approach?

- A. Write a custom plugin to intercept read operations and blank out sensitive columns.
- B. Use the out-of-the-box column-level security feature in Dataverse that simply needs to be configured.
- C. Create a PCF control that hides the column from the form.
- D. Implement client scripting that hides sensitive columns based on the current user's role.

<details>
<summary>Answer</summary>

**Correct answer:** B. Use the out-of-the-box column-level security feature in Dataverse that simply needs to be configured.

**Explanation:** Column-level security in Dataverse is an out-of-the-box feature that simply needs to be configured. Developers should leverage what the platform already does well rather than building custom solutions.

</details>

---

### Question 12 — Single Choice

A business requires automation that accesses data from an external REST API when a Dataverse record is created.

Based on the comparison table, which mechanism is most appropriate?

- A. Workflow
- B. Power Automate Flow
- C. Plugin
- D. Business Rule

<details>
<summary>Answer</summary>

**Correct answer:** B. Power Automate Flow

**Explanation:** According to the capability comparison table, Power Automate Flows can access external data using connectors. Workflows cannot access external data, making Power Automate Flow the better choice for this scenario.

</details>

---

### Question 13 — Single Choice

A developer needs logic that must execute synchronously (blocking) and run both before and after a Dataverse operation.

Which mechanism supports synchronous execution at both Before and After stages?

- A. Power Automate Flow
- B. Workflow
- C. Plugin
- D. Business Rule

<details>
<summary>Answer</summary>

**Correct answer:** C. Plugin

**Explanation:** According to the capability comparison, Plugins can run either synchronously or asynchronously, and can execute at both Before and After stages. Power Automate Flows are asynchronous only, and Workflows can run either but support Before/After as well — however Plugins are the developer-managed option that best fits this scenario.

</details>

---

### Question 14 — Single Choice

A developer wants to use the Dataverse Organization Service from an Azure Function outside of any plugin context.

Which class should they use to connect to Dataverse?

- A. `IOrganizationServiceFactory`
- B. `IPluginExecutionContext`
- C. `ServiceClient`
- D. `OrganizationRequest`

<details>
<summary>Answer</summary>

**Correct answer:** C. `ServiceClient`

**Explanation:** The `ServiceClient` class implements the `IOrganizationService` interface and can be used outside of plugins, for example from an ASP.NET custom portal, an Azure Function, or a console application.

</details>

---

### Question 15 — Single Choice

During the Custom API lab exercise, the developer registers the plugin assembly using a specific tool.

Which command launches the Plugin Registration Tool?

- A. `pac plugin init`
- B. `pac tool prt`
- C. `pac auth create`
- D. `pac solution import`

<details>
<summary>Answer</summary>

**Correct answer:** B. `pac tool prt`

**Explanation:** The command `pac tool prt` is used to launch the Plugin Registration Tool from the command prompt, as described in Task 2 of the Custom API lab exercise.

</details>

---

### Question 16 — Multi-Select

A developer is evaluating when to use client scripting instead of Business Rules in a model-driven app. (Select **two**.)

- A. When business logic must be included in a Dataverse solution for deployment.
- B. When complex nested if/then/else logic is better achieved with a switch statement.
- C. When dynamic values, such as form notifications or filtered choice values, are needed.
- D. When the logic must be understood and maintained by non-developers.
- E. When the logic should run server-side without requiring a browser session.

<details>
<summary>Answer</summary>

**Correct answer:** B and C

**Explanation:** Client scripting is preferred over Business Rules when logic requires complex nested if/then/else expressions better written as switch statements, or when dynamic values like form notifications and filtering choice values are needed. Options A and D favor Business Rules, and E describes server-side logic like plugins.

</details>

---

### Question 17 — Multi-Select

A developer is implementing a PCF code component. Which methods are required by the `StandardControl` interface? (Select **three**.)

- A. `render`
- B. `init`
- C. `updateView`
- D. `getOutputs`
- E. `destroy`
- F. `onDataLoad`

<details>
<summary>Answer</summary>

**Correct answer:** B, C, and E

**Explanation:** The `StandardControl` interface requires implementing `init` (initialization), `updateView` (called when property bag values change), and `destroy` (cleanup). The `getOutputs` method is optional. `render` and `onDataLoad` are not part of this interface.

</details>

---

### Question 18 — Multi-Select

A developer is writing a Dataverse plugin and needs access to services via the `IServiceProvider`. Which services are available? (Select **three**.)

- A. `IPluginExecutionContext`
- B. `ITracingService`
- C. `IOrganizationServiceFactory`
- D. `IAuthenticationService`
- E. `IEventBusService`
- F. `IFormContext`

<details>
<summary>Answer</summary>

**Correct answer:** A, B, and C

**Explanation:** The `IServiceProvider` in a Dataverse plugin provides access to `IPluginExecutionContext` (message and requestor info), `ITracingService` (diagnostic trace logging), and `IOrganizationServiceFactory` (access to Dataverse data). The other options are not available through this interface.

</details>

---

### Question 19 — Multi-Select

A developer is comparing Power Pages with a custom ASP.NET portal for a client project. Which considerations favor choosing Power Pages? (Select **two**.)

- A. The project requires highly specialized and custom page layouts not achievable with templates.
- B. Standard functionality needs to be delivered quickly with minimal developer involvement.
- C. Makers can create and manage the site using no-code tooling.
- D. The solution requires highly skilled developers to implement proprietary authentication flows.
- E. The team needs full control over the server-side rendering pipeline.

<details>
<summary>Answer</summary>

**Correct answer:** B and C

**Explanation:** Power Pages provide numerous functionalities out of the box and enable makers to create robust websites. They are a good fit when standard functionality needs to be delivered quickly and makers can manage the site without code. Highly specialized scenarios or custom server-side requirements favor a custom ASP.NET portal.

</details>

---

### Question 20 — Fill-in-the-Blank

Power Apps Component Framework code components are implemented using HTML, CSS, and ___, while the app runtime manages the lifecycle by requiring the component class to implement the ___ interface.

<details>
<summary>Answer</summary>

**Answer:** TypeScript; StandardControl

**Explanation:** PCF code components are built with HTML, CSS, and TypeScript. The component class must implement the `StandardControl` interface, which defines the lifecycle methods (`init`, `updateView`, `destroy`) the runtime uses to interact with the component.

</details>

---

### Question 21 — Fill-in-the-Blank

In the Dataverse event pipeline, the only scenario where a plugin can be registered on the ___ stage is when implementing a ___.

<details>
<summary>Answer</summary>

**Answer:** Main Operation; Custom API

**Explanation:** Normally, plugins are registered on Pre-Validation, Pre-Operation, or Post-Operation. The Main Operation stage is reserved exclusively for Custom API plugin implementations.

</details>

---

### Question 22 — Fill-in-the-Blank

When writing a Dataverse plugin, you access the message being processed and information about the requestor through the ___ service, and you write diagnostic output using the ___ service.

<details>
<summary>Answer</summary>

**Answer:** IPluginExecutionContext; ITracingService

**Explanation:** `IPluginExecutionContext` provides access to the message being processed and requestor information. `ITracingService` allows the plugin to write diagnostic messages to the trace log.

</details>

---

### Question 23 — Fill-in-the-Blank

The Dataverse ___ API is available at an OData v4 RESTful endpoint and supports any programming language that can make HTTP requests authenticated with ___.

<details>
<summary>Answer</summary>

**Answer:** Web API; OAuth 2.0

**Explanation:** The Dataverse Web API is an OData v4 RESTful endpoint that supports any programming language capable of making HTTP requests, with authentication handled via OAuth 2.0.

</details>

---

### Question 24 — Fill-in-the-Blank

In the Custom API lab exercise, the command `pac plugin ___` is used to initialize a new Dataverse plugin class library, and the tool is opened using `pac tool ___`.

<details>
<summary>Answer</summary>

**Answer:** init; prt

**Explanation:** `pac plugin init` initializes a new Dataverse plugin class library project. `pac tool prt` launches the Plugin Registration Tool used to register the compiled plugin assembly.

</details>

---

### Question 25 — Single Choice

A developer is new to Power Platform and wants to add a feature that already exists in Dynamics 365 Sales, such as multi-currency invoice calculations.

What is the recommended approach?

- A. Build a custom calculation engine using a plugin to have full control.
- B. Use Power Automate to replicate the calculation logic using expressions.
- C. Consider using the built-in Dynamics 365 Sales capabilities rather than implementing a custom solution.
- D. Create a PCF control that embeds the calculation logic in the UI.

<details>
<summary>Answer</summary>

**Correct answer:** C. Consider using the built-in Dynamics 365 Sales capabilities rather than implementing a custom solution.

**Explanation:** Developers should learn what Power Platform can do out of the box. Invoice calculations using variable multi-currency price lists are complex but well-implemented in Dynamics 365 Sales — using those built-in capabilities is preferred over building a custom solution.

</details>
