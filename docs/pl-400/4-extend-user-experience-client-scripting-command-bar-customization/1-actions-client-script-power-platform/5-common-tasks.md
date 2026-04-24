# Client scripting common tasks

- 8 minutes

The client API object model is extensive and rich. In this unit, we look at some of the common tasks you can perform and the techniques to use to accomplish them.

> **Note:** This sample code assumes that the attributes and controls used are present. Most of the methods return `null` if objects are not available, and usual defensive checks should be used in practice.

> **Tip:** Collections returned by Client API methods have helpful methods for iteration. See the [Collections (Client API reference)](https://learn.microsoft.com/en-us/power-apps/developer/model-driven-apps/clientapi/reference/collections/) documentation for more information.

## Access Dataverse column data

A Dataverse column is represented as an attribute object in the object model. You can use the `getAttribute()` method of the formContext object to quickly locate either a specific attribute or all attributes present on the form.

| Task | Example |
|------|---------|
| Access by name | `var nameAttribute = formContext.getAttribute("name");` — assigns the attribute for the **Account Name** column. Returns `null` if not present on the form. |
| Access all attributes | `var allAttributes = formContext.getAttribute();` — assigns an array of all attributes in the `formContext.data.entity.attributes` collection. |

## Use attributes

| Task | Example |
|------|---------|
| Get the value of an attribute | `var nameValue = formContext.getAttribute("name").getValue();` |
| Set the value of an attribute | `formContext.getAttribute("name").setValue("new name");` |
| Get the currently selected option in a Choice column | `var addressTypeOption = formContext.getAttribute("address1_addresstypecode").getSelectedOption();` |
| Determine if an attribute value has changed | `var isNameChanged = formContext.getAttribute("name").getIsDirty();` |
| Make a column required | `formContext.getAttribute("creditlimit").setRequiredLevel("required");` |
| Make a column optional | `formContext.getAttribute("creditlimit").setRequiredLevel("none");` |
| Determine the submit mode for an attribute | `var nameSubmitMode = formContext.getAttribute("name").getSubmitMode();` — returns `always`, `never`, or `dirty`. |
| Control whether data is saved on record save | `formContext.getAttribute("name").setSubmitMode("always");` — forces the value to always be saved. |
| Check user privileges on an attribute | `var canUpdateNameAttribute = formContext.getAttribute("name").getUserPrivilege().canUpdate;` |

## Access form controls

| Task | Example |
|------|---------|
| Access all controls for a specific attribute | `var nameControls = formContext.getAttribute("name").controls.get();` — returns an array of all controls for the attribute. |
| Access a control by name | `var nameControl = formContext.getControl("name");` — the first control added has the same name as the column; subsequent controls have an index appended (e.g., `name1`, `name2`). |
| Access all controls | `var allControls = formContext.getControl();` |

## Use form controls

| Task | Example |
|------|---------|
| Determine if a control is visible | `var isNameVisible = formContext.getControl("name").getVisible();` |
| Hide a control | `formContext.getControl("name").setVisible(false);` |
| Show a control | `formContext.getControl("name").setVisible(true);` |
| Get a reference to the attribute for a control | `var nameAttribute = formContext.getControl("name").getAttribute();` |
| Disable all controls for an attribute | `formContext.getAttribute("name").controls.forEach(function(control, index) { control.setDisabled(true); });` |
| Change the label for a control | `formContext.getControl("name").setLabel("Company Name");` |
| Get the parent of a control | `var parentSection = formContext.getControl("name").getParent();` |
| Set focus on a control | `formContext.getControl("name").setFocus();` |

## Use tabs and sections

Each form has a collection of tabs. Each tab has a collection of sections. Each section has a collection of controls. You can programmatically access and manipulate these elements.

| Task | Example |
|------|---------|
| Show or hide a tab | `formContext.ui.tabs.get("general").setVisible(false);` — hides the **general** tab. |
| Change the label for a tab | `formContext.ui.tabs.get("general").setLabel("Major");` |
| Show or hide a section | `formContext.getControl("industrycode").getParent().setVisible(false);` — hides the section containing the **Industry Code** column. |

## Use entity data

| Task | Example |
|------|---------|
| Get the ID of the current record | `var recordId = formContext.data.entity.getId();` — returns `null` if the form is open for a new record. |
| Save the current record | `formContext.data.entity.save();` — use `"saveandclose"` or `"saveandnew"` for equivalent button actions. |
| Determine whether any data has changed | `var isDirty = formContext.data.entity.getIsDirty();` |
