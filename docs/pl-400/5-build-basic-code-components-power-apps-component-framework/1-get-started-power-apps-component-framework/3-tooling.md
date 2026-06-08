# Power Apps component tooling

Completed

- 10 minutes

When you build a Power Apps code component, you use a combination of tools to streamline the steps required from start to finish.

| Step | Description | Tools |
| --- | --- | --- |
| Create | Create and initialize the component project using a template. | Power Platform Command Line Interface (CLI) |
| Implement | Describe and implement your component behavior and styling. | Code editor or Integrated Development Environment (IDE) of your choice |
| Build | Validate and transpile TypeScript code, customize a component manifest. | Power Platform CLI or Visual Studio Code |
| Debug | Validate and troubleshoot component behavior without deploying it to a Dataverse environment. | Power Platform CLI |
| Package | Create a Dataverse solution file, and package the component as part of the solution. | Power Platform CLI and Visual Studio msbuild |

Let's take a look at some of the tools that we use.

## Power Platform CLI

The Power Platform CLI (command-line interface) is a developer-focused command-line tooling that provides commands for building custom code. This currently includes code components and plug-ins. The tool also has environment **admin** commands available for managing environments. You can also use the **solution** and **package** commands to implement application lifecycle management with solutions.

The CLI only takes a few [steps to install](/en-us/powerapps/developer/data-platform/powerapps-cli?azure-portal=true#install-power-apps-cli). You can ensure you have the latest version by using the following update command:

`pac install latest`

When you start to build your code component, you use the CLI to scaffold your initial files using a template. The following command is an example of initializing a component using the field template:

`pac pcf init --namespace Contoso --name Slider --template field`

One of the prerequisites to installing the CLI is to install node package manager (npm). You use npm to manage dependencies and build your code component. When you use the init command, it creates a package.json file configured with the dependencies for your code component and several commands, like build, that you use during the development of your component. The first **npm** command you run after initializing the component is **install**. This command downloads all the libraries needed to support the Power Apps component framework.

`npm install`

You can also request that when the initialization runs, it also runs the npm install by adding `--run-npm-install` to your init command options.

`pac pcf init --namespace Contoso --name Slider --template field --run-npm-install`

As you develop your code component, you can check for any code issues using the following build command:

`npm run build`

This command validates your manifest, runs the TypeScript transpiler, and lets you know of any problems.

A test harness is also available so you can test your code component locally without having to deploy it to an environment. You can launch the test harness with your code component using the following start command:

`npm start`

You can also enable watch mode by using **npm start watch** command. If you make changes to your code in watch mode, the test harness automatically picks them up without restarting.

To speed up your testing of code components, the CLI can authenticate to your development environment and push your code component for testing in real apps. The following command would build and push the latest version of your code component to your currently configured Dataverse development environment.

`pac pcf push --publisher-prefix dev`

## Tools for Visual Studio Code

The Power Platform extension for Visual Studio Code brings the Power Platform command line interface (CLI) to work within the context of the editor environment. You can install the extension from the [Visual Studio Marketplace](https://marketplace.visualstudio.com/items?itemName=microsoft-IsvExpTools.powerplatform-vscode). Once installed you can use the CLI pac command from the terminal window.

## Tools for Visual Studio

You install these tools either using the standalone install or as part of installing Visual Studio. You can find them at [Download Visual Studio 2022 for Windows & Mac](https://visualstudio.microsoft.com/downloads/?azure-portal=true).

The **msbuild** command is used when you package your component as part of a Power Apps solution for deployment into a Dataverse environment. For example, the following commands initialize a new solution for your component and create a **msbuild** project file that manages creation of the output solution files during a build.

`pac solution init --publisher-name Contoso --publisher-prefix contoso ÔÇæÔÇæoutputDirectory vssolution`

To have your code component packaged in the solution, you must add a reference to your component. This ensures that when a build is run, your component is included in the output solution that is generated. The following command adds the reference:

`pac solution add-reference --path \<path to your Power Apps component framework project\>`

You can use the msbuild command to generate the solution files with the solution references configured. The following command runs the build the first time:

`msbuild /t:build /restore`

Tip

If you are getting an error that msbuild command is not recognized, try running the command from the Developer Command Prompt for Visual Studio. This shortcut is created as part of a Visual Studio or Tools for Visual Studio installation.

After the first build, you can run the **msbuild** command to regenerate the solution files. The generated solution files are located in the \bin\debug\ (or \bin\release) folder after the build is successful. Once the output zip file is ready, you can either manually [import the solution into Dataverse](/en-us/powerapps/maker/data-platform/import-update-export-solutions/?azure-portal=true) or automatically deploy it using the [Microsoft Power Platform Build Tools](https://marketplace.visualstudio.com/items?itemName=microsoft-IsvExpTools.PowerPlatform-BuildTools&amp;azure-portal=true).

## Choose an IDE

We recommend using Visual Studio Code or Visual Studio to write your components. But you can use any IDE you choose to build custom Power Apps code components.
