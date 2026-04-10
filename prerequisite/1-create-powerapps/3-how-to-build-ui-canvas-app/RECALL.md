# Recall: How to Build the User Interface in a Canvas App

> **Source files:** index.md, 1-use-themes.md, 2-branding-control.md, 3-icons.md, 4-images.md, 5-personalization.md, 6-use-table-phone-form-factors.md, 6a-exercise-create-new-ui.md

---

## Keywords

| Term | Definition |
|------|-----------|
| Theme | A predefined set of colors and visual elements applied app-wide to themeable controls. |
| Fill | A control property that sets the background color of the control. |
| Named Formula | An app-level variable defined under the `Formulas` property to reuse colors or values throughout the app. |
| Icon control | A built-in Power Apps control providing out-of-the-box icons with customizable `OnSelect` and `Color` properties. |
| Image control | A Media control that displays images from local files or connected data sources. |
| Image position | A property defining how an image fits within an Image control (Fill, Fit, Stretch, Tile, Center). |
| User() function | A Power Apps function returning the current user's `Email`, `FullName`, and `Image` from their Microsoft account. |
| Form factor | The target screen type for a canvas app: **Phone** or **Tablet**, affecting layout and control sizing. |
| HoverFill / HoverColor | Control properties that change background and text color when a user hovers over the control. |
| DisabledFill / DisabledColor | Control properties that apply when a control's `DisplayMode` is set to `Disabled`. |
| RGBA / ColorValue | Color input methods accepted by Power Apps: RGBA function, hex string via `ColorValue()`, or `Color.[name]`. |

---

## Main Ideas

- Power Apps provides 20+ out-of-the-box themes; applying a theme instantly updates `Fill` and `Color` properties on all themeable controls.
- Theme changes do **not** override colors already manually set on a control before the theme was applied.
- New blank screens default to `Fill = Color.White`; newly added controls inherit the active theme.
- Control branding properties fall into three states: default (Fill, Color, BorderColor, BorderStyle), hover (HoverFill, HoverColor), and disabled (DisabledFill, DisabledColor).
- Power Apps supports 14 standard fonts via a command-bar dropdown; any supported font name can also be typed manually.
- Brand colors and fonts should be defined as **Named Formulas** on the App object (Tree view → App → Formulas) for consistent reuse.
- The **Icon** control's type can be changed at any time by updating its `Icon` property; icons inherit the active theme color on insertion.
- The `Back()` function navigates to the previous screen; `Navigate('Screen Name')` navigates to a specific screen.
- The **Image** control's performance impact scales with the number and size of images loaded — optimize file sizes accordingly.
- `User().Image`, `User().FullName`, and `User().Email` provide live personalization data from the signed-in Microsoft account.
- Canvas apps support two form factors: **Tablet** (default 16:9 landscape) for desktop/laptop users and **Phone** for smartphones.
- Resizing an app after building requires manually rearranging controls to fit the new form factor.
- The built-in preview tool lets you test app layout on specific device models and orientations without leaving the editor.

---

## Mini Quiz

### Q1 — Single Choice

A developer applies the **Dark Blue** theme to an app but notices that one button still shows the old custom green color she set last week.

Why wasn't the button color updated by the theme?

- A. The Dark Blue theme does not include button styling.
- B. Power Apps does not apply themes to buttons.
- C. Colors manually set on a control before the theme is applied are not overridden.
- D. The button's `DisplayMode` is set to `Disabled`.

<details>
<summary>Answer</summary>

**Correct answer:** C. Colors manually set on a control before the theme is applied are not overridden.

**Explanation:** Power Apps preserves manually configured control colors when a theme is applied, supporting flexible custom theming without losing prior customizations.

</details>

---

### Q2 — Fill-in-the-Blank

To reuse a brand color throughout a canvas app without duplicating values, define it as a ___ on the **App** object using the ___ property.

<details>
<summary>Answer</summary>

**Answer:** Named Formula; Formulas

**Explanation:** Selecting the App in the Tree view and opening the `Formulas` property lets you define named formulas (e.g., `nfBrandingDark = ColorValue("#334A5F")`) that can be referenced anywhere in the app.

</details>

---

### Q3 — Single Choice

A maker wants users to tap an icon and always return to the home screen regardless of navigation history.

Which `OnSelect` formula should be used?

- A. `Back()`
- B. `Navigate('Home Screen')`
- C. `Reset(HomeScreen)`
- D. `Launch('Home Screen')`

<details>
<summary>Answer</summary>

**Correct answer:** B. `Navigate('Home Screen')`

**Explanation:** `Back()` returns to the previous screen in navigation history, which may not always be the home screen. `Navigate('Home Screen')` goes directly to the named screen every time.

</details>

---

### Q4 — Fill-in-the-Blank

The three properties of the `User()` function are `User().___`, `User().___`, and `User().___ `.

<details>
<summary>Answer</summary>

**Answer:** Email; FullName; Image

**Explanation:** These three properties return the signed-in user's email address, display name, and profile photo from their Microsoft account.

</details>

---

### Q5 — Single Choice

A canvas app is built on the **Tablet** form factor with a 16:9 aspect ratio. A user opens it on a smartphone.

What is the most likely result?

- A. The app automatically reformats to a phone layout.
- B. The app crashes and asks the user to switch devices.
- C. The user may not see the entire canvas or may need to rotate their device.
- D. The app switches to Portrait orientation automatically.

<details>
<summary>Answer</summary>

**Correct answer:** C. The user may not see the entire canvas or may need to rotate their device.

**Explanation:** A Tablet form factor app is not optimized for smaller screens; users may need to scroll or rotate to see all content when opening it on a smartphone.

</details>

---

### Q6 — Single Choice

Which **Image position** setting would best preserve the full aspect ratio of a company logo placed in a fixed-size Image control?

- A. Fill
- B. Stretch
- C. Tile
- D. Fit

<details>
<summary>Answer</summary>

**Correct answer:** D. Fit

**Explanation:** The **Fit** setting scales the image to fit within the control while preserving its original aspect ratio, preventing distortion — ideal for logos.

</details>

---

### Q7 — Fill-in-the-Blank

To change an existing Icon control from a Back arrow to a Home icon, update the control's ___ property.

<details>
<summary>Answer</summary>

**Answer:** Icon

**Explanation:** The `Icon` property of an Icon control determines which icon is displayed and can be changed at any time from the command bar or formula bar.

</details>

---
