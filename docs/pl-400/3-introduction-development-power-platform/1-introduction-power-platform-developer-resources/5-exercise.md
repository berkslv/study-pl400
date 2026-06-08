# Exercise - Prepare development environment

Completed

- 15 minutes

In this exercise, you'll sign up for a Power Apps Developer Plan and learn how to create Power Platform environments and configure their settings.

## Task 1: Sign up for the developer plan

1. Navigate to [Power Apps Developer Plan](https://powerapps.microsoft.com/developerplan/?azure-portal=true) and select **Try for free**.
2. Enter your email address, check the box to agree to the Subscription Agreement and Privacy Statement. Click **Start free**.

[![Screenshot of sign up for the Developer plan sign up.](media/developer-plan.png)](media/developer-plan.png#lightbox)
3. Select your region and then **Accept**.
4. Navigate to [Power Platform admin center](https://admin.powerplatform.microsoft.com/?azure-portal=true) and select **Environments**.
5. You should see the newly created environment.
6. You'll now create a new developer environment. Select **+ New** environment button.
7. Enter **Dev** for Name, select your region, select **Developer** for Type, and then select **Next**.
8. Select a language, select a currency, select **Yes** for Deploy sample apps and data, and then select the **here** button under the **URL**.

[![Screenshot of the add dataverse to new environment dialog.](media/here.png)](media/here.png#lightbox)
9. You may provide your own unique URL here. Providing your own URL will make it easier to remember. Select **Save**

[![Screenshot of unique environment URL.](media/unique-environment.png)](media/unique-environment.png#lightbox)
10. You should now see your new environment listed with the list of environments.
11. Don't navigate away from this page.

## Task 2: Review and configure environment settings

1. Wait until the environment state changes to **Ready**. You should see a notification when your new environment is ready.
2. Select the Dev environment you created and then select the environment **Settings** button.

[![Screenshot of the environment setting button.](media/settings.png)](media/settings.png#lightbox)
3. Take a minute or two to review all the different environment settings available to you.
4. Expand the **Audit and logs** section and select **Audit settings**.
5. Check the **Start auditing** checkbox and select **Save**.

[![Screenshot of audit settings.](media/audit-settings.png)](media/audit-settings.png#lightbox)
6. Go back to the environment settings.
7. Expand the **Product** section and select **Features**.
8. Scroll down to the **Power Apps component framework for canvas apps** section.
9. Turn **On** Allow publishing of canvas apps with code components.

[![Screenshot of the allow publishing of canvas apps with code components toggle button.](media/allow.png)](media/allow.png#lightbox)
10. Scroll down and select **Save**.

## Task 3: Run sample Power Apps from maker portal

1. Navigate to [Power Apps maker portal](https://make.powerapps.com/?azure-portal=true) and select the **Dev** environment you created.
2. Select **Apps**, select the **Asset Checkout** model-driven application, and then select **Edit**.

[![Screenshot of the edit application button.](media/edit.png)](media/edit.png#lightbox)
3. Take a few minutes to review the different areas of the model-driven app designer.
4. After you're done, select the **&lt;-** Back button.
5. You should now be back on the list of apps. Select the **Asset Checkout** application and then select **Play** to launch the application.
6. Take some time to familiarize yourself with the user experience of the model-driven application if you're new to model-driven applications.
7. Close the model-driven application.

## Task 4: Import and review the Creator Kit

1. Download the **Creator Kit Core** solution from [here](https://aka.ms/creatorkitdownload) and save it to your machine.
2. Download the **Creator Kit Reference (MDA)** from [here](https://aka.ms/creatorkitreferencemda) and save it to your machine.
3. Navigate to [Power Apps maker portal](https://make.powerapps.com/?azure-portal=true) and select the **Dev** environment you created.
4. Select **Solutions** and then select the **Import solution** button.

[![Screenshot of the import solution button.](media/import-solution.png)](media/import-solution.png#lightbox)
5. Select the **Browse** button.
6. Select the **CreatorKitCore** solution you downloaded and then select **Open**.
7. Select **Next**.
8. Select **Import** and wait for the solution import to complete. You should see a notification when the import is completed.
9. After the solution import completes, select **Solutions** and then select the **Import solution** button again.
10. Select the **Browse** button.
11. Select the **CreatorKitReferencesMDA** solution you downloaded and then select **Open**.
12. Select **Next**.
13. Select **Import** and wait for the solution import to complete. You should see a notification when the import is completed.
14. You should now have both solutions you imported listed in the solutions view.

[![Screenshot of the imported solutions.](media/solutions.png)](media/solutions.png#lightbox)
15. Select **Apps** and launch the **Creator Kit Reference App**.
16. Select **Allow** if prompted for permission.
17. The application showcases several PCF components. Go to the **Basic** category and select **Icon**.
18. Read the description and best practices.

[![Screenshot of the icon basic input components.](media/icon.png)](media/icon.png#lightbox)
19. See the different use cases for the icon components.
20. Take a few minutes to review some of the other components.
21. You can review the code for different components on [GitHub](https://github.com/microsoft/PowerApps-Samples/?azure-portal=true).
