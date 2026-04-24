# Quiz: Build, Package, and Debug a Power Apps Code Component (PCF)

> **Source material:** 1-introduction.md, 2-package-code-component.md, 3-debug-code-component.md, 4-check.md, 5-summary.md
> **Total questions:** 24
> **Question types:** Multiple choice (single), Multiple choice (multi-select), Fill-in-the-Blank

---

## Questions

### Question 1 — Single Choice

A developer wants to start a new Power Apps code component project using the Power Platform CLI. They have created a directory called `editable-pcf` and navigated into it.

Which CLI command should they run to initialize the project as a field-type component?

- A. `pac pcf new --namespace SampleNamespace --name EditablePCF --template field`
- B. `pac pcf init --namespace SampleNamespace --name EditablePCF --template field`
- C. `npm init --namespace SampleNamespace --name EditablePCF --template field`
- D. `pac solution init --namespace SampleNamespace --name EditablePCF --template field`

<details>
<summary>Answer</summary>

**Correct answer:** B. `pac pcf init --namespace SampleNamespace --name EditablePCF --template field`

**Explanation:** The `pac pcf init` command is used to initialize a new code component project. It requires `--namespace`, `--name`, and `--template` parameters. `pac pcf new` and `pac solution init` are not valid commands for this purpose.

</details>

---

### Question 2 — Single Choice

After initializing a PCF project, a developer runs `npm install` but receives errors. They want to verify that Node.js and npm are installed correctly before proceeding.

Which commands should they run to verify the installations?

- A. `node check` and `npm check`
- B. `node test` and `npm test`
- C. `Node --version` and `npm --version`
- D. `node --install` and `npm --install`

<details>
<summary>Answer</summary>

**Correct answer:** C. `Node --version` and `npm --version`

**Explanation:** Running `Node --version` and `npm --version` in a command prompt returns the installed version numbers, confirming both are installed correctly. If either command returns an error, Node.js needs to be installed.

</details>

---

### Question 3 — Single Choice

A developer has built a PCF component and wants to test it locally before deploying it to a Dataverse environment. They want to launch the component in the Power Apps component test harness.

Which command starts the local test harness?

- A. `npm run test`
- B. `npm run build`
- C. `pac pcf preview`
- D. `npm start`

<details>
<summary>Answer</summary>

**Correct answer:** D. `npm start`

**Explanation:** The `npm start` command launches the Power Apps component test harness in a browser window, allowing you to test the component locally with different inputs. `npm run build` compiles the component but does not launch the test harness.

</details>

---

### Question 4 — Single Choice

A developer is configuring the `ControlManifest.Input.xml` file for their PCF component. They need to add a reference to a CSS file named `EditablePCF.css` located in a `css` subfolder.

Which XML snippet should they add inside the `resources` node?

- A. `<style path="css/EditablePCF.css" order="1" />`
- B. `<css path="css/EditablePCF.css" order="1" />`
- C. `<resource path="css/EditablePCF.css" type="css" />`
- D. `<link href="css/EditablePCF.css" />`

<details>
<summary>Answer</summary>

**Correct answer:** B. `<css path="css/EditablePCF.css" order="1" />`

**Explanation:** The correct XML element to reference a CSS file in the manifest's `resources` node is `<css path="..." order="..." />`. The `path` attribute must exactly match the actual CSS file name and folder — a mismatch is a common cause of build errors.

</details>

---

### Question 5 — Single Choice

After running `npm run build`, a developer inspects the output directory. They want to understand what build artifacts are produced.

Which of the following files is compiled into the `out/controls/EditablePCF` directory and uploaded to the Microsoft Dataverse organization?

- A. `index.ts`
- B. `ControlManifest.Input.xml`
- C. `ControlManifest.xml`
- D. `EditablePCF.css`

<details>
<summary>Answer</summary>

**Correct answer:** C. `ControlManifest.xml`

**Explanation:** The build compiles the source into the `out/controls/EditablePCF` directory, producing a `css` folder, `bundle.js` (bundled source code), and `ControlManifest.xml`. The `ControlManifest.xml` (not `.Input.xml`) is the actual manifest file that gets uploaded to Dataverse.

</details>

---

### Question 6 — Single Choice

A developer wants to quickly push a code component directly to a Dataverse environment for testing purposes during development. They do not need to create a transportable solution file.

Which CLI command should they run?

- A. `pac solution import --publisher-prefix msl`
- B. `pac pcf push --publisher-prefix msl`
- C. `pac pcf deploy --environment dev`
- D. `msbuild /t:build /restore`

<details>
<summary>Answer</summary>

**Correct answer:** B. `pac pcf push --publisher-prefix msl`

**Explanation:** The `pac pcf push --publisher-prefix msl` command creates a temporary solution called `PowerAppsTools_msl` and pushes the component directly to the authenticated Dataverse environment. This is the recommended approach during development and testing.

</details>

---

### Question 7 — Single Choice

A team needs to transport a PCF component to a production environment using a build pipeline. They need to create a proper solution ZIP file rather than using the CLI push command.

Which build engine is used to generate the solution package ZIP file?

- A. npm
- B. Node.js
- C. webpack
- D. MSBuild

<details>
<summary>Answer</summary>

**Correct answer:** D. MSBuild

**Explanation:** MSBuild (Microsoft Build Engine) is used to generate the solution ZIP file from a Dataverse solution project. It requires either Visual Studio or the Visual Studio Build Tools to be installed. npm is used for building the PCF component code itself, not the solution package.

</details>

---

### Question 8 — Single Choice

A developer is packaging their PCF component into a Dataverse solution and runs the MSBuild command for the first time. The build fails because references are not restored.

Which flag must be included the first time MSBuild is run to restore references?

- A. `/p:configuration=Release`
- B. `/t:restore`
- C. `/restore`
- D. `/t:build`

<details>
<summary>Answer</summary>

**Correct answer:** C. `/restore`

**Explanation:** The `/restore` flag must be included when running MSBuild for the first time on a solution project to restore package references. In subsequent builds, only `msbuild /t:build` is needed. The `/p:configuration=Release` flag is used to produce a release build instead of a debug build.

</details>

---

### Question 9 — Single Choice

A developer has built a solution package using MSBuild with the default configuration. They want to know where the output ZIP file is located.

Where is the solution ZIP file generated by default?

- A. `Solution\out\`
- B. `Solution\bin\Release\`
- C. `Solution\bin\Debug\`
- D. `Solution\dist\`

<details>
<summary>Answer</summary>

**Correct answer:** C. `Solution\bin\Debug\`

**Explanation:** By default, MSBuild produces a debug build and outputs the solution ZIP to the `Solution\bin\Debug\` directory. To generate a release build to `bin\Release\`, you must specify `msbuild /p:configuration=Release`.

</details>

---

### Question 10 — Single Choice

A developer wants to change a solution package from Managed to Unmanaged before building. They need to edit the solution's project configuration file.

Which XML node in the `.cdsproj` file controls the package type?

- A. `<PackageType>`
- B. `<SolutionType>`
- C. `<SolutionPackageType>`
- D. `<DeploymentType>`

<details>
<summary>Answer</summary>

**Correct answer:** C. `<SolutionPackageType>`

**Explanation:** The `<SolutionPackageType>` node inside a `<PropertyGroup>` element in the `.cdsproj` file controls whether the solution is packaged as `Managed`, `Unmanaged`, or `Both`. The default value is Managed.

</details>

---

### Question 11 — Single Choice

A developer is testing a dataset PCF component in the test harness and wants to provide mock data with sample contact records.

What file format must be used to load mock data into the Power Apps Component Test Harness for a dataset component?

- A. JSON
- B. XML
- C. CSV
- D. PDF

<details>
<summary>Answer</summary>

**Correct answer:** C. CSV

**Explanation:** The Power Apps component test harness supports loading mock data in CSV format for dataset components. The CSV file can be exported from a target environment or manually created. JSON, XML, and PDF are not supported for this purpose.

</details>

---

### Question 12 — Single Choice

During development, a developer wants to automatically reload the test harness whenever they make changes to their component's source files, without manually restarting the harness each time.

Which command enables this watch mode behavior?

- A. `npm start --watch`
- B. `npm run watch`
- C. `npm start watch`
- D. `pac pcf watch`

<details>
<summary>Answer</summary>

**Correct answer:** C. `npm start watch`

**Explanation:** Running `npm start watch` enables watch mode, which automatically reloads the test harness when changes are made to `index.ts`, `ControlManifest.Input.xml`, imported libraries, or manifest resources. This avoids the need to manually restart the test harness after every change.

</details>

---

### Question 13 — Single Choice

A developer is using browser DevTools to debug their PCF component and wants to pause execution at a specific line in their `index.ts` file to inspect variable values.

Which DevTools panel allows a developer to set debugger breakpoints in component source code?

- A. Elements panel
- B. Console panel
- C. Network panel
- D. Sources panel

<details>
<summary>Answer</summary>

**Correct answer:** D. Sources panel

**Explanation:** The Sources panel in browser DevTools allows developers to set breakpoints in TypeScript/JavaScript source files. When a breakpoint is hit, execution pauses and the developer can inspect variable values and step through the code logic interactively.

</details>

---

### Question 14 — Single Choice

A developer wants to inspect the HTML rendered by their PCF component to verify that DOM elements are being created correctly in the test harness.

Which DevTools panel provides a view of the rendered HTML and allows selecting elements for inspection?

- A. Sources panel
- B. Console panel
- C. Elements panel
- D. Application panel

<details>
<summary>Answer</summary>

**Correct answer:** C. Elements panel

**Explanation:** The Elements panel in browser DevTools shows the rendered HTML of the page. Developers can use the "Select an element to inspect" icon, right-click and choose Inspect, or directly click elements in the Elements panel to navigate to specific parts of the component's DOM.

</details>

---

### Question 15 — Single Choice

A PCF component developer adds `console.log()` calls in their `index.ts` file to trace logic at runtime. They want to view this output while testing in the browser.

Where are `console.log()` messages displayed in browser DevTools?

- A. Elements panel
- B. Sources panel
- C. Network panel
- D. Console panel

<details>
<summary>Answer</summary>

**Correct answer:** D. Console panel

**Explanation:** The Console panel in browser DevTools displays all `console.log()` output from the running component. Developers can also run ad-hoc JavaScript from within the Console panel to test method calls in the live environment context.

</details>

---

### Question 16 — Single Choice

A developer initialized their PCF component project using the command `pac pcf init --namespace SampleNamespace --name EditablePCF --template field`. After running `npm run build`, the build fails with a file-not-found error related to the CSS resource.

What is the most common cause of this build failure?

- A. The `npm install` command was not run before building.
- B. The CSS file name in the manifest does not match the actual CSS file name.
- C. The `ControlManifest.Input.xml` version number is incorrect.
- D. The publisher prefix was not set in the manifest.

<details>
<summary>Answer</summary>

**Correct answer:** B. The CSS file name in the manifest does not match the actual CSS file name.

**Explanation:** A mismatch between the `path` attribute in the `<css>` resource reference in `ControlManifest.Input.xml` and the actual CSS file name is the most common cause of build errors. The file names must match exactly, including casing.

</details>

---

### Question 17 — Single Choice

Before pushing a PCF component to a Dataverse environment using `pac pcf push`, a developer must complete a prerequisite setup step in Visual Studio Code.

What must be configured in VS Code before running the push command?

- A. A solution project must be initialized with `pac solution init`.
- B. An Auth Profile must be added via the Power Platform tab in VS Code.
- C. The component must be exported as a ZIP file first.
- D. The publisher must be registered in the Power Platform Admin Center.

<details>
<summary>Answer</summary>

**Correct answer:** B. An Auth Profile must be added via the Power Platform tab in VS Code.

**Explanation:** Before pushing a component, developers must add an Auth Profile in VS Code using the Power Platform tab, sign in to their account, and select the target Dataverse environment. The push command uses this authenticated connection to deploy the component.

</details>

---

### Question 18 — Multi-Select

A developer is reviewing the three required elements that make up a Power Apps code component (PCF).

Which **three** elements does a code component consist of? (Select **three**.)

- A. Manifest
- B. Solution package
- C. Implementation
- D. Publisher
- E. Resources

<details>
<summary>Answer</summary>

**Correct answer:** A. Manifest, C. Implementation, E. Resources

**Explanation:** A code component consists of three elements: a **manifest** (ControlManifest.Input.xml that describes the component), an **implementation** (typically index.ts containing the component logic), and **resources** (CSS, images, and other supporting files). Solution packages and publishers are deployment concepts, not component structure elements.

</details>

---

### Question 19 — Multi-Select

A developer wants to configure watch mode for their PCF component so the test harness automatically reloads on file changes.

Which **three** of the following file types are tracked by watch mode? (Select **three**.)

- A. `index.ts`
- B. `solution.cdsproj`
- C. `ControlManifest.Input.xml`
- D. `package.json`
- E. All resources listed in the manifest file

<details>
<summary>Answer</summary>

**Correct answer:** A. `index.ts`, C. `ControlManifest.Input.xml`, E. All resources listed in the manifest file

**Explanation:** Watch mode (`npm start watch`) automatically tracks changes to `index.ts`, `ControlManifest.Input.xml`, libraries imported in `index.ts`, and all resources listed in the manifest file. Changes to `solution.cdsproj` or `package.json` do not trigger a reload.

</details>

---

### Question 20 — Multi-Select

A developer must set up their development machine before they can start building PCF code components.

Which **three** tools are required to be installed before initializing a PCF project? (Select **three**.)

- A. Node.js (with npm)
- B. .NET Framework SDK
- C. Visual Studio Code
- D. Power Platform CLI
- E. SQL Server Management Studio

<details>
<summary>Answer</summary>

**Correct answer:** A. Node.js (with npm), C. Visual Studio Code, D. Power Platform CLI

**Explanation:** To build PCF components, you need Node.js (which includes npm for running build commands), Visual Studio Code (as the IDE), and the Power Platform CLI (for `pac pcf init` and related commands). .NET Framework SDK is not required for PCF development; MSBuild (from Visual Studio Build Tools) is needed only for solution packaging.

</details>

---

### Question 21 — Multi-Select

A developer needs to connect a PCF component to the host application so that changes made in the component are reflected back in the app.

Which **two** PCF lifecycle methods are responsible for receiving data from the host app and sending changes back to it? (Select **two**.)

- A. `init`
- B. `updateView`
- C. `destroy`
- D. `getOutputs`
- E. `buttonClick`

<details>
<summary>Answer</summary>

**Correct answer:** B. `updateView`, D. `getOutputs`

**Explanation:** The `updateView` method is called by the framework whenever property values change in the host app, allowing the component to receive and reflect updated data. The `getOutputs` method is called by the framework to retrieve any output values the component wants to push back to the host app. `init` is for initialization, `destroy` is for cleanup, and `buttonClick` is a custom event handler, not a PCF lifecycle method.

</details>

---

### Question 22 — Fill-in-the-Blank

After building a solution project, the default output location for the solution ZIP file is `Solution\bin\___`. To produce a release version instead of a debug version, you must pass `msbuild /p:configuration=___`.

<details>
<summary>Answer</summary>

**Answer:** `Debug`; `Release`

**Explanation:** By default, MSBuild targets a debug configuration and writes output to `Solution\bin\Debug\`. Specifying `/p:configuration=Release` switches to a release build and outputs the ZIP to `Solution\bin\Release\`.

</details>

---

### Question 23 — Fill-in-the-Blank

To initialize a Dataverse solution project using the Power Platform CLI with publisher name `mslearn` and publisher prefix `msl`, a developer runs the command `pac solution ___ --publisher-name mslearn --publisher-prefix msl`.

<details>
<summary>Answer</summary>

**Answer:** `init`

**Explanation:** The `pac solution init` command creates a new Dataverse solution project. It requires `--publisher-name` and `--publisher-prefix` parameters to associate the solution with a publisher, which is required for all Dataverse solutions.

</details>

---

### Question 24 — Fill-in-the-Blank

A PCF component's `___ ` method is called when the control is removed from the DOM tree. It should be used to remove event listeners and cancel any pending remote calls to avoid memory leaks. In the `EditablePCF` example, this method calls `removeEventListener` on the ___ element.

<details>
<summary>Answer</summary>

**Answer:** `destroy`; `button`

**Explanation:** The `destroy` lifecycle method is called by the framework when the component is being removed. In the `EditablePCF` example, `destroy` removes the click event listener attached to the button element during `init`, preventing memory leaks.

</details>

---
