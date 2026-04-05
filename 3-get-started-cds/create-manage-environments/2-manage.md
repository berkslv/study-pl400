# Create and Manage an Environment

A default environment is automatically created for you when you sign up for Power Apps, Dynamics 365, or if you have a Microsoft 365 account with Microsoft. At least one environment is always designated as the default when you start to work with Microsoft Dataverse.

## Cases for Creating Dataverse Environments

There are many reasons why you might create an environment with Dataverse in your tenant. Bear in mind that once you create an environment with Dataverse in it, you can access that Dataverse data from other environments as well. Dataverse creation with an environment reserves up to 1 GB in storage, so you should have a plan when setting up Dataverse environments.

A use case with only one instance of Dataverse for two environments could be when you have a development environment and a testing environment. In this scenario, you might want to share the same Dataverse database between the two environments. You can create two environments, one for development and one for testing. Your development environment could include a Dataverse database, while your testing environment doesn't, or vice-versa. You can develop your app in the development environment. Then once you move to the testing environment, you can connect to the same Dataverse database created with the development environment.

Another use case would be keeping production data separate from development/testing data. In this case you might create a production environment with its own Dataverse database, and you could restrict data access to the production environment. That way you could have two Dataverse environments with separate data.

## Exercise: Create a New Environment with Dataverse

1. Sign in to the [Power Platform admin center](https://admin.powerplatform.microsoft.com/).
2. Select **Environments** from the left-hand side rail.
3. Select the **New** button from the top left side of the command bar.
4. In the **New Environment** panel on the right side of your screen, name the new environment, select the region, choose the type, and describe the purpose. Toggle **Add a Dataverse data store** to **Yes** if creating a sandbox or production environment, then select **Next**.
5. The **Add Dataverse** panel appears. Configure the following:
   - **Language** and **Currency** default to the selected region.
   - **Security group** — you must select one.
   - Optionally set a custom URL, enable Dynamics 365 apps, and deploy sample apps with data.
6. Select **+ Select** for the security group to choose a group, or choose **None** under "Open access" to allow all tenant users to access the environment. Select **Done**.
7. Select **Save** to create the new environment.

> **Tip:** Each environment requires 1 GB of storage space from your tenant. You can't create a new environment without sufficient storage.

## Add Dataverse to an Existing Environment

If you need to add Dataverse to an environment that was created without it:

1. Sign in to the [Power Platform admin center](https://admin.powerplatform.microsoft.com/).
2. Select **Environments** and choose an environment where the **Dataverse** column shows **No**.
3. Select **Add Dataverse** from the environment details screen.
4. Confirm your selections and select **Add**.
