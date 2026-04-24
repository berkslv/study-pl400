# Debugging client script

- 3 minutes

Nearly every modern browser has a debugging extension that supports capturing network traffic, analyzing page content, and debugging client scripts. The following toolsets are useful for performing debugging operations:

- Microsoft Edge (through F12 Developer Tools). For more information, see [F12 developer tools guide](https://learn.microsoft.com/en-us/microsoft-edge/devtools-guide-chromium/).
- Google Chrome (through F12 Developer Tools)
- Mozilla Firefox (using Firebug)
- Apple Safari (using Web Inspector)

## View script resources

When your model-driven app form page loads, all client script libraries load alongside the webpage as individual script resources. Given the volume of script resources needed to run a model-driven app, locating a file you might want to debug against can be difficult. When using debugging tools like Microsoft Edge, we recommend you note your file name and use the tool's search capabilities to locate your script files.

## Write messages to the console

Using the `window.alert` method when debugging JavaScript issues or the [debugger statement](https://developer.mozilla.org/docs/Web/JavaScript/Reference/Statements/debugger/) to interrupt execution are still commonly used to troubleshoot code in the application. But now that all modern browsers provide easy access to debugging tools, it isn't a best practice as others might be using the application you're currently debugging. These debugging calls are also often inadvertently left in code, causing issues for the app users in production.

Consider writing your messages to the console instead. Here's a small function you can add to your libraries to help send any messages you want to view to the console when it's open.

```javascript
function writeToConsole(message)
{
  if (typeof console != 'undefined') {
    console.log(message);
  }
}
```

Unlike the alert method, if you forget to remove any code that uses this function, people using the application don't see your messages. It's also helpful when troubleshooting the application behavior in production without disrupting the app users.

## Use Fiddler Auto-Responder to replace web resource content

Constantly editing web resources when they are under development can be difficult and time-intensive. You have to republish the files within a solution upon every edit and ensure that you clear the browser cache of the previous version of the resources. In addition, if multiple developers share the environment, it can be disruptive for others.

To improve efficiency, consider using a tool like Auto-Responder in Telerik Fiddler to replace content of a web resource with content from a local file, rather than uploading it and republishing each time. Several other third-party tools that also support live editing can be considered. For more information on how to install and configure Fiddler Auto-Responder, see [Script web resource development using Fiddler Auto-Responder](https://learn.microsoft.com/en-us/power-apps/developer/model-driven-apps/streamline-javascript-development-fiddler-autoresponder/).
