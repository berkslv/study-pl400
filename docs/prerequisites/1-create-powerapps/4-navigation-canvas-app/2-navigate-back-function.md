# The Navigate and Back functions

- 6 minutes

Let's look at how you can add arguments to the `Navigate` and `Back` functions to enhance the user interface in a Power Apps app. In the syntax, square brackets indicate optional parameters.

## Navigate function

Here's a breakdown of the `Navigate` syntax:

```
Navigate(ScreenName, ScreenTransition.TransitionType, {ContextRecord: NewValue})
```

- `ScreenName` (required): The screen to display.
- `ScreenTransition` (optional): The visual transition to use between the current screen and the next screen. If omitted, the default is `ScreenTransition.None`.
- `ContextRecord` (optional): A record containing one or more context variable names and their values. This record sets or updates context variables on the new screen.

You must specify the first parameter to indicate which screen to navigate to. The second parameter optionally controls the transition effect. The third parameter lets you pass context values to the new screen.

## Back function

Here's the syntax for the **Back** function:

```
Back([ScreenTransition])
```

- `ScreenTransition` (optional): The visual transition to use when returning to the previous screen. By default, this is the inverse of the transition used to reach the current screen.

The **Back** function must include parentheses: `Back()`.

The **Back** function returns the user to the previously viewed screen. Power Apps maintains a navigation history, including screen transitions. When **Back** is used, Power Apps reverses the transition (unless a specific transition is defined).

## Screen transitions

Screen transitions can be used with both **Navigate** and **Back** functions. Available options include:

- `ScreenTransition.Cover`: New screen slides in from right to left, covering the current screen.
- `ScreenTransition.CoverRight`: New screen slides in from left to right.
- `ScreenTransition.Fade`: Current screen fades out, revealing the new screen.
- `ScreenTransition.None` (Default): Instantly switches to the new screen.
- `ScreenTransition.UnCover`: Current screen slides out from right to left.
- `ScreenTransition.UnCoverRight`: Current screen slides out from left to right.

## Examples

| Formula | Description | Result |
|---|---|---|
| `Navigate(Details)` | Navigates to the `Details` screen without a transition or context change. | The `Details` screen appears immediately. |
| `Navigate(Details, ScreenTransition.Fade)` | Navigates to the `Details` screen using a `Fade` transition. | The current screen fades into the `Details` screen. |
| `Navigate(Details, ScreenTransition.Fade, {ID: 12})` | Adds a fade transition and sets the `ID` context variable. | Details screen appears with `ID` set to `12`. |
| `Navigate(Details, ScreenTransition.Fade, {ID: 12, Shade: Color.Red})` | Displays the `Details` screen with a `Fade` transition. Updates `ID` to `12` and `Shade` to `Color.Red`. | The current screen fades to show the `Details` screen. `ID` is set to `12` and `Shade` to `Color.Red`. |
| `Back()` | Returns to the previous screen using the inverse transition. | Power Apps reverses the last transition to display the prior screen. |
| `Back(ScreenTransition.Cover)` | Returns to the previous screen using the `Cover` transition. | Uses the Cover transition regardless of how the current screen was entered. |

In summary, **Navigate** and **Back** support parameters for enhanced control. With **Navigate**, you can direct users to another screen, apply transitions, and set context variables. The **Back** function enables reverse navigation with either default or specified transitions.
