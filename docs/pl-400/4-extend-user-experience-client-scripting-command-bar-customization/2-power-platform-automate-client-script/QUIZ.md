# Quiz: Automate Client Script with the Power Platform Client API

> **Source material:** 1-introduction.md, 2-best-practices.md, 3-debug.md, 4-exercise.md, 5-check.md, 6-summary.md  
> **Total questions:** 25  
> **Question types:** Multiple choice (single), Multiple choice (multi-select), Fill-in-the-Blank

---

## Questions

### Question 1 — Single Choice

A developer wants to display an informational notification outside the context of a form — for example, from a command bar script — without interrupting the user's workflow.

Which method should the developer use?

- A. `Xrm.Navigation.openAlertDialog`
- B. `Xrm.App.addGlobalNotification`
- C. `Xrm.Utility.showProgressIndicator`
- D. `Xrm.Panel.loadPanel`

<details>
<summary>Answer</summary>

**Correct answer:** B. `Xrm.App.addGlobalNotification`

**Explanation:** The `Xrm.App.addGlobalNotification` method displays error, information, warning, or success notifications for an app and can be used outside the context of a form, making it suitable for command bar scripts.

</details>

---

### Question 2 — Single Choice

You are developing a model-driven app that must capture a photograph using the device camera during an inspection workflow.

Which object in the Client API should you use?

- A. `Xrm.Utility`
- B. `Xrm.Encoding`
- C. `Xrm.Device`
- D. `Xrm.Navigation`

<details>
<summary>Answer</summary>

**Correct answer:** C. `Xrm.Device`

**Explanation:** `Xrm.Device` exposes native device capabilities including `captureImage`, which invokes the device camera to capture an image.

</details>

---

### Question 3 — Single Choice

A field technician uses a model-driven app on a mobile device to scan product barcodes during inventory checks.

Which `Xrm.Device` method should you call to read the barcode?

- A. `captureImage`
- B. `getCurrentPosition`
- C. `pickFile`
- D. `getBarcodeValue`

<details>
<summary>Answer</summary>

**Correct answer:** D. `getBarcodeValue`

**Explanation:** `getBarcodeValue` invokes the device camera to scan barcode information such as a product number.

</details>

---

### Question 4 — Single Choice

A client script needs to encode a FetchXML query string that contains the `&` character before passing it as a URL parameter.

Which `Xrm` object provides encoding capabilities for this scenario?

- A. `Xrm.Utility`
- B. `Xrm.WebApi`
- C. `Xrm.Encoding`
- D. `Xrm.Navigation`

<details>
<summary>Answer</summary>

**Correct answer:** C. `Xrm.Encoding`

**Explanation:** `Xrm.Encoding` is used to encode and decode XML and HTML strings, including FetchXML that contains special characters like `&` or `<`.

</details>

---

### Question 5 — Single Choice

A developer needs to open a table form from a client script when the user selects a record from a custom lookup.

Which `Xrm.Navigation` method should be used?

- A. `openUrl`
- B. `openWebResource`
- C. `openForm`
- D. `openFile`

<details>
<summary>Answer</summary>

**Correct answer:** C. `openForm`

**Explanation:** `Xrm.Navigation.openForm` opens a table form or a quick create form, making it the correct choice for navigating to a record form programmatically.

</details>

---

### Question 6 — Single Choice

Your team wants to retrieve runtime information such as organization settings, user settings, and client information from within a client script.

Which `Xrm.Utility` method should you call?

- A. `getEntityMetadata`
- B. `getGlobalContext`
- C. `getResourceString`
- D. `getAllowedStatusTransitions`

<details>
<summary>Answer</summary>

**Correct answer:** B. `getGlobalContext`

**Explanation:** `Xrm.Utility.getGlobalContext` retrieves the global context, which provides runtime information including organization settings, user settings, app details, and client information.

</details>

---

### Question 7 — Single Choice

A developer's client script calls a long-running server process. While waiting for the result, the user should see a message indicating the app is busy.

Which two `Xrm.Utility` methods should be used together?

- A. `openAlertDialog` and `closeAlertDialog`
- B. `showProgressIndicator` and `closeProgressIndicator`
- C. `addGlobalNotification` and `clearGlobalNotification`
- D. `lookupObjects` and `refreshParentGrid`

<details>
<summary>Answer</summary>

**Correct answer:** B. `showProgressIndicator` and `closeProgressIndicator`

**Explanation:** `Xrm.Utility.showProgressIndicator` displays a progress dialog with a specified message, and `closeProgressIndicator` closes it once the operation completes.

</details>

---

### Question 8 — Single Choice

A developer uses `Xrm.WebApi.createRecord` in a client script that must work both when the device is online and offline.

What is the benefit of using `Xrm.WebApi.createRecord` instead of calling the online or offline namespace methods directly?

- A. It performs the operation faster than the online API.
- B. It automatically determines whether to use the online or offline namespace based on client state.
- C. It bypasses Dataverse security roles for the operation.
- D. It returns a synchronous result without the need for promises.

<details>
<summary>Answer</summary>

**Correct answer:** B. It automatically determines whether to use the online or offline namespace based on client state.

**Explanation:** Using `Xrm.WebAPI.createRecord` means the API determines whether to use the online or offline namespace methods automatically, removing the need for the developer to track the client state manually.

</details>

---

### Question 9 — Single Choice

A business analyst asks why a client script that hides a required field still allows the field to be blank when a record is imported via the API.

What is the most accurate explanation?

- A. Client scripts apply to all access points including imports.
- B. Client scripts are a security mechanism that enforces rules at the server level.
- C. Client scripts only affect the model-driven app UI and do not run during data import or API calls.
- D. The import tool automatically bypasses all business rules.

<details>
<summary>Answer</summary>

**Correct answer:** C. Client scripts only affect the model-driven app UI and do not run during data import or API calls.

**Explanation:** Client scripting addresses client-side UI concerns in model-driven apps. It is not a universal solution — data imported or modified through other access points such as the API or data import tools bypass client scripts entirely.

</details>

---

### Question 10 — Single Choice

You need business logic to run specifically on the **Save** form event. You consider using either a business rule or a client script.

Which statement is correct?

- A. Business rules run on the Save event when scope is set to form.
- B. You must use a client script to run logic on the Save form event.
- C. Business rules run on all form events by default.
- D. The Save event is not supported by either business rules or client scripts.

<details>
<summary>Answer</summary>

**Correct answer:** B. You must use a client script to run logic on the Save form event.

**Explanation:** Business rules only run on form load and field change unless the scope is set to table. If logic must execute on the Save form event, a client script is required.

</details>

---

### Question 11 — Single Choice

A developer wants to display a column value from a related table on an Idea form, updating it in real time as the user changes the lookup.

Which approach provides instant on-form updates without requiring a page refresh?

- A. Calculated columns
- B. Rollup columns
- C. Client script using `Xrm.WebApi`
- D. Power Automate cloud flow

<details>
<summary>Answer</summary>

**Correct answer:** C. Client script using `Xrm.WebApi`

**Explanation:** Calculated columns run logic on retrieve, so changes don't reflect until the form refreshes. Client script using `Xrm.WebApi` can retrieve and display related data instantly as the user interacts with the form.

</details>

---

### Question 12 — Single Choice

A developer discovers a method by inspecting the Client API objects in the browser debugger. The method is not listed in the official Client API reference documentation.

What should the developer do?

- A. Use the method because it works in the current browser version.
- B. Avoid using the method because it is unsupported and may not work in future versions.
- C. Submit a support ticket to have the method added to the documentation.
- D. Use the method only in test environments.

<details>
<summary>Answer</summary>

**Correct answer:** B. Avoid using the method because it is unsupported and may not work in future versions.

**Explanation:** Methods discovered through inspection that are not in the official documentation are unsupported. Using them cannot be guaranteed to work in future versions and may contribute to implementation instability.

</details>

---

### Question 13 — Single Choice

During a code review, a developer notices that a colleague's form script uses jQuery to manipulate the DOM directly.

What guidance should be provided?

- A. jQuery is recommended for model-driven app forms when using modern browsers.
- B. jQuery and direct HTML DOM manipulation libraries are not supported within form scripts or command bar commands.
- C. jQuery is only unsupported on mobile clients.
- D. jQuery can be used for read-only DOM interactions but not for writing values.

<details>
<summary>Answer</summary>

**Correct answer:** B. jQuery and direct HTML DOM manipulation libraries are not supported within form scripts or command bar commands.

**Explanation:** Scripts for model-driven app forms should restrict themselves to methods in the Client API object model. jQuery and other direct HTML DOM manipulation libraries are not supported.

</details>

---

### Question 14 — Single Choice

A developer is writing a client script that performs a query against Dataverse. The developer wants to ensure the UI remains responsive during the query.

What coding approach should be used?

- A. Synchronous code that blocks until the query returns.
- B. Asynchronous patterns to ensure a non-blocking user experience.
- C. A confirmation dialog to pause the user while the query runs.
- D. A progress indicator that blocks user input until the query completes.

<details>
<summary>Answer</summary>

**Correct answer:** B. Asynchronous patterns to ensure a non-blocking user experience.

**Explanation:** Non-blocking code using asynchronous patterns should be used when performing queries or process-intensive activities to keep the UI responsive.

</details>

---

### Question 15 — Single Choice

A team uses a shared development environment with multiple developers iterating on JavaScript web resources. Republishing for every small change is slowing development.

Which tool can help developers test local file changes without republishing to the environment each time?

- A. Power Apps Test Studio
- B. Telerik Fiddler Auto-Responder
- C. Visual Studio Live Share
- D. Browser localStorage

<details>
<summary>Answer</summary>

**Correct answer:** B. Telerik Fiddler Auto-Responder

**Explanation:** Fiddler Auto-Responder can replace the content of a web resource with content from a local file, avoiding the need to republish and clear the browser cache on every edit.

</details>

---

### Question 16 — Single Choice

A developer adds `window.alert` calls throughout a client script during debugging and then deploys the solution to production without removing them.

What is the risk?

- A. The alerts will be silently suppressed by modern browsers.
- B. The alerts will interrupt users of the production application.
- C. The solution checker will remove the alert calls automatically.
- D. The alerts will only appear in non-Chromium browsers.

<details>
<summary>Answer</summary>

**Correct answer:** B. The alerts will interrupt users of the production application.

**Explanation:** `window.alert` calls left in production code are disruptive to app users. The recommended alternative is to write messages to the browser console so they are not visible to end users.

</details>

---

### Question 17 — Single Choice

Solution Checker is configured to run as part of an automated build process in an organization's ALM pipeline.

What is a benefit of this configuration compared to running it on demand only?

- A. It compresses JavaScript files to improve load performance.
- B. It proactively identifies and remediates problems before release to users.
- C. It automatically fixes deprecated method usage in web resources.
- D. It generates test data for client script validation.

<details>
<summary>Answer</summary>

**Correct answer:** B. It proactively identifies and remediates problems before release to users.

**Explanation:** Running Solution Checker regularly as part of the ALM process allows teams to identify and resolve performance, stability, reliability, and deprecated method issues before they reach production users.

</details>

---

### Question 18 — Multi-Select

A developer needs to select naming strategies to prevent function name conflicts when multiple JavaScript libraries are loaded on the same model-driven app form. (Select **two**.)

- A. Use a unique prefix for every function name (e.g., `MyUniqueName_functionName`)
- B. Store all functions as properties of a globally shared `window` object
- C. Associate functions with a namespace object (e.g., `MyUniqueName.MyFunctions.action`)
- D. Name functions using only lowercase letters
- E. Prefix function names with the table's logical name

<details>
<summary>Answer</summary>

**Correct answer:** A and C

**Explanation:** The two recommended strategies are using a unique function prefix to avoid collisions and using a namespace object to group functions. Both ensure that functions from different libraries do not overwrite each other.

</details>

---

### Question 19 — Multi-Select

A developer is considering whether to implement a requirement using business rules or client scripting. Which scenarios require client scripting rather than business rules? (Select **two**.)

- A. Setting a field value when another field changes
- B. Running logic on the form Save event
- C. Hiding a field when a Yes/No column is set to No
- D. Referencing data from a related table to drive field requirement levels
- E. Showing an error message when a date field is empty

<details>
<summary>Answer</summary>

**Correct answer:** B and D

**Explanation:** Business rules do not support the Save event (unless scoped to table for save) and cannot reference related table data. Client script is required in both cases. The other options are standard business rule capabilities.

</details>

---

### Question 20 — Multi-Select

Which of the following are methods available in the `Xrm.WebApi` object? (Select **three**.)

- A. `retrieveMultipleRecords`
- B. `openForm`
- C. `executeMultiple`
- D. `captureImage`
- E. `updateRecord`
- F. `showProgressIndicator`

<details>
<summary>Answer</summary>

**Correct answer:** A, C, and E

**Explanation:** `retrieveMultipleRecords`, `executeMultiple`, and `updateRecord` are all methods of `Xrm.WebApi`. `openForm` belongs to `Xrm.Navigation`, `captureImage` to `Xrm.Device`, and `showProgressIndicator` to `Xrm.Utility`.

</details>

---

### Question 21 — Multi-Select

Which of the following are reasons `Xrm.Device` methods might fail at runtime? (Select **two**.)

- A. The device lacks the required hardware capability (e.g., no camera).
- B. The user has not signed into the model-driven app.
- C. The user denied the app permission to access the device capability.
- D. The method is called from a command bar script instead of a form script.
- E. The form is in read-only mode.

<details>
<summary>Answer</summary>

**Correct answer:** A and C

**Explanation:** Device methods may fail because of the device's capabilities (e.g., no camera), its configuration, lack of permissions, or the user's consent settings (e.g., denying camera access).

</details>

---

### Question 22 — Fill-in-the-Blank

The `Xrm.WebApi` object allows client scripts to perform CRUD operations in the context of the current app user. When the app is online, the method `___` can be used to run a single action, function, or CRUD operation.

<details>
<summary>Answer</summary>

**Answer:** `execute`

**Explanation:** `Xrm.WebApi.online.execute` runs a single action, function, or CRUD operation. It is part of the online namespace of the `Xrm.WebApi` object.

</details>

---

### Question 23 — Fill-in-the-Blank

To prevent function name conflicts across multiple JavaScript libraries loaded on a form, developers can associate functions with a script object to create a ___ .

<details>
<summary>Answer</summary>

**Answer:** namespace

**Explanation:** Using a namespace object groups related functions under a unique identifier, preventing collisions with functions of the same name in other libraries loaded on the same form.

</details>

---

### Question 24 — Fill-in-the-Blank

During development, instead of using `window.alert` to display debug messages, developers should write messages to the browser ___ to avoid disrupting other app users.

<details>
<summary>Answer</summary>

**Answer:** console

**Explanation:** Writing debug messages to the console (e.g., using `console.log`) is the recommended practice because the messages are not visible to end users, even if the logging calls are accidentally left in production code.

</details>

---

### Question 25 — Fill-in-the-Blank

To check whether a table is available in offline mode for a given user profile, you can call `Xrm.WebApi.___` which returns a Boolean value.

<details>
<summary>Answer</summary>

**Answer:** `isAvailableOffline`

**Explanation:** `Xrm.WebApi.isAvailableOffline` returns a Boolean value indicating whether a table is present in a user's profile and available in offline mode.

</details>
