# Brand a control

- 6 minutes

If a built-in **Microsoft Power Apps** theme doesn't match your app's intended look and feel, you can customize many control properties. Adjusting properties such as **Fill**, **HoverColor**, and **BorderColor** significantly alters a control's appearance. Additionally, Power Apps supports custom font configuration.

Power Apps allows multiple color input methods: RGBA values, hexadecimal codes, or standard HTML color names via `Color.[your selected color]`.

## Typical properties

These apply when the control isn't being interacted with:

- **Fill** - the control's background color
- **Color** - the text color
- **BorderColor** - the color of the control's border
- **BorderStyle** - the border style (solid, dashed, dotted, or none)

## Hover properties

These properties take effect when a user hovers over the control with a mouse:

- **HoverFill** - the background color on hover
- **HoverColor** - the font color on hover

## Disabled properties

These apply when a control's **DisplayMode** is set to **Disabled**:

- **DisabledFill** - the background color when disabled
- **DisabledColor** - the text color when disabled

## Theme-controlled color settings

Some color settings can't be altered and are specific to the selected theme. For example, the **Date picker** control has changeable properties like **Color**, **BorderColor**, **BorderStyle**, **BorderThickness**, and **Fill**, but internal calendar colors remain theme-controlled in Preview mode.

## Font property

Any control that displays text supports the **Font** property. The command bar provides a dropdown of 14 standard fonts supported in Power Apps. You can also enter the name of any supported font manually. For example:

```
"Algerian"
```

## Apply custom branding across your app

Power Apps recognizes color as a data type. You can define colors or fonts as variables and reference them throughout your app using named **Formulas** (accessible when selecting **App** in the Tree view panel).

### Steps to define branding colors

1. From the Home Screen, select **App** in the **Tree view** panel.
2. Open the property dropdown and select **Formulas**.
3. Define your brand colors. For example, Contoso Electronics uses:

    ```
    nfBrandingLight = RGBA(3, 131, 135, 1);
    nfBrandingDark = ColorValue("#334A5F");
    ```

    Here, `nf` stands for "named formula". These values can now be used across your app wherever color is specified.

4. Set the **Fill** property of header rectangles to `nfBrandingDark`.
5. Set the **Fill** property of button controls to `nfBrandingLight`.

> **Tip:** Once a control's appearance matches your branding, copy it to a hidden screen and use it as a template throughout your app.
