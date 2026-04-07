# Recall: Navigation in Canvas Apps (Power Apps)

> **Source files:** 1-understand-navigation.md, 2-navigate-back-function.md, 3-more-ways-to-use-navigate-function.md, 3a-exercise-create-navigation-functions.md

---

## Keywords

| Term | Definition |
|------|-----------|
| `Navigate` | Power Apps function that moves the user to a specified screen, with optional transition and context variables. |
| `Back` | Power Apps function that returns the user to the previously viewed screen using navigation history. |
| `ScreenTransition` | Optional parameter controlling the animation effect when switching between screens. |
| `ContextRecord` | Optional third parameter of `Navigate` used to set or update context variables on the destination screen. |
| `OnSuccess` | Form control property that triggers a formula (e.g., Navigate) only after a successful data submission. |
| `OnTimerEnd` | Timer control property that triggers a formula (e.g., Navigate) when the timer expires. |
| `OnChange` | Dropdown control property that triggers a formula when the selected value changes. |
| `Switch` | Power Apps function for multi-branch conditional logic based on a single input value. |
| `Reset(Self)` | Resets a control (e.g., Dropdown) back to its default value after an action completes. |
| Hidden Screen | A screen included in an app but not exposed to users; used for documentation or reusable templates. |

---

## Main Ideas

- `Navigate(ScreenName, ScreenTransition, {ContextRecord})` — only `ScreenName` is required; the other two parameters are optional.
- `Back([ScreenTransition])` — requires parentheses; reverses the last transition by default unless overridden.
- `Back` depends on navigation history; it does nothing if no prior screen exists (e.g., app opened directly to a screen).
- Available `ScreenTransition` values: `None` (default), `Cover`, `CoverRight`, `Fade`, `UnCover`, `UnCoverRight`.
- `Cover` slides the new screen in from the right; `UnCover` slides the current screen out to the left.
- The `Navigate` function can be used on `OnSelect` (Button/Icon), `OnSuccess` (Form), `OnTimerEnd` (Timer), and `OnChange` (Dropdown).
- A Timer with `AutoStart: true` and `Visible: false` provides automatic, invisible navigation after a set duration.
- Default Timer `Duration` is 60,000 ms (60 seconds); set it to `4000` for a 4-second auto-redirect.
- A Dropdown navigation menu uses a table literal (e.g., `["","Home Screen","Catalog Screen"]`) as its `Items` property, with `""` as the default to prevent preselection.
- `Switch(Self.SelectedText.Value, "Option", Navigate(...), ...)` followed by `Reset(Self)` is the recommended pattern for dropdown navigation.
- `OnChange` fires when the selected value changes; `OnSelect` fires when the control is clicked — use `OnChange` for dropdown navigation.
- Hidden screens are visible in the design environment but inaccessible to app users at runtime.

---

## Mini Quiz

### Q1 — Single Choice

A developer wants to navigate to `DetailScreen` while fading out the current screen and setting a context variable `RecordID` to `42`.

Which formula is correct?

- A. `Navigate(DetailScreen, ScreenTransition.Fade)`
- B. `Navigate(DetailScreen, ScreenTransition.Fade, {RecordID: 42})`
- C. `Back(DetailScreen, ScreenTransition.Fade, {RecordID: 42})`
- D. `Navigate(DetailScreen, {RecordID: 42})`

<details>
<summary>Answer</summary>

**Correct answer:** B. `Navigate(DetailScreen, ScreenTransition.Fade, {RecordID: 42})`

**Explanation:** `Navigate` accepts three parameters: screen name, transition type, and a context record. Option D omits the required transition parameter before the context record.

</details>

---

### Q2 — Fill-in-the-Blank

The `Back` function returns the user to the previously viewed screen and reverses the last transition by default. If no prior screen exists in navigation history, the `Back` function ___.

<details>
<summary>Answer</summary>

**Answer:** won't work (does nothing)

**Explanation:** `Back` relies on navigation history. If a user opens the app directly to a specific screen with no prior navigation, there is no history to return to, so `Back` has no effect.

</details>

---

### Q3 — Single Choice

A developer sets a Form control's `OnSuccess` property to `Navigate('Success Screen', ScreenTransition.Fade)`. When does this navigation trigger?

- A. Every time the form is submitted, regardless of outcome.
- B. Only when the form is opened for editing.
- C. Only after a successful data submission from the form.
- D. When the user selects the form control.

<details>
<summary>Answer</summary>

**Correct answer:** C. Only after a successful data submission from the form.

**Explanation:** The `OnSuccess` property fires exclusively when the form's save operation completes successfully, ensuring users only see the Success Screen on a valid save.

</details>

---

### Q4 — Fill-in-the-Blank

To create a Timer that automatically navigates away after 4 seconds without being visible to the user, set `AutoStart` to `___`, `Duration` to `___`, and `Visible` to `___`.

<details>
<summary>Answer</summary>

**Answer:** `true`, `4000`, `false`

**Explanation:** `AutoStart: true` starts the timer when the screen loads; `Duration: 4000` sets it to 4,000 milliseconds (4 seconds); `Visible: false` hides the timer control from the user.

</details>

---

### Q5 — Single Choice

A developer builds a Dropdown navigation menu. They configure the `Items` property with screen names and write navigation logic. Which property should they use to trigger navigation when a user picks an option?

- A. `OnSelect`
- B. `OnChange`
- C. `OnSuccess`
- D. `OnTimerEnd`

<details>
<summary>Answer</summary>

**Correct answer:** B. `OnChange`

**Explanation:** `OnChange` fires when the dropdown's selected value changes. `OnSelect` fires when the control is clicked, which does not reliably capture value selection in a Dropdown.

</details>

---

### Q6 — Fill-in-the-Blank

After a dropdown navigation formula runs, calling `___(Self)` resets the dropdown back to its default empty value.

<details>
<summary>Answer</summary>

**Answer:** `Reset`

**Explanation:** `Reset(Self)` clears the dropdown selection back to its `Default` property value (`""`), ensuring no option remains highlighted after navigation.

</details>

---

### Q7 — Single Choice

Which `ScreenTransition` value is the default when no transition is specified in `Navigate`?

- A. `ScreenTransition.Fade`
- B. `ScreenTransition.Cover`
- C. `ScreenTransition.UnCover`
- D. `ScreenTransition.None`

<details>
<summary>Answer</summary>

**Correct answer:** D. `ScreenTransition.None`

**Explanation:** When the `ScreenTransition` parameter is omitted, Power Apps defaults to `ScreenTransition.None`, which instantly switches to the new screen without animation.

</details>

---
