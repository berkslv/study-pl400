# Exercise - Install and use developer tools

- 15 minutes

In this exercise, you'll install some of the developer tools from NuGet.

> **Important:** Use a test environment with Microsoft Dataverse provisioned. If you don't have one you can sign up for the [Developer Plan](https://www.microsoft.com/power-platform/products/power-apps/).

## Task 1: Install developer tools

In this task, you'll use a Power Platform CLI to install tools.

1. Launch Command Prompt.
2. Run the command below to install the **Configuration Manager Tool**.

    ```
    pac tool cmt
    ```

3. The Configuration Manager Tool should install and launch. Close the Configuration Manager Tool.
4. Run the command below to install the **Package Deployer Tool**.

    ```
    pac tool pd
    ```

5. The Package Deployer Tool should install and launch. Close the Package Deployer Tool.
6. Run the command below to install the **Plugin Registration Tool**.

    ```
    pac tool prt
    ```

7. The Plugin Registration Tool should install and launch. Don't close the Plugin Registration Tool.

## Task 2: Explore a registered plug-in with the plug-in registration tool

1. Select **Create New Connection**.
2. Select the radio button next to **Office 365**.
3. Check **Display list of available organizations**.
4. Select **Login** and sign in with your Dataverse environment credentials when prompted.
5. On the list of organizations (environments), pick your environment and select **Login** again.
6. You'll see a list of system plug-ins. If you do this on an environment with custom plug-ins you would see them in the list as well. The **(Assembly)** items are .NET DLLs that implement the plug-ins.
7. Locate **Microsoft.CDS.DataLakeDataProvider.Plugins** and expand it.
8. Each of the child items is implemented in the assembly. Expand one of the items to see the step registrations for that individual plug-in.
9. Step registration connects the plug-in as an event handler to the event. In the above example, this is handling a create on the `insightsstorevirtualentity` table.
10. Double-click on the step to see the step configuration details including what message and entity it's registered on, the pipeline stage when the plugin is invoked, whether execution is synchronous or asynchronous, etc.

When you create your own custom plug-in, you use this tool to load the assembly and register the steps for the events that you want to handle.
