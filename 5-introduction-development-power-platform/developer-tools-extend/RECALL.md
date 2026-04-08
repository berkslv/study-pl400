# Recall: Developer Tools for Extending Power Platform

> **Source files:** 1-introduction.md, 2-exercise.md, 3-solution-packager.md, 4-package-deploy.md, 5-exercise-tools.md, 6-check.md

---

## Keywords

| Term | Definition |
|------|-----------|
| Power Platform CLI (pac) | Primary command-line interface for developers to create, manage, and deploy Power Platform extensions. |
| PCF (Power Apps Component Framework) | Framework for building reusable code components for use in canvas and model-driven apps. |
| SolutionPackager | Tool that extracts a Dataverse solution `.zip` into individual XML files for source control, and repacks them. |
| Unmanaged Solution | Development-time solution container; can be modified freely and exported for source control. |
| Managed Solution | Deployment-time solution whose components cannot be directly modified or removed in the target environment. |
| Package Deployer | Tool that deploys a package containing multiple solutions, reference data, and custom code into a Dataverse environment. |
| Plugin Registration Tool (prt) | Tool used to register custom plug-in assemblies and step registrations in a Dataverse environment. |
| Configuration Migration Tool (cmt) | Tool to export and import configuration/reference data between Dataverse environments. |
| Solution Layering | Dataverse mechanism where multiple solution layers coexist; unmanaged layer always wins over managed layers. |
| PackageImportExtension | C# class in a Package Deployer project that exposes event handlers for custom logic during deployment. |
| ALM Build Tasks | Azure DevOps tasks and GitHub Actions provided by Microsoft to automate Power Platform solution lifecycle. |
| Connector CLI (paconn) | Command-line tool to create, download, update, and validate Power Platform custom connectors. |

---

## Main Ideas

- Power Platform CLI (`pac`) is the primary developer tool; it supports commands for PCF, solutions, packages, plug-ins, auth, canvas apps, connectors, pipelines, and more.
- The CLI can be installed standalone or as the **Power Platform Tools** extension for Visual Studio Code, enabling `pac` commands from the VS Code terminal.
- PCF components are initialized with `pac pcf init`, built/tested locally via `npm start` (test harness), and pushed to a dev environment with `pac pcf push --publisher-prefix <prefix>`.
- Unmanaged solutions are used during development; managed solutions are used for deployment to non-development environments and should be generated as build artifacts.
- Solution layering: the unmanaged layer always overrides managed layers; the last-installed managed solution wins over earlier ones (except for components that support merging, like model-driven app forms).
- SolutionPackager (`pac solution pack/unpack`) converts a solution `.zip` into source-control-friendly XML files and rebuilds the zip from those files.
- The `/map` argument in SolutionPackager allows mapping extracted solution files to external project directories (e.g., plug-in assembly bin output folders).
- Package Deployer packages can contain multiple Dataverse solutions, flat files, exported configuration data, and custom .NET code that runs before/during/after deployment.
- Package Deployer deployment methods: Power Platform CLI (`pac package deploy`), interactive wizard (`pac tool pd`), Windows PowerShell, or AppSource.
- `PackageImportExtension.cs` event handlers include: `InitializeCustomExtension`, `BeforeImportStage`, `PreSolutionImport`, `RunSolutionUpgradeMigrationStep`, and `AfterPrimaryImport`.
- Configuration Migration Tool produces a `data.zip` that can be embedded in a deployment package; it supports uniqueness conditions to avoid duplicate records on import.
- Plug-ins are developed in **.NET** and registered using the Plugin Registration Tool; step registration links a plug-in to a specific Dataverse message, entity, pipeline stage, and execution mode (sync/async).
- Community tools are not supported by Microsoft; contact the tool publisher for issues.

---

## Mini Quiz

### Q1 — Single Choice

A developer needs to initialize a PCF component project in a new folder.

Which `pac` command is used?

- A. `pac solution init`
- B. `pac pcf init --namespace lab --name FirstControl --template field`
- C. `pac package init --outputDirectory MyPackage`
- D. `pac auth create --name Lab --url <URL>`

<details>
<summary>Answer</summary>

**Correct answer:** B. `pac pcf init --namespace lab --name FirstControl --template field`

**Explanation:** `pac pcf init` initializes a PCF component project with the specified namespace, name, and template type. The other commands initialize solution projects, packages, or authentication profiles.

</details>

---

### Q2 — Fill-in-the-Blank

Unmanaged solutions are used in ___ environments, while managed solutions are used to deploy to any environment that is ___ a development environment for that solution.

<details>
<summary>Answer</summary>

**Answer:** development; not

**Explanation:** Unmanaged solutions allow free modification during development. Managed solutions protect their components from direct modification and are intended for deployment targets like test, UAT, or production.

</details>

---

### Q3 — Single Choice

A release engineer wants to extract a Dataverse solution zip file into individual files for source control using the Power Platform CLI.

Which command accomplishes this?

- A. `pac solution pack --zipfile C:\MyProject.zip --folder .\MyProjectUnpacked\.`
- B. `pac solution list`
- C. `pac solution unpack --zipfile C:\MyProject.zip --folder .\MyProjectUnpacked\.`
- D. `pac solution add-reference --path c:\SliderComponent`

<details>
<summary>Answer</summary>

**Correct answer:** C. `pac solution unpack --zipfile C:\MyProject.zip --folder .\MyProjectUnpacked\.`

**Explanation:** `pac solution unpack` uses SolutionPackager logic to disassemble a solution zip into individual XML files suitable for source control. `pack` is the reverse operation.

</details>

---

### Q4 — Fill-in-the-Blank

The ___ event handler in `PackageImportExtension.cs` is called after all import steps are complete, allowing for final customizations of the environment.

<details>
<summary>Answer</summary>

**Answer:** `AfterPrimaryImport`

**Explanation:** `AfterPrimaryImport` fires once all solutions and data have been imported, making it the correct hook for post-deployment environment adjustments.

</details>

---

### Q5 — Single Choice

An ISV needs to deploy a certified offering — including two managed solutions and seed reference data — to a customer environment from AppSource.

Which tool is designed for this scenario?

- A. SolutionPackager
- B. Plugin Registration Tool
- C. Configuration Migration Tool
- D. Package Deployer

<details>
<summary>Answer</summary>

**Correct answer:** D. Package Deployer

**Explanation:** Package Deployer is explicitly designed for ISVs to bundle multiple solutions, configuration data, and custom installation logic into a single deployable package, including AppSource distribution.

</details>

---

### Q6 — Fill-in-the-Blank

The Plugin Registration Tool is used to register plug-in ___ and ___ in a Dataverse environment.

<details>
<summary>Answer</summary>

**Answer:** assemblies; steps

**Explanation:** After building a .NET plug-in DLL, developers use the Plugin Registration Tool to load the assembly and create step registrations that link the plug-in to specific Dataverse messages and entities.

</details>

---

### Q7 — Single Choice

In solution layering, when three managed solutions each modify different sections of the same model-driven app form, what is the result?

- A. Only the last-installed managed solution's form changes are visible.
- B. The form from the oldest managed solution takes precedence.
- C. The changes from all three managed solutions are merged into a combined form.
- D. The form is locked and no managed solution can modify it.

<details>
<summary>Answer</summary>

**Correct answer:** C. The changes from all three managed solutions are merged into a combined form.

**Explanation:** Some components, such as model-driven app forms, support merging rather than a last-one-wins approach. Each managed solution's changes to different sections of the form are combined in the final result.

</details>

---
