# Context objects

- 7 minutes

When creating event handlers and using the client scripting API, you should understand the context objects available and how to use them. The purpose of context objects is to give you information about the context in which your code is executing. This context ensures you don't have to hardcode the information in your logic. Context allows you to create more generic functions and makes your functions less sensitive to the specific layout of the UI components you're working with.

## Execution context

When you register an event handler, you can have the execution context passed as the first parameter. When you register the event handler using form properties, this is an option that you can enable.

Typically, it's a good idea to always have this option selected when you register an event handler using form properties. When you register an event handler using code, this option is automatically selected.

Your function definition that takes execution context as the first parameter would look like this:

```javascript
function myHandler(executionContext) {
    var formContext = executionContext.getFormContext();
    // ...
}
```

The most common use of the execution context is to retrieve the form and grid contexts. Another useful method in this context is `getEventSource`. The event source returns a reference to the object that triggered the event. This object allows you to write generic handlers that interrogate the event source at run time to find out which control triggered the event. This can be helpful when you want to write a single method that can be registered on events on multiple controls, rather than creating a separate event handler for each control.

## Form context

The Client API form context (**formContext**) references the form or an item on the form, such as a quick view control or a row in an editable grid, against which the current code runs. You can retrieve the **formContext** object from the execution context using the **getFormContext** function.

Previously, the item or form was accessed using the global `Xrm.Page` object. However, in the latest version, the `Xrm.Page` object is deprecated. Instead, you should use the `getFormContext` method from the execution context object to get a reference to the appropriate form or item on the form.

Instead of writing:

```javascript
var firstName = Xrm.Page.getAttribute("firstname").getValue();
```

You should write:

```javascript
var formContext = executionContext.getFormContext();
var firstName = formContext.getAttribute("firstname").getValue();
```

### Data object

The data object (**formContext.data**) is intended to be used for any table to manipulate data within the form.

| Name | Description |
|------|-------------|
| Attributes | Collection of non-entity data on the form. Items in this collection are of the same data type as the attributes collection on entity, but they aren't attributes of the form table. |
| Entity | Methods to retrieve information specific to the row that is displayed on the page, the save method, and a collection of all the attributes that are included on the form. Attribute data is limited to attributes that are represented by fields on the form. |
| Process | Objects and methods to interact with the business process flow data on a form. |

### UI object

The UI object (**formContext.ui**) provides both methods to retrieve information about the user interface and also collections for several sub components of the form or grid.

| Name | Description |
|------|-------------|
| Controls | Collection of all the controls on the page. |
| FormSelector | Methods to get information about forms. Use `formSelector.getCurrentItem` to retrieve information about the current form. Use `formSelector.items` to return information about all available forms for the user. |
| Navigation | Collection of all the navigation items on the page. For automating overall application navigation, use the `Xrm.Navigation` namespace. |
| Process | Objects and methods to interact with the business process flow control on a form, such as setting its visibility. |
| QuickForms | Collection of all the quick view controls on a form. |
| Tabs | Collection of all the tabs on the page. |

It's common to use the data object, instead of the UI object, to get or set a table column value. The data object has only a single attribute representing the table column value. By comparison, the UI object has multiple controls for the same table column on the form. So, it's easier to work with the data object to manipulate the attribute value and the UI object to work with the controls that represent that attribute on the form.

Using the context objects in your scripts makes them more resilient to change on the form and in the client API.
