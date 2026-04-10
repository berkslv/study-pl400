# Quiz: How to Build the User Interface in a Canvas App in Power Apps

> **Source material:** index.md, 1-use-themes.md, 2-branding-control.md, 3-icons.md, 4-images.md, 5-personalization.md, 6-use-table-phone-form-factors.md, 6a-exercise-create-new-ui.md, 7-knowledge-check.md, 8-summary.md
> **Total questions:** 25
> **Question types:** Multiple choice (single), Multiple choice (multi-select), Fill-in-the-blank

---

## Questions

### Question 1 — Single Choice

Your organization uses a specific teal color for all internal tools. You want to apply it consistently to all button controls in a new Power Apps canvas app. None of the built-in themes match this color exactly.

What is the recommended approach to define and reuse this custom color across your app?

- A. Manually set the Fill property on each button individually.
- B. Define the color as a named formula in the App's Formulas property and reference it throughout the app.
- C. Apply the closest built-in theme and accept the color mismatch.
- D. Create a separate screen for each color variation.

<details>
<summary>Answer</summary>

**Correct answer:** B. Define the color as a named formula in the App's Formulas property and reference it throughout the app.

**Explanation:** Power Apps treats color as a data type, allowing you to define colors as named formulas (e.g., `nfBrandingLight = RGBA(3, 131, 135, 1)`) in the App's Formulas property. These named formulas can then be referenced across all controls in the app for consistent branding.

</details>

---

### Question 2 — Single Choice

A maker applies the **Steel** theme to a canvas app. They then manually change the Fill property of one button to match a custom brand color. Later, they decide to switch the theme to **Lavender**.

What happens to the manually customized button's Fill property when the Lavender theme is applied?

- A. The button's Fill property is overridden by the Lavender theme colors.
- B. Power Apps reverts the button to the default white fill.
- C. Power Apps does not override the manually set Fill property.
- D. The button is deleted from the screen.

<details>
<summary>Answer</summary>

**Correct answer:** C. Power Apps does not override the manually set Fill property.

**Explanation:** If you modify any control colors prior to applying a theme, Power Apps does not override those settings. This behavior supports flexibility in how custom theming is applied.

</details>

---

### Question 3 — Single Choice

You are building a canvas app and want to display the current user's profile photo in the app header. The photo is stored in the user's Microsoft account.

Which formula should you set on the Image property of an Image control to display the signed-in user's profile photo?

- A. `CurrentUser.Photo`
- B. `User().Image`
- C. `User().Photo`
- D. `Me().Image`

<details>
<summary>Answer</summary>

**Correct answer:** B. `User().Image`

**Explanation:** The `User()` function provides access to the signed-in user's identity information. The `User().Image` property specifically returns the profile image from the user's Microsoft account.

</details>

---

### Question 4 — Single Choice

A canvas app is built using the Tablet form factor. A user opens the app on a smartphone.

What is the likely outcome?

- A. The app automatically reformats itself to fit the phone screen.
- B. The app displays correctly in both landscape and portrait mode.
- C. The user may not see the entire canvas or may need to rotate the device.
- D. The app refuses to open on a smartphone.

<details>
<summary>Answer</summary>

**Correct answer:** C. The user may not see the entire canvas or may need to rotate the device.

**Explanation:** The Phone form factor allows you to tailor controls and layout for smaller screens. If a Tablet form factor app is opened on a smartphone, users may not see the entire canvas or may need to rotate their device to view it properly.

</details>

---

### Question 5 — Single Choice

You want to add a navigation element to a canvas app screen that takes the user back to the previous screen. You prefer not to use a text label.

Which control type and OnSelect formula combination is most appropriate?

- A. An Image control with `Back()` in the OnSelect property.
- B. An Icon control (Back arrow) with `Back()` in the OnSelect property.
- C. A Button control with `Navigate('Home Screen')` in the OnSelect property.
- D. A Rectangle control with `Back()` in the OnSelect property.

<details>
<summary>Answer</summary>

**Correct answer:** B. An Icon control (Back arrow) with `Back()` in the OnSelect property.

**Explanation:** Power Apps provides an Icon control with many built-in icons, including a Back arrow. Setting the OnSelect property to `Back()` makes it navigate to the previous screen. Icons are advantageous because they don't require text and can fit in compact areas.

</details>

---

### Question 6 — Single Choice

You are configuring display settings for a canvas app. You want the app to maintain a consistent aspect ratio regardless of screen size.

Which setting should you enable in the Display tab of the app Settings?

- A. Lock orientation
- B. Lock aspect ratio
- C. Scale to fit
- D. Custom size

<details>
<summary>Answer</summary>

**Correct answer:** B. Lock aspect ratio

**Explanation:** In the Display tab of the app Settings, the **Lock aspect ratio** option (enabled by default) ensures that the app maintains a consistent aspect ratio across different screen sizes.

</details>

---

### Question 7 — Single Choice

A maker wants to change an existing Back arrow icon to a Home icon on the Admin Screen. They want it to navigate to the Home Screen when selected.

Which two steps are required? (Consider only one answer per single-choice question format.)

What property must be updated to change the icon's visual appearance from a Back arrow to a Home icon?

- A. The OnSelect property
- B. The Color property
- C. The Icon property
- D. The Fill property

<details>
<summary>Answer</summary>

**Correct answer:** C. The Icon property

**Explanation:** You can change an icon type by updating the **Icon** property of the Icon control. Selecting the Icon property in the command bar and choosing the Home icon will immediately change the Back arrow to a Home icon.

</details>

---

### Question 8 — Single Choice

You are building a canvas app and want to display images from a connected data source in a list format.

Which control is most suitable for displaying multiple records, each containing an image from the data source?

- A. Image control
- B. Gallery control
- C. Form control
- D. Data table control

<details>
<summary>Answer</summary>

**Correct answer:** B. Gallery control

**Explanation:** The Image control displays a single image, while a **Gallery** control is designed to display multiple records from a data source. If your data source includes images, you can display them in a Gallery control.

</details>

---

### Question 9 — Single Choice

A maker adds several large image files to their canvas app to enhance the visual design. After publishing, users report that the app loads slowly.

What is the most likely cause of the performance issue?

- A. Too many icon controls are on the screen.
- B. The app is using a Tablet form factor instead of Phone.
- C. The number and size of the image files are impacting app load performance.
- D. Named formulas are consuming too much memory.

<details>
<summary>Answer</summary>

**Correct answer:** C. The number and size of the image files are impacting app load performance.

**Explanation:** The Image control documentation explicitly notes that the number and size of images may impact app performance as Power Apps loads them. Makers should always consider image file size and optimize accordingly.

</details>

---

### Question 10 — Single Choice

You want to apply a consistent color scheme to all controls in a canvas app with a single action.

What is the most efficient way to achieve this?

- A. Manually update the Fill property of each control.
- B. Apply a built-in theme from the Theme selector.
- C. Create a variable for each color and assign it to controls one by one.
- D. Use a named formula only on the screens, not on individual controls.

<details>
<summary>Answer</summary>

**Correct answer:** B. Apply a built-in theme from the Theme selector.

**Explanation:** Applying a theme changes control properties like Fill and Color across all themeable controls with a single selection. Additionally, newly added controls inherit the selected theme, maintaining visual consistency throughout the app.

</details>

---

### Question 11 — Single Choice

A canvas app developer needs to display the currently signed-in user's full name in a text label on the Home Screen.

Which formula should be set on the Text property of the label?

- A. `User.FullName`
- B. `FullName.User()`
- C. `User().FullName`
- D. `User().Name`

<details>
<summary>Answer</summary>

**Correct answer:** C. `User().FullName`

**Explanation:** The `User()` function in Power Apps returns identity information about the signed-in user. The `User().FullName` property specifically returns the full display name from the user's Microsoft account.

</details>

---

### Question 12 — Single Choice

You are reviewing control properties in Power Apps. You want to know which property controls the background color of a button when a user hovers over it with a mouse.

Which property should you configure?

- A. Fill
- B. HoverFill
- C. DisabledFill
- D. PressedFill

<details>
<summary>Answer</summary>

**Correct answer:** B. HoverFill

**Explanation:** The **HoverFill** property defines the background color of a control when a user hovers over it with a mouse. This is distinct from **Fill** (normal state), **DisabledFill** (when control is disabled), and **PressedFill** (when the control is pressed).

</details>

---

### Question 13 — Single Choice

A new blank screen is added to a Power Apps canvas app that has the Steel theme applied.

What is the default Fill property value for the new blank screen?

- A. The Steel theme's background color
- B. `Color.Transparent`
- C. `Color.White`
- D. `RGBA(0, 0, 0, 1)`

<details>
<summary>Answer</summary>

**Correct answer:** C. `Color.White`

**Explanation:** When you add a new blank screen to a canvas app, it defaults to a Fill property of `Color.White`, regardless of which theme is applied to the app.

</details>

---

### Question 14 — Single Choice

You are building a canvas app primarily for use on smartphones. You want the layout to be optimized for smaller screens from the start.

Which form factor should you choose when creating the app?

- A. Tablet
- B. Browser
- C. Phone
- D. Desktop

<details>
<summary>Answer</summary>

**Correct answer:** C. Phone

**Explanation:** The Phone form factor allows you to tailor controls and layout specifically for smaller screens. Using the Tablet form factor for a smartphone-first app may result in users not seeing the entire canvas or needing to rotate their device.

</details>

---

### Question 15 — Single Choice

In the Image control, which ImagePosition value would you use to display the entire image within the control boundaries without cropping, while maintaining the original aspect ratio?

- A. Fill
- B. Stretch
- C. Tile
- D. Fit

<details>
<summary>Answer</summary>

**Correct answer:** D. Fit

**Explanation:** The **Fit** ImagePosition option displays the entire image within the control boundaries while maintaining the original aspect ratio. **Fill** fills the entire control but may crop the image, **Stretch** distorts the aspect ratio, and **Tile** repeats the image.

</details>

---

### Question 16 — Multi-Select

You are customizing the visual appearance of a Button control in Power Apps. (Select **three**.)

Which of the following properties can you configure to change how the button looks when it is not being interacted with?

- A. Fill
- B. HoverFill
- C. Color
- D. DisabledFill
- E. BorderColor
- F. BorderStyle

<details>
<summary>Answer</summary>

**Correct answer:** A. Fill, C. Color, E. BorderColor, F. BorderStyle (any three from A, C, E, F)

**Explanation:** The **Fill** (background color), **Color** (text color), **BorderColor**, and **BorderStyle** properties all apply when the control is in its normal, uninteracted state. **HoverFill** applies on mouse hover, and **DisabledFill** applies when the control is disabled.

</details>

---

### Question 17 — Multi-Select

A maker is reviewing the User() function in Power Apps. (Select **two**.)

Which of the following properties are directly available from the `User()` function?

- A. `User().Email`
- B. `User().Department`
- C. `User().FullName`
- D. `User().JobTitle`
- E. `User().Manager`

<details>
<summary>Answer</summary>

**Correct answer:** A. `User().Email`, C. `User().FullName`

**Explanation:** The `User()` function exposes three properties: `User().Email` (email address), `User().FullName` (display name), and `User().Image` (profile photo). Department, job title, and manager are not directly available through the User() function.

</details>

---

### Question 18 — Multi-Select

You are designing a canvas app and need to specify a color for a control's Fill property. (Select **three**.)

Which of the following color input methods does Power Apps support for color properties?

- A. RGBA values (e.g., `RGBA(3, 131, 135, 1)`)
- B. Hexadecimal color codes (e.g., `ColorValue("#334A5F")`)
- C. HTML color names via `Color.[color name]`
- D. CSS `rgb()` function syntax
- E. JSON color objects

<details>
<summary>Answer</summary>

**Correct answer:** A. RGBA values, B. Hexadecimal color codes, C. HTML color names via `Color.[color name]`

**Explanation:** Power Apps supports multiple color input methods: RGBA values (e.g., `RGBA(3, 131, 135, 1)`), hexadecimal codes via `ColorValue("#334A5F")`, and standard HTML color names via `Color.[your selected color]`. CSS rgb() syntax and JSON color objects are not natively supported.

</details>

---

### Question 19 — Multi-Select

A maker wants to preview how a Tablet form factor canvas app appears on mobile devices. (Select **two**.)

Which of the following can be done using Power Apps' built-in preview tool?

- A. Preview the app on a list of popular smartphone models.
- B. Automatically convert the app to Phone form factor.
- C. Test different device orientations (vertical and horizontal).
- D. Deploy the app directly to a mobile device.
- E. Simulate slow network conditions.

<details>
<summary>Answer</summary>

**Correct answer:** A. Preview the app on a list of popular smartphone models, C. Test different device orientations (vertical and horizontal).

**Explanation:** The built-in preview tool in Power Apps shows how the app appears on different mobile platforms by selecting device icons. Makers can choose from a list of popular smartphone models and test both vertical and horizontal orientations. It does not convert form factors, deploy apps, or simulate network conditions.

</details>

---

### Question 20 — Multi-Select

You are configuring a canvas app's display settings. (Select **two**.)

Which of the following settings can be toggled in the Display tab of the app Settings panel?

- A. Lock aspect ratio
- B. Change form factor
- C. Lock orientation
- D. Enable offline mode
- E. Set theme

<details>
<summary>Answer</summary>

**Correct answer:** A. Lock aspect ratio, C. Lock orientation

**Explanation:** In the Display tab of the app Settings panel, makers can toggle **Lock aspect ratio** (enabled by default) and **Lock orientation**. Form factor changes, offline mode, and theme settings are configured elsewhere.

</details>

---

### Question 21 — Fill-in-the-Blank

In Power Apps, the ___ property of an Image control defines how the image appears within the control boundaries — for example, whether it fills, fits, stretches, tiles, or centers.

<details>
<summary>Answer</summary>

**Answer:** Image position (or ImagePosition)

**Explanation:** The **Image position** property of the Image control determines how the image is displayed within the control. Valid options include Fill, Fit, Stretch, Tile, and Center.

</details>

---

### Question 22 — Fill-in-the-Blank

To access the User's display name in a canvas app formula, you use the expression ___.

<details>
<summary>Answer</summary>

**Answer:** `User().FullName`

**Explanation:** The `User()` function provides identity information about the signed-in user. `User().FullName` returns the full display name from the user's Microsoft account.

</details>

---

### Question 23 — Fill-in-the-Blank

In a Power Apps canvas app, you can define reusable color values by creating ___ in the App's Formulas property, which can then be referenced across all controls.

<details>
<summary>Answer</summary>

**Answer:** named formulas

**Explanation:** Power Apps allows makers to define named formulas (accessible when selecting App in the Tree view panel) that store reusable values like colors or fonts. These named formulas can then be referenced throughout the app wherever a color or font is specified.

</details>

---

### Question 24 — Fill-in-the-Blank

When a canvas app is built on the ___ form factor, it is optimized for use on desktop or laptop computers, while the ___ form factor is better suited for smartphones.

<details>
<summary>Answer</summary>

**Answer:** Tablet; Phone

**Explanation:** Power Apps offers two primary form factors: **Tablet**, which is recommended when most users access the app from a desktop or laptop, and **Phone**, which is recommended when the app is primarily intended for smartphones.

</details>

---

### Question 25 — Fill-in-the-Blank

To navigate an Icon control's OnSelect back to a screen named 'Home Screen', you use the formula ___.

<details>
<summary>Answer</summary>

**Answer:** `Navigate('Home Screen')`

**Explanation:** The `Navigate()` function is used in Power Apps to navigate to a specific screen. When set on the OnSelect property of an Icon control, `Navigate('Home Screen')` takes the user directly to the Home Screen, which is especially useful in apps with many screens where the Back arrow might not return the user to the intended starting point.

</details>
