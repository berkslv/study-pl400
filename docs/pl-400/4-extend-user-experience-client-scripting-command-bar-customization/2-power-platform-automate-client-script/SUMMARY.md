# Summary: Automate Client Scripts with the Xrm Object Model

> **Source files:** 1-introduction.md, 2-best-practices.md, 3-debug.md, 4-exercise.md

---

## Xrm Object — Global Client API

- `Xrm` is globally available in client scripts; does not require the execution context.
- Top-level namespaces: `Xrm.App`, `Xrm.Device`, `Xrm.Encoding`, `Xrm.Navigation`, `Xrm.Panel`, `Xrm.Utility`, `Xrm.WebApi`.

---

## Xrm.App

- `addGlobalNotification` — displays error, information, warning, or success notification at the app level (not form-scoped); supports action callbacks.
- `clearGlobalNotification` — removes a previously added app notification.
- Use for command bar scripts to notify users of completed actions outside a form context.

---

## Xrm.Device

- Exposes native device capabilities; most methods are mobile-only except `pickFile` (also available on web clients).
- Methods may fail due to device capability, configuration, missing permissions, or user consent refusal.

| Method | Description |
| --- | --- |
| `captureAudio` | Records audio via device microphone. |
| `captureImage` | Captures an image via device camera. |
| `captureVideo` | Records a video via device camera. |
| `getBarcodeValue` | Scans a barcode via device camera. |
| `getCurrentPosition` | Returns current GPS location. |
| `pickFile` | Opens a file picker dialog (web and mobile). |

---

## Xrm.Encoding

- Encodes and decodes XML and HTML strings.
- Use cases: HTML web resource interaction, query string parameter encoding/decoding, FetchXML with special characters (`&`, `<`).

---

## Xrm.Navigation

- Provides navigation and dialog methods within a model-driven app.
- Alert, confirm, and error dialogs are blocking — prefer form notifications or non-blocking mechanisms.

| Method | Description |
| --- | --- |
| `openAlertDialog` | Displays an alert with a message and a button. |
| `openConfirmDialog` | Displays a confirmation with a message and two buttons. |
| `openErrorDialog` | Displays an error dialog. |
| `openFile` | Opens a file. |
| `openForm` | Opens a table form or quick create form. |
| `openUrl` | Opens a URL, including file URLs. |
| `openWebResource` | Opens an HTML web resource. |

---

## Xrm.Panel

- `Xrm.Panel` displays a webpage in the side pane of a model-driven app form.

---

## Xrm.Utility

- Container for miscellaneous utility methods.
- Deprecated methods that previously lived here have moved to `Xrm.Navigation`; update legacy code accordingly.

| Method | Description |
| --- | --- |
| `closeProgressIndicator` | Closes a progress dialog opened by `showProgressIndicator`. |
| `getAllowedStatusTransitions` | Returns valid state transitions for a table and state code. |
| `getEntityMetadata` | Returns entity metadata for a specified table. |
| `getGlobalContext` | Retrieves org settings, user settings, app details, and client info. |
| `getLearningPathAttributeName` | Returns the DOM attribute name used by Learning Path content designer. |
| `getResourceString` | Returns a localized string for a key from a web resource. |
| `invokeProcessAction` | Invokes an action or Custom API. |
| `lookupObjects` | Opens a lookup control to select one or more rows. |
| `refreshParentGrid` | Refreshes the parent grid containing a specified record. |
| `showProgressIndicator` | Displays a progress dialog with a custom message. |

---

## Xrm.WebApi

- Performs CRUD operations against Dataverse using the Web API from client scripts.
- Operations run in the context of the current app user automatically.
- Supports both online and offline modes; using `Xrm.WebApi.createRecord` auto-selects the correct namespace.

| Method | Description |
| --- | --- |
| `createRecord` | Creates a table row. |
| `deleteRecord` | Deletes a table row by ID. |
| `retrieveRecord` | Retrieves a single row by ID. |
| `retrieveMultipleRecords` | Retrieves multiple rows by query options or FetchXML. |
| `updateRecord` | Updates a table row. |
| `isAvailableOffline` | Returns whether a table is in the user's offline profile. |
| `execute` | Runs a single action, function, or CRUD operation. |
| `executeMultiple` | Runs a collection of actions, functions, or CRUD operations. |

---

## Client Scripting Best Practices

- Client scripts address client-side UI issues in model-driven apps — they are **not** a security measure and do not cover all access points (import, API, canvas apps, etc.).
- Combine client scripts with server-side solutions (e.g., Dataverse plug-ins) when business logic must apply universally.

### Business Rules vs. Client Script

- Business rules can: set/clear field values, set requirement levels, show/hide/enable/disable controls, validate data, create recommendations.
- Table-scoped business rules apply logic server-side (consistent across UI, import, API).
- Use client script over business rules when:
  - Logic references data from a related table (requires `Xrm.WebApi`).
  - Logic must run on the **Save** form event (business rules only run on load/field change unless table-scoped).
  - Conditions are complex (multiple `and`/`or` statements).
  - Form column values need to be cleared (business rule workarounds are cumbersome).
  - Instant in-form value updates are needed (calculated columns only update on form refresh).

### Coding Standards

- **Unique function names** — use a unique prefix or namespace pattern to avoid collisions with other libraries loaded on the same form.

```javascript
// Prefix approach
function MyUniqueName_performMyAction() {
  // Code to perform your action.
}
```

```javascript
// Namespace approach
if (typeof (MyUniqueName) == "undefined") { MyUniqueName = {}; }
MyUniqueName.MyFunctions = {
  performMyAction: function() {
    this.anotherAction();
  },
  anotherAction: function() {
    // Code in another function
  }
};
// Call as:
MyUniqueName.MyFunctions.performMyAction();
```

> **Note:** Inside a namespace, use `this` to reference sibling functions. When used as an event handler, `this` refers to the event source, not the namespace.

- **No unsupported methods** — avoid undocumented methods discovered via debugger inspection.
- **No deprecated methods** — review code regularly; solution checker flags these.
- **No jQuery or DOM manipulation** — jQuery is not supported in form scripts or command bar commands; use only the Client API object model.
- **Write non-blocking code** — use asynchronous patterns; avoid blocking dialogs and progress indicators; prefer non-intrusive notification mechanisms.
- **Cross-browser compatibility** — test scripts against all browsers and device form factors used in your deployment.

### Solution Checker

- Runs static analysis on solutions including JavaScript web resources.
- Identifies: performance, stability, and reliability issues; use of deprecated methods.
- Can be run on demand from the maker portal or automated in a build pipeline (ALM).

---

## Debugging Client Scripts

- Use browser F12 Developer Tools (Edge, Chrome), Firebug (Firefox), or Web Inspector (Safari).
- Locating script files: note the file name and use the debugger's search to find it among all loaded script resources.

### Console Logging (Preferred over `window.alert`)

- `window.alert` and `debugger` statements are not best practice — they disrupt other users and are often left in production code.
- Use console logging instead:

```javascript
function writeToConsole(message) {
  if (typeof console != 'undefined') {
    console.log(message);
  }
}
```

- Console messages are invisible to app users if the console is closed, making it safe to leave in code when troubleshooting production issues.

### Fiddler Auto-Responder

- Use Telerik Fiddler Auto-Responder (or similar tools) to serve local file versions of web resources without republishing to the environment.
- Avoids repeated publish cycles and browser cache clearing during development.
- Prevents disruption to other developers sharing the environment.

---

## Exercise: Use Table Data from Client Script

**Goal:** Set column requirement levels on the **Idea** form based on column values on the related **Challenge** table, retrieved via `Xrm.WebApi`.

### Key script structure

```javascript
function LearnLab_handleIdeaOnLoad(executionContext) {
  var formContext = executionContext.getFormContext();
  formContext.getAttribute('sample_originatingchallengeid').addOnChange(LearnLab_handleChallengeOnChange);
  LearnLab_setRequiredFields(formContext);
}

function LearnLab_handleChallengeOnChange(executionContext) {
  var formContext = executionContext.getFormContext();
  LearnLab_setRequiredFields(formContext);
}

function LearnLab_setRequiredFields(formContext) {
  var challenge = formContext.getAttribute('sample_originatingchallengeid').getValue();
  if (challenge != null) {
    var challengeId = challenge[0].id;
    Xrm.WebApi.retrieveRecord("sample_challenge", challengeId, "?$select=crc8c_investmentrequired,crc8c_roirequired").then(
      function success(result) {
        var investmentRequired = result.crc8c_investmentrequired ? 'required' : 'none';
        var roiRequired = result.crc8c_roirequired ? 'required' : 'none';
        formContext.getAttribute("sample_investmentrequired").setRequiredLevel(investmentRequired);
        formContext.getAttribute("sample_timetoroimonths").setRequiredLevel(roiRequired);
      },
      function (error) {
        console.log(error.message);
      }
    );
  } else {
    formContext.getAttribute("sample_investmentrequired").setRequiredLevel('none');
    formContext.getAttribute("sample_timetoroimonths").setRequiredLevel('none');
  }
}
```

### Deployment steps

1. Create a solution and add the **Idea** and **Challenge** tables (with their Main forms).
2. Add two Yes/No columns to **Challenge** (`Investment Required`, `ROI Required`); add them to the Challenge form.
3. Create `IdeaForm.js` with the functions above.
4. Upload `IdeaForm.js` as a JavaScript web resource inside the solution.
5. Add `IdeaForm.js` as a **Form library** on the Idea Main form.
6. Register `LearnLab_handleIdeaOnLoad` as an **On Load** event handler with execution context passed.
7. Save, publish, and test.

---

## References

- [Client API Xrm object](https://learn.microsoft.com/en-us/power-apps/developer/model-driven-apps/clientapi/clientapi-xrm/)
- [F12 developer tools guide](https://learn.microsoft.com/en-us/microsoft-edge/devtools-guide-chromium/)
- [Script web resource development using Fiddler Auto-Responder](https://learn.microsoft.com/en-us/power-apps/developer/model-driven-apps/streamline-javascript-development-fiddler-autoresponder/)
- [Supported web browsers and mobile devices](https://learn.microsoft.com/en-us/power-platform/admin/supported-web-browsers-and-mobile-devices/)
- [Understand the Client API object model](https://learn.microsoft.com/en-us/power-apps/developer/model-driven-apps/clientapi/understand-clientapi-object-model/)
- [Use solution checker to validate your apps in Power Apps](https://learn.microsoft.com/en-us/power-apps/maker/data-platform/use-powerapps-checker/)
- [Xrm.Panel](https://learn.microsoft.com/en-us/power-apps/developer/model-driven-apps/clientapi/reference/xrm-panel/)
- [Xrm.Utility (Client API reference)](https://learn.microsoft.com/en-us/power-apps/developer/model-driven-apps/clientapi/reference/xrm-utility/)
- [Xrm.WebApi (Client API reference)](https://learn.microsoft.com/en-us/power-apps/developer/model-driven-apps/clientapi/reference/xrm-webapi/)
