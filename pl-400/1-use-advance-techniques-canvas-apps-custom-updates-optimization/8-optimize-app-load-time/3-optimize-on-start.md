# Optimize App.OnStart

The **OnStart** property on the app object runs when a user starts your app. The property is commonly used to evaluate formulas for retrieving and caching data that you want to preload and for setting global variables. The **App.OnStart** property can become too busy with this work, which can cause performance problems. This unit explores available alternatives to reduce these types of problems.

## Navigate on app startup

A common need during app startup is to select the first screen that the user views. Previously, adding conditional logic and using the `Navigate()` function in the **App.OnStart** property was common practice. Using `Navigate()` in **OnStart** has been retired, and all new apps are prohibited from using the `Navigate()` function from **App.OnStart**.

### Use App.StartScreen

The new approach is to use the **App.StartScreen** property. By default, this property will be empty, and the first screen in the screen tree view is shown. If you're evaluating the formula provided for the **StartScreen** property and it results in an error, the first screen will return as if the property is empty. You can use the `IfError()` function to catch errors and redirect to an appropriate error screen.

**StartScreen** is a data flow property that can't contain behavior functions. All data flow functions are available, including:

- `Param()` - to read parameters used to start the app
- `User()` - to read information about the current user
- `LookUp()`, `Filter()`, `CountRows()`, `Max()`, and other functions that read from a data source
- Any call through a connector (should implement quickly)
- Signals such as `Connection`, `Compass`, and `App`

> **Note:** Global variables and collections, including those created in **OnStart**, aren't available in the **StartScreen** property.

The **StartScreen** property is evaluated once at startup. You can manually force it to be reevaluated by using the **Navigate to StartScreen** context menu command for the app object.

### Migrating from Navigate() in OnStart

If you have an older app, you should update it to use the new **StartScreen** property. Until your app is updated, you can go to **Settings > Updates > Retired** tab and turn off the **Enable Navigate function in App.OnStart** toggle switch to continue (for a limited time) using the `Navigate()` function in **OnStart**.

## Use OnVisible instead of OnStart

Review the formulas that you have in **App.OnStart**, and if they only preload information for a single screen, then move the logic from **App.OnStart** to that screen's **OnVisible** property.

## Review app settings

New app settings regularly become available with Power Apps updates. Consider the following app settings when you're optimizing app load functionality:

- **Enable App.OnStart property** - This setting is turned on by default. Consider turning off the setting if you don't need **OnStart** and want to discourage its use.
- **Use non-blocking OnStart rule** - In published apps, this setting allows **App.OnStart** formulas to run concurrently with other app rules. When the setting is turned off, your other rules wait for **App.OnStart** to finish. This setting is turned on by default for new apps, but you must enable it for older apps.
