# Quiz: Developer Tools for Extending Microsoft Power Platform

> **Source material:** 1-introduction.md, 2-exercise.md, 3-solution-packager.md, 4-package-deploy.md, 5-exercise-tools.md, 6-check.md, 7-summary.md
> **Total questions:** 25
> **Question types:** Multiple choice (single), Multiple choice (multi-select), Fill-in-the-blank

---

## Questions

### Question 1 — Single Choice

A developer wants to initialize and manage the lifecycle of a Power Apps Component Framework (PCF) component from the command line, and also use the same tool to develop and test plug-ins in a solution-aware manner.

Which tool is the primary CLI designed for this purpose?

- A. Power Platform Connector CLI
- B. Power Platform CLI (`pac`)
- C. Solution Packager Tool
- D. Package Deployer

<details>
<summary>Answer</summary>

**Correct answer:** B. Power Platform CLI (`pac`)

**Explanation:** The Power Platform CLI is described as the primary CLI for developers to perform various operations, including initializing and managing PCF components and helping with plug-in development. It is solution-aware and can deploy supported platform extensions to a development environment for testing.

</details>

---

### Question 2 — Single Choice

Your team needs to prepare a custom connector for open-sourcing and certification submission. Which tool must you use to edit, validate, and submit the connector definition?

- A. Power Platform CLI (`pac`)
- B. Power Platform Tools for Visual Studio
- C. Power Platform Connector CLI (`paconn`)
- D. Plugin Registration Tool

<details>
<summary>Answer</summary>

**Correct answer:** C. Power Platform Connector CLI (`paconn`)

**Explanation:** The Connector CLI (paconn) provides a command-line tool to create, download, update, and validate Power Platform custom connectors. It must be used when preparing a custom connector for open-sourcing or certification.

</details>

---

### Question 3 — Single Choice

A developer is setting up a new local development environment and wants to install the Power Platform Tools so that `pac` commands can be run directly from the Visual Studio Code terminal.

What is the correct way to install the CLI for this use case?

- A. Download the NuGet package `Microsoft.CrmSdk.CoreTools` and extract it manually.
- B. Install the Power Platform Tools extension from the Visual Studio Marketplace.
- C. Install the Power Platform Tools extension from the Visual Studio Code Marketplace.
- D. Run `npm install -g pac` from a Node.js terminal.

<details>
<summary>Answer</summary>

**Correct answer:** C. Install the Power Platform Tools extension from the Visual Studio Code Marketplace.

**Explanation:** The Power Platform CLI can be installed as a Visual Studio Code extension (Power Platform Tools). With this extension, `pac` commands can be executed from the Visual Studio Code terminal windows.

</details>

---

### Question 4 — Single Choice

You are building a Dataverse plug-in using Visual Studio and need project templates to manage solutions and package them for deployment. Which tool provides this support directly within Visual Studio?

- A. Power Platform CLI
- B. Power Platform Connector CLI
- C. Power Platform Tools for Visual Studio
- D. Package Deployer

<details>
<summary>Answer</summary>

**Correct answer:** C. Power Platform Tools for Visual Studio

**Explanation:** Power Platform Tools for Visual Studio provides support for building Dataverse plug-ins using Visual Studio and includes project templates for managing solutions and packaging for deployment. It can be installed from the Visual Studio Marketplace.

</details>

---

### Question 5 — Single Choice

Your organization wants to automate the process of exporting solutions and checking them into source control as part of an Azure DevOps pipeline. Which Microsoft-provided resource should you use to build this automation?

- A. Community tools for Microsoft Dataverse
- B. GitHub Copilot Chat
- C. Power Platform Build Tools for Azure DevOps
- D. Configuration Migration Tool

<details>
<summary>Answer</summary>

**Correct answer:** C. Power Platform Build Tools for Azure DevOps

**Explanation:** Microsoft provides build tasks for Azure DevOps (and GitHub Actions) specifically to support automating ALM processes such as exporting solutions and checking them into source control, ensuring consistency and repeatability.

</details>

---

### Question 6 — Single Choice

A developer needs to generate early-bound .NET Framework classes that represent a Dataverse table data model for use in a model-driven app. Which NuGet package provides this Code Generation Tool?

- A. `Microsoft.CrmSdk.XrmTooling.PackageDeployment.WPF`
- B. `Microsoft.CrmSdk.XrmTooling.PluginRegistrationTool`
- C. `Microsoft.CrmSdk.XrmTooling.ConfigurationMigration.Wpf`
- D. `Microsoft.CrmSdk.CoreTools`

<details>
<summary>Answer</summary>

**Correct answer:** D. `Microsoft.CrmSdk.CoreTools`

**Explanation:** The `Microsoft.CrmSdk.CoreTools` NuGet package contains both the Code Generation Tool (which generates early-bound .NET Framework classes representing the Dataverse table data model) and the Solution Packager Tool.

</details>

---

### Question 7 — Single Choice

You need to register a custom .NET plug-in assembly and connect it as an event handler to a specific Dataverse table message. Which tool do you use to load the assembly and configure the step registration?

- A. Solution Packager Tool
- B. Plugin Registration Tool
- C. Package Deployer
- D. Configuration Migration Tool

<details>
<summary>Answer</summary>

**Correct answer:** B. Plugin Registration Tool

**Explanation:** The Plugin Registration Tool is used to register custom code plug-in assemblies and steps in a Dataverse environment. Step registration connects the plug-in as an event handler to a specific event on a table.

</details>

---

### Question 8 — Single Choice

A team exports a Dataverse solution as a `.zip` file and wants to store it in a Git repository so that individual component changes can be tracked over time. What is the problem with storing the `.zip` file directly?

- A. The `.zip` file is too large to store in source control.
- B. Source control systems cannot compress `.zip` files.
- C. As a single binary file, it is not effective or useful when placed into a source control repository.
- D. The `.zip` file format is not supported by Dataverse.

<details>
<summary>Answer</summary>

**Correct answer:** C. As a single binary file, it is not effective or useful when placed into a source control repository.

**Explanation:** Solutions exported from a Dataverse environment are compressed `.zip` files. As a single binary, they cannot be meaningfully diff'd or tracked in source control. Solution packaging tools (like SolutionPackager or `pac solution unpack`) unpack the zip into individual XML and other files that can be tracked by source control.

</details>

---

### Question 9 — Single Choice

A developer runs `pac solution unpack --zipfile C:\MyProject.zip --folder .\MyProjectUnpacked\` and then checks the resulting files into Git. Later, they need to recreate the solution `.zip` from those files. Which command accomplishes this?

- A. `pac solution export --folder .\MyProjectUnpacked\`
- B. `pac solution pack --zipfile C:\MyProject.zip --folder .\MyProjectUnpacked\.`
- C. `pac solution init --zipfile C:\MyProject.zip`
- D. `pac solution add-reference --path .\MyProjectUnpacked\`

<details>
<summary>Answer</summary>

**Correct answer:** B. `pac solution pack --zipfile C:\MyProject.zip --folder .\MyProjectUnpacked\.`

**Explanation:** The `pac solution pack` command repacks individual solution files from a folder back into a `.zip` file using the SolutionPackager logic. This is the counterpart to `pac solution unpack`.

</details>

---

### Question 10 — Single Choice

An environment has three managed solutions installed that each modify different sections of the same model-driven app form, plus an unmanaged solution that also changes one field on that form. What does the user see at runtime?

- A. Only the last managed solution's changes, because it overwrites the earlier managed solutions.
- B. Only the unmanaged solution's changes, because the unmanaged layer always wins entirely.
- C. A combined form that merges changes from all three managed solutions and applies the unmanaged layer on top.
- D. An error, because conflicting managed solutions cannot coexist in the same environment.

<details>
<summary>Answer</summary>

**Correct answer:** C. A combined form that merges changes from all three managed solutions and applies the unmanaged layer on top.

**Explanation:** Some components, like model-driven app forms, support merging. Changes from all managed solutions are merged, and the unmanaged layer is always on top, overriding any managed solution changes. The user sees a combination of all layers.

</details>

---

### Question 11 — Single Choice

A developer wants to export a solution from a non-development environment and directly modify its components by editing them in that environment. Is this possible, and why?

- A. Yes, because all solutions can be edited in any environment.
- B. No, because only unmanaged solutions allow component modification, and managed solutions can't be directly modified in non-development environments.
- C. Yes, but only if the solution was created by the same user.
- D. No, because solutions can only be edited in AppSource.

<details>
<summary>Answer</summary>

**Correct answer:** B. No, because only unmanaged solutions allow component modification, and managed solutions can't be directly modified in non-development environments.

**Explanation:** Managed solutions are used to deploy to any environment that isn't a development environment. Managed solution components cannot be directly modified in or removed from the managed solution, nor can new components be added to it in those environments.

</details>

---

### Question 12 — Single Choice

An ISV wants to deploy a certified solution to a customer environment that includes two solution files, reference data, and custom code that runs before and after installation. Which deployment method is the correct choice?

- A. Manual solution import via the Maker Portal
- B. Package Deployer with a deployment package
- C. SolutionPackager tool
- D. Power Platform CLI `pac solution publish`

<details>
<summary>Answer</summary>

**Correct answer:** B. Package Deployer with a deployment package

**Explanation:** Package Deployer is designed specifically for this scenario. A deployment package can include one or more Dataverse solution files, configuration/reference data, and custom code that runs at various installation phases. ISVs must use this package format when preparing solutions for publishing on AppSource.

</details>

---

### Question 13 — Single Choice

A developer needs to add custom logic that runs immediately before a specific named solution begins importing during a package deployment. Which event handler should they implement in `PackageImportExtension.cs`?

- A. `InitializeCustomExtension`
- B. `BeforeImportStage`
- C. `PreSolutionImport`
- D. `AfterPrimaryImport`

<details>
<summary>Answer</summary>

**Correct answer:** C. `PreSolutionImport`

**Explanation:** `PreSolutionImport` is raised before the named solution is imported, allowing configuration settings to be made to the import process for that specific solution. `BeforeImportStage` is called before the main import process begins overall, not before a specific named solution.

</details>

---

### Question 14 — Single Choice

After all import steps have completed during a Package Deployer installation, you need to run final adjustments to the environment. Which event handler do you use?

- A. `RunSolutionUpgradeMigrationStep`
- B. `PreSolutionImport`
- C. `BeforeImportStage`
- D. `AfterPrimaryImport`

<details>
<summary>Answer</summary>

**Correct answer:** D. `AfterPrimaryImport`

**Explanation:** `AfterPrimaryImport` is called after all import steps are complete, allowing for final customizations or adjustments of the environment. This is the correct hook for post-deployment configuration.

</details>

---

### Question 15 — Single Choice

A developer wants to open the Package Deployer Tool (a Windows application with a wizard-like experience) using the Power Platform CLI, without downloading the NuGet package manually. What command launches it?

- A. `pac tool cmt`
- B. `pac tool prt`
- C. `pac tool pd`
- D. `pac package deploy`

<details>
<summary>Answer</summary>

**Correct answer:** C. `pac tool pd`

**Explanation:** The command `pac tool pd` installs and launches the Package Deployer Tool (Windows application). `pac tool cmt` launches the Configuration Manager Tool, and `pac tool prt` launches the Plugin Registration Tool.

</details>

---

### Question 16 — Single Choice

You need to migrate configuration and test data between two Dataverse environments and then include that data in a deployment package. What is the correct tool and output file format to use?

- A. Solution Packager Tool, outputting a `.zip` solution file
- B. Configuration Migration Tool, outputting a `data.zip` file
- C. Package Deployer, outputting a `.csproj` file
- D. Power Platform CLI, outputting a `.json` schema file

<details>
<summary>Answer</summary>

**Correct answer:** B. Configuration Migration Tool, outputting a `data.zip` file

**Explanation:** The Configuration Migration Tool transports configuration and test data between environments and produces a `data.zip` file as output. This file can be included as part of a Package Deployer deployment package.

</details>

---

### Question 17 — Multi-Select

You are reviewing the available Power Platform CLI command categories. Which of the following command categories are available in the Power Platform CLI? (Select **three**.)

- A. `PCF` — Commands for working with Power Apps component framework
- B. `Pipeline` — Commands for working with Pipelines
- C. `Database` — Commands for working with SQL databases
- D. `Plugin` — Command to create a plug-in project
- E. `WebAPI` — Commands for calling Dataverse Web API directly
- F. `SharePoint` — Commands for integrating SharePoint lists

<details>
<summary>Answer</summary>

**Correct answer:** A, B, D

**Explanation:** The Power Platform CLI includes `PCF`, `Pipeline`, and `Plugin` as documented command categories. `Database`, `WebAPI`, and `SharePoint` are not listed as Power Platform CLI command categories.

</details>

---

### Question 18 — Multi-Select

A deployment package created for Package Deployer can consist of which of the following components? (Select **three**.)

- A. One or more Dataverse solution files
- B. A compiled Power BI report (.pbix)
- C. Flat files or exported configuration data from the Configuration Migration tool
- D. Custom code that can run before, during, or after package deployment
- E. A managed Azure DevOps pipeline definition
- F. A Power Platform CLI binary

<details>
<summary>Answer</summary>

**Correct answer:** A, C, D

**Explanation:** A Package Deployer deployment package can include: one or more Dataverse solution files, flat files or exported configuration data from the Configuration Migration tool, custom code that runs at installation phases, and HTML content for the installer UI. Power BI reports, Azure DevOps pipeline definitions, and CLI binaries are not part of a deployment package.

</details>

---

### Question 19 — Multi-Select

The Configuration Migration Tool provides several key benefits when preparing data for transport between environments. Which of the following are documented benefits? (Select **two**.)

- A. Automatically moves values for date and datetime columns forward at import to keep demo data current.
- B. Translates all data records to the language of the target environment.
- C. Avoids duplicate records on the target system by defining a uniqueness condition per table.
- D. Automatically generates early-bound classes from the exported data schema.
- E. Compresses solution metadata into a single binary zip file for transport.

<details>
<summary>Answer</summary>

**Correct answer:** A, C

**Explanation:** The Configuration Migration Tool automatically moves date/datetime values forward at import (useful for demo environments) and avoids duplicates by defining uniqueness conditions per table to compare against the target system. The other options describe unrelated tools or fabricated features.

</details>

---

### Question 20 — Multi-Select

Which of the following methods can be used to deploy a Package Deployer package to a Dataverse environment? (Select **three**.)

- A. Power Platform CLI using `pac package deploy`
- B. Interactively using the Package Deployment Tool Windows application
- C. Directly uploading through the Power Apps Maker Portal solution import
- D. Windows PowerShell for command-line automated installation
- E. AppSource portal when the offer is selected for install
- F. Visual Studio Test Explorer

<details>
<summary>Answer</summary>

**Correct answer:** A, B, D (or A, B, E depending on context — see explanation)

**Explanation:** The documented deployment methods for Package Deployer packages are: CLI (`pac package deploy`), interactively via the Package Deployment Tool Windows application, Windows PowerShell, and AppSource. Any three of A, B, D, E are correct. F (Visual Studio Test Explorer) and C (Maker Portal solution import) are not valid Package Deployer deployment methods.

</details>

---

### Question 21 — Fill-in-the-Blank

The SolutionPackager tool is distributed as part of the NuGet package ___.

<details>
<summary>Answer</summary>

**Answer:** `Microsoft.CrmSdk.CoreTools`

**Explanation:** The SolutionPackager tool is included in the `Microsoft.CrmSdk.CoreTools` NuGet package, which also contains the Code Generation Tool. It can be installed using the Power Platform CLI `tool` command or by downloading and unpackaging the NuGet package.

</details>

---

### Question 22 — Fill-in-the-Blank

When a SolutionPackager operation needs to map web resources or plug-in assemblies from their default extract folder location to a separate project directory, the ___ command-line argument is used.

<details>
<summary>Answer</summary>

**Answer:** `/map`

**Explanation:** The `/map` argument in SolutionPackager allows developers to provide an XML mapping document that maps solution file locations in the extract folder to their corresponding project directories, such as mapping a plug-in assembly to its build output folder.

</details>

---

### Question 23 — Fill-in-the-Blank

To initialize a new PCF component project in a folder named `labPCF`, with namespace `lab`, component name `FirstControl`, and template `field`, the correct `pac` command is: `pac pcf init --namespace lab --name FirstControl --template ___`.

<details>
<summary>Answer</summary>

**Answer:** `field`

**Explanation:** The `--template` argument specifies the PCF component template type. In the exercise, the `field` template is used to initialize the PCF component project. Other template values exist (such as `dataset`) for different control types.

</details>

---

### Question 24 — Fill-in-the-Blank

After initializing a PCF component project and before building or running it, a developer must run ___ to pull down all project dependencies from the npm repository.

<details>
<summary>Answer</summary>

**Answer:** `npm install`

**Explanation:** After running `pac pcf init` to scaffold the component, `npm install` is required to download all Node.js package dependencies defined in the project's `package.json` file before the component can be built or run.

</details>

---

### Question 25 — Fill-in-the-Blank

To push a PCF control to a Dataverse dev environment for unit testing before packaging it into a final solution, a developer uses the command `pac pcf push --publisher-prefix ___`, where the value represents the customization publisher prefix configured for the environment.

<details>
<summary>Answer</summary>

**Answer:** `lab` (or the appropriate publisher prefix for the environment)

**Explanation:** The `pac pcf push` command deploys the PCF component to the connected Dataverse environment. The `--publisher-prefix` flag specifies the publisher prefix (e.g., `lab`), resulting in a solution named `PowerAppsTools_<prefix>` being created or updated in the environment for testing.

</details>
