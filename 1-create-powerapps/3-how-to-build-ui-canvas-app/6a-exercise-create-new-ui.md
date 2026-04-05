# Exercise - Create and adjust UI for a new canvas app

- 10 minutes

Go to the Microsoft Power Apps home page and select **Create**, then choose the **Start with a blank canvas** card. Select the **Tablet** form factor and follow these steps:

1. Insert a **Rectangle** control and resize it to span the top of the screen. Set its **Height** property to `80`.
2. Insert an **Image** control and position it in the top-left corner of the rectangle.
3. Set the **Image** property to:

    ```
    User().Image
    ```

4. Insert a **Text label** and position it to the right of the image in the header.
5. Adjust the width to be `200`.
6. Change the **Text** property to:

    ```
    "Welcome, " & User().FullName
    ```

7. Change the **Color** property of the label text to white.
8. Insert a **Text input** control and position it below the header rectangle.
9. Insert a **Reset Icon** and place it to the right of the **Text input** control.
10. Set the **OnSelect** property of the Reset icon to (update the control name if needed):

    ```
    Reset(TextInput1)
    ```

    > **Note:** The Reset function changes the Text input to whatever is entered as the Default value, which is initially "Text input".

11. Apply a theme to your app. Select **App** or **Screen1** in the **Tree view**, then choose a theme from the **Theme** dropdown in the command bar (e.g., the Dark Blue theme).

12. Enter **Preview** mode. Type some text into the **Text input** control, then select the **Reset** icon. Your text should have returned to "Text input".

13. Use the preview tools to view your app on different devices, such as a **Samsung Galaxy Tab A7**.

14. Try switching to a **Phone** view (e.g., **iPhone 14**) and experiment with different orientations.

Congratulations—you've successfully applied new Power Apps skills!
