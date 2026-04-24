# Exercise - Use client script to hide a form section

- 9 minutes

In this exercise, you use client script to implement the business requirement of hiding the Status section when a project start date either isn't provided or is in the future.

> **Important:** Use a test environment with Microsoft Dataverse provisioned and the sample apps enabled.

## Task 1 - Prepare solution with the form

In this task, you will create a solution, add an existing table to the solution, and prepare the main form of the table you added to the solution.

1. Navigate to [Power Apps maker portal](https://make.powerapps.com/) and make sure you are in the correct environment that has the sample apps enabled.
2. Select **Solutions** and then select **+ New solution**.
3. Enter **Innovation Challenge Enhancements** for **Display name**, select **CDS default publisher** for **Publisher**, and select **Create**.
4. The **Innovation Challenge Enhancements** solution you created should open.
5. Select **+ Add existing** and then select **Table**.
6. Enter `team` in the search textbox, select **Team Project**, and then select **Next**.

   > **Note:** If you are unable to locate **Team Project** table you may not have the sample apps in your environment. Select another environment or create a new one with the sample apps installed.

7. Select the **Edit objects** button.
8. Select the **Forms** tab, select the **Information** form of **Form type** Main, and then select **Add**.
9. Select **Add** again.
10. Open the **Team Project** table you just added to the solution.
11. Select **Forms** in the **Data experiences** card.
12. Open the **Information** form that is **Form type** Main.
13. Select the **Status** section.
14. In the **Properties** pane, change the **Name** to `section_status`. Check the **Hide** checkbox to hide the section by default.
15. Go to the Tree view and select the **General** tab.
16. In the Properties pane, change the **Name** to `tab_general`.
17. Select the **Project start** column.
18. Go to the **Properties** pane and select the **(i)** button next to the **Table column** name.
19. Copy the **Logical name** (`sample_projectstart`) and paste it into a notepad. You will use this name in your script.
20. Select **Save and publish** to save your changes. Wait for the publishing to complete.
21. Select the **Back** button.
22. Select **All**.
23. Select **Publish all customizations**, and wait for the publishing to complete.

## Task 2 - Build the client script

In this task, you'll create a script that shows/hides the status section based on the project start date.

The logic: hide the status section if the project start date is empty or in the future; otherwise show it.

1. Open Visual Studio Code (or your favorite code editor).
2. Select **Open Folder**.
3. Create a folder in your Documents folder named **ClientScriptLab**, then select it and click **Select Folder**.
4. Hover over the **CLIENTSCRIPTLAB** folder and select **New File**.
5. Name the file `FormTeamProject.js`.
6. Add the following function stubs to `FormTeamProject.js`:

    ```javascript
    function LearnLab_handleTeamProjectOnLoad(executionContext) {

    }

    function LearnLab_handleProjectStatusOnChange(executionContext) {

    }

    function LearnLab_hideOrShowStatusSection(formContext) {

    }
    ```

7. Add this code to the **OnLoad** function. This registers an `onChange` event handler and calls the common function to show/hide the section:

    ```javascript
    var formContext = executionContext.getFormContext();
    formContext.getAttribute('sample_projectstart').addOnChange(LearnLab_handleProjectStatusOnChange);
    LearnLab_hideOrShowStatusSection(formContext);
    ```

8. Add this code to the **OnChange** function:

    ```javascript
    var formContext = executionContext.getFormContext();
    LearnLab_hideOrShowStatusSection(formContext);
    ```

9. Add this code to the **hideOrShowStatusSection** function. Notice the tab name `tab_general`, the section name `section_status`, and column name `sample_projectstart`:

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

10. Select **File** and **Save**.

The complete script should look like this:

```javascript
function LearnLab_handleTeamProjectOnLoad(executionContext) {
    var formContext = executionContext.getFormContext();
    formContext.getAttribute('sample_projectstart').addOnChange(LearnLab_handleProjectStatusOnChange);
    LearnLab_hideOrShowStatusSection(formContext);
}

function LearnLab_handleProjectStatusOnChange(executionContext) {
    var formContext = executionContext.getFormContext();
    LearnLab_hideOrShowStatusSection(formContext);
}

function LearnLab_hideOrShowStatusSection(formContext) {
    var tabGeneral = formContext.ui.tabs.get('tab_general');
    var sectionStatus = tabGeneral.sections.get('section_status');
    var startDate = formContext.getAttribute('sample_projectstart').getValue();
    var CurrentDate = new Date();
    if (startDate == null || startDate > CurrentDate) {
        sectionStatus.setVisible(false);
    } else {
        sectionStatus.setVisible(true);
    }
}
```

## Task 3 - Upload the script

In this task, you load the script you created into your environment.

1. Navigate to [Power Apps maker portal](https://make.powerapps.com/) and make sure you are in the correct environment.
2. Select **Solutions** and open the **Innovation Challenge Enhancements** solution.
3. Select **+ New** and then select **More | Web resource**.
4. Enter `FormTeamProject.js` for **Name**, enter `FormTeamProject.js` for **Display name**, select **JavaScript (JS)** for **Type**, and select **Choose File**.
5. Select the `FormTeamProject.js` file you created earlier and then select **Open**.
6. Select **Save**.
7. Your solution should now have the **Team Project** table and the **FormTeamProject.js** web resource.

## Task 4 - Edit form

In this task, you'll add the JavaScript library to the Team Project main form and add an event handler for the **On Load** event.

1. Make sure you're still in the **Innovation Challenge Enhancements** solution.
2. Expand **Tables** and then expand the **Team Project** table.
3. Select **Forms** and open the **Information** form.
4. Go to the **Properties** pane, and select the **Events** tab. Expand **OnLoad** if it is collapsed, and select **+ Event Handler**. In **Configure Event**, select **+ Add library**.
5. Enter `team` in the search textbox and press **Enter**. Select **FormTeamProject.js**, and select **Add**.
6. Enter `LearnLab_handleTeamProjectOnLoad` under **Function**, check the **Pass execution context as first parameter** checkbox, and select **Done**.
7. Select **Save and publish** and wait for your changes to be saved.
8. Once your changes have been saved and published, select the **Back** button.
9. Select **All**.
10. Select **Publish all customizations** and wait for the publishing to complete.

## Task 5 - Test

In this task, you'll test your script.

1. Navigate to [Power Apps maker portal](https://make.powerapps.com/), and make sure you are in the correct environment.
2. Select **Apps**, and open the **Innovation Challenge** application.
3. Select **Team Projects**, and open the **Cloud Computing** team project.
4. The **Status section** should be hidden because the **Project start** column is empty.
5. Press the calendar icon next to the **Project start** and select today's date.
6. The **Status** section should become visible.
7. Change the **Project start** to a future date — the **Status** section should now become hidden.
8. Change the **Project start** to a date in the past — the **Status** section should become visible again.

You have now used JavaScript and Client API to implement business requirements that aren't possible to implement using declarative options like business rules.
