# Summary: Navigation in Canvas Apps (Power Apps)

> **Source files:** 1-understand-navigation.md, 2-navigate-back-function.md, 3-more-ways-to-use-navigate-function.md, 3a-exercise-create-navigation-functions.md, 4-knowledge-check.md

---

## Navigate Function

- Moves users from one screen to another.
- Can be used in: `OnSelect` (Button/Icon), `OnSuccess` (Form), `OnTimerEnd` (Timer), `OnChange` (Dropdown).
- Can pass context variables (data) to the destination screen via a context record.

**Syntax:**

```
Navigate(ScreenName, ScreenTransition.TransitionType, {ContextRecord: NewValue})
```

- `ScreenName` (required): The screen to display.
- `ScreenTransition` (optional): Visual animation between screens. Defaults to `ScreenTransition.None`.
- `ContextRecord` (optional): A record of context variable names and values to set on the new screen.

**Examples:**

| Formula | Result |
|---|---|
| `Navigate(Details)` | Instantly displays the `Details` screen. |
| `Navigate(Details, ScreenTransition.Fade)` | Displays `Details` with a fade animation. |
| `Navigate(Details, ScreenTransition.Fade, {ID: 12})` | Displays `Details` with fade; sets context variable `ID` to `12`. |
| `Navigate(Details, ScreenTransition.Fade, {ID: 12, Shade: Color.Red})` | Displays `Details` with fade; sets `ID` to `12` and `Shade` to `Color.Red`. |

---

## Back Function

- Returns the user to the previously viewed screen based on navigation history.
- Does not work if there is no prior screen in history (e.g., app opened directly to a specific screen).
- Parentheses are required: `Back()`.
- By default, reverses the transition used to arrive at the current screen.

**Syntax:**

```
Back([ScreenTransition])
```

- `ScreenTransition` (optional): Override the reverse transition. If omitted, the inverse of the incoming transition is used.

**Examples:**

| Formula | Result |
|---|---|
| `Back()` | Returns to the previous screen using the inverse of the last transition. |
| `Back(ScreenTransition.Cover)` | Returns using the `Cover` transition regardless of how the current screen was entered. |
| `Back(ScreenTransition.UnCoverRight)` | Returns using `UnCoverRight` transition. |

---

## Screen Transitions

Available `ScreenTransition` values for both `Navigate` and `Back`:

| Transition | Behavior |
|---|---|
| `ScreenTransition.None` | Default. Instantly switches to the new screen. |
| `ScreenTransition.Cover` | New screen slides in from right to left, covering the current screen. |
| `ScreenTransition.CoverRight` | New screen slides in from left to right. |
| `ScreenTransition.Fade` | Current screen fades out, revealing the new screen. |
| `ScreenTransition.UnCover` | Current screen slides out from right to left. |
| `ScreenTransition.UnCoverRight` | Current screen slides out from left to right. |

---

## Navigation Techniques

### OnSuccess (Form Control)

- Triggers `Navigate` only when form data is successfully saved.
- Set the form's **OnSuccess** property:

```
Navigate('Success Screen', ScreenTransition.Fade)
```

### OnTimerEnd (Timer Control)

- Automates navigation after a delay (e.g., showing a success screen for a few seconds before redirecting).
- Timer control default: `Duration` = 60,000 ms, `AutoStart` = false, `Visible` = true.

**Configuration steps:**

1. Insert a **Timer** control on the target screen.
2. Set **AutoStart** to `true`.
3. Set **Duration** to `4000` (4 seconds).
4. Set **OnTimerEnd** to `Navigate('<yourScreenName>')`.
5. Set **Visible** to `false`.

### OnChange (Dropdown Control)

- Use a **Dropdown** control as a navigation menu across screens.
- Use **OnChange** (not **OnSelect**) — `OnChange` fires when the selected value changes; `OnSelect` fires on click.
- Set the **Items** property to a table of screen names:

```
["", "Home Screen", "Catalog Screen", "Success Screen"]
```

- The empty string `""` is used as the **Default** so no option is preselected.
- Use a **Switch** function in **OnChange** to evaluate the selected value and navigate:

```pfx
Switch(Self.SelectedText.Value,
    "Catalog", Navigate('Catalog Screen', ScreenTransition.Cover),
    "Admin",   Navigate('Admin Screen', ScreenTransition.Cover)
);
Reset(Self)
```

- `Reset(Self)` resets the dropdown to its default value after navigation.
- `Self` references the control itself; `Self.SelectedText.Value` gets the selected item text.
- **Switch** is preferred over **If** when there are multiple possible outcomes from a single input.

---

## Hidden Screens

- Screens can exist in an app without any visible navigation path to them.
- Hidden screens are not accessible to users but remain visible in the design environment.
- Use cases:
  - **Documentation** – Notes for developers about the app.
  - **Template** – Store branded/styled controls for reuse across screens.

---

## Key Facts & Best Practices

- Always type formulas directly in the formula bar (fx bar); avoid copy-pasting from external sources as quote characters may not translate correctly.
- `Navigate` and `Back` can be used in any property that accepts a formula, not just button `OnSelect`.
- Context variables passed via `Navigate`'s third parameter are set on the destination screen.
- The `Back` function relies on Power Apps' internal navigation history stack.
- Valid screen transitions: `Cover`, `CoverRight`, `Fade`, `None`, `UnCover`, `UnCoverRight`. (Invalid examples: `Jump`, `Erase`, `FadeOut`.)
