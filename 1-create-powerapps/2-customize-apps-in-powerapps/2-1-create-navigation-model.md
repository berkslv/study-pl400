# Exercise - Create basic screen navigation for a canvas app

- 5 minutes

In this unit we'll continue to work on our Contoso Coffee Machines app. We're going to add some app screen navigation so that your user can move to the different screens of the app.

> **Note:** The screen that is at the top of your **Tree view** is the screen that the app will land on by default. In our case, the first screen someone will see when we share an app with them is our 'Home Screen'.

## Steps

1. Go to the **'Home Screen'** of your app and **Insert** two button controls.

2. Position them both center screen, one above the other with some space between them. Make sure they're slightly offset so we can learn how to **Align** controls.

3. Holding the **Shift** key, select both controls.

4. Select the **Align** dropdown control from the command bar and select **"Align left"**.

   > **Note:** The **Align** feature is a powerful way to quickly line up multiple controls at once. The **Undo** feature is also in the command bar just to the right of the **Back** button.

5. In the Properties panel on the right, set:
   - **Width**: `250`
   - **Height**: `100`

6. Change the **Text** property of the top button to `"View Catalog"` and the bottom button to `"Admin Screen"`.

7. Select the **"View Catalog"** button and add the following to the **OnSelect** property:

   ```
   Navigate('Catalog Screen')
   ```

8. Select the **"Admin Screen"** button and add the following to the **OnSelect** property:

   ```
   Navigate('Admin Screen')
   ```

9. Go to the **Catalog Screen** and add a **Button** control. Drag it to the bottom right corner and update the **Text** property to `"Back"`.

10. Update the **OnSelect** property of the Back button to:

    ```
    Back()
    ```

    This formula will return the user to the previous screen.

11. Go to your **Admin Screen** and repeat steps 9-10.

12. Return to your **Home Screen** and place the app in preview mode. Test the navigation buttons.

> **Tip:** Your app will only understand `Back()` if you first navigate to that screen through the app. When you preview your app, remember to start the preview from the **Home Screen**.

Congratulations! You have now added basic navigation to your app.
