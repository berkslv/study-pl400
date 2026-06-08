# Quiz: Imperative Development Techniques in Power Apps Canvas Apps

> **Source material:** 1-imperative-vs-declarative.md, 2-variables.md, 3-global-variables.md, 4-contextual-variables.md, 5-collections.md, 6-additional-variables.md, 7-exercise-variables-collection.md, 8-knowledge-check.md, 9-summary.md
> **Total questions:** 23
> **Question types:** Multiple choice (single), Multiple choice (multi-select), Fill-in-the-blank

---

## Questions

### Question 1 — Single Choice

A developer compares two programming paradigms. One approach requires the developer to define every step — get the ingredients, remove the tomato, assemble the sandwich, send it to the user. The other approach only states the desired outcome.

Which characteristic best describes imperative development compared to declarative development?

- A. It simplifies code by focusing only on the desired outcome
- B. It gives more control by defining each step of the process
- C. It relies on abstraction functions to hide complexity from the developer
- D. It is the default approach used in Excel and other low-code tools

<details>
<summary>Answer</summary>

**Correct answer:** B. It gives more control by defining each step of the process

**Explanation:** Imperative development focuses on *how* to achieve a goal by specifying each step. This gives more control but often comes with more complexity, unlike declarative development which focuses on *what* result is wanted.

</details>

---

### Question 2 — Single Choice

A developer evaluates a formula `GetSandwich(Kitchen, Mouth)` and notes that it requires no knowledge of the intermediate steps. However, customizing the output (such as removing tomatoes) depends entirely on what the function's creator supports.

Which development approach does this formula illustrate?

- A. Imperative development, because the function defines each execution step
- B. Declarative development, because the focus is on the desired result, not the process
- C. Imperative development, because the developer pushes data explicitly
- D. Declarative development, because the developer defines every step in detail

<details>
<summary>Answer</summary>

**Correct answer:** B. Declarative development, because the focus is on the desired result, not the process

**Explanation:** Declarative development focuses on *what* result you want rather than *how* to produce it. Low-code tools like Excel use this approach, and the formula pulls data without requiring the developer to specify intermediate steps.

</details>

---

### Question 3 — Single Choice

A developer new to Power Apps asks whether they need to declare a variable type before assigning a value, as they would in C#.

Which statement accurately describes how variables work in Power Apps?

- A. Variables must be declared with an explicit data type before use
- B. Variables must be initialized to a default value before they can be referenced
- C. Power Apps automatically determines the variable type when a value is first assigned
- D. Variables persist across sessions and are stored in the connected data source

<details>
<summary>Answer</summary>

**Correct answer:** C. Power Apps automatically determines the variable type when a value is first assigned

**Explanation:** In Power Apps, you do not need to initialize, declare, or type a variable. When you assign a value using the appropriate function, Power Apps automatically infers the data type. Variables are also temporary and cleared when the user closes the app.

</details>

---

### Question 4 — Fill-in-the-Blank

Power Apps supports three types of variables. ___ variables are available throughout the entire app, ___ variables are scoped to the screen where they are created, and ___ store a table of data in memory.

<details>
<summary>Answer</summary>

**Answer:** Global, context (contextual), collections

**Explanation:** Global variables use `Set`, context variables use `UpdateContext` and are screen-scoped, and collections use `Collect` or `ClearCollect` to store tabular data in memory.

</details>

---

### Question 5 — Single Choice

A developer wants to store the signed-in user's full name when a canvas app loads, so it can be displayed in a welcome message on every screen without repeated calls to Microsoft Entra ID.

Which formula should they place in the **OnStart** property of the App object?

- A. `UpdateContext({varUserDisplayName: User().FullName})`
- B. `Set(varUserDisplayName, User().FullName)`
- C. `Collect(varUserDisplayName, User().FullName)`
- D. `ClearCollect(varUserDisplayName, User().FullName)`

<details>
<summary>Answer</summary>

**Correct answer:** B. `Set(varUserDisplayName, User().FullName)`

**Explanation:** The `Set` function creates and assigns a value to a global variable. Placing this in `OnStart` ensures the user's name is retrieved once when the app loads and stored for reference across all screens.

</details>

---

### Question 6 — Single Choice

A canvas app displays a welcome message on every screen using the formula `"Welcome " & User().FullName` in each label's Text property. Users report the app becomes slow when navigating between screens.

What is the best approach to improve performance?

- A. Increase the delegation limit in app settings to reduce query frequency
- B. Replace the formula with a hard-coded static string to avoid network calls
- C. Store the user's name in a global variable during `OnStart` and reference it across all screens
- D. Use a context variable on each screen to cache the user's name per screen

<details>
<summary>Answer</summary>

**Correct answer:** C. Store the user's name in a global variable during `OnStart` and reference it across all screens

**Explanation:** Placing `Set(varUserDisplayName, User().FullName)` in `OnStart` retrieves the user's name once. Each screen can then reference `varUserDisplayName` instead of calling `User().FullName` repeatedly, eliminating duplicate network calls to Microsoft Entra ID.

</details>

---

### Question 7 — Single Choice

A developer sets a global variable `varActiveStatus` to `true` in the `OnVisible` property of Screen1 in a multi-screen canvas app.

On which screens is `varActiveStatus` accessible?

- A. Only Screen1, where it was originally set
- B. Only screens that explicitly call the `Set` function to reference the variable
- C. All screens in the app
- D. Only screens that were open at the time the variable was set

<details>
<summary>Answer</summary>

**Correct answer:** C. All screens in the app

**Explanation:** Global variables are available throughout the entire app after they are set, regardless of which screen set them. This is the key advantage of global variables over context variables.

</details>

---

### Question 8 — Single Choice

A developer builds a canvas app with a "Delete record" button on multiple screens. Each screen needs its own popup confirmation dialog that can be shown and hidden independently, without one screen's popup state affecting another.

Which variable type is the most appropriate solution?

- A. Global variable, because it is the most flexible option
- B. Collection, because it stores multiple states as tabular data
- C. Context variable, because the same variable name can have independent values on different screens
- D. Environment variable, because it isolates values by screen

<details>
<summary>Answer</summary>

**Correct answer:** C. Context variable, because the same variable name can have independent values on different screens

**Explanation:** Context variables are scoped to the screen where they are created. When controls are copied to another screen, the context variable with the same name operates independently on each screen, making them ideal for reusable, screen-specific UI state like popup dialogs.

</details>

---

### Question 9 — Single Choice

A developer wants to show a popup confirmation group when a user selects a Trash icon in a gallery. They set the **Visible** property of the popup group to `varPopup`.

Which formula should be placed on the **OnSelect** property of the Trash icon to display the popup?

- A. `Set(varPopup, true)`
- B. `Collect(varPopup, true)`
- C. `UpdateContext({varPopup: true})`
- D. `SetContext(varPopup, true)`

<details>
<summary>Answer</summary>

**Correct answer:** C. `UpdateContext({varPopup: true})`

**Explanation:** The `UpdateContext` function creates and sets context variable values. It takes a record literal as its argument. `Set` is for global variables, and `SetContext` is not a valid Power Apps function.

</details>

---

### Question 10 — Single Choice

A developer needs to initialize three context variables — a counter, an active flag, and the current user's name — in a single formula on a screen's `OnVisible` property.

Which formula correctly declares all three context variables at once?

- A. `Set(varCount, 1); Set(varActive, true); Set(varName, User().FullName)`
- B. `UpdateContext({varCount: 1}); UpdateContext({varActive: true}); UpdateContext({varName: User().FullName})`
- C. `UpdateContext({varCount: 1, varActive: true, varName: User().FullName})`
- D. `Collect(varCount, 1, varActive, true, varName, User().FullName)`

<details>
<summary>Answer</summary>

**Correct answer:** C. `UpdateContext({varCount: 1, varActive: true, varName: User().FullName})`

**Explanation:** The `UpdateContext` function uniquely supports declaring multiple context variables in a single call by separating entries with commas inside a single record literal. The `Set` function requires one call per variable.

</details>

---

### Question 11 — Fill-in-the-Blank

A context variable created using the ___ function is only accessible on the ___ where it was created. Copying controls that use this variable to another screen results in two independent instances of the variable with the same name.

<details>
<summary>Answer</summary>

**Answer:** `UpdateContext`, screen

**Explanation:** Context variables are screen-scoped by design. Unlike global variables (created with `Set`), context variables cannot be read or modified from a different screen, even if they share the same name.

</details>

---

### Question 12 — Multi-Select

A developer is evaluating whether to use a collection to store project data in a canvas app. They want to understand the capabilities and limitations before proceeding.

Which statements about collections are accurate? (Select **three**.)

- A. The `Collect` function is not delegable, so only the first 500 records from a data source are retrieved by default
- B. Collections are linked to the data source and automatically sync changes back
- C. Collections are temporary and are removed when the app is closed
- D. Collections can be used directly with the Form control for editing records
- E. After creation, collections support standard table functions such as Filter, Sort, and CountRows
- F. Collections must always be populated from an existing external data source

<details>
<summary>Answer</summary>

**Correct answer:** A, C, E

**Explanation:** The `Collect` function is not delegable (limited to 500 records by default), collections are temporary in-memory structures cleared on app close, and they support standard table functions. Collections are NOT linked to the data source (changes don't auto-save), cannot be used directly with the Form control, and can be created manually within the app without an external data source.

</details>

---

### Question 13 — Single Choice

A developer configures the `OnStart` property of an app to load a collection named `colCustomer` from a data source each time the app starts. During testing, they notice that records are being duplicated in the collection on subsequent runs.

Which function should they use instead of `Collect` to prevent duplicate records?

- A. `Remove`
- B. `UpdateContext`
- C. `ClearCollect`
- D. `Patch`

<details>
<summary>Answer</summary>

**Correct answer:** C. `ClearCollect`

**Explanation:** `ClearCollect` first clears all existing data from the collection before adding new records, preventing duplication. Using `Collect` appends data to any existing collection contents, which causes duplicates when run multiple times.

</details>

---

### Question 14 — Fill-in-the-Blank

The ___ function used to populate a collection from a data source is not delegable. This means that by default only the first ___ records from the data source are retrieved and stored in the collection.

<details>
<summary>Answer</summary>

**Answer:** `Collect`, 500

**Explanation:** Because `Collect` is not delegable, Power Apps retrieves only the first 500 records by default. Developers who need more records must use techniques to work around delegation limits, such as splitting queries or adjusting the data row limit setting.

</details>

---

### Question 15 — Single Choice

A developer adds a button to a canvas app. Each time the button is pressed, it should increment a global counter by 1. When the app first loads, no initial value has been explicitly set for the counter.

Which formula should be placed on the button's **OnSelect** property?

- A. `Set(varCounter, 1)`
- B. `Set(varCounter, 0 + 1)`
- C. `Set(varCounter, varCounter + 1)`
- D. `Collect(varCounter, varCounter + 1)`

<details>
<summary>Answer</summary>

**Correct answer:** C. `Set(varCounter, varCounter + 1)`

**Explanation:** Variables in Power Apps can self-reference. On the first press, `varCounter` defaults to `0`, so the result is `1`. On each subsequent press, the current value is incremented by `1`. This pattern is commonly used for counter variables.

</details>

---

### Question 16 — Single Choice

A developer adds a button to a canvas app with the formula `Set(varStatus, varStatus & " active")` on its **OnSelect** property. No initial value has been assigned to `varStatus` anywhere in the app.

What value does `varStatus` hold before the button is pressed for the first time?

- A. `null`
- B. `"undefined"`
- C. `0`
- D. `""` (empty string)

<details>
<summary>Answer</summary>

**Correct answer:** D. `""` (empty string)

**Explanation:** In Power Apps, text variables default to `""` (empty string) before they are explicitly set. Number variables default to `0` and Boolean variables default to `false`. No initialization is required, but developers should be aware of these default values.

</details>

---

### Question 17 — Multi-Select

A developer builds a canvas app that uses three different variable types. None of the variables have been explicitly initialized before they are first referenced.

Which statements correctly describe the default values of uninitialized variables in Power Apps? (Select **two**.)

- A. Number variables default to `0`
- B. Boolean variables default to `null`
- C. Text variables default to `""` (empty string)
- D. All uninitialized variables default to `false` regardless of type
- E. Number variables default to `-1`
- F. Boolean variables default to `true`

<details>
<summary>Answer</summary>

**Correct answer:** A, C

**Explanation:** Power Apps assigns type-specific defaults to uninitialized variables: text variables default to `""`, number variables default to `0`, and Boolean variables default to `false`. There is no `null` default for any variable type.

</details>

---

### Question 18 — Single Choice

A developer stores the entire user record in a global variable using `Set(varUser, User())`. The user record contains the columns Email, FullName, and Image. They want to display the user's email address in a Label control.

Which formula should be placed in the Label's **Text** property?

- A. `varUser["Email"]`
- B. `varUser.Email`
- C. `User().Email`
- D. `GetField(varUser, "Email")`

<details>
<summary>Answer</summary>

**Correct answer:** B. `varUser.Email`

**Explanation:** When a record is stored in a variable, individual fields are accessed using dot (`.`) notation. This works for records stored from action-based data sources like `User()` or retrieved using `LookUp` from a tabular data source.

</details>

---

### Question 19 — Fill-in-the-Blank

In Power Apps, variables do not automatically ___ when the underlying data source is modified during an active session. For example, a variable storing an invoice count set during `OnStart` will retain its original value even after a user creates a new invoice, unless the developer adds explicit ___ logic or the app is restarted.

<details>
<summary>Answer</summary>

**Answer:** update (refresh), update (refresh)

**Explanation:** A common source of confusion for developers new to Power Apps is that variables are not reactive. They hold the value assigned at the time of the last explicit `Set` or `UpdateContext` call and do not track changes to data sources on their own.

</details>

---

### Question 20 — Multi-Select

A developer is choosing between global variables and context variables for different requirements in a canvas app.

Which statements correctly describe the differences between global and context variables? (Select **two**.)

- A. Global variables are available on all screens; context variables are scoped to a single screen
- B. Context variables are created with the `Set` function; global variables use `UpdateContext`
- C. Global variables are set using the `Set` function; context variables are set using `UpdateContext`
- D. Context variables can store tabular data, while global variables can only store single values
- E. Global variables support declaring multiple variables in a single formula using a comma separator

<details>
<summary>Answer</summary>

**Correct answer:** A, C

**Explanation:** Global variables use the `Set` function and are accessible across all screens, while context variables use `UpdateContext` and are scoped to the screen where they are created. It is `UpdateContext` — not `Set` — that supports declaring multiple variables in a single formula call.

</details>

---

### Question 21 — Single Choice

A developer wants to populate a combo box control in a canvas app with a list of project statuses: "Active", "On Hold", and "Closed". There is no external data source available for this data.

Which approach is the most appropriate?

- A. Create a global variable that holds a comma-separated string of the status values
- B. Use `ClearCollect` to create a collection with the status values and bind it to the combo box
- C. Hard-code the status values into a context variable scoped to the screen
- D. Use the Form control to load a static list from a SharePoint list

<details>
<summary>Answer</summary>

**Correct answer:** B. Use `ClearCollect` to create a collection with the status values and bind it to the combo box

**Explanation:** Collections can be created dynamically within the app without an external data source, making them ideal for populating dropdown and combo box controls with manually defined data. Context variables and global variables are not designed to hold tables of data in the same way.

</details>

---

### Question 22 — Fill-in-the-Blank

To avoid repeated network calls to Microsoft Entra ID across multiple screens, a developer stores the user's full name using the formula `Set(varUserDisplayName, User().FullName)` in the App object's ___ property. Each Label control on subsequent screens then references ___ in its Text property instead of calling `User().FullName` directly.

<details>
<summary>Answer</summary>

**Answer:** `OnStart`, `varUserDisplayName`

**Explanation:** The `OnStart` property runs once when the app loads, making it the ideal location to initialize global variables with values that would otherwise require repeated data source calls. Referencing the variable on each screen eliminates redundant queries.

</details>

---

### Question 23 — Multi-Select

A developer reviews the unique behaviors of context variables before deciding to use them for screen-level UI state management.

Which statements are true specifically about context variables and not global variables? (Select **two**.)

- A. They are created and set using the `UpdateContext` function
- B. They are available on all screens in the app after being set
- C. They are scoped to the screen where they were created, keeping values independent per screen
- D. They are populated using the `ClearCollect` function
- E. They can only store Boolean or numeric values

<details>
<summary>Answer</summary>

**Correct answer:** A, C

**Explanation:** Context variables are unique in that they use the `UpdateContext` function (instead of `Set`) and are strictly scoped to the screen where they are created. This scoping allows the same variable name to exist independently on multiple screens, which is useful for reusable UI patterns like popups.

</details>
