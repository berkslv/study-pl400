# Recall: Customize Canvas Apps in Power Apps

> **Source files:** 1-improve-apps-with-customization.md, 2-explore-screens-and-controls.md, 2-1-create-navigation-model.md, 3-get-started-with-functions.md

---

## Keywords

| Term | Definition |
|------|-----------|
| Gallery | A layout container control that displays a set of records from a data source. |
| DataCard | The container within a Form that represents a single field, holding key, value, star, and error controls. |
| DataCardValue | The text input control inside a DataCard that holds the editable field value. |
| SubmitForm | A Power Apps function that saves form changes back to the data source. |
| Navigate() | A formula function that moves the user to a specified screen in a canvas app. |
| Back() | A formula function that returns the user to the previously visited screen. |
| ColorValue() | A function that converts a text color name (e.g., "Purple") into a Power Apps color value. |
| IsSelected | A Boolean gallery property that is `true` for the currently selected gallery item. |
| ThisItem | A reference within a Gallery or Form to the current record's field values. |
| Text() | A function that formats a numeric or date value as a formatted text string. |
| Value() | A function that converts a text representation of a number into a numeric value. |
| Tree view | The left-side panel in Power Apps Studio showing the hierarchical list of all screens and controls. |

---

## Main Ideas

- A Gallery control's **Layout** property can be changed (e.g., "Image, title, subtitle, and body") to display additional fields; modifying a label in the first row applies to all rows.
- The **Text** property of any label inside a gallery uses `ThisItem.<FieldName>` to display the value of a data source column for each row.
- Form fields can be added, removed, and reordered via the **Edit fields** panel; fields are removed using the ellipsis **More actions > Remove** option.
- The **Control type** for a form field can be changed (e.g., from "Edit text" to "Edit multi-line text") to better suit the data being entered.
- Each Form **DataCard** contains four sub-controls: `DataCardKey` (label), `DataCardValue` (input), `StarVisible` (required indicator), and `ErrorMessage` (validation label).
- The Form's **DataSource** property identifies where submitted data is written; the **Item** property identifies which gallery record to display.
- The **Default** property of a DataCard sets the initial value from the data source; the **Update** property identifies which input control provides the new value on save.
- The screen at the top of the Tree view is the default launch screen when an app is shared.
- `Navigate('Screen Name')` is placed on a button's **OnSelect** property to route users to a named screen; `Back()` returns them to the prior screen.
- The **Align** feature in the command bar can align multiple selected controls (e.g., "Align left") simultaneously when they are multi-selected with Shift.
- `Text(Value(ThisItem.'Price'), "$ ##.00")` formats a numeric field as a currency string inside a gallery label.
- `ColorValue(ThisItem.'Primary Color')` dynamically sets a label's **Color** property to the color name stored in a data source field.
- Controls (e.g., a header Rectangle and Label) can be copied across screens using Ctrl+C / Ctrl+V to maintain consistent UI; each screen's label **Text** can then reference `'Screen Name'.Name` to display its title dynamically.

---

## Mini Quiz

### Q1 — Single Choice

You want a gallery label to show the **Type** column from your data source for each row.

Which formula should you set as the label's **Text** property?

- A. `ThisRow.Type`
- B. `ThisItem.Type`
- C. `CurrentItem.Type`
- D. `SelectedItem.Type`

<details>
<summary>Answer</summary>

**Correct answer:** B. `ThisItem.Type`

**Explanation:** Inside a gallery, `ThisItem` is the reference to the current record. `ThisItem.<FieldName>` retrieves the value of that column for the row being rendered.

</details>

---

### Q2 — Single Choice

A developer wants to display a price field stored as text with a dollar sign and two decimal places.

Which formula achieves this?

- A. `Format(ThisItem.'Price', "$##.00")`
- B. `Currency(ThisItem.'Price')`
- C. `Text(Value(ThisItem.'Price'), "$ ##.00")`
- D. `Text(ThisItem.'Price', "$ ##.00")`

<details>
<summary>Answer</summary>

**Correct answer:** C. `Text(Value(ThisItem.'Price'), "$ ##.00")`

**Explanation:** `Value()` converts the text to a number first, then `Text()` formats it with the specified currency pattern. Skipping `Value()` may cause errors when the field is stored as text.

</details>

---

### Q3 — Fill-in-the-Blank

To save changes made in a form named **Form1**, you set a button's **OnSelect** property to `___(Form1)`.

<details>
<summary>Answer</summary>

**Answer:** `SubmitForm`

**Explanation:** `SubmitForm(Form1)` is the required command that writes the form's updated values back to the connected data source.

</details>

---

### Q4 — Single Choice

A user navigates from the Home Screen to the Catalog Screen by tapping a button. Which formula should the **Back** button on the Catalog Screen use?

- A. `Navigate('Home Screen')`
- B. `GoBack()`
- C. `Back()`
- D. `Return('Home Screen')`

<details>
<summary>Answer</summary>

**Correct answer:** C. `Back()`

**Explanation:** `Back()` returns the user to the previously visited screen. It only works correctly if the user reached the current screen through in-app navigation (not by previewing directly from that screen).

</details>

---

### Q5 — Fill-in-the-Blank

Inside a Form, each field is represented as a ___ in the Tree view, which contains sub-controls for the key label, value input, required star, and error message.

<details>
<summary>Answer</summary>

**Answer:** `DataCard`

**Explanation:** When a field is added to a Form control, it appears as a DataCard node in the Tree view, housing DataCardKey, DataCardValue, StarVisible, and ErrorMessage child controls.

</details>

---

### Q6 — Single Choice

You want a gallery label's text color to dynamically match the value stored in the **Primary Color** column of each record.

Which formula should you set on the label's **Color** property?

- A. `Color(ThisItem.'Primary Color')`
- B. `ColorValue(ThisItem.'Primary Color')`
- C. `RGBA(ThisItem.'Primary Color')`
- D. `TextColor(ThisItem.'Primary Color')`

<details>
<summary>Answer</summary>

**Correct answer:** B. `ColorValue(ThisItem.'Primary Color')`

**Explanation:** `ColorValue()` converts a text color name (e.g., "Blue") stored in a data source field into a Power Apps color value that can be assigned to color properties.

</details>

---

### Q7 — Fill-in-the-Blank

The screen positioned at the ___ of the Tree view panel is the default screen displayed when an app is opened or shared.

<details>
<summary>Answer</summary>

**Answer:** top

**Explanation:** Power Apps loads the topmost screen in the Tree view as the initial screen. Screens can be reordered using the ellipsis **Move up / Move down** options.

</details>

---
