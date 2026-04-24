# Summary: Client-Side Scripting in Power Apps Model-Driven Apps

> **Source files:** 1-introduction.md, 2-upload-scripts.md, 3-event-handlers.md, 4-context.md, 5-common-tasks.md, 6-exercise.md

---

## Overview and Capabilities

- Client scripting uses JavaScript to implement custom business logic in model-driven apps when declarative business rules are insufficient.
- Client scripts run in response to form events and can be triggered from command bar buttons.
- Logic only enforces when users interact via the application — must be paired with server-side logic for rules that must always run.
- Only use **documented** objects and functions; undocumented ones can change or disappear at any time.
- Direct manipulation of HTML form content is **not supported** — always use the client scripting API object model.

### Common Tasks

- Get or set column values on the form
- Show and hide UI elements (controls, tabs, sections)
- Reference multiple controls per column
- Switch between forms where multiple forms are available for a table
- Open forms, views, dialogs, and reports
- Interact with the business process flow control

---

## Client Scripting API Namespaces

- **App** — Add event handlers for app-level notifications
- **Device** — Access device content (image, video, audio, location) with user consent
- **Encoding** — HTML encode/decode utility functions
- **Navigation** — Platform-independent navigation: open dialogs, forms, files, and URLs
- **Panel** — Display a web page (by URL) in the static side pane, visible on all pages in the web client
- **Utility** — Utility functions including access to metadata and context objects
- **WebAPI** — Create/manage records and execute Web API actions and functions

---

## Script Web Resources

- Scripts must be uploaded as **script web resources** before use on a form.
- Supports JavaScript or TypeScript; TypeScript must be transpiled to JavaScript before upload.
- Upload via **Forms Library > Add JavaScript Library > + New web resource**, selecting **JavaScript (JS)** as the type.
- Associate a script library with a form once per form; a single association covers all event handlers registered on that form.
- If a referenced column is removed from the form, the script breaks — add column as a **dependency** to prevent this.

### Web Resource Dependencies

- Dependencies on other web resources can be configured to auto-load required resources.
- Web resource dependencies load **asynchronously and in parallel** — no guaranteed load order.
- If one JS resource must initialize before another, manage that ordering within your own code logic.

### Updating Scripts

1. Return to the script web resource in the solution.
2. Upload the new version of the file.
3. **Publish** the web resource so the app uses the latest changes.

---

## Event Handlers

- Event handlers are registered either via **form properties** (design time) or **via code** (runtime).
- Must be registered separately on each form where they should run.
- **OnLoad** can only be registered via form properties configuration — not from code.

### Events Registerable via Form Properties

- **Form** — `OnLoad`, `OnSave`
- **Tabs** — Tab state change (e.g., tab expanded/collapsed)
- **Columns** — Column data changed (`OnChange`)

### Registering via Code

- All handlers except `OnLoad` can be registered via code.
- Common pattern: register `OnLoad` via form properties, then register all other handlers from within the `OnLoad` handler using code.
- Benefit: avoids registering every handler on every form manually; supports dynamic registration logic.

```javascript
function LearnLab_handleAccountOnLoad(executionContext) {
    var formContext = executionContext.getFormContext();
    formContext.getAttribute('accountnumber').addOnChange(LearnLab_handleOnChangeAccountNumber);
}

function LearnLab_handleOnChangeAccountNumber(executionContext) {
    var formContext = executionContext.getFormContext();
    formContext.ui.setFormNotification('Check other systems', 'INFO', 'AcctNumber');
}
```

---

## Context Objects

### Execution Context

- Passed as the first parameter to event handlers.
- When registering via form properties, explicitly enable **Pass execution context as first parameter**.
- When registering via code, execution context is automatically included.
- Key methods:
  - `getFormContext()` — retrieves form or grid context
  - `getEventSource()` — returns reference to the object that triggered the event (useful for generic multi-control handlers)

```javascript
function myHandler(executionContext) {
    var formContext = executionContext.getFormContext();
    // ...
}
```

### Form Context (`formContext`)

- References the form or an item on the form (quick view control, editable grid row).
- Retrieved via `executionContext.getFormContext()`.
- **`Xrm.Page` is deprecated** — use `getFormContext()` instead.

```javascript
// Deprecated:
var firstName = Xrm.Page.getAttribute("firstname").getValue();

// Correct:
var formContext = executionContext.getFormContext();
var firstName = formContext.getAttribute("firstname").getValue();
```

#### `formContext.data` — Data Object

| Property | Description |
|----------|-------------|
| `Attributes` | Collection of non-entity data on the form |
| `Entity` | Methods and attributes for the current row (save, refresh, attribute collection) |
| `Process` | Interact with business process flow data |

- Use the **data object** to get/set column values (single attribute per column).

#### `formContext.ui` — UI Object

| Property | Description |
|----------|-------------|
| `Controls` | All controls on the page |
| `FormSelector` | Form info; `getCurrentItem()` for current form, `.items` for all available forms |
| `Navigation` | Navigation items on the page |
| `Process` | Business process flow control visibility |
| `QuickForms` | All quick view controls |
| `Tabs` | All tabs on the page |

- Use the **UI object** to work with controls (multiple controls can map to one column).

### Grid Context

- Provides context to event handlers registered on subgrids on a form.

---

## Common Tasks Reference

> Methods return `null` if objects are not available — use defensive null checks in production code.

### Access Column Data (Attributes)

```javascript
var nameAttribute = formContext.getAttribute("name");       // by name, null if not on form
var allAttributes = formContext.getAttribute();             // all attributes on form
```

### Use Attributes

```javascript
formContext.getAttribute("name").getValue();
formContext.getAttribute("name").setValue("new name");
formContext.getAttribute("address1_addresstypecode").getSelectedOption();  // Choice column
formContext.getAttribute("name").getIsDirty();                             // has value changed?
formContext.getAttribute("creditlimit").setRequiredLevel("required");
formContext.getAttribute("creditlimit").setRequiredLevel("none");
formContext.getAttribute("name").getSubmitMode();          // returns "always", "never", or "dirty"
formContext.getAttribute("name").setSubmitMode("always");  // force save on record save
formContext.getAttribute("name").getUserPrivilege().canUpdate;
```

### Access Form Controls

```javascript
formContext.getAttribute("name").controls.get();   // all controls for attribute
formContext.getControl("name");                    // first control; subsequent: "name1", "name2"
formContext.getControl();                          // all controls
```

### Use Form Controls

```javascript
formContext.getControl("name").getVisible();
formContext.getControl("name").setVisible(false);
formContext.getControl("name").setVisible(true);
formContext.getControl("name").getAttribute();
formContext.getAttribute("name").controls.forEach(function(control, index) { control.setDisabled(true); });
formContext.getControl("name").setLabel("Company Name");
formContext.getControl("name").getParent();        // returns parent section
formContext.getControl("name").setFocus();
```

### Use Tabs and Sections

```javascript
formContext.ui.tabs.get("general").setVisible(false);     // hide tab
formContext.ui.tabs.get("general").setLabel("Major");     // rename tab
formContext.getControl("industrycode").getParent().setVisible(false);  // hide section
```

### Use Entity Data

```javascript
formContext.data.entity.getId();           // null if new record
formContext.data.entity.save();            // also: "saveandclose", "saveandnew"
formContext.data.entity.getIsDirty();      // any unsaved changes?
```

---

## Exercise: Hide/Show Form Section Based on Date

**Requirement:** Hide the Status section when project start date is empty or in the future; show it when start date is in the past.

**Key setup steps:**
- Set Status section name to `section_status`, hide by default
- Set General tab name to `tab_general`
- Column logical name: `sample_projectstart`

**Complete script:**

```javascript
function LearnLab_handleTeamProjectOnLoad(executionContext) {
    var formContext = executionContext.getFormContext();
    formContext.getAttribute('sample_projectstart').addOnChange(LearnLab_handleProjectStatusOnChange);
    LearnLab_hideOrShowStatusSection(formContext);
}

function LearnLab_handleProjectStatusOnChange(executionContext) {
    var formContext = executionContext.getFormContext();
    LearnLab_hideOrShowStatusSection(formContext);
}

function LearnLab_hideOrShowStatusSection(formContext) {
    var tabGeneral = formContext.ui.tabs.get('tab_general');
    var sectionStatus = tabGeneral.sections.get('section_status');
    var startDate = formContext.getAttribute('sample_projectstart').getValue();
    var CurrentDate = new Date();
    if (startDate == null || startDate > CurrentDate) {
        sectionStatus.setVisible(false);
    } else {
        sectionStatus.setVisible(true);
    }
}
```

**Deployment steps:**
1. Upload script as a JavaScript web resource in the solution
2. Open the target form in the form designer
3. Add script library to form via **Events > OnLoad > + Event Handler > + Add library**
4. Set function to `LearnLab_handleTeamProjectOnLoad`, check **Pass execution context as first parameter**
5. Save and publish; publish all customizations

---

## References

- [Collections (Client API reference)](https://learn.microsoft.com/en-us/power-apps/developer/model-driven-apps/clientapi/reference/collections/)
- [Power Apps maker portal](https://make.powerapps.com/)
