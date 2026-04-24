# Quiz: Get Started with Power Apps Component Framework

> **Source material:** 1-introduction.md, 2-architecture.md, 3-tooling.md, 4-manifest.md, 5-demo.md, 6-check.md, 7-summary.md
> **Total questions:** 24
> **Question types:** Multiple choice (single), Multiple choice (multi-select), Fill-in-the-blank

---

## Questions

### Question 1 — Single Choice

A developer wants to replace a plain text box on a model-driven app form with a custom slider that enforces business rules based on other form data. Which type of Power Apps component framework component should they build?

- A. Dataset component
- B. Field component
- C. Canvas component
- D. Grid component

<details>
<summary>Answer</summary>

**Correct answer:** B. Field component

**Explanation:** A Field component is a custom control for a field on a form. It can render a slider instead of a simple text box and can include custom business logic that limits stops on the slider based on other data bound to the component.

</details>

---

### Question 2 — Single Choice

An app maker needs to display appointment data in a daily scheduler view with drag-and-drop rescheduling, instead of a standard grid. Which type of Power Apps component framework component is the best fit?

- A. Field component
- B. Form component
- C. Dataset component
- D. Web resource

<details>
<summary>Answer</summary>

**Correct answer:** C. Dataset component

**Explanation:** A Dataset component is a custom control to display rows of data. The example of a daily scheduler with drag-and-drop to reschedule appointments is the canonical use case described for dataset components.

</details>

---

### Question 3 — Single Choice

Before the Power Apps component framework existed, developers used a different technology to create custom presentations on app forms. What was that technology?

- A. Power Automate flows
- B. HTML web resources
- C. Canvas app screens
- D. Azure Functions

<details>
<summary>Answer</summary>

**Correct answer:** B. HTML web resources

**Explanation:** Before the Power Apps component framework, developers used HTML web resources to create a custom presentation for an app's form. The component framework provides a modernized, supported alternative.

</details>

---

### Question 4 — Multi-Select

A developer is evaluating the advantages of using Power Apps component framework over HTML web resources. Which **three** advantages does the component framework provide? (Select **three**.)

- A. Access to framework APIs for component lifecycle management, contextual data, and metadata
- B. Automatic generation of business process flows
- C. Support for client frameworks such as React and AngularJS
- D. Built-in AI Builder model training
- E. Ability to bundle all files into a single solution file with other app resources
- F. Automatic deployment to Azure

<details>
<summary>Answer</summary>

**Correct answers:** A, C, E

**Explanation:** The Power Apps component framework advantages include rich framework APIs, support for client frameworks like React and AngularJS, and the ability to bundle all files into a single solution file. The other options are not listed as framework advantages.

</details>

---

### Question 5 — Single Choice

A developer is reviewing the three key areas of a Power Apps component. Which of the following correctly identifies all three areas?

- A. Manifest, stylesheet, and database schema
- B. Manifest, implementation, and resource files
- C. Configuration, deployment package, and test harness
- D. TypeScript code, Power Automate flow, and canvas app

<details>
<summary>Answer</summary>

**Correct answer:** B. Manifest, implementation, and resource files

**Explanation:** A Power Apps component is composed of a manifest input file, its implementation (code implementing the StandardControl interface), and any additional resource files the component needs.

</details>

---

### Question 6 — Single Choice

A developer is writing the entry-point class for a new code component. Which interface must the class implement to allow the hosting app to interact with it?

- A. `ComponentFramework.ReactControl`
- B. `ComponentFramework.StandardControl`
- C. `ComponentFramework.DatasetControl`
- D. `ComponentFramework.LifecycleControl`

<details>
<summary>Answer</summary>

**Correct answer:** B. `ComponentFramework.StandardControl`

**Explanation:** All code components must implement the `ComponentFramework.StandardControl<IInputs, IOutputs>` interface, which provides a consistent contract for the hosting runtime to interact with the component.

</details>

---

### Question 7 — Single Choice

A developer needs to perform initialization tasks when a component is first loaded, such as starting a remote server call. Which lifecycle method should contain this logic?

- A. `updateView`
- B. `getOutputs`
- C. `destroy`
- D. `init`

<details>
<summary>Answer</summary>

**Correct answer:** D. `init`

**Explanation:** The `init` method is called to initialize the component instance. It is where remote server calls and other initialization actions should be started. Note that dataset values cannot be initialized here — use `updateView` for that.

</details>

---

### Question 8 — Single Choice

After the `init` method starts loading data from a remote server, the property bag values change before the data has loaded. Which lifecycle method is called to reflect these changes in the component UI?

- A. `init`
- B. `getOutputs`
- C. `updateView`
- D. `destroy`

<details>
<summary>Answer</summary>

**Correct answer:** C. `updateView`

**Explanation:** `updateView` is called whenever any value in the component's property bag changes. If data requests started in `init` have not finished, the component code must handle this state and provide a visual loading indicator.

</details>

---

### Question 9 — Single Choice

A component with a text input field allows users to type a value. When the user changes the value, the component needs to inform the hosting runtime before `getOutputs` is called to retrieve the updated value. Which method triggers this notification?

- A. `updateView`
- B. `notifyOutputChanged`
- C. `destroy`
- D. `init`

<details>
<summary>Answer</summary>

**Correct answer:** B. `notifyOutputChanged`

**Explanation:** When a component is interactive, it calls `notifyOutputChanged` to notify the host that new output values are available. The framework then calls `getOutputs` to retrieve the bound property values.

</details>

---

### Question 10 — Single Choice

A developer is removing a component from the page. Which lifecycle method should be used to clean up resources such as unmounting a React component?

- A. `init`
- B. `getOutputs`
- C. `updateView`
- D. `destroy`

<details>
<summary>Answer</summary>

**Correct answer:** D. `destroy`

**Explanation:** The `destroy` method is invoked when the component is removed from the DOM tree. It should be used to clean up and release any memory the component uses. For React components, `ReactDOM.unmountComponentAtNode` is called inside `destroy`.

</details>

---

### Question 11 — Single Choice

A developer wants to scaffold a new field component project named "Slider" under the namespace "Contoso". Which Power Platform CLI command initializes this project?

- A. `pac pcf create --namespace Contoso --name Slider --type field`
- B. `pac pcf init --namespace Contoso --name Slider --template field`
- C. `pac solution init --publisher-name Contoso --name Slider --template field`
- D. `npm init --namespace Contoso --name Slider --template field`

<details>
<summary>Answer</summary>

**Correct answer:** B. `pac pcf init --namespace Contoso --name Slider --template field`

**Explanation:** The `pac pcf init` command scaffolds the initial project files. The `--namespace`, `--name`, and `--template` flags specify the component's namespace, name, and template type respectively.

</details>

---

### Question 12 — Single Choice

A developer wants to test a code component locally without deploying it to a Dataverse environment. Which command launches the local test harness?

- A. `npm run build`
- B. `pac pcf push --publisher-prefix dev`
- C. `npm start`
- D. `msbuild /t:build /restore`

<details>
<summary>Answer</summary>

**Correct answer:** C. `npm start`

**Explanation:** Running `npm start` launches the test harness, which lets developers validate and troubleshoot component behavior locally without deploying to a Dataverse environment.

</details>

---

### Question 13 — Single Choice

After making iterative changes to a component, a developer wants the local test harness to automatically pick up each code change without manually restarting. Which command enables this behavior?

- A. `npm run build`
- B. `npm start watch`
- C. `pac pcf push --watch`
- D. `npm install --watch`

<details>
<summary>Answer</summary>

**Correct answer:** B. `npm start watch`

**Explanation:** Running `npm start watch` enables watch mode, so the test harness automatically picks up code changes as they are saved, without needing to restart the harness manually.

</details>

---

### Question 14 — Single Choice

A developer has finished implementing a component and wants to deploy it directly to their configured Dataverse development environment. Which command should they run?

- A. `npm run build`
- B. `msbuild /t:deploy`
- C. `pac pcf push --publisher-prefix dev`
- D. `pac solution import`

<details>
<summary>Answer</summary>

**Correct answer:** C. `pac pcf push --publisher-prefix dev`

**Explanation:** The `pac pcf push` command builds and pushes the latest version of the code component to the configured Dataverse development environment using the specified publisher prefix.

</details>

---

### Question 15 — Multi-Select

A team needs to package a code component as part of a Dataverse solution for deployment. Which **two** tools are required for this packaging step? (Select **two**.)

- A. Power Platform CLI
- B. Azure DevOps Pipelines
- C. Visual Studio msbuild
- D. npm webpack
- E. Power BI Desktop

<details>
<summary>Answer</summary>

**Correct answers:** A, C

**Explanation:** Creating a Dataverse solution file and packaging the component requires both the Power Platform CLI (for solution initialization and reference management) and Visual Studio msbuild (for building the solution package).

</details>

---

### Question 16 — Single Choice

Which file in a code component project is used to define the component's properties, resources, and framework feature declarations?

- A. `index.ts`
- B. `package.json`
- C. `ControlManifest.Input.xml`
- D. `ComponentDefinition.json`

<details>
<summary>Answer</summary>

**Correct answer:** C. `ControlManifest.Input.xml`

**Explanation:** The `ControlManifest.Input.xml` file is the component manifest. It is initialized by `pac pcf init` and must be customized to specify properties, resources, and framework features the component uses.

</details>

---

### Question 17 — Single Choice

A component property must receive its value from a table data column in a model-driven app. Which `usage` attribute value should be set for this property in the manifest?

- A. `input`
- B. `output`
- C. `bound`
- D. `required`

<details>
<summary>Answer</summary>

**Correct answer:** C. `bound`

**Explanation:** A property with `usage="bound"` expects to be bound to a table data column in the hosting model-driven app. `input` and `output` are other valid usage values but do not imply a column binding.

</details>

---

### Question 18 — Single Choice

A developer has published a code component and now wants to add a new required property to support a new feature. What risk must the developer consider before making this change?

- A. Required properties cannot be added to components that implement StandardControl.
- B. Adding a required property is a breaking change that can affect existing consuming apps.
- C. The manifest does not support required properties; use optional properties only.
- D. Required properties are only supported for dataset components.

<details>
<summary>Answer</summary>

**Correct answer:** B. Adding a required property is a breaking change that can affect existing consuming apps.

**Explanation:** The manifest best practices state that developers should consider the impact on existing apps when adding required properties to already-published components, as this can break apps that consume the component.

</details>

---

### Question 19 — Single Choice

A developer needs to enable the WebAPI feature so a component can make Dataverse Web API calls. Where must this be declared?

- A. In the `index.ts` file under the `init` method
- B. In the `package.json` dependencies section
- C. In the `ControlManifest.Input.xml` under `<feature-usage>`
- D. In the `tsconfig.json` compiler options

<details>
<summary>Answer</summary>

**Correct answer:** C. In the `ControlManifest.Input.xml` under `<feature-usage>`

**Explanation:** Framework device, utility, and WebAPI features must be declared in the manifest's `<feature-usage>` node before they can be used. These features are only available for components used in model-driven apps.

</details>

---

### Question 20 — Multi-Select

A developer is adding localization support to a component. Which **two** things must be done in the manifest to support localized display names and descriptions for properties? (Select **two**.)

- A. Set the `display-name-key` and `description-key` attributes on each property
- B. Register the component with Microsoft Translation Services
- C. Include `<resx>` entries for each locale's `.resx` file in the resources node
- D. Set `required="false"` on all localized properties
- E. Add a `<culture>` node to the manifest root

<details>
<summary>Answer</summary>

**Correct answers:** A, C

**Explanation:** To support localization, each property must use `display-name-key` and `description-key` attributes that reference keys in `.resx` files. The `.resx` files for each supported locale must also be declared using `<resx>` elements in the manifest resources node.

</details>

---

### Question 21 — Single Choice

Which of the following is NOT a valid template type when initializing a Power Apps code component using `pac pcf init`?

- A. Field
- B. Dataset
- C. Unbound
- D. Both Field and Dataset are valid; Unbound is not

<details>
<summary>Answer</summary>

**Correct answer:** D. Both Field and Dataset are valid; Unbound is not

**Explanation:** The two valid template types for `pac pcf init` are `field` and `dataset`. "Unbound" is not a valid template type for Power Apps component framework components.

</details>

---

### Question 22 — Fill-in-the-Blank

The Power Platform Creator Kit is a collection of commonly used Power Apps component framework controls. All of the components in the Creator Kit use the ___ framework to provide a consistent look and feel.

<details>
<summary>Answer</summary>

**Answer:** Fluent UI

**Explanation:** The Power Platform Creator Kit components use the Fluent UI framework to provide consistency across all included controls.

</details>

---

### Question 23 — Fill-in-the-Blank

When a code component's business rule rejects new output from `notifyOutputChanged`, the framework calls ___ on the component with the ___ value and an error message.

<details>
<summary>Answer</summary>

**Answer:** `updateView`; old (previous)

**Explanation:** If the host determines the new output is invalid (e.g., a business rule rejects it), the runtime calls `updateView` with the old value and an error message rather than accepting the new output.

</details>

---

### Question 24 — Fill-in-the-Blank

To initialize a Dataverse solution and then add a code component reference to it, a developer first runs `pac solution init`, and then runs `pac solution ___` to link the component project.

<details>
<summary>Answer</summary>

**Answer:** `add-reference`

**Explanation:** After creating a solution with `pac solution init`, the developer uses `pac solution add-reference --path <path to component project>` to link the code component into the solution before building with msbuild.

</details>
