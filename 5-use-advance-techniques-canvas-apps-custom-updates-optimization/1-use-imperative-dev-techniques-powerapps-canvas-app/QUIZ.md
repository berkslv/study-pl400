# Quiz: Imperative Development Techniques in Power Apps Canvas Apps

> **Source material:** 1-imperative-vs-declarative.md, 2-variables.md, 3-global-variables.md, 4-contextual-variables.md, 5-collections.md, 6-additional-variables.md, 6a-exercise-variables-collection.md, 7-knowledge-check.md, 8-summary.md
> **Total questions:** 25
> **Question types:** Multiple choice (single), Multiple choice (multi-select), Fill-in-the-blank

---

## Questions

### Question 1 — Single Choice

A developer is choosing between imperative and declarative programming for a new Power Apps canvas app feature. They need fine-grained control over every step of the data processing logic.

Which programming approach should they use?

- A. Declarative, because it focuses on what result you want
- B. Imperative, because it focuses on how to achieve a goal
- C. Declarative, because it is the only approach Power Apps supports
- D. Imperative, because it always produces simpler, easier-to-read code

<details>
<summary>Answer</summary>

**Correct answer:** B. Imperative, because it focuses on how to achieve a goal

**Explanation:** Imperative development focuses on *how* to achieve a goal and gives developers more control by defining each step of the process. Declarative development focuses on *what* result you want, which is simpler but offers less control over execution.

</details>

---

### Question 2 — Single Choice

A Power Apps developer wants to store information that can be accessed from any screen in the app. They need to set the value once and reference it on multiple screens without repeated data source calls.

Which type of variable should they use?

- A. Context variable, using UpdateContext
- B. Collection, using the Collect function
- C. Global variable, using the Set function
- D. Local variable, using the Let function

<details>
<summary>Answer</summary>

**Correct answer:** C. Global variable, using the Set function

**Explanation:** Global variables are created and set with the `Set` function and can be referenced anywhere within the app. Context variables are scoped to a single screen, and collections store tabular data rather than single values. There is no "local variable" type in Power Apps.

</details>

---

### Question 3 — Single Choice

An app displays a welcome message using `"Welcome " & User().FullName` on five different screens. Users report that the app feels slow when navigating between screens.

What is the most likely cause of this performance issue?

- A. The `User()` function is not supported in Label controls
- B. Each screen load triggers a separate network call to Microsoft Entra ID to resolve the user's name
- C. The string concatenation operator `&` is computationally expensive
- D. Welcome messages should only appear on the first screen

<details>
<summary>Answer</summary>

**Correct answer:** B. Each screen load triggers a separate network call to Microsoft Entra ID to resolve the user's name

**Explanation:** Using `User().FullName` inline on every screen causes Power Apps to query Microsoft Entra ID every time a screen opens, generating repetitive network calls that slow down the app. Storing the result in a global variable at app start and referencing that variable on each screen eliminates these redundant calls.

</details>

---

### Question 4 — Single Choice

A developer sets up the following formula on the `OnStart` property of the App object:

```
Set(varUserDisplayName, User().FullName)
```

Where should the developer reference `varUserDisplayName` to display the user's name in a Label control?

- A. In the `Text` property of the Label, as `"Welcome " & varUserDisplayName`
- B. In the `OnVisible` property of each screen
- C. In the `OnSelect` property of the Label control
- D. In the `Default` property of a Text Input control only

<details>
<summary>Answer</summary>

**Correct answer:** A. In the `Text` property of the Label, as `"Welcome " & varUserDisplayName`

**Explanation:** After setting a global variable with `Set`, you reference its value directly by name in any property of any control. Using `"Welcome " & varUserDisplayName` in the Label's `Text` property produces the same output as the inline `User().FullName` call but without repeated network queries.

</details>

---

### Question 5 — Single Choice

A canvas app has a complex formula that checks whether a customer has more than three outstanding invoices. This check needs to control the `Visible` property of both a warning icon and an approval button on the same screen.

What is the best approach to avoid duplicate network calls and simplify maintenance?

- A. Copy the formula into the `Visible` property of both controls
- B. Set a global variable using the complex formula in `OnStart` and bind both controls to that variable
- C. Set a variable using the complex formula in the screen's `OnVisible` property, then bind both controls to that variable
- D. Create two separate data connections and bind each control to its own connection

<details>
<summary>Answer</summary>

**Correct answer:** C. Set a variable using the complex formula in the screen's `OnVisible` property, then bind both controls to that variable

**Explanation:** Running the complex formula once in the screen's `OnVisible` property and storing the result in a variable means the data source is queried only once per screen load. Both controls then reference the variable, which eliminates duplicate network traffic and keeps the formula in a single location for easier maintenance.

</details>

---

### Question 6 — Single Choice

A developer copies a group of controls that include a popup dialog driven by a context variable named `varShowPopUp` from Screen1 to Screen2.

What happens to the value of `varShowPopUp` on Screen1 when it is set to `true` on Screen2?

- A. The value on Screen1 also changes to `true` because global variable names are shared
- B. The value on Screen1 is unaffected because context variables are scoped to the screen where they are created
- C. An error occurs because two variables cannot share the same name in the same app
- D. The value on Screen1 resets to its default because context variables are read-only after copying

<details>
<summary>Answer</summary>

**Correct answer:** B. The value on Screen1 is unaffected because context variables are scoped to the screen where they are created

**Explanation:** Context variables with the same name on different screens are independent. Each instance is scoped to its own screen, so changing `varShowPopUp` on Screen2 does not affect the value of `varShowPopUp` on Screen1.

</details>

---

### Question 7 — Single Choice

A developer is unsure whether to use a global variable or a context variable for a new feature. The feature doesn't need to share state across screens.

Which guidance does Microsoft recommend as the default choice when in doubt?

- A. Context variables, because they are faster to evaluate
- B. Collections, because they are the most flexible variable type
- C. Global variables, because they are available everywhere and offer the most flexibility
- D. Context variables, because they prevent accidental cross-screen state sharing

<details>
<summary>Answer</summary>

**Correct answer:** C. Global variables, because they are available everywhere and offer the most flexibility

**Explanation:** According to the documentation, when in doubt about whether to use global or contextual variables, global variables are the default answer because they are available everywhere in the app, making them the most flexible option.

</details>

---

### Question 8 — Single Choice

A developer needs to declare three context variables in a single formula call. Which formula correctly creates `varCount` set to `1`, `varActive` set to `true`, and `varName` set to the user's full name?

- A. `Set(varCount, 1); Set(varActive, true); Set(varName, User().FullName)`
- B. `UpdateContext({varCount: 1, varActive: true, varName: User().FullName})`
- C. `UpdateContext(varCount: 1); UpdateContext(varActive: true); UpdateContext(varName: User().FullName)`
- D. `Set({varCount: 1, varActive: true, varName: User().FullName})`

<details>
<summary>Answer</summary>

**Correct answer:** B. `UpdateContext({varCount: 1, varActive: true, varName: User().FullName})`

**Explanation:** `UpdateContext` accepts a record containing multiple name-value pairs, allowing multiple context variables to be declared or updated in a single call. The `Set` function can only set one variable per call, so multiple `Set` statements are needed to achieve the same result with global variables.

</details>

---

### Question 9 — Single Choice

A developer uses the following formula to populate a collection: `Collect(collectProjects, Projects)`. After the app loads, a user adds a new record directly in the connected data source.

What happens to the data in `collectProjects`?

- A. `collectProjects` is automatically refreshed to include the new record
- B. `collectProjects` remains unchanged until the app explicitly re-queries the data source
- C. `collectProjects` is cleared and must be repopulated using `ClearCollect`
- D. An error is raised because collections cannot be created from an existing data source

<details>
<summary>Answer</summary>

**Correct answer:** B. `collectProjects` remains unchanged until the app explicitly re-queries the data source

**Explanation:** Collections are not linked to the data source after they are created. Changes made to the data source after collection creation are not automatically reflected in the collection. The app must explicitly re-query (e.g., re-run `Collect` or `ClearCollect`) to refresh the data.

</details>

---

### Question 10 — Single Choice

A developer creates the collection `collectProjects` using `Collect(collectProjects, Projects)` where the data source has 1,200 records. How many records will the collection contain by default?

- A. All 1,200 records, because Collect retrieves the full data set
- B. Up to 2,000 records, the default Power Apps delegation limit
- C. Up to 500 records, because Collect is not delegable and uses the default data row limit
- D. Zero records, because Collect requires a Filter expression to retrieve data

<details>
<summary>Answer</summary>

**Correct answer:** C. Up to 500 records, because Collect is not delegable and uses the default data row limit

**Explanation:** The `Collect` function is not delegable, which means by default only the first 500 records from the data source are retrieved and stored in the collection. Developers who need more records must handle delegation limits separately.

</details>

---

### Question 11 — Single Choice

A developer adds the following formula to a Button's `OnSelect` property:

```
Set(varCounter, varCounter + 1)
```

The button is selected three times in a row. What is the value of `varCounter` after the third press, assuming no other formula sets `varCounter`?

- A. 0, because variables reset after each button press
- B. 1, because `Set` always assigns a fixed value
- C. 3, because `varCounter` starts at 0 and is incremented by 1 each press
- D. An error, because a variable cannot reference itself inside a `Set` formula

<details>
<summary>Answer</summary>

**Correct answer:** C. 3, because `varCounter` starts at 0 and is incremented by 1 each press

**Explanation:** Variables can self-reference in Power Apps. An unset number variable defaults to `0`. Each button press evaluates `varCounter + 1` using the current value and stores the result back, so after three presses the value is `3`.

</details>

---

### Question 12 — Single Choice

A developer stores the entire user record in a global variable with `Set(varUser, User())`. They want to display the user's email address in a Label. Which formula should they use in the Label's `Text` property?

- A. `varUser["Email"]`
- B. `varUser.Email`
- C. `GetField(varUser, "Email")`
- D. `varUser->Email`

<details>
<summary>Answer</summary>

**Correct answer:** B. `varUser.Email`

**Explanation:** When a record is stored in a variable, individual fields are accessed using dot (`.`) notation. The `User()` record has three columns — `Email`, `FullName`, and `Image` — all of which can be accessed using `varUser.Email`, `varUser.FullName`, or `varUser.Image`.

</details>

---

### Question 13 — Single Choice

An app stores the number of open support tickets in a global variable during `OnStart`. A support agent submits a new ticket while using the app. The agent notices the ticket count displayed in the app hasn't changed.

What is the most accurate explanation for this behaviour?

- A. Global variables are read-only and cannot track changing data
- B. Variables do not automatically update; the variable only reflects the value it was set to, until explicitly updated or the app is restarted
- C. The `Set` function is asynchronous, so updates are delayed by up to 30 seconds
- D. The support ticket data source is not compatible with global variables

<details>
<summary>Answer</summary>

**Correct answer:** B. Variables do not automatically update; the variable only reflects the value it was set to, until explicitly updated or the app is restarted

**Explanation:** Variables in Power Apps do not auto-update when the underlying data changes. The variable retains its original value until the app explicitly updates it (e.g., by re-running a `Set` formula after the new record is created) or until the app is closed and reopened, triggering `OnStart` again.

</details>

---

### Question 14 — Single Choice

A developer needs to temporarily store a table of customer records retrieved from Dataverse and display them in a Gallery control. Which function should they use to create the collection?

- A. `Set`
- B. `UpdateContext`
- C. `Collect` or `ClearCollect`
- D. `LookUp`

<details>
<summary>Answer</summary>

**Correct answer:** C. `Collect` or `ClearCollect`

**Explanation:** Collections are created with the `Collect` or `ClearCollect` functions. `Collect` appends records to an existing collection, while `ClearCollect` clears the collection first and then adds the records. `Set` and `UpdateContext` are used for single-value variables, and `LookUp` retrieves a single record from a table.

</details>

---

### Question 15 — Single Choice

Which of the following controls is explicitly NOT compatible with a collection as its data source?

- A. Gallery
- B. Data Table
- C. Form control
- D. Combo Box

<details>
<summary>Answer</summary>

**Correct answer:** C. Form control

**Explanation:** According to the documentation, collections cannot be used directly with the Form control, even though they store tabular data. Galleries, Data Tables, and Combo Boxes can all use collections as their data source.

</details>

---

### Question 16 — Multi-Select

A team is reviewing best practices for variable usage in Power Apps canvas apps. They need to identify scenarios where using a **global variable** is the most appropriate choice. (Select **three**.)

- A. Storing a user's display name at app start so it can be shown on every screen
- B. Storing a Boolean value that controls the visibility of a popup that is copied to multiple screens independently
- C. Caching a complex calculation result that is referenced in multiple formulas across different screens
- D. Storing tabular data from a data source for reuse throughout the app
- E. Keeping track of a running counter that multiple screens need to read and increment
- F. Storing a single record retrieved via LookUp so its fields can be accessed using dot notation across the app

<details>
<summary>Answer</summary>

**Correct answer:** A, C, F

**Explanation:** Global variables are ideal for values that need to be shared across multiple screens: storing user info at startup (A), caching cross-screen computations (C), and storing a record for dot-notation access throughout the app (F). Popup state reused independently per screen (B) benefits from context variables. Tabular data (D) uses collections, not global variables. A counter shared across screens (E) can use a global variable, but storing tabular data (D) requires a collection.

</details>

---

### Question 17 — Multi-Select

A developer is learning about collections in Power Apps. Which of the following statements about collections are **true**? (Select **two**.)

- A. A collection is automatically synchronized with its data source when the data source changes
- B. A collection is removed from memory when the user closes the app
- C. A collection can be created manually within the app without loading data from an external data source
- D. A collection can be used directly with the Form control to display and edit records
- E. A collection is only accessible on the screen where it is created

<details>
<summary>Answer</summary>

**Correct answer:** B, C

**Explanation:** Collections are temporary and are cleared when the app is closed (B). They can also be created dynamically within the app without an external data source, for example to populate a dropdown list (C). Collections are not auto-synced with their data source (A), cannot be used directly with the Form control (D), and are available throughout the entire app — not just the screen where they are created (E).

</details>

---

### Question 18 — Multi-Select

A developer is explaining the differences between Power Apps variable types to a new team member. Which of the following statements correctly describe **context variables**? (Select **two**.)

- A. They are created and updated using the `Set` function
- B. They are scoped to the screen where they are created
- C. They can be referenced from any screen in the app
- D. They allow multiple variables to be declared in a single function call
- E. They persist after the user closes the app

<details>
<summary>Answer</summary>

**Correct answer:** B, D

**Explanation:** Context variables are scoped to the screen where they are created (B) and the `UpdateContext` function allows multiple context variables to be declared at once using a record syntax (D). They are created with `UpdateContext`, not `Set` (A). They cannot be referenced from other screens (C). Like all variables in Power Apps, they do not persist after the app is closed (E).

</details>

---

### Question 19 — Multi-Select

An organization wants to improve the performance of their Power Apps canvas app. Which of the following actions leverage variables to achieve performance improvements? (Select **two**.)

- A. Using `Set` in `OnStart` to store `User().FullName` once instead of calling `User()` inline on every screen
- B. Using `UpdateContext` to set a Boolean variable instead of evaluating a complex filter formula on multiple controls
- C. Using `Collect` to store all records from a large data source exceeding 10,000 rows
- D. Using a global variable to track which screen the user is currently viewing
- E. Using `ClearCollect` after every button press to refresh the collection in real time

<details>
<summary>Answer</summary>

**Correct answer:** A, B

**Explanation:** Storing `User().FullName` in a global variable at startup eliminates repeated Entra ID network calls (A). Using a variable to store the result of a complex formula means the formula runs once instead of once per control that uses it, reducing duplicate processing (B). `Collect` has a 500-record non-delegable limit, making it unsuitable for very large data sets (C). Tracking screen navigation in a variable doesn't directly improve performance (D). Calling `ClearCollect` on every button press would hurt performance rather than improve it (E).

</details>

---

### Question 20 — Multi-Select

A developer is deciding what default values to expect when variables are first used without being explicitly set. Which of the following pairings of **variable type** and **default value** are correct? (Select **three**.)

- A. Text variable → `""` (empty string)
- B. Number variable → `1`
- C. Boolean variable → `false`
- D. Text variable → `null`
- E. Number variable → `0`
- F. Boolean variable → `true`

<details>
<summary>Answer</summary>

**Correct answer:** A, C, E

**Explanation:** In Power Apps, variables that have not been explicitly set have the following default values: Text → `""` (empty string), Number → `0`, Boolean → `false`. They do not default to `null`, `1`, or `true`.

</details>

---

### Question 21 — Fill-in-the-Blank

In Power Apps, you use the `___` function to create or update a global variable, and the `___` function to create or update a context variable.

<details>
<summary>Answer</summary>

**Answer:** `Set` (global variable); `UpdateContext` (context variable)

**Explanation:** `Set` creates and updates global variables that are accessible throughout the entire app. `UpdateContext` creates and updates context variables that are scoped to the screen where they are used.

</details>

---

### Question 22 — Fill-in-the-Blank

A developer writes the following formula in the `OnStart` property of the App object:

```
Set(varUser, User())
```

To display the user's full name from the stored record in a Label control, the developer sets the Label's `Text` property to `___`.

<details>
<summary>Answer</summary>

**Answer:** `varUser.FullName`

**Explanation:** When a record is stored in a variable, individual fields are accessed using dot (`.`) notation. The `User()` function returns a record with `Email`, `FullName`, and `Image` fields, so `varUser.FullName` retrieves the full name from the stored record.

</details>

---

### Question 23 — Fill-in-the-Blank

Collections are created using the `___` function, which appends records to an existing collection, or the `___` function, which clears the collection before adding new records.

<details>
<summary>Answer</summary>

**Answer:** `Collect`; `ClearCollect`

**Explanation:** `Collect` adds records to a collection without removing existing ones, while `ClearCollect` clears all existing records first and then adds the new ones. Both functions create the collection if it does not already exist.

</details>

---

### Question 24 — Fill-in-the-Blank

Variables in Power Apps are `___` by nature, which means the information stored in them is no longer available once `___`.

<details>
<summary>Answer</summary>

**Answer:** temporary; the user closes the app (or their session ends)

**Explanation:** All three variable types — global variables, context variables, and collections — are temporary and session-scoped. When the user closes Power Apps, all variable data is lost. To persist data, it must be written to a data source before the session ends.

</details>

---

### Question 25 — Fill-in-the-Blank

When using `Collect` to load data from a data source, by default only the first `___` records are retrieved because the `Collect` function is not `___`.

<details>
<summary>Answer</summary>

**Answer:** 500; delegable

**Explanation:** The `Collect` function is not delegable, meaning the data retrieval is processed on the client side rather than the server side. As a result, only the first 500 records (the default data row limit) are retrieved from the data source and stored in the collection.

</details>
