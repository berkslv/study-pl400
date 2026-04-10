# Build for phones or tablets

- 6 minutes

When building a Microsoft Power Apps canvas app, you can choose between two primary form factors: **Phone** or **Tablet**.

- Use the **Tablet** form factor if most users access the app from a desktop or laptop computer.
- Use the **Phone** form factor if the app is primarily intended for smartphones.

The **Phone** form factor allows you to tailor controls and layout specifically for smaller screens. If you build on the **Tablet** form factor and open the app on a smartphone, users may not see the entire canvas or may need to rotate their device.

> **Note:** It's possible to design a responsive app that adapts to both form factors, but that approach is outside the scope of this lesson.

## Adjust app display settings

1. While editing your app, select the **Settings** button from the command bar. The **Settings** panel opens to the **General** tab.
2. To modify the app's display properties, select the **Display** tab. From here, you can change the **Orientation** to either **Landscape** (default) or **Portrait**.

    The default **Size** is set to 16:9, but other aspect ratios are available, including a **Custom** option.

    > **Warning:** If you resize your app after building it, you may need to rearrange controls to fit the new form factor.

3. You can also toggle:
   - **Lock aspect ratio** (enabled by default)
   - **Lock orientation**

## Preview your app on different devices

Microsoft Power Apps includes a built-in preview tool that shows how your app appears on different mobile platforms.

1. With your app in **Preview** mode, look for the icons representing a tablet, phone, and browser screen.
2. Select one of the device icons to open a scrollable list of supported devices. For example, selecting **Phone** displays popular smartphone models. A **Custom** option is also available if your device isn't listed.

If your app is built on a **Tablet** form factor, you can also test different device **Orientations** (vertical and horizontal) to evaluate whether a different layout might better suit your target users.
