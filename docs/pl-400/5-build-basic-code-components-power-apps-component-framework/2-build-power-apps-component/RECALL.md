# Recall: Build and Deploy a Power Apps Code Component (PCF)

> **Source files:** 1-introduction.md, 2-package-code-component.md, 3-debug-code-component.md

---

## Keywords

| Term | Definition |
|------|-----------|
| Code Component | A custom Power Apps control built with TypeScript, CSS, and HTML using the PCF framework. |
| Power Apps Component Framework (PCF) | Microsoft framework enabling developers to build custom UI controls for model-driven and canvas apps. |
| ControlManifest.Input.xml | XML file defining a code component's properties, resources, and metadata. |
| `pac pcf init` | CLI command to scaffold a new PCF project with namespace, name, and template arguments. |
| `pac pcf push` | CLI command to push a built component directly to a Dataverse environment for testing. |
| `pac solution init` | CLI command to create a new Dataverse solution project with publisher name and prefix. |
| `npm run build` | Command that compiles the PCF project and generates typed manifest outputs in the `out/` folder. |
| `npm start` | Command that launches the Power Apps component test harness in a local browser. |
| Test Harness | Local browser utility (`npm start`) that renders a PCF component with configurable context and data inputs. |
| `notifyOutputChanged` | Callback function a component calls to signal the framework that bound/output property values have changed. |
| `updateView` | PCF lifecycle method called whenever the host app pushes new data or context changes into the component. |
| `getOutputs` | PCF lifecycle method that returns current output property values to the framework. |
| MSBuild | Microsoft build engine used to compile a Dataverse solution project into a deployable `.zip` file. |
| Publisher Prefix | Short identifier (e.g., `msl`) used to namespace solution components and avoid naming collisions. |

---

## Main Ideas

- Code components consist of three elements: a **manifest** (ControlManifest.Input.xml), an **implementation** (index.ts), and **resources** (CSS, images, etc.).
- The `pac pcf init` command requires `--namespace`, `--name`, and `--template` (e.g., `field`) arguments to scaffold the project.
- Run `npm install` after init to install build tools, then `npm run build` to compile; build outputs go to `out/controls/<ComponentName>/`.
- Build artifacts include `bundle.js`, the compiled `ControlManifest.xml`, and any CSS resources.
- A CSS filename mismatch between the manifest `<css path>` reference and the actual file is the most common build error.
- Two deployment options exist: **`pac pcf push`** (temporary dev solution, fast iteration) and **solution zip via MSBuild** (portable, pipeline-ready).
- `pac pcf push --publisher-prefix <prefix>` creates a `PowerAppsTools_<prefix>` solution automatically in the target environment.
- Solution packaging: `pac solution init` → `pac solution add-reference --path ..` → `msbuild /t:build /restore`.
- Default MSBuild package type is **Managed**; change `<SolutionPackageType>` in `.cdsproj` for Unmanaged or Both.
- The test harness supports **Context Inputs** (form factor, width/height) and **Data Inputs** (field values or CSV for dataset components).
- For dataset components, mock data can be loaded via a CSV file in the test harness.
- Browser DevTools (F12) support breakpoints in `index.ts` source files, console logging, and element inspection for PCF debugging.
- The `destroy()` method must remove event listeners added in `init()` to prevent memory leaks.
- `Component Framework` must be enabled in the Power Platform Admin Center for the target environment before pushing components.

---

## Mini Quiz

### Q1 — Single Choice

A developer runs `pac pcf init` and then immediately tries to build their component. The build fails because TypeScript types for the manifest properties are missing.

What command must be run before implementing component logic to generate the correct TypeScript types?

- A. `npm start`
- B. `pac pcf push`
- C. `npm run build`
- D. `pac solution init`

<details>
<summary>Answer</summary>

**Correct answer:** C. `npm run build`

**Explanation:** Running `npm run build` compiles the project and generates typed TypeScript interfaces from `ControlManifest.Input.xml` into the `generated/ManifestTypes` file, which is required before implementing component logic.

</details>

---

### Q2 — Fill-in-the-Blank

The PCF lifecycle method ___ is called by the framework whenever the host application sends updated data or context to the component.

<details>
<summary>Answer</summary>

**Answer:** `updateView`

**Explanation:** `updateView` is triggered each time a bound property value, container size, or other context changes in the host app, allowing the component to re-render accordingly.

</details>

---

### Q3 — Single Choice

A developer wants to quickly test a code component against a live Dataverse environment during development without creating a formal solution package.

Which CLI command should they use?

- A. `pac solution init`
- B. `pac pcf push --publisher-prefix msl`
- C. `msbuild /t:build /restore`
- D. `npm run build`

<details>
<summary>Answer</summary>

**Correct answer:** B. `pac pcf push --publisher-prefix msl`

**Explanation:** `pac pcf push` creates a temporary solution and imports the component directly into the connected Dataverse environment, making it ideal for rapid development iteration.

</details>

---

### Q4 — Fill-in-the-Blank

After initializing a solution project with `pac solution init`, you link the PCF component to it by running `pac solution add-reference --path ___`. Then you generate the solution zip using ___.

<details>
<summary>Answer</summary>

**Answer:** `..` (parent directory path), `msbuild /t:build /restore`

**Explanation:** `add-reference --path ..` points the solution project to the PCF component one directory up. MSBuild then compiles everything into a `.zip` in `bin\Debug` or `bin\Release`.

</details>

---

### Q5 — Single Choice

During test harness testing, a developer wants to verify how their dataset component renders with realistic records.

What is the correct way to provide mock data?

- A. Hard-code records directly in `index.ts` and rebuild.
- B. Load a CSV file through the Data Inputs panel in the test harness.
- C. Configure records in `ControlManifest.Input.xml`.
- D. Use the Context Inputs panel to set the Form Factor to Web.

<details>
<summary>Answer</summary>

**Correct answer:** B. Load a CSV file through the Data Inputs panel in the test harness.

**Explanation:** The test harness Data Inputs panel allows you to load a CSV file with mock records for dataset components, letting you verify rendering without deploying to a real environment.

</details>

---

### Q6 — Fill-in-the-Blank

To signal the framework that a bound output property value has changed, a code component calls the ___ callback that was passed into the `init` method.

<details>
<summary>Answer</summary>

**Answer:** `notifyOutputChanged`

**Explanation:** When the component updates an output property (e.g., after the user saves an edit), it calls `notifyOutputChanged()` so the framework knows to call `getOutputs()` to retrieve the new value.

</details>

---

### Q7 — Single Choice

A developer sets a breakpoint in `index.ts` inside the `buttonClick` method and opens the browser's developer tools.

Which DevTools panel is used to set and interact with code breakpoints?

- A. Elements
- B. Console
- C. Sources
- D. Network

<details>
<summary>Answer</summary>

**Correct answer:** C. Sources

**Explanation:** The Sources panel in browser DevTools allows developers to browse loaded scripts, set breakpoints, and step through code execution line by line.

</details>

---
