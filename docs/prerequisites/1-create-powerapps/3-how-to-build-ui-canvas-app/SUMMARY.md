# Summary: Building the User Interface in a Canvas App (Power Apps)

> **Source files:** index.md, 1-use-themes.md, 2-branding-control.md, 3-icons.md, 4-images.md, 5-personalization.md, 6-use-table-phone-form-factors.md, 6a-exercise-create-new-ui.md

---

## Themes

- Power Apps includes 20+ out-of-the-box themes (e.g., Lavender, Steel, Dark Blue).
- Themes change control properties like **Fill** and **Color** uniformly across the app.
- Theme options are available when selecting a **Screen** or **App** in the **Tree view** panel.
- Applying a theme takes effect immediately.
- Newly added controls automatically inherit the selected theme.
- Controls with manually modified colors before theme application are **not** overridden by a theme.
- New blank screens default to `Fill = Color.White`.
- To set a custom background color: select the screen → command bar → **Background color** → choose from Theme or Standard palette.
- Hovering over a color in the palette shows its RGBA value; Power Apps treats color as **data type: color**.

---

## Control Branding & Custom Colors

- Color inputs accepted: RGBA values, hexadecimal codes, or `Color.[name]` (HTML color names).

### Typical (idle) Properties

- **Fill** – background color of the control
- **Color** – text color
- **BorderColor** – border color
- **BorderStyle** – solid, dashed, dotted, or none

### Hover Properties

- **HoverFill** – background color when mouse hovers
- **HoverColor** – font color when mouse hovers

### Disabled Properties (when `DisplayMode = Disabled`)

- **DisabledFill** – background color when disabled
- **DisabledColor** – text color when disabled

### Theme-Controlled Properties

- Some internal colors (e.g., the **Date picker** calendar interior) are theme-controlled and cannot be changed via properties.

### Font Configuration

- Any control displaying text supports the **Font** property.
- 14 standard fonts are available via the command bar dropdown; additional fonts can be entered manually.

```
"Algerian"
```

### Named Formulas for App-Wide Branding

- Define colors/fonts as named formulas on **App** → **Formulas** in the Tree view.
- Prefix convention for named formulas: `nf`.

```
nfBrandingLight = RGBA(3, 131, 135, 1);
nfBrandingDark = ColorValue("#334A5F");
```

- Reference named formulas anywhere a color is specified (e.g., `Fill = nfBrandingDark`).
- **Best practice:** Once a control matches branding, copy it to a hidden screen and use it as a template.

---

## Icons

- **Icon** control provides many built-in icons (e.g., back arrow, home, floppy disk).
- Icons don't require text and fit into space where labels cannot.
- Insert via: command bar → **Insert** → expand **Icons** (or search by name).
- Inserted icons inherit the selected theme's color scheme.
- Key customizable properties: **OnSelect**, **Color**, **Icon** (icon type).

### Adding a Navigation Icon

1. Select the target screen and header control.
2. Insert an icon (e.g., **Back arrow**) via **Insert** → **Icons**.
3. Reposition to the desired corner of the header rectangle.
4. Change **Color** to white via command bar → **Color** → Standard colors.
5. Set **OnSelect** to navigate back:

```
Back()
```

6. Copy and paste the icon to reuse configured properties on other screens.

### Changing an Icon Type

1. Copy an existing icon and paste onto the target screen.
2. Select the **Icon** property button in the command bar and choose the new icon type (e.g., **Home**).
3. Update **OnSelect** for the new behavior:

```
Navigate('Home Screen')
```

- **Note:** Use a **Home** icon when an app has many screens; `Back()` may not return to the intended starting point.

---

## Images

- **Image** control is a **Media** control that displays images from local files or connected data sources.
- Can be used to show logos, user photos, gallery images, or screen backgrounds.
- Large or numerous images can degrade app performance — optimize image file sizes.

### Key Properties

| Property | Description |
| --- | --- |
| **Image** | Specifies the image file name or URL |
| **Image position** | Fill, Fit, Stretch, Tile, Center |
| **Transparency** | Controls how much background shows through |

### Uploading and Inserting an Image

1. In **Edit mode**, select the **Media** button from the left-side rail (use ellipsis if hidden).
2. Select **+ Add Media** → **Upload** → choose the image file.
3. The file appears in the **Images** list with a thumbnail.
4. Either select the file from the Media panel or insert an **Image** control and set its **Image** property to the uploaded file.
5. Resize and position the control; adjust **Image position** as needed (**Fit** is commonly appropriate for logos).

- The **Image** property also accepts a formula — if the result is `Data type: image`, the image displays accordingly.

---

## Personalization

- The **User()** function retrieves identity data from the signed-in user's Microsoft account.

| Property | Description |
| --- | --- |
| `User().Email` | Email address of the current user |
| `User().FullName` | Full name of the current user |
| `User().Image` | Profile image of the current user |

### Adding User Personalization

1. Insert an **Image** control and set its **Image** property:

```
User().Image
```

2. Insert a **Text label** and set its **Text** property:

```
User().FullName
```

3. Insert another **Text label** and set its **Text** property:

```
User().Email
```

- If no profile image exists, a silhouette placeholder is shown.
- `User().Email` can be reused to send messages to or filter data for the current user.

---

## Form Factors (Phone vs. Tablet)

- Two primary form factors: **Phone** and **Tablet**.
- **Tablet** — recommended when most users access from desktop or laptop.
- **Phone** — recommended when the app targets smartphones; tailors controls/layout for smaller screens.
- Building on **Tablet** and viewing on a phone may result in incomplete canvas display or require device rotation.
- Responsive apps that adapt to both form factors are possible but require additional design effort.

### Adjusting Display Settings

1. Select **Settings** from the command bar → **Display** tab.
2. Change **Orientation**: **Landscape** (default) or **Portrait**.
3. Change **Size**: default is 16:9; custom aspect ratios available.
4. Toggle **Lock aspect ratio** (enabled by default) and **Lock orientation**.

> **Warning:** Resizing an app after building may require rearranging controls to fit the new form factor.

### Previewing on Different Devices

1. Enter **Preview** mode.
2. Select the tablet, phone, or browser icon in the preview toolbar.
3. Choose a device model from the list (or use **Custom**).
4. Test different orientations (vertical/horizontal) to evaluate layout suitability.

---

## Exercise: Create a Canvas App with Custom UI

1. Go to Power Apps home → **Create** → **Start with a blank canvas** → select **Tablet** form factor.
2. Insert a **Rectangle** control; set **Height** = `80` and span it across the top of the screen.
3. Insert an **Image** control, position in top-left of the rectangle, set **Image** to:

```
User().Image
```

4. Insert a **Text label**, position to the right of the image; set **Width** = `200`; set **Text** to:

```
"Welcome, " & User().FullName
```

5. Set the label **Color** to white.
6. Insert a **Text input** control below the header rectangle.
7. Insert a **Reset Icon** to the right of the text input; set **OnSelect** to:

```
Reset(TextInput1)
```

8. Apply a theme: select **App** or **Screen1** in Tree view → choose a theme (e.g., **Dark Blue**).
9. Enter **Preview** mode; type text into the input, then select **Reset** — text reverts to the default value.
10. Use the preview toolbar to test on different devices (e.g., Samsung Galaxy Tab A7, iPhone 14) and orientations.

> **Note:** `Reset()` returns the control to its **Default** value, not an empty string.

