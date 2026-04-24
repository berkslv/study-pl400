# Create a code component solution package

Completed

- 15 minutes

You must deploy a code component to a Microsoft Dataverse environment before using it in Power Apps or Power Pages. Your first task to deploy a component is to package your code component into a solution, allowing you to import it into an environment. You can accomplish this in two ways. You can use the CLI Push command to create a temporary solution to push your component to an environment to facilitate testing. This approach is great for use during the development of the component. The other option is to create a solution for the component and import it separately into your Dataverse environment. This option is good for use in build pipelines or manual deploys to other than your development environment. Let's explore both options in more detail.

In the following steps, you'll practice both techniques using the code component that you built in the last topic or one of the samples components available.

## Prerequisites

You must have an existing code component project that is already built. You can follow these steps for any other code component project, such as the [Sample components](https://learn.microsoft.com/en-us/power-apps/developer/component-framework/use-sample-components/).

## Push a component to a Dataverse environment during development

To push a code component using the Power Platform CLI, follow these steps:

1. Start Visual Studio Code and select **Explorer**.
2. Select **Open Folder**.

![Screenshot of Visual Studio Code open folder button.](media/open-folder.png)

3. Select the **editable-pcf** project folder you created in the previous lab and select **Select Folder**.
4. Select the **Power Platform** tab and select **Add Auth Profile**.

![Screenshot of VSCode and the Add Auth Profile button from clicking the Power Platform icon in the left nav.](media/profile.png)

5. Look for a **Sign in to your account** popup and select the account you wish to use. Enter the appropriate username, select NEXT, and enter the password. You might need to provide MFA if it has been set up in your tenant.

![Screenshot of the standard Microsoft Tenant SignIn.](media/login.png)

6. The profile you added will show up under **Auth Profiles**, along with the associated **Environments & Solutions**. Be sure that you select the appropriate environment under Environment & Solutions. There will be a star you can select. Be sure the environment selected has the Component Framework enabled as well in the Environment Features section of the Power Platform Admin Center for the selected Environment.

![Screenshot of the AUTH PROFILES and ENVIRONMENTS & SOLUTIONS sections.](media/checker.png)

7. Select **Terminal** and select **New Terminal**.
8. Build the project by running the command below and make sure it builds successfully.

    ```console
    npm run build
    ```

![Screenshot of the results of running the npm run build command.](media/deploy-build.png)

9. Push the custom control to your environment by running the command below.

    ```console
    pac pcf push --publisher-prefix msl
    ```

![Screenshot of the initial build and import to the environment.](media/deploy-initial.png)

    Notice in the image the red box that indicates the Connected as and Connected To sections. Ensure these match the AUTH PROFILE and selected ENVIRONMENT from your previous steps.

10. The solution should get imported into your environment and published.

![Screenshot of Visual Studio Code terminal.](media/solution-imported.png)

    You can ignore the Yellow warning message if it's received.

11. Navigate to [Power Apps maker portal](https://make.powerapps.com/) and make sure you are in the correct environment.
12. Select **Solutions**.
13. You should see **PowerAppsTools\_msl** solution. Select to open the solution.

![Screenshot of an environment solutions list with a red rectangle around the Power Apps Tools solution.](media/solution.png)

14. You should see the custom control you created.

![Screenshot of a solution components with a red rectangle around a custom control.](media/custom-control.png)

## Create a solution file with Power Platform CLI

To create a solution file with Power Platform CLI, follow these steps:

1. Go back Visual Studio Code and make sure you have the **EDITABLE-PCF** project open.
2. Go to the terminal and to **Command prompt**.
3. Create new folder by running the command below.

    ```console
    md Solution
    ```

4. Change the directory to the Solution folder you created. Run the command below.

    ```console
    cd Solution
    ```

5. Initialize your Dataverse solution project with the following command:

    ```console
    pac solution init --publisher-name mslearn --publisher-prefix msl
    ```

6. Inform your solution project its components will be added during the build. To accomplish this task, use the following command:

    ```dotnetcli
    pac solution add-reference --path ..
    ```

7. To generate your solution's zip file, use Microsoft Build Engine, or msbuild for short. You'll only need to use the /restore flag the first time the solution project is built. In every subsequent build, you'll need to run msbuild only. The path to your MSBuild.exe can be different depending on the version of Visual Studio you've installed on your machine.

    ```console
    "C:\Program Files (x86)\Microsoft Visual Studio\2022\BuildTools\MSBuild\Current\Bin\MSBuild.exe" /t:build /restore
    ```

8. The build should succeed.
9. Locate the **Solution** folder you created and expand it.
10. Expand the **bin\debug** folder.
11. You should see the solution.zip file here.

![Screenshot of the created solution.](media/solution-file.png)

> **Note:** To run MSBuild, you need to have either Visual Studio or the Visual Studio Build Tools installed. You can install the build tools from the [Visual Studio Downloads](https://visualstudio.microsoft.com/downloads/#build-tools-for-visual-studio-2022). To access MSBuild, you might need to add it to the path directory of your Windows environment variables. For example, Visual Studio 2022 stores MSBuild at *C:\Program Files (x86)\Microsoft Visual Studio\2022\Enterprise\MSBuild\Current\Bin*. You can also use the Visual Studio Developer Command Prompt to access MSBuild, or run it by using the full qualified path (*"C:\Program Files (x86)\Microsoft Visual Studio\2022\Enterprise\MSBuild\Current\Bin\MSBuild.exe"/t:build /restore*).

The default package type is a Managed solution. If you want to export as Unmanaged (or Both), you can clear (or uncomment) the comment in the following section from your Solutions.cdsproj and edit the SolutionPackageType node accordingly:

```xml
<!-- Solution Packager overrides un-comment to use: SolutionPackagerType Managed, Unmanaged, Both)-->
<PropertyGroup>
  <SolutionPackageType>Unmanaged</SolutionPackageType>
</PropertyGroup>
```

You can set the msbuild configuration to **Release** to issue a production build, for example, `msbuild /p:configuration=Release`.

You can manually import the containing zip file that is found in bin\Debug or bin\Release, depending on your release configuration. You can also programmatically deploy your code components by using the Power Platform CLI. For more information, see [Connecting to your environment](https://learn.microsoft.com/en-us/power-apps/developer/component-framework/import-custom-controls#connecting-to-your-environment) and [Deploying code components](https://learn.microsoft.com/en-us/power-apps/developer/component-framework/import-custom-controls#deploying-code-components) sections of the [Package a code component](https://learn.microsoft.com/en-us/power-apps/developer/component-framework/import-custom-controls) documentation.
