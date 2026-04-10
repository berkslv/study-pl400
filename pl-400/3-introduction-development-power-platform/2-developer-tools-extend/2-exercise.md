# Exercise - Use the Power Apps CLI

- 15 minutes

In this exercise, you'll install the Power Platform CLI and create your first Power Apps Component Framework (PCF) component.

## Task 1: Install the CLI

1. Install npm (comes with Node.js) or [Node.js](https://nodejs.org/) (comes with npm). We recommend that you use LTS (Long-Term Support) version 10.15.3 or higher.
2. Install [Visual Studio Code](https://code.visualstudio.com/Download/).
3. Install [Power Platform Tools extension](https://marketplace.visualstudio.com/items?itemName=microsoft-IsvExpTools.powerplatform-vscode).
4. Start Visual Studio Code.
5. Select **Terminal** and select **New Terminal**.
6. Run the `pac` command to see what commands are available:

    ```
    pac
    ```

7. You can enter `pac` and then a command to see what options it has. For example, try the following:

    ```
    pac admin
    ```

8. Navigate to [Power Apps Maker Portal](https://make.powerapps.com/) and make sure you have the **Dev** environment selected.
9. In the upper right corner of the screen, select the **Settings** icon and choose **Session details**.
10. In the Power Apps session details dialog, select **Instance url** value and copy it for use later in the exercise.
11. Go back to the Visual Studio Code terminal, type the following command to establish a connection from the CLI and sign in to your test environment when prompted.

    ```
    pac auth create --name Lab --url <Your Instance URL>
    ```

12. Type the following `who` command that displays the environment and the user information. This is good to ensure you are in the correct environment.

    ```
    pac org who
    ```

## Task 2: Create a PCF component

1. Run the command below to create a new folder named **labPCF** inside your user's folder.

    ```
    md labPCF
    ```

2. Change directory to the folder you created.

    ```
    cd labPCF
    ```

3. Run the command below to initialize the component project.

    ```
    pac pcf init --namespace lab --name FirstControl --template field
    ```

4. Type the following command and then press enter. This pulls down any dependencies from the npm repository.

    ```
    npm install
    ```

5. Open the folder in Visual Studio Code.

    ```
    code -a .
    ```

6. Explore the files that have been created.
7. Open **index.ts** in the **FirstControl** folder.
8. Paste the following two variables inside the export.

    ```typescript
    private label: HTMLInputElement;
    private _container: HTMLDivElement;
    ```

9. Paste the following inside the **init()** function to create the HTML controls and set the label value.

    ```typescript
    this.label = document.createElement("input");
    this.label.setAttribute("type", "label");
    this.label.value = "My First PCF";
    this._container = document.createElement("div");
    this._container.appendChild(this.label);
    container.appendChild(this._container);
    ```

10. Save the file.
11. Go to the terminal and input the following command and then enter. This will start the test harness with the latest code.

    ```
    npm start
    ```

12. The test harness is useful early in the project to visualize your control without deploying it to an environment. You can adjust property values to change the size of the control area. After you're done exploring the test harness, switch back to the terminal and press Ctrl-C to terminate the execution of the test harness.
13. If prompted, type **Y** and [ENTER].
14. Run the following command to list solutions in your environment.

    ```
    pac solution list
    ```

15. These are the current solutions that are in your environment. The next step will add one for the component.
16. Type the following push command to push our control to the environment.

    ```
    pac pcf push --publisher-prefix lab
    ```

17. Run `pac solution list` command again. You should see a PowerAppsTools\_lab solution listed. This is how your component is installed in the dev environment for unit testing before being packaged for user testing or production or included as part of another solution.

## Task 3: Use the component in an app (optional)

1. Navigate to the [Microsoft Power Platform Admin Center](https://aka.ms/ppac/).
2. Select **Environments** from the menu on the left.
3. Select the **environment** you're using for the lab.
4. Select **Settings**.
5. Expand **Product** area and select **Features**.
6. On the right side, enable the **Allow publishing of canvas apps with code components** feature.
7. Navigate to [Power Apps maker portal](https://make.powerapps.com/) and make sure you are in the correct environment.
8. Select **Solutions**.
9. Select to open the **PowerAppsTools\_lab** solution.
10. You should see your component listed.
11. Select **+ New | App | Canvas app**.
12. Select **Phone** for Format, enter **First PCF** for App name, and select **Create**.
13. On the left pane, select **Add (+)**, and then select **Get more components.**
14. Select the **Code** tab.
15. Select your component.
16. Select **Import**.
17. On the left tool bar, select **+** and expand **Code components**.
18. Select the **FirstControl**. You should now see the control with the text **My First PCF** on the canvas.
19. Select **Save** to save the application.

You have now built your first PCF component and used it in a canvas app.
