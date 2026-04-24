# Quiz: Actions with Client Script in Power Platform

> **Source material:** 1-introduction.md, 2-upload-scripts.md, 3-event-handlers.md, 4-context.md, 5-common-tasks.md, 7-check.md, 8-summary.md
> **Total questions:** 22
> **Question types:** Multiple choice (single), Multiple choice (multi-select), Fill-in-the-Blank

---

## Questions

### Question 1 — Single Choice

A developer needs to implement custom business logic on a model-driven app form. Declarative business rules do not meet the requirements.

Which technology should the developer use?

- A. Power Automate flows
- B. Client scripting with JavaScript
- C. Calculated columns
- D. Business process flows

<details>
<summary>Answer</summary>

**Correct answer:** B. Client scripting with JavaScript

**Explanation:** Client scripting allows you to use JavaScript in Power Apps model-driven apps to implement custom business logic and is an alternative when declarative business rules don't meet the requirements.

</details>

---

### Question 2 — Single Choice

A maker uploads a TypeScript file to use as a script web resource on a model-driven form.

What must the maker do before uploading the file?

- A. Convert the TypeScript file to a JSON configuration file
- B. Wrap the TypeScript code inside an HTML web resource
- C. Transpile the TypeScript to JavaScript
- D. Register the TypeScript file as a plug-in assembly

<details>
<summary>Answer</summary>

**Correct answer:** C. Transpile the TypeScript to JavaScript

**Explanation:** If you use TypeScript, you must transpile it to JavaScript before uploading it as a web resource, because only JavaScript (JS) is supported as the script web resource type.

</details>

---

### Question 3 — Single Choice

A developer registers an event handler on a form using form properties. Later, another maker removes a column from the form that was referenced by the script.

What will happen?

- A. The script will gracefully skip the missing column
- B. The script will break because the referenced column is no longer available
- C. The form will automatically re-add the missing column
- D. The event handler will be unregistered automatically

<details>
<summary>Answer</summary>

**Correct answer:** B. The script will break because the referenced column is no longer available

**Explanation:** If somebody removes a column from the form that a script references, the script will break. To prevent this, the column should be added as a dependency so it is always available to the script logic.

</details>

---

### Question 4 — Single Choice

A developer configures web resource dependencies for a script library. The script depends on a second JavaScript library being fully initialized before the main script runs.

What is the correct approach?

- A. List the dependency in the dependency configuration and rely on it to enforce load order
- B. Manage the initialization dependency in code, because web resource dependencies load asynchronously and in parallel
- C. Use a ribbon rule to delay loading until both web resources are ready
- D. Set the dependent library's type to CSS so it loads synchronously first

<details>
<summary>Answer</summary>

**Correct answer:** B. Manage the initialization dependency in code, because web resource dependencies load asynchronously and in parallel

**Explanation:** Web resource dependencies do not provide control over load order — all web resources are loaded asynchronously and in parallel. If one JavaScript library must initialize before another, you need to manage that dependency in code.

</details>

---

### Question 5 — Single Choice

A developer has finished updating a client script and uploads the new version to the script web resource in the solution.

What additional step is required for the app to use the latest changes?

- A. Re-register all event handlers on each form
- B. Delete and re-create the web resource
- C. Publish the script web resource
- D. Restart the Power Apps environment

<details>
<summary>Answer</summary>

**Correct answer:** C. Publish the script web resource

**Explanation:** After uploading a new version of a script web resource, you must publish the script web resource so the app uses the latest changes.

</details>

---

### Question 6 — Single Choice

A developer wants to register an OnChange event handler for a column without using the form properties dialog.

Which event handler must be registered via form properties first to enable this pattern?

- A. OnSave
- B. OnChange
- C. OnLoad
- D. Tab state change

<details>
<summary>Answer</summary>

**Correct answer:** C. OnLoad

**Explanation:** The OnLoad event handler must be registered using configuration (form properties). A common pattern is to register OnLoad via form properties and then register all other event handlers, such as OnChange, programmatically inside the OnLoad handler.

</details>

---

### Question 7 — Single Choice

A developer wants to write a single OnChange handler that can be reused across multiple controls. The handler must determine which control triggered the event at run time.

Which method provides this information?

- A. `executionContext.getFormContext()`
- B. `executionContext.getEventSource()`
- C. `formContext.ui.controls.get()`
- D. `formContext.data.entity.getId()`

<details>
<summary>Answer</summary>

**Correct answer:** B. `executionContext.getEventSource()`

**Explanation:** `getEventSource` returns a reference to the object that triggered the event, allowing you to write generic handlers that interrogate the event source at run time instead of creating a separate handler for each control.

</details>

---

### Question 8 — Single Choice

A developer is reading code written by a previous developer and notices the following line:

```javascript
var firstName = Xrm.Page.getAttribute("firstname").getValue();
```

What is the recommended replacement for this code?

- A. `var firstName = Xrm.getFormContext().getAttribute("firstname").getValue();`
- B. `var firstName = formContext.data.entity.attributes.get("firstname").getValue();`
- C. `var firstName = formContext.getAttribute("firstname").getValue();`
- D. `var firstName = executionContext.getAttribute("firstname").getValue();`

<details>
<summary>Answer</summary>

**Correct answer:** C. `var firstName = formContext.getAttribute("firstname").getValue();`

**Explanation:** The `Xrm.Page` object is deprecated. The recommended approach is to retrieve the `formContext` object using `executionContext.getFormContext()` and then call `getAttribute("firstname").getValue()` on it.

</details>

---

### Question 9 — Single Choice

A developer needs to make the `creditlimit` column required on a model-driven form using client scripting.

Which code correctly accomplishes this task?

- A. `formContext.getControl("creditlimit").setRequired(true);`
- B. `formContext.getAttribute("creditlimit").setRequiredLevel("required");`
- C. `formContext.getAttribute("creditlimit").setRequired("yes");`
- D. `formContext.ui.controls.get("creditlimit").setMandatory(true);`

<details>
<summary>Answer</summary>

**Correct answer:** B. `formContext.getAttribute("creditlimit").setRequiredLevel("required");`

**Explanation:** The `setRequiredLevel` method on an attribute accepts the value `"required"` to make a column mandatory. To make it optional, you would pass `"none"`.

</details>

---

### Question 10 — Single Choice

A developer needs to hide the **general** tab on a model-driven form using client scripting.

Which code correctly accomplishes this task?

- A. `formContext.ui.tabs.get("general").setEnabled(false);`
- B. `formContext.getControl("general").setVisible(false);`
- C. `formContext.ui.tabs.get("general").setVisible(false);`
- D. `formContext.getAttribute("general").setVisible(false);`

<details>
<summary>Answer</summary>

**Correct answer:** C. `formContext.ui.tabs.get("general").setVisible(false);`

**Explanation:** Tabs are accessed via `formContext.ui.tabs.get()` by tab name, and visibility is controlled with `setVisible(false)`.

</details>

---

### Question 11 — Single Choice

A developer needs to save the current record and open a new blank form immediately after.

Which call achieves this?

- A. `formContext.data.entity.save("saveandclose");`
- B. `formContext.data.entity.save("saveandnew");`
- C. `formContext.data.entity.save("new");`
- D. `formContext.data.entity.save();`

<details>
<summary>Answer</summary>

**Correct answer:** B. `formContext.data.entity.save("saveandnew");`

**Explanation:** Passing `"saveandnew"` to `save()` saves the current record and opens a new blank form, equivalent to clicking the **Save & New** button.

</details>

---

### Question 12 — Single Choice

A developer needs to determine whether any unsaved changes exist on the current form before performing an action.

Which code correctly checks this?

- A. `formContext.data.entity.getIsDirty();`
- B. `formContext.getAttribute("name").getIsDirty();`
- C. `formContext.ui.getIsDirty();`
- D. `executionContext.getIsDirty();`

<details>
<summary>Answer</summary>

**Correct answer:** A. `formContext.data.entity.getIsDirty();`

**Explanation:** `formContext.data.entity.getIsDirty()` returns a Boolean indicating whether any data on the form has changed since the last save.

</details>

---

### Question 13 — Single Choice

A developer wants to retrieve the current selected option from a Choice (option set) column named `address1_addresstypecode`.

Which code is correct?

- A. `formContext.getAttribute("address1_addresstypecode").getValue();`
- B. `formContext.getAttribute("address1_addresstypecode").getSelectedOption();`
- C. `formContext.getControl("address1_addresstypecode").getSelectedOption();`
- D. `formContext.data.entity.getAttribute("address1_addresstypecode").getOption();`

<details>
<summary>Answer</summary>

**Correct answer:** B. `formContext.getAttribute("address1_addresstypecode").getSelectedOption();`

**Explanation:** The `getSelectedOption()` method is used on an attribute object to retrieve the currently selected option for a Choice column.

</details>

---

### Question 14 — Multi-Select

A developer is designing a client script solution. They want to ensure the script is resilient and follows best practices.

Which **two** practices should the developer follow? (Select **two**.)

- A. Directly manipulate the form's HTML DOM elements for better performance
- B. Use only documented objects and functions from the client scripting API
- C. Use context objects instead of hardcoding control names or layout details
- D. Store column values in global JavaScript variables to avoid repeated API calls
- E. Use `Xrm.Page` for backward compatibility with older forms

<details>
<summary>Answer</summary>

**Correct answer:** B. Use only documented objects and functions from the client scripting API; C. Use context objects instead of hardcoding control names or layout details

**Explanation:** Direct DOM manipulation is not supported and may break with layout changes. Only documented API objects should be used, as undocumented ones can change or disappear. Context objects reduce sensitivity to UI layout changes.

</details>

---

### Question 15 — Multi-Select

A developer needs to associate a script library with a model-driven form. They are reviewing the steps required.

Which **two** steps are required? (Select **two**.)

- A. Upload the script as a JavaScript web resource
- B. Configure a security role to allow script execution
- C. Add the script library to the form via **Form libraries**
- D. Create a custom API to expose the script functions
- E. Register an OnLoad handler from the ribbon designer

<details>
<summary>Answer</summary>

**Correct answer:** A. Upload the script as a JavaScript web resource; C. Add the script library to the form via **Form libraries**

**Explanation:** To use client scripting on a form, the script must first be uploaded as a JavaScript web resource, and then the library must be associated with the form by adding it through **Form libraries** in the form editor.

</details>

---

### Question 16 — Multi-Select

A team is evaluating when to supplement client scripting with server-side logic.

Which **two** statements correctly describe a limitation of client scripting? (Select **two**.)

- A. Client scripting cannot read column values from the form
- B. Client scripting logic only enforces logic when the user is interacting through the application UI
- C. Client scripting does not run when data is created or updated via the Web API or integrations
- D. Client scripting cannot hide or show form controls
- E. Client scripting cannot register event handlers programmatically

<details>
<summary>Answer</summary>

**Correct answer:** B. Client scripting logic only enforces logic when the user is interacting through the application UI; C. Client scripting does not run when data is created or updated via the Web API or integrations

**Explanation:** Client scripting only runs when a user interacts with the form. It must be paired with server-side logic (such as plug-ins) to ensure business rules are enforced regardless of how data is accessed or modified.

</details>

---

### Question 17 — Multi-Select

A developer is reviewing the top-level namespaces of the client scripting API.

Which **three** namespaces are part of the client scripting API object model? (Select **three**.)

- A. `Xrm.WebAPI`
- B. `Xrm.Navigation`
- C. `Xrm.Utility`
- D. `Xrm.Workflow`
- E. `Xrm.DataModel`
- F. `Xrm.Device`

<details>
<summary>Answer</summary>

**Correct answer:** A. `Xrm.WebAPI`; B. `Xrm.Navigation`; C. `Xrm.Utility`; F. `Xrm.Device`

**Explanation:** The documented client scripting API namespaces include WebAPI, Navigation, Utility, Device, App, Encoding, and Panel. `Xrm.Workflow` and `Xrm.DataModel` are not part of the API.

</details>

---

### Question 18 — Fill-in-the-Blank

To retrieve the form context from within an event handler function, you call the ___ method on the execution context object.

<details>
<summary>Answer</summary>

**Answer:** `getFormContext()`

**Explanation:** The execution context is passed as the first parameter to event handlers, and `executionContext.getFormContext()` returns a reference to the current form or form item.

</details>

---

### Question 19 — Fill-in-the-Blank

Associating a script library with a form is only required ___ per script for each form, regardless of how many event handlers are registered on that form.

<details>
<summary>Answer</summary>

**Answer:** once

**Explanation:** You only need to associate a script library with a form one time. After that, any number of event handlers from that library can be registered on the same form.

</details>

---

### Question 20 — Fill-in-the-Blank

To check whether the value of the `name` attribute has been modified since the last save, you call ___ on the attribute object.

<details>
<summary>Answer</summary>

**Answer:** `getIsDirty()`

**Explanation:** `formContext.getAttribute("name").getIsDirty()` returns `true` if the attribute value has changed since the last save, allowing scripts to react to unsaved edits.

</details>

---

### Question 21 — Fill-in-the-Blank

To force a column's value to always be submitted when a record is saved, regardless of whether it changed, you call `formContext.getAttribute("name").setSubmitMode(___)`.

<details>
<summary>Answer</summary>

**Answer:** `"always"`

**Explanation:** The `setSubmitMode` method accepts `"always"`, `"never"`, or `"dirty"`. Using `"always"` forces the attribute value to be included in every save operation.

</details>

---

### Question 22 — Single Choice

A developer needs to ensure that when the `accountclassificationcode` column is referenced in a client script, the column is always available on the form even if another maker tries to remove it.

What is the correct approach?

- A. Add `require('accountclassificationcode')` at the start of the script
- B. Mark the column as read-only in the form editor
- C. Add `accountclassificationcode` as a column dependency on the script web resource
- D. Use a business rule to lock the column on all forms

<details>
<summary>Answer</summary>

**Correct answer:** C. Add `accountclassificationcode` as a column dependency on the script web resource

**Explanation:** Adding the column as a dependency ensures the column data is always available for the script logic, even if someone later removes it from the form layout.

</details>
