# Optimize App.OnStart

Completed

- 5 minutes

The **OnStart** property on the app object runs when a user starts your app. The property is commonly used to evaluate formulas for retrieving and caching data that you want to preload and for setting global variables. The **App.OnStart** property can become too busy with this work, which can cause performance problems. To help reduce these types of problems, alternative approaches are available, or are being invested in, for upcoming Microsoft Power Platform releases. Use available alternatives when they fit your app needs. This topic explores some of the available alternatives.

## Navigate on app startup

A common need during app startup is to select the first screen that the user views. For example, the app could open a welcome screen on first run or implement [deep linking](/en-us/power-apps/maker/canvas-apps/how-to/deep-linking) into a specific detail page. Previously, adding conditional logic and using the Navigate() function in the **App.OnStart** property was common practice. Using Navigate() in **OnStart** has been retired, and all new apps are prohibited from using the Navigate() function from **App.OnStart**.

The new approach is to use the **App.StartScreen** property. By default, this property will be empty, and the first screen in the screen tree view is shown. If you're evaluating the formula that was provided for by the **StartScreen** property and it results in an error, the first screen will return as if the property is empty. You can use the IfError() function to catch errors and redirect to an appropriate error screen.

You can set the **StartScreen** property to a specific screen to ensure that, if it's moved in the tree, it's still the start screen. You can also have conditional logic, similar to the following image, that looks up the user. If the user doesn't have an address, they're sent to the **ChooseLocation** screen instead of the **HomeScreen**.

[![Screenshot of the StartScreen property of the app.](media/1-conditional-logic.png)](media/1-conditional-logic.png#lightbox)

**StartScreen** is a data flow property that can't contain behavior functions. All data flow functions are available, and the following examples are common:

- Param() function to read parameters that are used to start the app
- User() function to read information about the current user
- LookUp(), Filter(), CountRows(), Max(), and other functions that read from a data source
- Any call through a connector, but it should implement quickly
- Signals such as Connection, Compass, and App

Global variables and collections, including those that are created in **OnStart**, aren't available in the **StartScreen** property.

The **StartScreen** property is evaluated once at startup. If you need to test afterward, you can change the property. Alternatively, you can manually force it to be reevaluated by using the **Navigate to StartScreen** context menu command for the app object.

[![Screenshot of a context menu that is available for the app object in Power Apps Studio.](media/2-navigate-start-screen.png)](media/2-navigate-start-screen.png#lightbox)

If you have an older app, you should update your app to use the new **StartScreen** property. Until your app is updated, you can go to **Settings &gt; Updates &gt; Retired** tab and turn off the **Enable Navigate function in App.OnStart** toggle switch. By turning off this toggle switch, you can (for a limited time) continue to use the Navigate() function in **OnStart**.

[![Screenshot of going to app Settings > Updates > Retired tab and turning off the Enable Navigate function in App.Onstart option.](media/3-retired-features.svg)](media/3-retired-features.svg#lightbox)

## Use OnVisible instead of OnStart

Review the formulas that you have in **App.OnStart**, and if they only preload information for a single screen, then move the logic from **App.OnStart** to that screen's **OnVisible** property.

## Review app settings

New app settings regularly become available with Power Apps updates. It's a good practice to review them to determine if they could be helpful. Consider the following app settings when you're optimizing app load functionality:

- **Enable App.OnStart property** - This setting is turned on by default. Consider turning off the setting if you don't need **OnStart** and want to discourage its use.
- **Use non-blocking OnStart rule** - In published apps, this setting allows **App.OnStart** formulas to run concurrently with other app rules. When the setting is turned off, your other rules wait for **App.OnStart** to finish. This setting is turned on by default for new apps, but you must enable it for older apps.
