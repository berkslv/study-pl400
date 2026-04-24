# Recall: Automate Client Script with the Xrm Object

> **Source files:** 1-introduction.md, 2-best-practices.md, 3-debug.md, 4-exercise.md

---

## Keywords

| Term | Definition |
|------|-----------|
| Xrm object | Globally available Client API object providing properties and methods for model-driven app automation. |
| Xrm.WebApi | Client API namespace for CRUD operations using the Web API in the context of the current user. |
| Xrm.Navigation | Namespace providing navigation methods such as opening forms, URLs, dialogs, and web resources. |
| Xrm.Utility | Container namespace offering utility methods like `getGlobalContext`, `invokeProcessAction`, and `lookupObjects`. |
| Xrm.Device | Namespace exposing native device capabilities (camera, audio, GPS, barcode, file picker) for mobile clients. |
| Xrm.Encoding | Namespace for encoding and decoding XML and HTML strings, useful with FetchXML and web resources. |
| Xrm.Panel | Namespace providing a method to display a webpage in the side pane of a model-driven app form. |
| addGlobalNotification | App object method to display error, info, warning, or success notifications outside of a form context. |
| Solution Checker | Static analysis tool that validates client scripts against best practice rules, detecting deprecated or problematic patterns. |
| Fiddler Auto-Responder | Tool that replaces web resource content with a local file during development, avoiding repeated republish cycles. |
| Namespace pattern | JavaScript coding convention using an object container to prevent function name collisions across script libraries. |
| Execution context | Object passed to event handlers providing access to the form context and other runtime information. |

---

## Main Ideas

- The `Xrm` object is globally available in client scripts; it does not require the execution context to be used.
- `Xrm.WebApi` operations run in the context of the current app user and automatically handle online/offline mode when using methods like `createRecord`.
- `Xrm.WebApi` supports: `createRecord`, `deleteRecord`, `retrieveRecord`, `retrieveMultipleRecords`, `updateRecord`, `execute`, `executeMultiple`, and `isAvailableOffline`.
- `Xrm.Device.pickFile` is the only Device method also available in web clients; all others are mobile-only.
- `openAlertDialog`, `openConfirmDialog`, and `openErrorDialog` are blocking — prefer non-blocking mechanisms like `addGlobalNotification` or form notifications.
- Business rules with table scope run server-side and apply to API/import access; client scripts do not.
- Client script is preferred over business rules when: referencing related table data, running logic on form save, implementing complex conditions, or clearing field values instantly.
- Avoid jQuery and direct DOM manipulation in form scripts and ribbon commands — use only Client API methods.
- Always write asynchronous (non-blocking) code for queries and process-intensive operations.
- Use namespaces or unique function prefixes to prevent naming collisions across loaded script libraries.
- Avoid unsupported methods (discovered via debugger inspection) and deprecated methods flagged by Solution Checker.
- Use `console.log` instead of `window.alert` or `debugger` statements for debugging — alerts may surface to end users.
- Fiddler Auto-Responder allows local file mapping to web resources for faster iteration without republishing to the environment.
- Solution Checker can be run on-demand from the maker portal or automated as part of a CI/CD pipeline.

---

## Mini Quiz

### Q1 — Single Choice

A developer needs to display a notification to a user from a command bar button script, outside of any form context.

Which method should they use?

- A. `Xrm.Navigation.openAlertDialog`
- B. `Xrm.App.addGlobalNotification`
- C. `Xrm.Utility.showProgressIndicator`
- D. `Xrm.Panel.loadPanel`

<details>
<summary>Answer</summary>

**Correct answer:** B. `Xrm.App.addGlobalNotification`

**Explanation:** `addGlobalNotification` is specifically designed to display notifications outside of a form context, such as from a command bar script. `openAlertDialog` is blocking and form-scoped in typical use.

</details>

---

### Q2 — Fill-in-the-Blank

When using `Xrm.WebApi.createRecord`, the API automatically determines whether to use the ___ or ___ namespace methods based on the current client state.

<details>
<summary>Answer</summary>

**Answer:** online, offline

**Explanation:** `Xrm.WebApi` includes both online and offline method sets; calling `createRecord` directly lets the API choose the appropriate one without the developer needing to track client state manually.

</details>

---

### Q3 — Single Choice

A business rule is set to table scope. Where does its logic execute?

- A. Only on form load in the browser
- B. Only when a field value changes in the UI
- C. On the backend, including API calls and data imports
- D. Only when the form save event fires

<details>
<summary>Answer</summary>

**Correct answer:** C. On the backend, including API calls and data imports

**Explanation:** Table-scoped business rules apply logic server-side, ensuring consistency regardless of whether the action comes from the UI, a data import, or an API method call.

</details>

---

### Q4 — Fill-in-the-Blank

To prevent function name collisions across multiple loaded script libraries, developers should use either a ___ prefix or a JavaScript ___ pattern.

<details>
<summary>Answer</summary>

**Answer:** unique, namespace

**Explanation:** Because all loaded libraries share the same global scope on a form, the last-loaded function with a duplicate name wins. Unique prefixes or namespace objects prevent this conflict.

</details>

---

### Q5 — Single Choice

Which of the following is the recommended approach for debugging client scripts without disrupting production app users?

- A. Use `window.alert` to display variable values
- B. Insert `debugger` statements throughout the code
- C. Write messages using `console.log`
- D. Use `Xrm.Navigation.openErrorDialog` to surface errors

<details>
<summary>Answer</summary>

**Correct answer:** C. Write messages using `console.log`

**Explanation:** `console.log` writes to the browser console and is invisible to end users. `window.alert` and `debugger` statements interrupt the user experience and are often accidentally left in production code.

</details>

---

### Q6 — Single Choice

A developer wants to replace a web resource with a local file during development to avoid republishing on every change.

Which tool supports this workflow?

- A. Power Apps Solution Checker
- B. Microsoft Edge F12 Developer Tools
- C. Telerik Fiddler Auto-Responder
- D. Power Apps Monitor

<details>
<summary>Answer</summary>

**Correct answer:** C. Telerik Fiddler Auto-Responder

**Explanation:** Fiddler Auto-Responder intercepts web resource requests and serves local file content instead, enabling faster iteration without uploading and republishing the resource each time.

</details>

---

### Q7 — Fill-in-the-Blank

The `Xrm.Device.___` method is the only Device API method available in both web clients and mobile clients.

<details>
<summary>Answer</summary>

**Answer:** pickFile

**Explanation:** All other `Xrm.Device` methods (captureAudio, captureImage, captureVideo, getBarcodeValue, getCurrentPosition) are restricted to mobile device interactions; `pickFile` also works in the web client.

</details>

---
