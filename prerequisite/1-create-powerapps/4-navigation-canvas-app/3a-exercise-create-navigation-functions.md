# Exercise - App navigation practice

- 30 minutes

You're nearing the end of this module, so let's apply what you've learned in a guided exercise.

In this example, you'll continue configuring screen transitions in the *Contoso Coffee Machines* app. If you're using another multi-screen app, you can follow along with similar steps.

> **Note:** When entering formulas, it's best to type them directly in the formula (*fx*) bar. Avoid copy-pasting from other sources, as single and double quotation marks may not translate correctly in Power Apps.

1. Sign in to the Power Apps home page, and open the **Contoso Coffee Machines** app in edit mode.

2. On the home screen, select the **View Catalog** button. In its `OnSelect` property, replace:

    ```
    Navigate('Catalog Screen')
    ```

    with:

    ```
    Navigate('Catalog Screen',ScreenTransition.Cover)
    ```

3. Still on the home screen, select the **Admin Screen** button. In its `OnSelect` formula, change:

    ```
    Navigate('Admin Screen')
    ```

    to:

    ```
    Navigate('Admin Screen',ScreenTransition.Fade)
    ```

4. Preview the app. Select the **Catalog** and **Admin** buttons to observe the transitions. Then, use your **Back** buttons to return to the home screen.

5. Switch back to edit mode. On the *Admin Screen*, select the arrow icon used as a back button. Update its **OnSelect** property from:

    ```
    Back()
    ```

    to:

    ```
    Back(ScreenTransition.UnCoverRight)
    ```

6. Preview the app again. Select the **Admin Screen** button, then select the back button. Notice the difference in the return transition.

7. In edit mode, insert a new screen: **New screen > Templates > Success**. Rename it to `Success Screen`.

8. On the *Catalog Screen*, select your **Form** control from the **Tree view**.

9. Set the form's **OnSuccess** property to:

    ```
    Navigate('Success Screen',ScreenTransition.Fade)
    ```

10. Navigate to the *Success Screen* in the **Tree view**, and insert a **Timer** control.

11. Set these **Timer** control properties:

    - **AutoStart**: `true`
    - **Duration**: `4000`
    - **OnTimerEnd**: `Navigate('Catalog Screen',ScreenTransition.Fade)`
    - **Visible**: `false`

12. Return to the *Catalog Screen* and preview the app. Make a change in the form and select **Save changes**.

    The app should display the *Success Screen* for four seconds, then return to the *Catalog Screen*.

13. Exit preview mode and return to the *Home Screen*. Now, add a dropdown navigation menu.

14. Insert a **Dropdown** control and position it under the upper-left area of the header rectangle.

15. Add a **Text label** control above the dropdown and set its **Text** property to:

    ```
    "Screen Navigation"
    ```

    Set its **Color** property to:

    ```
    Color.White
    ```

16. Select the `Dropdown` control and set its properties:

    - **Default**: `""`
    - **Items**: `["", "Catalog Screen", "Admin Screen"]`

17. Set its **OnChange** property:

    ```pfx
    Switch(
        Self.SelectedText.Value,
        "Catalog",
        Navigate(
            'Catalog Screen',
            ScreenTransition.Cover
        ),
        "Admin",
        Navigate(
            'Admin Screen',
            ScreenTransition.Cover
        )
    );
    Reset(Self)
    ```

18. Preview the app again. Test the dropdown to confirm navigation between screens.

19. Return to edit mode, select the *Catalog Screen*. Copy the **Back** icon (Ctrl+C), then paste it (Ctrl+V). Move the duplicate icon to the top right of the header rectangle.

20. Change the duplicated icon to a **Home** icon.

21. Set the **OnSelect** property of the **Home** icon to:

    ```
    Navigate('Home Screen', ScreenTransition.CoverRight)
    ```

22. Preview the app. On the *Catalog Screen*, confirm that selecting the Home icon takes you back to the *Home Screen*.

## Summary

You successfully configured navigation features in your app:

- **Navigate** and **Back** functions with screen transitions.
- A *Success Screen* displayed on form submission using **OnSuccess**.
- A **Timer** that navigates after a delay via **OnTimerEnd**.
- A **Dropdown** menu for navigation using **OnChange**.
- A **Home** icon for returning to the home screen.
