# Client scripting common tasks

Completed

- 8 minutes

The client API object model is extensive and rich. As you get familiar with client scripting, you'll realize that you can use many API objects and methods to implement your logic. In this unit, we look at some of the common tasks you can perform and the techniques to use to accomplish them.

## Access Dataverse column data

A Dataverse column is represented as an attribute object in the object model. You can use the getAttribute() method of the formContext object to quickly locate either a specific attribute or all attributes present on the form. Each attribute object includes some common methods that are available regardless of data type. There are also [other methods](/en-us/power-apps/developer/model-driven-apps/clientapi/reference/attributes/?azure-portal=true) available for specific attribute data types (text, number, date, etc.).

Note

This sample code assumes that the attributes and controls used are present. Some methods (such as getAttribut) return **null** if objects aren't available, and usual defensive checks should be used in practice.

Tip

Collections returned by Client API methods have some helpful methods that you can use to iterate through the elements. For more information, see [Collections (Client API reference) in model-driven apps - Power Apps](/en-us/power-apps/developer/model-driven-apps/clientapi/reference/collections/?azure-portal=true).

| Task | Example |
| --- | --- |
| Access by name | `javascript var nameAttribute = formContext.getAttribute("name");` Assigns the attribute for the **Account Name** column to the **nameAttribute** variable. If the attribute isn't present on the form, the **getAttribute** method returns **null** value. |
| Access all attributes | `javascript var allAttributes = formContext.getAttribute();` Assigns an array of all the attributes in the **formContext.data.entity.attributes** collection to the **allAttributes** variable. |

## Use attributes

| Task | Example |
| --- | --- |
| Get the value of an attribute | `javascript var nameValue = formContext.getAttribute("name").getValue();` Assigns the value of the **Account Name** column to the **nameValue** variable. |
| Set the value of an attribute | `javascript formContext.getAttribute("name").setValue("new name");` Sets the value of the **Account Name** column to "new name". |
| Get the currently selected option object in an OptionSet attribute (Dataverse Choice column) | `javascript var addressTypeOption = formContext.getAttribute("address1_addresstypecode").getSelectedOption();` Assigns the selected option in the **Address Type** column to the **addressTypeOption** variable. |
| Determine whether an attribute value has changed in the user interface since the form has been opened | `javascript var isNameChanged = formContext.getAttribute("name").getIsDirty();` Assigns a Boolean value that indicates whether the **Account Name** column value has changed and assigns the value to the **isNameChanged** variable. |
| Change whether data is required in a column in order to save a record | `javascript formContext.getAttribute("creditlimit").setRequiredLevel("required");` Makes the **Credit Limit** column required. `javascript formContext.getAttribute("creditlimit").setRequiredLevel("none");` Makes the **Credit Limit** column optional. |
| Determine whether the data in an attribute is submitted when the record is saved | `javascript var   nameSubmitMode = formContext.getAttribute("name").getSubmitMode();` The **nameSubmitMode** variable value is either **always, never, or dirty** text to represent the **submitMode** for the **Account Name** column. |
| Control whether data in an attribute is saved when the record is saved | `javascript formContext.getAttribute("name").setSubmitMode("always");` The example forces the **Account Name** column value to always be saved, even when it hasn't changed. |
| When column level security has been applied to an attribute, determine whether a user has privileges to create, read, or update operations on the attribute. | `javascript var   canUpdateNameAttribute = formContext.getAttribute("name").getUserPrivilege().canUpdate;` Assigns a Boolean value that represents the userÔÇÖs privilege to update the **Account Name** column to the canUpdateNameAttribute variable. |

## Access form controls

| Task | Example |
| --- | --- |
| Access all the controls for a specific attribute | `javascript var nameControls = formContext.getAttribute("name").controls.get();` Assigns an array of all the controls for the **name** attribute to the **nameControls** variable. Most of the attributes are represented by one control but there may be more than one if a column has been added to the form more than once. |
| Access a control by name | `javascript var nameControl = formContext.getControl("name");` The first control added to a form for a column has the same name as the column. Each of the other control names has an index number appended to the name. For example, three controls for the name column have the names: **name, name1, and name2**, respectively. |
| Access all controls | `javascript var allControls = formContext.getControl();` Assigns an array of all the controls in the **formContext.ui.controls** collection to the **allControls** variable. |

## Use form controls

Similar to attribute objects, control objects have a common set of methods, regardless of the type. They also have [specialized methods](/en-us/power-apps/developer/model-driven-apps/clientapi/reference/controls/?azure-portal=true) based on the type of control.

| Task | Example |
| --- | --- |
| Determine if a control is visible | `javascript var isNameVisible = formContext.getControl("name").getVisible();` Assigns a **Boolean** value to the **isNameVisible** variable that represents whether the **Account Name** column is visible. |
| Hide or show a control | `javascript formContext.getControl("name").setVisible(false);` Hides the **Account Name** column. |
| Get a reference to the attribute for the control | `javascript var nameAttribute = formContext.getControl("name").getAttribute();` Assigns the attribute for the control for the **Account Name** column to the **nameAttribute** variable. |
| Disable or enable all controls for an attribute | `javascript formContext.getAttribute("name").controls.forEach(function   (control, index) { control.setDisabled(true); });` Remember that any attribute may have multiple controls. |
| Change the label for a control | `javascript formContext.getControl("name").setLabel("Company   Name");` Sets the label for the **Account Name** column to the text **Company Name**. |
| Get the parent of a control | `javascript var parentSection = formContext.getControl("name").getParent();` Assigns the parent control of the **Account Name** column to **parentSection** variable. |
| Set focus on a control | `javascript formContext.getControl("name").setFocus();` Set current input focus to the **Account Name** column. |

## Use tabs and sections

Each form has collection of tabs. Each tab has a collection of sections. Each section has a collection of controls. You can programmatically access these elements and use their methods.

| Task | Example |
| --- | --- |
| Show or hide a tab | `javascript formContext.ui.tabs.get("general").setVisible(false);` Hides **general** tab. |
| Change the label for a tab | `javascript formContext.ui.tabs.get("general").setLabel("Major");` Sets the label of the **general** tab to the text **Major**. |
| Show or hide a section | `javascript formContext.getControl("industrycode").getParent().setVisible(false);` Hides section containing the **Industry Code** column. |

## Use entity data

The following table contains methods you can use to get information about the current record.

| Task | Example |
| --- | --- |
| Get the *ID* of the current record | `javascript var recordId = formContext.data.entity.getId();` Assigns a current record unique identifier to the **recordId** variable. If the form is opened to create a new record, **null** value is returned. |
| Save the current record | `javascript formContext.data.entity.save();` Use **saveandclose** or **saveandnew** to perform the equivalent actions using the **Save & Close** or **Save & New**. |
| Determine whether any data in the current record is changed. | `javascript var isDirty = formContext.data.entity.getIsDirty();` Assigns a Boolean value that indicates whether any column value on the form has changed to the **isDirty** variable. |
