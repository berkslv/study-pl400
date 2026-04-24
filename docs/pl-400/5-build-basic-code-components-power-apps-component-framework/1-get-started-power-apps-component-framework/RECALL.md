# Recall: Get Started with Power Apps Component Framework

> **Source files:** 1-introduction.md, 2-architecture.md, 3-tooling.md, 4-manifest.md, 5-demo.md

---

## Keywords

| Term | Definition |
|------|-----------|
| Power Apps component framework (PCF) | Microsoft framework for building reusable, custom code components for Power Apps and Power Pages. |
| Code component | A reusable visual control with optional business logic built using HTML, CSS, and TypeScript. |
| Field component | A code component type replacing a standard form field with a custom control. |
| Dataset component | A code component type that renders rows of data in a custom layout. |
| StandardControl interface | TypeScript interface that all code components must implement to interact with the hosting runtime. |
| ControlManifest.Input.xml | XML file that declares a component's properties, resources, and required framework features. |
| `pac pcf init` | Power Platform CLI command to scaffold a new code component project from a template. |
| `pac pcf push` | CLI command to build and push the latest component version to a Dataverse development environment. |
| Test harness | Local browser-based tool launched via `npm start` for testing a component without deploying. |
| `feature-usage` | Manifest node that declares required framework features (e.g., WebAPI) before use. |
| Creator Kit | A Microsoft-provided collection of ready-to-use PCF controls built on Fluent UI. |
| `notifyOutputChanged` | Runtime method a component calls to signal that its bound output values have changed. |

---

## Main Ideas

- Code components consist of three parts: a **manifest** (`ControlManifest.Input.xml`), an **implementation** (TypeScript class implementing `StandardControl`), and optional **resource files** (CSS, resx, images).
- The two component types are **Field** (replaces a single form field) and **Dataset** (displays rows of data).
- The `StandardControl` lifecycle methods are: `init` (required), `updateView` (required), `getOutputs` (optional), and `destroy` (required).
- `init` cannot initialize dataset values; use `updateView` for that instead.
- `destroy` must clean up memory; for React components, call `ReactDOM.unmountComponentAtNode` here.
- The lifecycle flow: `init` → component calls `notifyOutputChanged` → runtime calls `getOutputs` → if valid, `updateView`; if invalid, `updateView` with old value and error message.
- Properties have four key attributes: `of-type` (data type), `usage` (`input`, `output`, or `bound`), `required`, and `default-value` (input only, model-driven apps).
- Renaming or removing manifest properties after publishing are **breaking changes** for consuming apps.
- Framework features (WebAPI, camera, location, etc.) must be declared in `<feature-usage>` in the manifest; only available in model-driven apps.
- Localized strings use `.resx` files; `display-name-key` and `description-key` in property definitions reference keys in those files.
- CLI workflow: `pac pcf init` → `npm install` → `npm run build` → `npm start` (test) → `pac pcf push` → `msbuild` (solution) → deploy.
- The Power Platform CLI also supports `pac solution init` and `pac solution add-reference` to create and package Dataverse solution files.

---

## Mini Quiz

### Q1 — Single Choice

A developer wants to replace a numeric text field on a model-driven app form with a custom slider control that enforces business rules. Which component type should they create?

- A. Dataset
- B. Field
- C. Page
- D. Canvas

<details>
<summary>Answer</summary>

**Correct answer:** B. Field

**Explanation:** A Field component replaces a single form field with a custom control. The slider example with bound business logic is the canonical use case described in the source material.

</details>

---

### Q2 — Fill-in-the-Blank

All code components must implement the `___` interface, which provides a consistent way for the hosting application to interact with the component.

<details>
<summary>Answer</summary>

**Answer:** StandardControl

**Explanation:** The source states: "Your code component accomplishes this by implementing the **StandardControl** interface."

</details>

---

### Q3 — Single Choice

During the component lifecycle, when is `updateView` called with the **old** value and an error message?

- A. When `init` fails to complete remote server calls
- B. When the host application first loads the component
- C. When a business rule rejects the new output from `getOutputs`
- D. When `destroy` is called before the component finishes rendering

<details>
<summary>Answer</summary>

**Correct answer:** C. When a business rule rejects the new output from `getOutputs`

**Explanation:** The lifecycle flow specifies that if the host validates the output and finds it invalid (e.g., a business rule rejected it), `updateView` is called with the old value and an error message.

</details>

---

### Q4 — Fill-in-the-Blank

To scaffold a new field component named `Slider` in the `Contoso` namespace, the CLI command is: `pac pcf init --namespace Contoso --name Slider --template ___`.

<details>
<summary>Answer</summary>

**Answer:** field

**Explanation:** The `--template` parameter accepts `field` or `dataset` to match the two component types.

</details>

---

### Q5 — Single Choice

A developer needs to use the WebAPI feature inside a code component. What must they do before the feature is available at runtime?

- A. Call `notifyOutputChanged` with a WebAPI flag
- B. Declare the feature in the `<feature-usage>` node of the manifest
- C. Import the WebAPI module in the TypeScript implementation file
- D. Set `required="true"` on a property with `of-type="WebAPI"`

<details>
<summary>Answer</summary>

**Correct answer:** B. Declare the feature in the `<feature-usage>` node of the manifest

**Explanation:** The manifest unit states: "Framework device, utility, and WebAPI features must be declared in the manifest before use" using the `<feature-usage>` / `<uses-feature>` XML elements.

</details>

---

### Q6 — Fill-in-the-Blank

A property with `usage="___"` is expected to be bound to a table data column in a model-driven app.

<details>
<summary>Answer</summary>

**Answer:** bound

**Explanation:** The manifest documentation lists three usage values — `input`, `output`, and `bound` — and specifies that `bound` expects a table data column.

</details>

---

### Q7 — Single Choice

Which CLI command builds the component and immediately deploys it to your configured Dataverse development environment?

- A. `npm run build`
- B. `pac pcf init --run-npm-install`
- C. `pac pcf push --publisher-prefix dev`
- D. `msbuild /t:build /restore`

<details>
<summary>Answer</summary>

**Correct answer:** C. `pac pcf push --publisher-prefix dev`

**Explanation:** `pac pcf push` builds and pushes the latest version of the code component to the configured Dataverse environment; `msbuild` is used for packaging a full solution file.

</details>

---
