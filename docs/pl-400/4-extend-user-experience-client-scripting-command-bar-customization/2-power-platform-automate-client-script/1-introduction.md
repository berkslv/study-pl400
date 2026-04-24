# Introduction to conducting global operations with the client API Xrm object

- 8 minutes

The Client API provides the **Xrm** object, which is globally available in your code, enabling various activities without relying on the execution context. At a high level, the following diagram illustrates each of the available properties and methods. For an in-depth overview of this object, see [Client API Xrm object](https://learn.microsoft.com/en-us/power-apps/developer/model-driven-apps/clientapi/clientapi-xrm/).

## App object

Using `addGlobalNotification` from the App object, you can display an error, information, warning, or success notifications for an app and specify actions to execute based on the notification. This notification is similar to form notifications, but you can use it outside the context of a form. For example, a command bar script could notify a user of an action completed. Use `clearGlobalNotification` method to clear a notification in the app.

## Device object

The `Xrm.Device` object exposes native device capabilities that are related to mobile device interactions, except for the `pickFile` method, which is also accessible through web clients. Canvas apps also provide an extensible framework for mobile development and should be considered in these scenarios. The following table is a summary of the methods that are available within the `Xrm.Device` object.

| Method | Description |
| --- | --- |
| [captureAudio](https://learn.microsoft.com/en-us/power-apps/developer/model-driven-apps/clientapi/reference/xrm-device/captureaudio/) | Invokes the device microphone to record audio. |
| [captureImage](https://learn.microsoft.com/en-us/power-apps/developer/model-driven-apps/clientapi/reference/xrm-device/captureimage/) | Invokes the device camera to capture an image. |
| [captureVideo](https://learn.microsoft.com/en-us/power-apps/developer/model-driven-apps/clientapi/reference/xrm-device/capturevideo/) | Invokes the device camera to record a video. |
| [getBarcodeValue](https://learn.microsoft.com/en-us/power-apps/developer/model-driven-apps/clientapi/reference/xrm-device/getbarcodevalue/) | Invokes the device camera to scan the barcode information, such as a product number. |
| [getCurrentPosition](https://learn.microsoft.com/en-us/power-apps/developer/model-driven-apps/clientapi/reference/xrm-device/getcurrentposition/) | Returns the current location by using the device geolocation capability. |
| [pickFile](https://learn.microsoft.com/en-us/power-apps/developer/model-driven-apps/clientapi/reference/xrm-device/pickfile/) | Opens a dialog box to select files from your computer (web client) or mobile device (mobile clients). |

Depending on the device configuration, some functionality isn't available. User consent may also be required for the app to access specific device capabilities. For example, the user may have globally disabled device location capabilities or refused the app camera access. When developing an app, beware that these methods may fail because of the device's capabilities, configuration, lack of permissions, or consent.

## Encoding object

You can use the `Xrm.Encoding` object to encode and decode XML and HTML strings. This encoding and decoding can be valuable when you're:

- Interacting with HTML web resources
- Encoding and decoding query string parameters
- Interacting with FetchXML that contains special characters like `&` or `<` in a search string

## Navigation object

The Navigation object provides navigation-related methods you can use within a model-driven application. Because of their blocking nature, activities such as showing alert, confirm, and error dialogs aren't considered an optimal user experience but are still available. In these scenarios, we recommend considering form notifications or other non-blocking mechanisms to warn users of an issue. Here's a summary of methods that are available within the `Xrm.Navigation` object.

| Method | Description |
| --- | --- |
| [openAlertDialog](https://learn.microsoft.com/en-us/power-apps/developer/model-driven-apps/clientapi/reference/xrm-navigation/openalertdialog/) | Displays an alert dialog that contains a message and a button. |
| [openConfirmDialog](https://learn.microsoft.com/en-us/power-apps/developer/model-driven-apps/clientapi/reference/xrm-navigation/openconfirmdialog/) | Displays a confirmation dialog box that contains a message and two buttons. |
| [openErrorDialog](https://learn.microsoft.com/en-us/power-apps/developer/model-driven-apps/clientapi/reference/xrm-navigation/openerrordialog/) | Displays an error dialog. |
| [openFile](https://learn.microsoft.com/en-us/power-apps/developer/model-driven-apps/clientapi/reference/xrm-navigation/openfile/) | Opens a file. |
| [openForm](https://learn.microsoft.com/en-us/power-apps/developer/model-driven-apps/clientapi/reference/xrm-navigation/openform/) | Opens a table form or a quick create form. |
| [openUrl](https://learn.microsoft.com/en-us/power-apps/developer/model-driven-apps/clientapi/reference/xrm-navigation/openurl/) | Opens a URL, including file URLs. |
| [openWebResource](https://learn.microsoft.com/en-us/power-apps/developer/model-driven-apps/clientapi/reference/xrm-navigation/openwebresource/) | Opens an HTML web resource. |

## Panel object

The `Xrm.Panel` object provides a method to display a webpage on the side pane of a model-driven app form. For more information, see [Xrm.Panel](https://learn.microsoft.com/en-us/power-apps/developer/model-driven-apps/clientapi/reference/xrm-panel/).

## Utility object

The `Xrm.Utility` object is a container for various useful methods. The following table is a summary of the methods that are available within the `Xrm.Utility` object. For more information, see [Xrm.Utility (Client API reference)](https://learn.microsoft.com/en-us/power-apps/developer/model-driven-apps/clientapi/reference/xrm-utility/).

| Method | Description |
| --- | --- |
| [closeProgressIndicator](https://learn.microsoft.com/en-us/power-apps/developer/model-driven-apps/clientapi/reference/xrm-utility/closeprogressindicator/) | Closes a progress dialog box that was opened using `showProgressIndicator`. |
| [getAllowedStatusTransitions](https://learn.microsoft.com/en-us/power-apps/developer/model-driven-apps/clientapi/reference/xrm-utility/getallowedstatustransitions/) | Returns the valid state transitions for the specified table and state code. |
| [getEntityMetadata](https://learn.microsoft.com/en-us/power-apps/developer/model-driven-apps/clientapi/reference/xrm-utility/getentitymetadata/) | Returns the entity metadata for the specified entity. |
| [getGlobalContext](https://learn.microsoft.com/en-us/power-apps/developer/model-driven-apps/clientapi/reference/xrm-utility/getglobalcontext/) | Retrieves the global context, providing runtime information such as organization settings, user settings, app details, and client information. |
| [getLearningPathAttributeName](https://learn.microsoft.com/en-us/power-apps/developer/model-driven-apps/clientapi/reference/xrm-utility/getlearningpathattributename/) | Returns the name of the DOM attribute that is expected by the learning path (guided help) content designer for identifying UI controls in the model-driven apps forms. |
| [getResourceString](https://learn.microsoft.com/en-us/power-apps/developer/model-driven-apps/clientapi/reference/xrm-utility/getresourcestring/) | Returns the localized string for a given key that is associated with the specified web resource. |
| [invokeProcessAction](https://learn.microsoft.com/en-us/power-apps/developer/model-driven-apps/clientapi/reference/xrm-utility/invokeprocessaction/) | Invokes an action based on the specified parameters. This method can also be used to invoke Custom APIs created by your developers. |
| [lookupObjects](https://learn.microsoft.com/en-us/power-apps/developer/model-driven-apps/clientapi/reference/xrm-utility/lookupobjects/) | Opens a lookup control to select one or more items. |
| [refreshParentGrid](https://learn.microsoft.com/en-us/power-apps/developer/model-driven-apps/clientapi/reference/xrm-utility/refreshparentgrid/) | Refreshes the parent grid that contains the specified record. |
| [showProgressIndicator](https://learn.microsoft.com/en-us/power-apps/developer/model-driven-apps/clientapi/reference/xrm-utility/showprogressindicator/) | Displays a progress dialog with the specified message. |

There are also many methods not listed here that you might come across in older code that has now [been deprecated](https://learn.microsoft.com/en-us/power-apps/developer/model-driven-apps/clientapi/reference/xrm-utility#deprecated-methods) because they've moved to the `Xrm.Navigation` namespace. If you find these methods, you should update the code to use the new `Xrm.Navigation` methods.

## Xrm.WebApi object

The `Xrm.WebApi` object provides properties and methods to use the Web API for traditional CRUD operations within a client script. When using `Xrm.WebAPI` in your script, operations are automatically performed in the context of the current app user. You can use the Web API when the app is online and offline (if you configure the environment for offline). The namespace includes a specific online and offline set of methods; however, using these methods requires keeping track of the client state. If you use `Xrm.WebAPI.createRecord`, the API determines if it should use the online or offline namespace methods for you.

The following table is a summary of the methods that are available within the `Xrm.WebApi` object. For more information, see [Xrm.WebApi (Client API reference)](https://learn.microsoft.com/en-us/power-apps/developer/model-driven-apps/clientapi/reference/xrm-webapi/).

| Method | Description |
| --- | --- |
| [createRecord](https://learn.microsoft.com/en-us/power-apps/developer/model-driven-apps/clientapi/reference/xrm-webapi/createrecord/) | Creates a table row. |
| [deleteRecord](https://learn.microsoft.com/en-us/power-apps/developer/model-driven-apps/clientapi/reference/xrm-webapi/deleterecord/) | Deletes a table row using the ID of the row. |
| [retrieveRecord](https://learn.microsoft.com/en-us/power-apps/developer/model-driven-apps/clientapi/reference/xrm-webapi/retrieverecord/) | Retrieves a row using the ID of the row. |
| [retrieveMultipleRecords](https://learn.microsoft.com/en-us/power-apps/developer/model-driven-apps/clientapi/reference/xrm-webapi/retrievemultiplerecords/) | Retrieves a collection of table rows matching the query options or Fetch XML provided. |
| [updateRecord](https://learn.microsoft.com/en-us/power-apps/developer/model-driven-apps/clientapi/reference/xrm-webapi/updaterecord/) | Updates a table row. |
| [isAvailableOffline](https://learn.microsoft.com/en-us/power-apps/developer/model-driven-apps/clientapi/reference/xrm-webapi/isavailableoffline/) | Returns a Boolean value that indicates whether a table is present in a user's profile and available in offline mode. |
| [execute](https://learn.microsoft.com/en-us/power-apps/developer/model-driven-apps/clientapi/reference/xrm-webapi/online/execute/) | Run a single action, function, or CRUD operation. |
| [executeMultiple](https://learn.microsoft.com/en-us/power-apps/developer/model-driven-apps/clientapi/reference/xrm-webapi/online/executemultiple/) | Run a collection of actions, functions, or CRUD operations. |

Using properties and methods of the **Xrm** object, you can automate business processes and improve the overall user experience.
