# Icons

- 3 minutes

Most apps include icons that are commonly recognized, such as the floppy disk icon for "Save" or the back arrow for "Back". The advantages of using an icon versus a label or a button are that icons don't require text and can usually fit into areas where text doesn't.

Microsoft Power Apps includes the **Icon** control and provides many out-of-the-box icons with customizable properties including **OnSelect** and **Color**. You can insert an icon by selecting the **Insert** button from the command bar and expanding the **Icons** field.

## Adding an icon

1. Open the Contoso Coffee Machines app and select the "Catalog Screen".
2. Insert a "Back arrow" icon in the Header by selecting the Header (e.g., **Rectangle1**), then select **Insert** from the command bar. You can find the Back arrow by expanding **Icons** or by entering "back" in the **Insert** search field.

    > **Note:** When you insert the new icon, it picks up the selected **Theme** color scheme.

3. Reposition the new **Back arrow** icon in the top left corner of your header rectangle.
4. Change the icon's color to white by selecting the icon, choosing the **Color** button from the command bar, and selecting the white circle under **Standard colors**.
5. Update the **OnSelect** property to:

    ```
    Back()
    ```

6. Copy the **Back arrow** icon and paste it onto your "Admin Screen" to reuse it with its configured **Color** and **OnSelect** properties.

## Changing an icon

You can change an icon type by updating the **Icon** property of the **Icon** control.

1. Copy and paste another **Back arrow** icon onto the "Admin Screen".
2. Position it in the upper right corner of the header rectangle.
3. Select the **Icon** property button in the command bar and choose the **Home** icon. You can type "home" in the search field to locate it quickly. The **Back arrow** will immediately change to a **Home** icon.
4. Update the **OnSelect** property to return to the home screen:

    ```
    Navigate('Home Screen')
    ```

The **Home** icon provides a consistent way to return to the home screen, which is especially helpful in apps with many screens where the **Back** arrow might not return the user to the intended starting point.
