# Exercise - Use table data from client script

- 14 minutes

In this exercise, you use a client script to implement the business requirement of making columns on the form required based on the values in a related table. You set the requirement level of columns on the Idea form in the Innovation Challenge sample app based on the value of columns on the Challenge table. To accomplish this, you use the `Xrm.WebAPI` methods to retrieve the related data.

> **Important:** Use a test environment with Microsoft Dataverse provisioned and the sample apps enabled. If you don't have one you can sign up for the [community plan](https://powerapps.microsoft.com/communityplan/).

## Task - Prepare solution

In this task, you create a solution, add existing tables to the solution, add new columns, and prepare the main form of one of the tables you added to the solution.

1. Navigate to [Power Apps maker portal](https://make.powerapps.com/) and make sure you're in the correct environment that has the sample apps enabled.

2. Select **Solutions** and then select **+ New solution**.

3. Enter **Innovation Challenge Web API** for **Display name**, select **CDS default publisher** for **Publisher**, and select **Create**.

4. The **Innovation Challenge Web API** solution you created should open.

5. Select **+ Add existing** and then select **Table**.

6. Enter *idea* in the Search textbox, select **Idea**, and then select **Next**.

   > **Note:** If you're unable to locate the **Idea** table, you may not have the sample apps in your environment. Select another environment or create a new one with the sample apps installed.

7. Select the **Edit objects** button.

8. Select the **Forms** tab, select the **Information** form of **Form type** Main, and then select **Add**.

9. Select **Add** again.

10. Select **+ Add existing** and select **Table** again.

11. Search for **challenge**, select **Challenge**, and then select **Next**.

12. Select the **Edit objects** button.

13. Select the **Forms** tab, select the **Information** form of **Form** type **Main**, and then select **Add**.

14. Select **Add** again.

15. Open the **Challenge** table you just added to the solution.

16. Select **+ New** and then select **Column**. You're adding two columns to indicate what data is required for Idea rows created for this Challenge.

17. Enter **Investment Required** for **Display name**, select **Choice | Yes/No** for **Data type**, expand the **Advanced options**. Make a note of the **prefix** of the **Schema name**; your prefix is different. You need this when you're creating the script and want to refer to the fields you're adding.

18. Select **Save**.

19. Select **+ New** and then select **Column** again.

20. Enter **ROI Required** for **Display name**, select **Choice | Yes/No** for **Data type**, and select **Save**.

21. Expand the **Challenge** table on the left side and then select **Forms**.

22. Open the **Information** form you added to the solution.

23. Select the **Table columns** tab.

24. Add the **Investment Required** column to the form.

25. Add the **ROI Required** to the form.

26. The form should now look like the updated layout. Select **Save and publish**. Wait for the publishing to be completed.

27. Go back to the solution by selecting the back button.

## Task - Create client script

In this task, you create a script that sets the required level for columns on the Idea table based on the Challenge table's column values.

1. Start a new instance of Visual Studio Code or use your favorite code editor. You can download and install [Visual Studio Code](https://code.visualstudio.com/).

2. Select **Open Folder**.

3. Create a folder in your Documents folder and name it **ClientScriptLab**.

4. Select the **ClientScriptLab** folder you created and select the **Select Folder** button.

5. Hover over the **CLIENTSCRIPTLAB** folder and select **New File**.

6. Name the file **IdeaForm.js**.

7. Add the below functions to **IdeaForm.js**. Your functions should have either unique names or use a namespace to ensure uniqueness.

```javascript
function LearnLab_handleIdeaOnLoad(executionContext) {
}
function LearnLab_handleChallengeOnChange(executionContext) {
}
```

8. Add this script to the **OnLoad** function. This script registers an **OnChange** event handler, you need to handle OnChange in case the related challenge changes.

```javascript
var formContext = executionContext.getFormContext();
formContext.getAttribute('sample_originatingchallengeid').addOnChange(LearnLab_handleChallengeOnChange);
```

9. Add this script to the **OnChange** function. This code simply gets the formContext.

```javascript
var formContext = executionContext.getFormContext();
```

10. Add this function to the **IdeaForm** file. This function is called from both OnLoad and OnChange functions and the formContext is passed as an argument. This is where you implement the business logic to set the requirement levels.

```javascript
function LearnLab_setRequiredFields(formContext) {
}
```

11. You first get the challenge lookup values. Add this script to the **setRequiredFields** function.

```javascript
var challenge = formContext.getAttribute('sample_originatingchallengeid').getValue();
```

12. You then check if the **challenge** value is null. Add this script to the **setRequiredFields** function.

```javascript
if (challenge != null) {
}
else {
}
```

13. You make the columns not required if the challenge is null. Add this script inside the **else**. This ensures if a challenge isn't selected the columns aren't required.

```javascript
formContext.getAttribute("sample_investmentrequired").setRequiredLevel('none');
formContext.getAttribute("sample_timetoroimonths").setRequiredLevel('none');
```

14. You get the ID of the related **challenge** if the challenge isn't null. Add this script inside the **if** statement.

```javascript
var challengeId = challenge[0].id;
```

15. Now you retrieve the challenge row using **WebAPI** and select only the two columns you're interested in, **InvestmentRequired** and **ROIRequired**. Add the script inside if statement.

> **Note:** Replace **crc8c** with your prefix from Task 1.

```javascript
Xrm.WebApi.retrieveRecord("sample_challenge", challengeId, "?$select=crc8c_investmentrequired,crc8c_roirequired").then(
    function success(result) {
    },
    function (error) {
    }
);
```

16. If the **retrieveRecord** succeeds, you first create two variables that hold the requirement values for both columns and set their initial value to not required. After that you check whether the columns are required and set the requirement variable accordingly. Finally you set the column requirement to the value of the variable you created. Add this script inside the success function.

> **Note:** Replace **crc8c** with your prefix from task 1.

```javascript
var investmentRequired = 'none';
var roiRequired = 'none';
if (result.cr07c_investmentrequired) {
    investmentRequired = 'required';
}
if (result.cr07c_roirequired) {
    roiRequired = 'required';
}
formContext.getAttribute("sample_investmentrequired").setRequiredLevel(investmentRequired);
formContext.getAttribute("sample_timetoroimonths").setRequiredLevel(roiRequired);
```

17. You log the error message if **retrieveRecord** causes an error. Add this script inside the error function. You could also use methods from `Xrm.Navigation` to show a dialog to the user with appropriate options if necessary.

```javascript
console.log(error.message);
```

18. You call the **LearnLab_setRequiredFields** from both **OnLoad** and **OnChange** functions. Add this script to both **OnLoad** and **OnChange** functions.

```javascript
LearnLab_setRequiredFields(formContext)
```

19. Select **File** and **Save all**.

## Task - Upload the script

In this task, you load the script you created into your environment.

1. Navigate to [Power Apps maker portal](https://make.powerapps.com/) and make sure you're in the correct environment.

2. Select **Solutions** and open the **Innovation Challenge Web API** solution.

3. Select **+ New** and select **More | Web resource**.

4. Enter **IdeaForm.js** for **Name**, enter **IdeaForm.js** for **Display name**, select **Java script (JS)** for **Type**, and then select **Choose File**.

5. Select the **IdeaForm.js** file you created earlier and then select **Open**.

6. Select **Save**.

7. Your solution should now have the **Challenge** table, **Idea** table, and the **IdeaForm.js** web resource.

8. Don't navigate away from this page.

## Task - Edit form

In this task, you add the JavaScript library to the Idea main form and add an event handler for the On Load event.

1. Make sure you're still in the **Innovation Challenge Web API** solution.

2. Expand the **Idea** table and select **Forms**.

3. Open the **Main Information** form.

4. Select the **Form libraries** tab.

5. Select **+ Add library**.

6. Enter **idea** in the search textbox and press Enter. Select **IdeaForm.js**, and then select **Add**.

7. Select the **Events** tab from the right.

8. Expand the **On Load** section and select **+ Event Handler**.

9. Enter **LearnLab_handleIdeaOnLoad** for **Function**, check the **Pass execution context as first parameter** checkbox, and select **Done**.

10. Select **Save and publish** and wait for the publishing to complete.

11. Select the **Back** button.

12. Select **All**.

13. Select **Publish all customizations** and wait for the publishing to complete.

## Task - Test

In this task, you test your script.

1. Navigate to [Power Apps Maker Portal](https://make.powerapps.com/) and make sure you're in the correct environment.

2. Select **Apps** and launch the **Innovation Challenge** application.

3. Select **Challenges** and open one of the **Challenge** rows.

4. The **Investment Required** and **ROI Required** should be empty. Select **Related** and select **Ideas**.

5. Open one of the **Ideas**.

6. Clear the **Investment Required** and **Time to ROI (months)** column values.

7. The columns aren't required because the requirement columns on the Challenge table are empty. Select the back button.

8. Select the Details tab and select **Yes** for both **Investment Required** and **ROI Required**.

9. Select the **Ideas** tab and open the same idea you selected last time.

10. The two columns should now be required.
