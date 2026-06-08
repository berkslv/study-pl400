# Exercise - Use client script to hide a form section

Completed

- 9 minutes

In this exercise, you use client script to implement the business requirement of hiding the Status section when a project start date either isn't provided or is in the future.

Important

Use a test environment with Microsoft Dataverse provisioned and the sample apps enabled. If you don't have one you can sign up for the [community plan](https://powerapps.microsoft.com/communityplan/?azure-portal=true).

## Task 1 - Prepare solution with the form

In this task, you create a solution, add an existing table to the solution, and prepare the main form of the table you added to the solution.

1. Navigate to [Power Apps maker portal](https://make.powerapps.com/?azure-portal=true) and make sure you are in the correct environment that has the sample apps enabled.
2. Select **Solutions** and then select **+ New solution**.
3. Enter **Innovation Challenge Enhancements** for **Display name**, select **CDS Default Publisher** for **Publisher**, and select **Create**.

[![Screenshot of the new solution properties.](media/new-solution.png)](media/new-solution.png#lightbox)
4. The **Innovation Challenge Enhancements** you created should open.
5. Select **+ Add existing** and then select **Table**.
6. Enter team in the search textbox, select **Team Project**, and then select **Next**.

    Note

    If you're unable to locate **Team Project** table you may not have the sample apps in your environment. Select another environment or create a new one with the sample apps installed.
7. Select the **Edit objects** button.

[![Screenshot of the select components button.](media/select-components.png)](media/select-components.png#lightbox)
8. Select the **Forms** tab, select the **Information** form of **Form type** Main, and then select **Add**.

[![Screenshot of the add component window.](media/add-component.png)](media/add-component.png#lightbox)
9. Select **Add** again.
10. Open the **Team Project** table you just added to the solution.
11. Select **Forms** in the **Data experiences** card.
12. Open the **Information** form that is **Form type** Main.

[![Screenshot of the information form.](media/information.png)](media/information.png#lightbox)
13. Select the **Status** section.

[![Screenshot of the status section.](media/status.png)](media/status.png#lightbox)
14. In the **Properties** pane, change the **Name** to **section\_status**. By default, a GUID is assigned as the section name. Change it to a more meaningful name to reference in your scripts. Next, check the **Hide** checkbox. This hides the section by default to reduce the jarring effect of showing and then hiding on load of the form.

[![Screenshot of the hide checkbox.](media/hide.png)](media/hide.png#lightbox)
15. Go to the Tree view and select the **General** tab.

[![Screenshot of the general tab.](media/general.png)](media/general.png#lightbox)
16. In the Properties pane, change the **Name** to **tab\_general**.
17. Select the **Project start** column.

[![Screenshot of the project start column.](media/project-start.png)](media/project-start.png#lightbox)
18. Go the **Properties** pane and select the **(i)** button next to the **Table column** name.
19. Copy the **Logical name** (**sample\_projectstart**) and paste it into a notepad. You use this name in your script to reference this column.

[![Screenshot of the information button with the logical name displayed.](media/information-button.png)](media/information-button.png#lightbox)
20. Select **Save and publish** to save your changes. Wait for the publishing to complete.
21. Select the **Back** button.

[![Screenshot of the back button.](media/back.png)](media/back.png#lightbox)
22. Select **All**.
23. Select **Publish all customizations**, and wait for the publishing to complete.

## Task 2 - Build the client script

In this task, you create a script that shows/hides the status section based on the project start date.

You'll hide the status section if the project start date is empty or in the future. Otherwise, the status section shows.

1. Start a new instance Visual Studio Code or use your favorite code editor. You can download and install [Visual Studio Code](https://code.visualstudio.com/?azure-portal=true).
2. Select **Open Folder**.

[![Screenshot of the open folder button.](media/open-folder.png)](media/open-folder.png#lightbox)
3. Create a folder in your Documents folder and name it **ClientScriptLab**.
4. Select the **ClientScriptLab** folder you created and **Select Folder**.

[![Screenshot of the select folder screen and button.](media/select-folder.png)](media/select-folder.png#lightbox)
5. Hover over the **CLIENTSCRIPTLAB** folder and select **New File**.

[![Screenshot of the new file button.](media/new-file.png)](media/new-file.png#lightbox)
6. Name the file **FormTeamProject.js**.
7. Add the below functions to **FormTeamProject.js**. Your functions should have either unique names or use a namespace to ensure uniqueness.

    ```javascript
    function LearnLab_handleTeamProjectOnLoad(executionContext) {
    
    }
    function LearnLab_handleProjectStatusOnChange(executionContext) {
    
    }
    function LearnLab_hideOrShowStatusSection(formContext) {
    
    }
    ```
8. Add this script to the code's **OnLoad** function. Notice the project start column name here **sample\_projectstart**. This is the logical name you saved earlier. This code registers an **onChange** event handler and calls a common function to show/hide the section. You need to handle on change in case a project start date input changes the hide/show requirement.

    ```javascript
    var formContext = executionContext.getFormContext();
    formContext.getAttribute('sample_projectstart').addOnChange(LearnLab_handleProjectStatusOnChange);
    LearnLab_hideOrShowStatusSection(formContext);
    ```

[![Screenshot of the onload function.](media/onload-function.png)](media/onload-function.png#lightbox)
9. Add this script to the OnChange function. This code simply gets the formContext and then calls the common function to hide/show.

    ```javascript
    var formContext = executionContext.getFormContext();
    LearnLab_hideOrShowStatusSection(formContext);
    ```
10. Add this script to the **hideOrShowStatusSection** function. Notice the tab name **tab\_general**, the section name **section\_status**, and column name **sample\_projectstart**.

    ```javascript
    var tabGeneral = formContext.ui.tabs.get('tab_general');
    var sectionStatus = tabGeneral.sections.get('section_status');
    var startDate = formContext.getAttribute('sample_projectstart').getValue();
    var CurrentDate = new Date();
    if (startDate == null || startDate > CurrentDate) {
      sectionStatus.setVisible(false);
    } else {
      sectionStatus.setVisible(true);
    }
    ```
11. Your script should now look like this image.

[![Screenshot of an example script.](media/example-script.png)](media/example-script.png#lightbox)
12. Select **File** and **Save**.

## Task 3 - Upload the script

In this task, you load the script you created into your environment.

1. Navigate to [Power Apps maker portal](https://make.powerapps.com/?azure-portal=true) and make sure you are in the correct environment.
2. Select **Solutions** and open the **Innovation Challenge Enhancements** solution.
3. Select **+ New** and then select **More | Web resource**.

[![Screenshot of the add new web resource button.](media/new-web-resource.png)](media/new-web-resource.png#lightbox)
4. Enter **FormTeamProject.js** for **Name**, enter **FormTeamProject.js** for **Display name**, select **Java script (JS)** for **Type**, and select **Choose File.**

[![Screenshot of the choose web resource file button.](media/choose-file.png)](media/choose-file.png#lightbox)
5. Select the **FormTeamProject.js** file you created earlier and then select **Open**.
6. Select **Save**.
7. Your solution should now have the **Team Project** table and the **FormTeamsProject.js** web resource.
8. Don't navigate away from this page.

## Task 4 - Edit form

In this task, you add JavaScript library to the Team Project main form and add an event handler for the **On Load** event.

1. Make sure you're still in the **Innovation Challenge Enhancements** solution.
2. Expand **Tables** and then expand the **Team Project** table.
3. Select **Forms** and open the **Information** form.
4. Go to the **Properties** pane, and select the **Events** tab. Expand **OnLoad** if it's collapsed, and select **+ Event Handler**. In **Configure Event**, select **+ Add library**.

[![Screenshot of the add new library to form button.](media/add-new-library.png)](media/add-new-library.png#lightbox)
5. Enter **team** in the search textbox and press **Enter**. Select **FormTeamProject.js**, and select **Add**.

[![Screenshot of the add javascript library window.](media/javascript-library.png)](media/javascript-library.png#lightbox)
6. Enter **LearnLab\_handleTeamProjectOnLoad** under **Function**, check the **Pass execution context as first parameter** checkbox, and select **Done**.

[![Screenshot showing the Configure Event dialog.](media/configure-event-details.png)](media/configure-event-details.png#lightbox)
7. Select **Save and publish** and wait for your changes to be saved.
8. Once your changes have been saved and published, select the **Back** button.
9. Select **All**.
10. Select **Publish all customizations** and wait for the publishing to complete.

## Task 5 - Test

In this task, you test your script.

1. Navigate to [Power Apps maker portal](https://make.powerapps.com/?azure-portal=true), and make sure you are in the correct environment.
2. Select **Apps**, and open the **Innovation Challenge** application.
3. Select **Team Projects**, and open the **Cloud Computing** team project.
4. The **Status section** should be hidden because the **Project start** column is empty.

[![Screenshot of empty project start column and hidden status section.](media/project-start-value.png)](media/project-start-value.png#lightbox)
5. Press calendar icon next to the **Project start** and select today's date.
6. The **Status** section should become visible.

[![Screenshot of the project start value set to today with the status section visible.](media/project-start-today.png)](media/project-start-today.png#lightbox)
7. Change the **Project start** to a future date.
8. The **Status** section should now become hidden.
9. Change the **Project start** to a date in the past.
10. The **Status** section should become visible again.

You have now used JavaScript and Client API to implement business requirements that aren't possible to implement using declarative options like business rules.
