# Exercise - Create a Custom API

- 15 minutes

In this exercise, you'll build a Dataverse custom API to execute some custom logic. You'll then use the custom API from a step in a Power Automate flow.

> **Important:** Use a test environment with Microsoft Dataverse provisioned. If you do not have one you can sign up for the [community plan](https://powerapps.microsoft.com/communityplan/).

## Task 1: Create the Custom API Project

1. Download and install [Power Platform CLI](https://aka.ms/PowerAppsCLI/).
2. Run the powerapps-cli file to start installation.
3. Use the setup wizard to complete the setup and select **Finish**.
4. Open **Command Prompt**.
5. Run the command below to create a new folder named **CustomAPILab**:

    ```
    md CustomAPILab
    ```

6. Change directory to the folder you created:

    ```
    cd CustomAPILab
    ```

7. Run the command below to initialize a new Dataverse plugin class library:

    ```
    pac plugin init
    ```

8. Dataverse plugin class library creation should be successful.
9. Run the command below to open the project in Visual Studio:

    ```
    start CustomAPILab.csproj
    ```

10. The project should open in Visual Studio.
11. Right-click on the **Plugin1.cs** file and rename it **MatchPlugin.cs**.
12. Select **Yes** to the renaming confirmation dialog.
13. Right-click on the **CustomAPILab Project** and select **Manage NuGet Packages**.
14. Search for **System.Text.RegularExpressions** and select **Install**.
15. Open the **MatchPlugin.cs** file.
16. Add the following `using` statement:

    ```csharp
    using System.Text.RegularExpressions;
    ```

17. Add the following lines inside the `ExecuteDataversePlugin` method, after the `var context` line. These lines get the value from the input parameters passed on the custom API invocation:

    ```csharp
    string input = (string)context.InputParameters["StringIn"];
    string pattern = (string)context.InputParameters["Pattern"];
    ```

18. Add the following line after to get the tracing service:

    ```csharp
    ITracingService tracingService = (ITracingService)localPluginContext.ServiceProvider.GetService(typeof(ITracingService));
    ```

19. Add the below line to write the input value into trace:

    ```csharp
    tracingService.Trace("Provided input: " + input);
    ```

20. Add the following line to call the `Regex.Match` method:

    ```csharp
    var result = Regex.Match(input, pattern);
    ```

21. Write the result to trace:

    ```csharp
    tracingService.Trace("Matching result: " + result.Success);
    ```

22. Add the following line to set the output parameter `Matched`:

    ```csharp
    context.OutputParameters["Matched"] = result.Success;
    ```

23. Select **Build > Build Solution**.
24. The project should build successfully.

## Task 2: Register the Custom API Plugin

1. Open command prompt and run the command below to launch the Plugin Registration Tool:

    ```
    pac tool prt
    ```

2. Select **+ Create New Connection**.
3. Select **Office 365**, provide your credentials, and select **Login**.
4. Select the correct environment.
5. Choose **Register | Register New Assembly**.
6. Select **...** and browse to the **CustomAPILab\bin\Debug\net462** folder.
7. Select **CustomAPILab.dll**.
8. Select **OK**.
9. Select **Register Selected Plugins**.
10. Select **OK** to the success message. Your plugin is ready to connect to the custom API we'll create in the next task.

## Task 3: Create the Custom API

1. Navigate to [Power Apps maker portal](https://make.powerapps.com/) and make sure you are in the correct environment.
2. Select **Solutions** on the left navigation.
3. Select **+ New Solution**.
4. Enter **Custom API Lab** in the Display Name.
5. Select **CDS Default Publisher** in the Publisher dropdown.
6. Select **Create**.
7. Select **+ New | More | Other | Custom API**.
8. Enter the following information:
   - **Unique Name:** `contoso_match`
   - **Name:** `Match`
   - **Display Name:** `Match`
   - **Description:** `Match a string`
   - **Binding Type:** `Global`
9. In **Plugin Type**, select the search icon and locate your plugin.
10. Select **Save and Close**.
11. Select **Done**.
12. Select **+ New | More | Other | Custom API Request Parameter**.
13. For **Custom API**, select the **Search** icon and select **Match** (your Custom API).
14. Enter **StringIn** for Unique Name, Name, Display Name, and Description.
15. Select **String** for Type.
16. Select **Save and Close**.
17. Select **Done**.
18. Repeat steps 13–17 and add another **Custom API Request Parameter** named **Pattern**.
19. Select **New | More | Other | Custom API Response Property**.
20. For **Custom API**, select the **Search** icon and select **Match** (your Custom API).
21. Enter **Matched** for **Unique Name**, **Name**, **Display Name**, and **Description**.
22. Select **Boolean** for **Type**.
23. Select **Save and Close**.

## Task 4: Use Custom API from Power Automate

1. In the solution, select **+ New | Automation | Cloud Flow | Instant**.
2. Enter **String match** for Flow name, select **Manually trigger a flow** trigger, and select **Create**.
3. Select **+ New Step**.
4. Search for **perform** and choose **Perform an unbound action**.
5. In the Action Name list, locate and select **contoso_match**.
6. Enter any valid email address in **StringIn**.
7. Enter the following Regular expression in **Pattern** (a simple email pattern):

    ```
    ^\w+@[a-zA-Z_]+?\.[a-zA-Z]{2,3}$
    ```

8. Select **Save**.
9. After save is complete, select **Test**.
10. Select **Manually**, then select **Test**.
11. Select **Run flow**.
12. Select **Done**.
13. After your flow completes, select the **Perform an unbound action** to expand and see results.

You have now completed building a custom action and using it from a Power Automate flow. The custom API action `contoso_match` is now also available for calling directly using the platform API.
