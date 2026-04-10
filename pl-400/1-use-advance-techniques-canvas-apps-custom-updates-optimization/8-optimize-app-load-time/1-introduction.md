# Introduction

First impressions are important. The first impression that app users get is the length of time that it takes for the app to display the first screen or to provide other visual feedback, such as progress indicators. During startup, your app performs several steps to prepare for the presentation of the first screen: Authenticate, get metadata, **OnStart** processing, and render screens.

- **Authenticate** - Handles all authentication prompts for connections that are configured for the app. Removing connectors that aren't in use can reduce the number of prompts and accelerate the process.
- **Get metadata** - Retrieves metadata, such as the version of the Microsoft Power Apps platform on which the app runs and the sources from which it must retrieve data.
- **OnStart processing** - Evaluates the formulas that you have set up in the **OnStart** property. Streamlining the performance of this processing has a direct impact on improving the load time of the app.
- **Render screens** - The first screen is prepared and presented to the user. Specified OnVisible formulas are implemented first. Optimizing formulas and minimizing the number of controls on the screen can improve load time.

This module explains how you can evaluate your app load time and identify strategies for improvement.

## Evaluate your app load time

When you're evaluating app load time, a good place to start is establishing a baseline for how long it takes for your app to load. You can accomplish this task by measuring the startup time from launching the application to the time when you believe that you have a usable app. Use a stopwatch to measure the time from launching the app to when you believe a person can start using it. Tools that you can use to measure and drill into the performance details during the load time are discussed later in this module. We recommend that you conduct a new evaluation with each app update so that you can compare the new version with your prior baseline and then identify significant increases in load time.

Measuring startup time helps you get actual timings; however, you should consider observing and asking users about their perception of the app's performance. Occasionally, you can have an app that loads in a few seconds, but users might perceive it to be much longer because they don't regard the app as usable yet. For example, that situation could happen because the app, after displaying the first screen, continues to load data and update the information even though users are already interacting with it. Approaches to solving these two problems differ. If you're trying to improve load time, then you can usually get imperative data that points you to where your app is spending time. If you're trying to improve user perception, then you need to observe the person using the app to understand how they use it and what changes might improve their perception. Small changes can help improve perception, such as adding text prompts to start the interaction or changing the start screen to persist and reload most recent records.

Commonly, you will discover components that slow down an app by viewing the app's **OnStart** property or the **OnVisible** property of the first screen. By optimizing or deferring work that is performed in these properties, you can accelerate load time. Some of these techniques will be explained later in this module.

If you view analytics for your app from the maker portal, it will include the **Time to first screen** and **Time to first screen without connection setup** analytics. The data is provided for the last 30 days and can be helpful in providing a summary of your app's performance.

The [Power Apps Review Tool](https://github.com/microsoft/powerapps-tools/tree/master/Tools/Apps/Microsoft.PowerApps.CodeReview/) is another option for evaluating apps. This open-source tool is packaged as a solution that you can import into your Microsoft Dataverse environment. After you have imported the tool, you can use it to evaluate apps in your environment. You can upload *.msapp* files for evaluation as well. The automated review can check your app against a customizable checklist of best practices, and it can identify many common issues that can impact the app startup time and general performance of your apps.

Common rules that the tool can check that can impact startup time include:

- **Use of Concurrent function** - Consider using the Concurrent function for parallel independent data requests.
- **App Settings flags** - Review app settings. Ensure Delayed Load and Explicit Column Selection is On.
- **Delegation** - Ensure ClearCollect and Filter operations are delegable.
- **Asset Optimization** - Review embedded asset compression/size optimization.
- **Data loading strategy** - Review OnStart and OnVisible data loading strategy. Avoid data calls in OnStart. Move to OnVisible when possible. Ensure that only important data calls block user interaction with UI during initial load of the home screen.
- **Cross-screen dependencies** - Ensure that repeating UI elements are encapsulated in components (for example, menus, header, footer).

## Review your app settings

App settings can have a significant impact on the performance of your app; therefore, make sure that you review the app settings and their enabled status with each app update. Older apps might not have the latest app setting options enabled automatically to ensure that the new option doesn't break existing apps.

A good example is the **Debug published app** option. Enabling this option allows more debug information to be displayed when you use the app monitor to troubleshoot the published app. When this option is enabled, it can be detrimental to the performance and should not be left on for production use.

Another setting to consider is **Data row limit**. This setting determines the most rows that will be retrieved from a server-based connection when delegation is not supported. By default, this value is 500 and can be any value between 1 and 2,000. For example, with the **Data row limit** set to 2,000, the following expression might only preload a few rows in a development environment:

```powerappsfl
ClearCollect(colDesks,Desks)
```

The same app in a production environment with a fully populated dataset could retrieve the full 2,000 rows. As a result, the app will load much slower in production than in development.

In older apps, the **Enable Navigate function in App.OnStart** setting might be enabled. This setting allows you to use the Navigate() function in the **App.OnStart** property, but results in the first screen will not render until all your expressions in **App.OnStart** are evaluated. In more recent apps, this approach is not allowed, and you will need to use the **App.StartScreen** property instead.

The **Upcoming features** category has three sections: **Preview**, **Experimental**, and **Retired**.

- **Experimental** - Let you try a new feature but are not intended for production apps. Turned off by default.
- **Preview** - Typically turned on by default for new apps. These features are in their final stages of testing before becoming standard settings.
- **Retired** - Settings that have been deprecated.

## Limits and throttling

Each connector can have its own limit of retrieved data and throttling. Additionally, [service protection limits](https://learn.microsoft.com/en-us/power-apps/developer/data-platform/api-limits/) are in place at the platform level. Make sure that you are aware of these limits for the connectors that you use in your app. Apps that encounter these limits during startup might exhibit a slowdown in loading the app.

## Use a loading image

Using a loading image or a progress indicator during long operations in your app can improve user perception. The simplest way to use a loading image during the loading of your app is to use a component that has a spinning image. You can find a prebuilt image in the [Power Apps tools GitHub repository](https://github.com/microsoft/powerapps-tools/blob/master/Components/Preloader%20Component.msapp/).

You can import this component and place it on your initial screen on top of your other controls. Then, you can use a variable to control the visibility of the component. Set the `Visible` property to a variable such as `showLoader`.

Then, in **App.OnStart**, you can turn on the loading image before loading the data, and then you can turn off the image after the data is loaded:

```powerappsfl
Set(showLoader, true);

ClearCollect(colDesks, Desks);

ClearCollect(colDeskFeatures, 'Desk Features');

Set(showLoader, false);
```

While using a loading image doesn't speed up your application, it provides visual feedback and can help the user understand that the app is doing work in the background.
