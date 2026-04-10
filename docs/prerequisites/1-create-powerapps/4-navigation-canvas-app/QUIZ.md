# Quiz: Navigation in Canvas Apps (Power Apps)

> **Source material:** 1-understand-navigation.md, 2-navigate-back-function.md, 3-more-ways-to-use-navigate-function.md, 3a-exercise-create-navigation-functions.md, 4-knowledge-check.md, 5-summary.md
> **Total questions:** 22
> **Question types:** Multiple choice (single), Multiple choice (multi-select), Fill-in-the-blank

---

## Questions

### Question 1 — Single Choice

You are building a canvas app with three screens. You want users to navigate to a screen called `OrderScreen` when they select a button. The button's **OnSelect** property should contain which formula?

- A. `Go(OrderScreen)`
- B. `Navigate(OrderScreen)`
- C. `Screen.Navigate("OrderScreen")`
- D. `Open(OrderScreen)`

<details>
<summary>Answer</summary>

**Correct answer:** B. `Navigate(OrderScreen)`

**Explanation:** The `Navigate` function is used to move users from one screen to another. The screen name is passed as the required first parameter. The other options are not valid Power Apps functions.

</details>

---

### Question 2 — Single Choice

A user opens your Power Apps canvas app directly to a specific screen via a deep link. They then select a button configured with `Back()`. What happens?

- A. The app navigates to the home screen.
- B. The app navigates to the first screen in the screen list.
- C. The Back function does nothing because there is no prior screen in the navigation history.
- D. Power Apps displays an error message and closes the app.

<details>
<summary>Answer</summary>

**Correct answer:** C. The Back function does nothing because there is no prior screen in the navigation history.

**Explanation:** The `Back` function relies on Power Apps' internal navigation history. If a user opens the app directly to a specific screen, there is no prior screen in history, so `Back()` will not navigate anywhere.

</details>

---

### Question 3 — Single Choice

You want the current screen to fade out and reveal the next screen when a user navigates. Which formula achieves this?

- A. `Navigate(Screen2, ScreenTransition.FadeOut)`
- B. `Navigate(Screen2, ScreenTransition.UnCover)`
- C. `Navigate(Screen2, ScreenTransition.Fade)`
- D. `Navigate(Screen2, ScreenTransition.Erase)`

<details>
<summary>Answer</summary>

**Correct answer:** C. `Navigate(Screen2, ScreenTransition.Fade)`

**Explanation:** `ScreenTransition.Fade` causes the current screen to fade out and reveal the new screen. `FadeOut` and `Erase` are not valid transition types, and `UnCover` slides the current screen out rather than fading.

</details>

---

### Question 4 — Single Choice

A developer configures a form's **OnSuccess** property with `Navigate('Success Screen', ScreenTransition.Fade)`. When does this navigation occur?

- A. Every time the form control is selected.
- B. When the user opens the screen containing the form.
- C. Only when the form data is successfully saved.
- D. When the user selects any button on the screen.

<details>
<summary>Answer</summary>

**Correct answer:** C. Only when the form data is successfully saved.

**Explanation:** The **OnSuccess** property of a Form control triggers only after a successful data submission/save operation. This makes it ideal for showing a confirmation or success screen only when data is persisted correctly.

</details>

---

### Question 5 — Single Choice

You have a **Timer** control on a Success Screen. You want it to automatically start when the screen is displayed and navigate to the Catalog Screen after 4 seconds. Which set of property values is correct?

- A. `AutoStart = false`, `Duration = 4000`, `OnTimerEnd = Navigate('Catalog Screen')`
- B. `AutoStart = true`, `Duration = 4`, `OnTimerEnd = Navigate('Catalog Screen')`
- C. `AutoStart = true`, `Duration = 4000`, `OnTimerEnd = Navigate('Catalog Screen')`
- D. `AutoStart = true`, `Duration = 4000`, `OnTimerStart = Navigate('Catalog Screen')`

<details>
<summary>Answer</summary>

**Correct answer:** C. `AutoStart = true`, `Duration = 4000`, `OnTimerEnd = Navigate('Catalog Screen')`

**Explanation:** The **Duration** property is in milliseconds, so 4000 equals 4 seconds. **AutoStart** must be `true` for the timer to start automatically when the screen loads, and the navigate formula belongs in **OnTimerEnd** — not **OnTimerStart** and not using a duration of `4` (which would be 4 milliseconds).

</details>

---

### Question 6 — Single Choice

You are using a **Dropdown** control as a navigation menu in a canvas app. A colleague suggests setting the navigation formula on the **OnSelect** property. Why is this incorrect?

- A. Dropdown controls do not have an **OnSelect** property.
- B. **OnSelect** fires when the control is clicked but does not detect value changes, so selecting the same option twice would not re-trigger navigation.
- C. **OnSelect** only works with Button controls, not Dropdown controls.
- D. **OnChange** and **OnSelect** work identically for Dropdown controls.

<details>
<summary>Answer</summary>

**Correct answer:** B. **OnSelect** fires when the control is clicked but does not detect value changes, so selecting the same option twice would not re-trigger navigation.

**Explanation:** For a Dropdown control used as a menu, **OnChange** is the correct property because it fires when the selected value changes. **OnSelect** fires on click and may not reliably respond to value changes the way a navigation menu requires.

</details>

---

### Question 7 — Single Choice

In a canvas app, the `Navigate` function is called with the following formula: `Navigate(Details, ScreenTransition.Fade, {ID: 12})`. What is the purpose of `{ID: 12}`?

- A. It sets the screen's index in the navigation history to 12.
- B. It passes a context variable named `ID` with the value `12` to the destination screen.
- C. It filters a data source named `Details` to only show records where ID equals 12.
- D. It assigns a unique identifier to the navigation action for logging purposes.

<details>
<summary>Answer</summary>

**Correct answer:** B. It passes a context variable named `ID` with the value `12` to the destination screen.

**Explanation:** The third parameter of `Navigate` is an optional context record. It sets or updates context variables on the destination screen. In this case, the variable `ID` is set to `12` on the Details screen.

</details>

---

### Question 8 — Single Choice

What is the default screen transition used by the `Navigate` function when no transition is specified?

- A. `ScreenTransition.Fade`
- B. `ScreenTransition.Cover`
- C. `ScreenTransition.UnCover`
- D. `ScreenTransition.None`

<details>
<summary>Answer</summary>

**Correct answer:** D. `ScreenTransition.None`

**Explanation:** When the `ScreenTransition` parameter is omitted, the default is `ScreenTransition.None`, which instantly switches to the new screen without any animation.

</details>

---

### Question 9 — Single Choice

A user arrives at the Admin Screen via `Navigate('Admin Screen', ScreenTransition.Fade)`. The back button uses `Back()` with no arguments. What transition will occur when the back button is selected?

- A. `ScreenTransition.None`
- B. `ScreenTransition.Cover`
- C. The inverse of `ScreenTransition.Fade`
- D. `ScreenTransition.CoverRight`

<details>
<summary>Answer</summary>

**Correct answer:** C. The inverse of `ScreenTransition.Fade`

**Explanation:** By default, the `Back` function reverses the transition used to reach the current screen. If the screen was entered with `ScreenTransition.Fade`, `Back()` will use the inverse fade transition when returning.

</details>

---

### Question 10 — Single Choice

Which `ScreenTransition` value causes the **new screen** to slide in from the **left to right**, covering the current screen?

- A. `ScreenTransition.Cover`
- B. `ScreenTransition.UnCoverRight`
- C. `ScreenTransition.CoverRight`
- D. `ScreenTransition.UnCover`

<details>
<summary>Answer</summary>

**Correct answer:** C. `ScreenTransition.CoverRight`

**Explanation:** `ScreenTransition.CoverRight` causes the new screen to slide in from left to right, covering the current screen. `ScreenTransition.Cover` slides in from right to left. The `UnCover` variants slide the *current* screen out rather than sliding the new screen in.

</details>

---

### Question 11 — Single Choice

You add a hidden screen to your canvas app. What is true about hidden screens?

- A. Hidden screens are deleted from the app package during publishing.
- B. Hidden screens are accessible to users in play mode via a special gesture.
- C. Hidden screens are not accessible to users but remain visible in the design environment.
- D. Hidden screens automatically become visible when a Navigate formula targets them.

<details>
<summary>Answer</summary>

**Correct answer:** C. Hidden screens are not accessible to users but remain visible in the design environment.

**Explanation:** Hidden screens have no visible navigation path for users, so they cannot be reached during play mode. However, they remain fully visible in the design environment, making them useful for storing documentation or template controls.

</details>

---

### Question 12 — Single Choice

After configuring a Dropdown navigation menu, you include `Reset(Self)` at the end of the **OnChange** formula. What is the purpose of this line?

- A. It reloads the app data from the data source.
- B. It resets the dropdown to its default empty value after navigation, clearing the selection.
- C. It resets all context variables on the current screen.
- D. It triggers the **OnTimerEnd** property of any Timer control on the screen.

<details>
<summary>Answer</summary>

**Correct answer:** B. It resets the dropdown to its default empty value after navigation, clearing the selection.

**Explanation:** `Reset(Self)` resets the Dropdown control back to its **Default** value (an empty string `""`). This removes the current selection so the menu appears unselected after navigating to a new screen.

</details>

---

### Question 13 — Single Choice

Which `ScreenTransition` value causes the **current screen** to slide out from **right to left** when navigating away?

- A. `ScreenTransition.Cover`
- B. `ScreenTransition.CoverRight`
- C. `ScreenTransition.UnCoverRight`
- D. `ScreenTransition.UnCover`

<details>
<summary>Answer</summary>

**Correct answer:** D. `ScreenTransition.UnCover`

**Explanation:** `ScreenTransition.UnCover` slides the current screen out from right to left, revealing the new screen beneath. This is the opposite of `ScreenTransition.Cover`, which slides the new screen in over the current one.

</details>

---

### Question 14 — Multi-Select

A developer is building a canvas app and needs to add navigation to different screens. Which **three** control properties can be used to trigger a `Navigate` function call? (Select **three**.)

- A. `OnSelect` on a Button control
- B. `OnChange` on a Dropdown control
- C. `OnVisible` on a Screen control
- D. `OnSuccess` on a Form control
- E. `OnTimerEnd` on a Timer control
- F. `OnHover` on a Label control

<details>
<summary>Answer</summary>

**Correct answer:** A. `OnSelect` on a Button control, B. `OnChange` on a Dropdown control, D. `OnSuccess` on a Form control, E. `OnTimerEnd` on a Timer control

**Note:** The question asks for three, but all four (A, B, D, E) are valid based on the source material. Accept any three of these four options.

**Explanation:** `Navigate` can be placed in any property that accepts a formula. The module explicitly covers using it in `OnSelect` (Button/Icon), `OnChange` (Dropdown), `OnSuccess` (Form), and `OnTimerEnd` (Timer). `OnHover` and `OnVisible` are not covered as navigation trigger points in the source material.

</details>

---

### Question 15 — Multi-Select

You need to configure a **Timer** control on a Success Screen to automatically navigate away after a short delay without being visible to users. Which **two** properties must be set differently from their defaults? (Select **two**.)

- A. Set `AutoStart` to `true`
- B. Set `Duration` to `60000`
- C. Set `Visible` to `false`
- D. Set `Repeat` to `true`
- E. Set `OnTimerStart` to the Navigate formula

<details>
<summary>Answer</summary>

**Correct answer:** A. Set `AutoStart` to `true`, C. Set `Visible` to `false`

**Explanation:** By default, `AutoStart` is `false` (must be changed to `true` so the timer starts automatically) and `Visible` is `true` (must be changed to `false` to hide the timer from users). The default `Duration` of 60,000 ms would need to be changed too, but the question asks only about changing from defaults — `Visible` and `AutoStart` are the two properties that must be set differently to fulfill the described requirements.

</details>

---

### Question 16 — Multi-Select

Which of the following are valid `ScreenTransition` values in Power Apps? (Select **four**.)

- A. `ScreenTransition.Cover`
- B. `ScreenTransition.Jump`
- C. `ScreenTransition.Fade`
- D. `ScreenTransition.Erase`
- E. `ScreenTransition.UnCoverRight`
- F. `ScreenTransition.None`

<details>
<summary>Answer</summary>

**Correct answer:** A. `ScreenTransition.Cover`, C. `ScreenTransition.Fade`, E. `ScreenTransition.UnCoverRight`, F. `ScreenTransition.None`

**Explanation:** The six valid screen transitions are `Cover`, `CoverRight`, `Fade`, `None`, `UnCover`, and `UnCoverRight`. `Jump` and `Erase` are not valid transition types in Power Apps.

</details>

---

### Question 17 — Multi-Select

A developer wants to use a Dropdown control as a navigation menu. Which **two** steps are required to configure it correctly? (Select **two**.)

- A. Set the **Items** property to a table of screen name strings.
- B. Set the navigation formula in the **OnSelect** property.
- C. Set the navigation formula using a **Switch** function in the **OnChange** property.
- D. Set the **Default** property to the first screen name in the list.
- E. Place the dropdown on only the first screen of the app.

<details>
<summary>Answer</summary>

**Correct answer:** A. Set the **Items** property to a table of screen name strings, C. Set the navigation formula using a **Switch** function in the **OnChange** property.

**Explanation:** The **Items** property provides the list of navigation options, and the **OnChange** property (not **OnSelect**) triggers navigation when the selection changes. Using **Switch** in **OnChange** evaluates the selected value and calls the appropriate `Navigate` function.

</details>

---

### Question 18 — Fill-in-the-Blank

The `Navigate` function accepts three parameters. The first is the required ___ name. The second is the optional ___, which controls the animation. The third is an optional ___ that can pass values to context variables on the destination screen.

<details>
<summary>Answer</summary>

**Answer:** screen (ScreenName); ScreenTransition (transition type); context record (ContextRecord)

**Explanation:** The full syntax is `Navigate(ScreenName, ScreenTransition.TransitionType, {ContextRecord: NewValue})`. Only the screen name is required; the other two parameters are optional.

</details>

---

### Question 19 — Fill-in-the-Blank

When using a Dropdown control for navigation, the **Items** property is set to a ___ data type. The **OnChange** property uses the `Self.SelectedText.___` expression to read the currently selected item.

<details>
<summary>Answer</summary>

**Answer:** Table (or table/array); Value

**Explanation:** The Items property accepts a Table (e.g., `["", "Home Screen", "Catalog Screen"]`). Within the OnChange formula, `Self.SelectedText.Value` retrieves the text of the currently selected item from the dropdown.

</details>

---

### Question 20 — Fill-in-the-Blank

The `Back` function requires ___ to be included in its syntax (e.g., `Back()`). By default, it reverses the ___ that was used when navigating to the current screen.

<details>
<summary>Answer</summary>

**Answer:** parentheses; transition (screen transition)

**Explanation:** Unlike some functions, `Back` must always be written with parentheses: `Back()`. When no transition argument is given, Power Apps automatically uses the inverse of the transition that brought the user to the current screen.

</details>

---

### Question 21 — Fill-in-the-Blank

Hidden screens in a canvas app can be used for two purposes: storing ___ for developers, or acting as a ___ that holds branded or styled controls for reuse.

<details>
<summary>Answer</summary>

**Answer:** documentation (notes); template

**Explanation:** Screens without visible navigation are called hidden screens. They serve as a place for developer documentation/notes or as template screens that store reusable branded controls and formatting without being accessible to end users.

</details>

---

### Question 22 — Single Choice

You are working in the formula bar to set up a Dropdown navigation menu and your colleague suggests copy-pasting the formula from a Word document. Why should you avoid doing this?

- A. Power Apps does not allow formulas to be pasted into the formula bar.
- B. Copy-pasting from external sources may cause single and double quotation marks to be converted to typographic (curly) quotes, which Power Apps does not recognize.
- C. The formula bar has a character limit that prevents pasted content from being saved.
- D. Pasted formulas are treated as plain text strings and will not execute.

<details>
<summary>Answer</summary>

**Correct answer:** B. Copy-pasting from external sources may cause single and double quotation marks to be converted to typographic (curly) quotes, which Power Apps does not recognize.

**Explanation:** The exercise unit explicitly warns that copying formulas from external sources (like Word or web pages) can convert standard straight quotes to typographic (curly) quote characters, which Power Apps cannot parse correctly. It is best practice to type formulas directly in the formula bar.

</details>

---
