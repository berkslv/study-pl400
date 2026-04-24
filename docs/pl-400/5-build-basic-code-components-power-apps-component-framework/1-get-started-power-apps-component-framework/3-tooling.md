# Power Apps component tooling

When you build a Power Apps code component, you use a combination of tools to streamline the steps required from start to finish.

| Step | Description | Tools |
| --- | --- | --- |
| Create | Create and initialize the component project using a template. | Power Platform CLI |
| Implement | Describe and implement your component behavior and styling. | Code editor or IDE of your choice |
| Build | Validate and transpile TypeScript code, customize a component manifest. | Power Platform CLI or Visual Studio Code |
| Debug | Validate and troubleshoot component behavior without deploying to a Dataverse environment. | Power Platform CLI |
| Package | Create a Dataverse solution file, and package the component as part of the solution. | Power Platform CLI and Visual Studio msbuild |

## Power Platform CLI

The Power Platform CLI (command-line interface) is a developer-focused command-line tooling that provides commands for building custom code (code components and plug-ins). It also has environment **admin**, **solution**, and **package** commands for application lifecycle management.

Ensure you have the latest version:

```bash
pac install latest
```

### Initialize a component

Scaffold initial files using a template. Example for a field component:

```bash
pac pcf init --namespace Contoso --name Slider --template field
```

### Install dependencies

```bash
npm install
```

You can also run npm install automatically during init:

```bash
pac pcf init --namespace Contoso --name Slider --template field --run-npm-install
```

### Build

Validates the manifest, runs the TypeScript transpiler, and reports any problems:

```bash
npm run build
```

### Test locally (test harness)

Launch the test harness to test your component locally without deploying:

```bash
npm start
```

Enable watch mode so the test harness auto-picks up code changes:

```bash
npm start watch
```

### Push to Dataverse environment

Build and push the latest version of your code component to your configured Dataverse development environment:

```bash
pac pcf push --publisher-prefix dev
```

## Tools for Visual Studio Code

The Power Platform extension for Visual Studio Code brings the Power Platform CLI into the editor environment. Install it from the [Visual Studio Marketplace](https://marketplace.visualstudio.com/items?itemName=microsoft-IsvExpTools.powerplatform-vscode). Once installed, use the `pac` command from the terminal window.

## Tools for Visual Studio

Install these tools either using the standalone install or as part of Visual Studio.

### Initialize a solution

```bash
pac solution init --publisher-name Contoso --publisher-prefix contoso --outputDirectory vssolution
```

### Add a reference to your component

```bash
pac solution add-reference --path \<path to your Power Apps component framework project\>
```

### Build the solution (first time)

```bash
msbuild /t:build /restore
```

> **Tip:** If `msbuild` is not recognized, run the command from the Developer Command Prompt for Visual Studio.

After the first build, run `msbuild` alone to regenerate solution files. Generated files are in `\bin\debug\` (or `\bin\release\`). You can then manually import the solution into Dataverse or deploy automatically using [Microsoft Power Platform Build Tools](https://marketplace.visualstudio.com/items?itemName=microsoft-IsvExpTools.PowerPlatform-BuildTools).

## Choose an IDE

Visual Studio Code or Visual Studio are recommended, but you can use any IDE to build custom Power Apps code components.
