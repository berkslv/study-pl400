# Summary: Developer Tools for Extending Microsoft Power Platform

> **Source files:** 1-introduction.md, 2-exercise.md, 3-solution-packager.md, 4-package-deploy.md, 5-exercise-tools.md

---

## Power Platform CLI (pac)

- Primary CLI for Power Platform developers; handles component lifecycle, solutions, plug-ins, and more.
- Can be installed standalone or as the **Power Platform Tools** extension for Visual Studio Code.
- Commands execute from VS Code terminal windows when installed as an extension.

| Command Category | Description |
| --- | --- |
| Admin | Environment lifecycle features |
| Application | Install AppSource prerequisite applications |
| Auth | Authenticate to Dataverse |
| Canvas | Work with canvas app source files |
| Connector | Work with Power Platform Connectors |
| Data | Import/export data from Dataverse |
| ModelBuilder | Code generator for Dataverse APIs and Tables |
| Org | Work with Dataverse environments |
| Package | Work with solution packages |
| Portal | Work with Power Pages |
| PCF | Work with Power Apps Component Framework |
| Pipeline | Work with Pipelines |
| Plugin | Create a plug-in project |
| Solution | Work with Dataverse solution projects |
| Telemetry | Manage telemetry settings |
| Tool | Install and launch Power Platform tools |
| Virtual-Agent | Work with Microsoft Copilot Studio bots |

### CLI — Installing tools via `pac tool`

- `pac tool cmt` — installs and launches the **Configuration Migration Tool**
- `pac tool pd` — installs and launches the **Package Deployer Tool**
- `pac tool prt` — installs and launches the **Plugin Registration Tool**

### CLI — PCF component workflow

```bash
# Create output folder and initialize PCF component
md labPCF
cd labPCF
pac pcf init --namespace lab --name FirstControl --template field
npm install
code -a .

# Start local test harness (no deployment required)
npm start

# Push component to dev environment
pac pcf push --publisher-prefix lab

# List solutions in environment
pac solution list
```

### CLI — Solution management

```bash
# Initialize a new solution project and add a PCF component reference
pac solution init --publisher-name developer --publisher-prefix dev
pac solution add-reference --path c:\Users\Downloads\SliderComponent

# Pack / unpack a solution zip
pac solution pack   --zipfile C:\MyProject.zip --folder .\MyProjectUnpacked\.
pac solution unpack --zipfile C:\MyProject.zip --folder .\MyProjectUnpacked\.
```

### CLI — Package management

```bash
# Initialize a deployment package project
pac package init --outputDirectory MyPackage

# Add solutions to the package
pac package add-solution --path ..\MySolution1_1_0_0_2_managed.zip
pac package add-solution --path ..\MySolution2_2_0_0_0_managed.zip

# Deploy a package via CLI
pac package deploy
```

---

## Power Platform Connector CLI (paconn)

- Standalone command-line tool to create, download, update, and validate Power Platform custom connectors.
- Required for advanced editing of connector definitions, and mandatory when preparing a connector for open-sourcing or certification.

---

## Power Platform Tools for Visual Studio

- Installed from the Visual Studio Marketplace.
- Supports building Dataverse plug-ins in Visual Studio.
- Includes project templates for managing solutions and packaging for deployment.

---

## ALM Tools (Azure DevOps & GitHub)

- Microsoft provides **Azure DevOps build tasks** and **GitHub Actions** for automating ALM processes.
- Automate solution export, source control check-in (using SolutionPackager), and deployment for consistency and repeatability.
- Full task/action lists available in official documentation.

---

## Microsoft NuGet Tools for Dataverse

- Tools downloaded, unpackaged, and run locally; installable via `pac tool` or directly from NuGet.

| NuGet Package | Tool | Description |
| --- | --- | --- |
| `Microsoft.CrmSdk.CoreTools` | **Code Generation Tool** | Generates early-bound .NET Framework classes from Dataverse table data model |
| `Microsoft.CrmSdk.XrmTooling.ConfigurationMigration.Wpf` | **Configuration Migration Tool** | Moves configuration/reference data across Dataverse environments |
| `Microsoft.CrmSdk.XrmTooling.PackageDeployment.WPF` | **Package Deployer** | Deploys packages (solutions + data + custom code) to Dataverse; required format for ISVs publishing to AppSource |
| `Microsoft.CrmSdk.XrmTooling.PluginRegistrationTool` | **Plugin Registration Tool** | Registers plug-in assemblies and event steps in Dataverse |
| `Microsoft.CrmSdk.CoreTools` | **SolutionPackager Tool** | Disassembles/reassembles solution zip files into/from XML files for source control |

---

## Solutions

- **Solutions** are containers that track and transport apps, flows, tables, and developer code components (JavaScript, plug-ins) between Dataverse environments.
- Solutions are the core of Power Platform ALM strategy.

### Unmanaged vs. Managed Solutions

- **Unmanaged** — Used in development environments; components can be added, created, or modified freely. Export as unmanaged for source control check-in; use SolutionPackager to prepare for check-in. Can also be exported as managed.
- **Managed** — Used in all non-development environments. Components cannot be directly modified or removed. Must be generated as a build artifact from an automated process (recommended). Can be serviced independently from other managed solutions.

### Solution Layering

- Dataverse tracks solution components using a **layer concept**.
- All unmanaged solutions form a **single layer**; each managed solution is a separate layer.
- Last-installed managed solution wins for most components; some components (e.g., model-driven app forms) **merge** changes across layers.
- The **unmanaged layer is always on top** and overrides any managed solution layer.

### Solution Dependencies

- The runtime tracks dependencies; a solution cannot be removed if another solution depends on it.

### Solution Packaging

- Exported solutions are compressed `.zip` files — not effective for source control as a single binary.
- **SolutionPackager** unpacks a solution into individual XML and resource files for source control management; can also repack from those files.
- The `/map` argument maps extracted files (e.g., plug-in assemblies in a `bin` output folder) to their corresponding project directories.
- Most commonly used inside automated build processes (Azure DevOps tasks, GitHub Actions).

---

## Package Deployer

- Deploys a **deployment package** to Dataverse — more than a single solution: includes multiple solutions, reference data, and custom installation logic.

### Package Contents

- One or more Dataverse solution files
- Flat files or exported configuration data (from Configuration Migration Tool)
- Custom code that runs before, during, or after deployment
- HTML content displayed at the beginning and end of the deployment process

### Package Lifecycle

1. Initialize folder with the deployment project template: `pac package init --outputDirectory MyPackage`
2. Add managed solution zip files: `pac package add-solution --path ...`
3. Add custom logic to `PackageImportExtension.cs` using available event handlers:
   - `InitializeCustomExtension` — Initialize custom extension functions
   - `BeforeImportStage` — Before main import, after solutions and data
   - `PreSolutionImport` — Before a named solution is imported (configure import settings)
   - `RunSolutionUpgradeMigrationStep` — During a solution upgrade when old and new solutions both exist (data transformation)
   - `AfterPrimaryImport` — After all import steps are complete (final adjustments)
4. Build the package:
   ```bash
   dotnet publish
   ```
   - Output: a `.zip` file containing everything needed for deployment.

### Package Deployment Methods

- **CLI** — `pac package deploy` after authenticating to the target environment
- **Interactive (wizard)** — Package Deployment Tool Windows app; launched via `pac tool pd`
- **Windows PowerShell** — Command-line installation suitable for automated processes
- **AppSource** — When an ISV offer is selected from AppSource portal

### Configuration Migration Tool

- Transports configuration and test data between environments; output `data.zip` can be included in a deployment package.
- Key capabilities:
  - Select specific tables and columns to export
  - Analyze relationships; run import using multiple passes for data integrity
  - Define record subsets via query
  - Avoid duplicates using uniqueness conditions per table (create if no match, update if match found)
  - Validate schema before export
  - Automatically move date/datetime column values forward at import (useful for demo environments)

---

## Plugin Registration Tool

- Registers custom plug-in assemblies (`.NET DLLs`) and their **step registrations** in Dataverse.
- Step registration = connects a plug-in as an event handler to a specific Dataverse event (message + entity + pipeline stage + sync/async).
- Used to view system plug-ins and any custom plug-ins deployed to an environment.

---

## PCF Component — First Control (Exercise Reference)

```typescript
// Variables inside export class
private label: HTMLInputElement;
private _container: HTMLDivElement;

// Inside init() function
this.label = document.createElement("input");
this.label.setAttribute("type", "label");
this.label.value = "My First PCF";
this._container = document.createElement("div");
this._container.appendChild(this.label);
container.appendChild(this._container);
```

- After `pac pcf push`, the component appears as a **PowerAppsTools\_\<prefix\>** solution in the environment.
- Canvas apps require **"Allow publishing of canvas apps with code components"** feature enabled (via Admin Center > Environment Settings > Product > Features).
- Components are added to canvas apps via **Add (+) > Get more components > Code tab**.

---

## Copilots

- Each Power Platform component includes copilot features for makers (e.g., adding controls via natural language, explaining Power Fx logic).
- **GitHub Copilot Chat** can assist with Power Platform extension development (e.g., explaining Dataverse plugin logic).

---

## Community Tools

- Many open-source community tools, libraries, and solutions fill gaps in official Microsoft tooling.
- Listed on the [Community tools for Microsoft Dataverse](https://learn.microsoft.com/en-us/power-apps/developer/data-platform/community-tools/) page.
- **Not supported by Microsoft** — contact the tool publisher for issues.

---

## References

- [Community tools for Microsoft Dataverse](https://learn.microsoft.com/en-us/power-apps/developer/data-platform/community-tools/)
- [Complete list of Azure DevOps build tasks](https://learn.microsoft.com/en-us/power-platform/alm/devops-build-tool-tasks/)
- [Complete list of GitHub Actions](https://learn.microsoft.com/en-us/power-platform/alm/devops-github-available-actions/)
- [Configuration Migration tool](https://learn.microsoft.com/en-us/power-platform/admin/manage-configuration-data/)
- [Deploy packages using Package Deployer and Windows PowerShell](https://learn.microsoft.com/en-us/power-platform/admin/deploy-packages-using-package-deployer-windows-powershell/)
- [Developer Plan (sign-up)](https://www.microsoft.com/power-platform/products/power-apps/)
- [Microsoft CrmSdk.CoreTools NuGet package](https://www.nuget.org/packages/Microsoft.CrmSdk.CoreTools/)
- [Microsoft CrmSdk.XrmTooling.ConfigurationMigration.Wpf NuGet package](https://www.nuget.org/packages/Microsoft.CrmSdk.XrmTooling.ConfigurationMigration.Wpf/)
- [Microsoft CrmSdk.XrmTooling.PackageDeployment.WPF NuGet package](https://www.nuget.org/packages/Microsoft.CrmSdk.XrmTooling.PackageDeployment.Wpf/)
- [Microsoft CrmSdk.XrmTooling.PluginRegistrationTool NuGet package](https://www.nuget.org/packages/Microsoft.CrmSdk.XrmTooling.PluginRegistrationTool/)
- [Microsoft Power Platform Build Tools](https://learn.microsoft.com/en-us/power-platform/alm/devops-build-tools/)
- [Power Apps CLI — standalone install](https://learn.microsoft.com/en-us/power-apps/developer/data-platform/powerapps-cli#standalone-power-platform-cli)
- [Power Apps CLI — VS Code extension](https://learn.microsoft.com/en-us/power-apps/developer/data-platform/powerapps-cli#using-power-platform-tools-for-visual-studio-code)
- [Power Platform CLI introduction](https://learn.microsoft.com/en-us/power-platform/developer/cli/introduction)
- [Power Platform Connector CLI (paconn)](https://learn.microsoft.com/en-us/connectors/custom-connectors/paconn-cli)
- [SolutionPackager Tool documentation](https://learn.microsoft.com/en-us/power-apps/developer/common-data-service/compress-extract-solution-file-solutionpackager/)
- [SolutionPackager /map command argument](https://learn.microsoft.com/en-us/power-apps/developer/common-data-service/compress-extract-solution-file-solutionpackager#use-the-map-command-argument)
