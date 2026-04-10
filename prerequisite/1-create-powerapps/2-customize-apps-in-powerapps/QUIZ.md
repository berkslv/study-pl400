# Quiz: Customize Apps in Power Apps

> **Source material:** 1-improve-apps-with-customization.md, 2-explore-screens-and-controls.md, 2-1-create-navigation-model.md, 3-get-started-with-functions.md, 4-knowledge-check.md, 5-summary.md
> **Total questions:** 25
> **Question types:** Multiple choice (single), Multiple choice (multi-select), Fill-in-the-blank

---

## Questions

### Question 1 — Single Choice

You are building a canvas app and want to display a list of product records from a data source so that users can browse and select one. Which control type is best suited for this purpose?

- A. Form
- B. Chart
- C. Gallery
- D. Text input

<details>
<summary>Answer</summary>

**Correct answer:** C. Gallery

**Explanation:** Galleries are layout containers that hold a set of controls and display records from a data source, making them ideal for browsing and selecting from a list of items.

</details>

---

### Question 2 — Single Choice

A maker has a Gallery control in their canvas app. They want clicking anywhere on a gallery item (including the Rectangle control) to select that item. What is the default **OnSelect** value for controls inside a gallery?

- A. `Navigate(Parent)`
- B. `Select(Parent)`
- C. `false`
- D. `true`

<details>
<summary>Answer</summary>

**Correct answer:** B. `Select(Parent)`

**Explanation:** By default, controls inside a gallery (such as the Rectangle) have their **OnSelect** property set to `Select(Parent)`, meaning selecting that control selects the parent gallery item.

</details>

---

### Question 3 — Single Choice

A maker notices that clicking anywhere in a gallery does nothing. They check the gallery's **OnSelect** property. What value does it most likely contain?

- A. `Navigate('Screen1')`
- B. `Select(Parent)`
- C. `false`
- D. `SubmitForm(Form1)`

<details>
<summary>Answer</summary>

**Correct answer:** C. `false`

**Explanation:** The Gallery control itself defaults to an **OnSelect** value of `false`, meaning that selecting a gallery item does nothing until an explicit action formula is defined.

</details>

---

### Question 4 — Single Choice

You need to save user edits made in a Form control back to the connected data source. Which formula should be placed on the Save button's **OnSelect** property?

- A. `SaveRecord(Form1)`
- B. `Patch(Form1)`
- C. `SubmitForm(Form1)`
- D. `UpdateForm(Form1)`

<details>
<summary>Answer</summary>

**Correct answer:** C. `SubmitForm(Form1)`

**Explanation:** The `SubmitForm` function instructs Power Apps to write the form's current input values back to the connected data source. Without it, edits are not persisted.

</details>

---

### Question 5 — Single Choice

A maker wants a button on the Catalog Screen to return the user to whichever screen they navigated from. Which formula should be set on the button's **OnSelect** property?

- A. `Navigate('Home Screen')`
- B. `Exit()`
- C. `Home()`
- D. `Back()`

<details>
<summary>Answer</summary>

**Correct answer:** D. `Back()`

**Explanation:** The `Back()` function returns the user to the previously visited screen. It only works correctly if the user arrived at the current screen through app navigation (e.g., via `Navigate()`).

</details>

---

### Question 6 — Single Choice

You want to specify what happens when a user selects a button in a canvas app. Where do you define this behavior?

- A. In the click wizard available from the Insert menu
- B. By setting the **OnClick** property to the desired formula
- C. By setting the **OnSelect** property to the desired formula
- D. Power Apps cannot run formulas based on user selections

<details>
<summary>Answer</summary>

**Correct answer:** C. By setting the **OnSelect** property to the desired formula

**Explanation:** In Power Apps canvas apps, interactive behavior triggered by a user selection is defined in the **OnSelect** property of the control. There is no "OnClick" property in Power Apps.

</details>

---

### Question 7 — Single Choice

A maker is configuring form navigation in an app. The app has three screens: Home Screen, Catalog Screen, and Admin Screen. The screen at the top of the Tree view will be shown first when users open the app. Which screen should be placed at the top of the Tree view to ensure users land on the Home Screen first?

- A. Admin Screen
- B. Catalog Screen
- C. Home Screen
- D. The order in the Tree view does not affect the launch screen

<details>
<summary>Answer</summary>

**Correct answer:** C. Home Screen

**Explanation:** The screen positioned at the top of the Tree view is the default launch screen. To ensure users see the Home Screen first, it must be moved to the top position in the Tree view.

</details>

---

### Question 8 — Single Choice

A maker wants to display the price of a coffee machine in currency format (e.g., `$ 12.00`) inside a gallery label. The price is stored as a text value in the data source. Which formula correctly formats it?

- A. `Format(ThisItem.'Price', "$ ##.00")`
- B. `Text(Value(ThisItem.'Price'), "$ ##.00")`
- C. `Currency(ThisItem.'Price')`
- D. `Value(ThisItem.'Price', "$ ##.00")`

<details>
<summary>Answer</summary>

**Correct answer:** B. `Text(Value(ThisItem.'Price'), "$ ##.00")`

**Explanation:** `Value()` converts the text price to a number, and `Text()` formats that number as a string with the specified currency format pattern including a dollar sign and two decimal places.

</details>

---

### Question 9 — Single Choice

You want a gallery label to display text in a color that dynamically matches the **Primary Color** field of each data record. Which formula achieves this when set on the label's **Color** property?

- A. `Color(ThisItem.'Primary Color')`
- B. `RGBA(ThisItem.'Primary Color')`
- C. `ColorValue(ThisItem.'Primary Color')`
- D. `TextColor(ThisItem.'Primary Color')`

<details>
<summary>Answer</summary>

**Correct answer:** C. `ColorValue(ThisItem.'Primary Color')`

**Explanation:** The `ColorValue()` function converts a text color name (e.g., "Purple") stored in a data field into a Power Apps color value that can be applied to control color properties.

</details>

---

### Question 10 — Single Choice

A maker is editing a form and wants to remove the **Machine ID** and **Product Type ID** fields so they are not visible or editable. What is the correct way to do this in Power Apps Studio?

- A. Delete the DataCard controls directly in the Tree view
- B. Select the form, click **Edit fields**, hover over each field, and select **Remove** from the ellipsis menu
- C. Set the **Visible** property of each field to `false`
- D. Disconnect the data source and reconnect without those fields

<details>
<summary>Answer</summary>

**Correct answer:** B. Select the form, click **Edit fields**, hover over each field, and select **Remove** from the ellipsis menu

**Explanation:** The **Fields** panel (accessed via **Edit fields** in the command bar) allows makers to add, remove, and reorder form fields without affecting the underlying data source schema.

</details>

---

### Question 11 — Single Choice

A maker sets the **Text** property of a gallery's Body1 label to `ThisItem.Type`. What does this display for each gallery item?

- A. The literal text "Type"
- B. The value of the **Type** column for that gallery row
- C. The row index number of each item
- D. The primary key (ID) of each record

<details>
<summary>Answer</summary>

**Correct answer:** B. The value of the **Type** column for that gallery row

**Explanation:** `ThisItem.Type` refers to the **Type** column value for the specific row being rendered in the gallery. Any change to this property is reflected across all gallery rows.

</details>

---

### Question 12 — Single Choice

Which pair of functions is used to navigate between screens in a canvas app?

- A. Back and End
- B. Home and Navigate
- C. Navigate and Back
- D. Exit and Start

<details>
<summary>Answer</summary>

**Correct answer:** C. Navigate and Back

**Explanation:** `Navigate()` moves the user to a specified screen, while `Back()` returns the user to the previously visited screen. These are the two primary screen navigation functions in Power Apps canvas apps.

</details>

---

### Question 13 — Single Choice

Inside a Form control, each field is represented as a DataCard in the Tree view. Which DataCard child control displays an asterisk to indicate a required field?

- A. DataCardKey
- B. ErrorMessage
- C. DataCardValue
- D. StarVisible

<details>
<summary>Answer</summary>

**Correct answer:** D. StarVisible

**Explanation:** The **StarVisible** control is a text label that displays an asterisk (`*`) symbol when the corresponding field is marked as required in the data source.

</details>

---

### Question 14 — Single Choice

A maker needs the **Product Summary** field in a form to accept multi-line text input with a visible scroll bar. What change should be made in the Fields panel?

- A. Set the field's **Height** property to `Auto`
- B. Change the Control type from "Edit text" to "Edit multi-line text"
- C. Add a new Text Area control manually to the form
- D. Enable the **Multiline** toggle in the Properties panel

<details>
<summary>Answer</summary>

**Correct answer:** B. Change the Control type from "Edit text" to "Edit multi-line text"

**Explanation:** Expanding a field in the Fields panel reveals a Control type dropdown. Changing it from "Edit text" to "Edit multi-line text" converts the input to a multi-line text box and adds a scroll bar.

</details>

---

### Question 15 — Multi-Select

A maker is reviewing the properties of a Form control. Which **two** properties are considered the most important for connecting the form to data correctly? (Select **two**.)

- A. DefaultMode
- B. DataSource
- C. OnSuccess
- D. Item
- E. Columns

<details>
<summary>Answer</summary>

**Correct answer:** B. DataSource, D. Item

**Explanation:** **DataSource** connects the form to the table where data will be written on submit. **Item** specifies the currently selected record (typically from a Gallery) whose data is pre-populated in the form for viewing or editing.

</details>

---

### Question 16 — Multi-Select

A maker wants to add a consistent header to all three screens in a canvas app by copying controls. Which **two** actions correctly describe how to copy controls across screens in Power Apps Studio? (Select **two**.)

- A. Right-click the controls and select Copy, then navigate to the target screen and paste
- B. Use Ctrl+C to copy selected controls, navigate to the target screen, and use Ctrl+V to paste
- C. Drag the controls from one screen to another in the Tree view
- D. Duplicate the screen and delete the unwanted controls
- E. Use the **Export** option to transfer controls between screens

<details>
<summary>Answer</summary>

**Correct answer:** A. Right-click the controls and select Copy, then navigate to the target screen and paste; B. Use Ctrl+C to copy selected controls, navigate to the target screen, and use Ctrl+V to paste

**Explanation:** Both right-click Copy/Paste and keyboard shortcuts (Ctrl+C / Ctrl+V) work for copying controls between screens. Controls can be multi-selected using the Shift key before copying.

</details>

---

### Question 17 — Multi-Select

A maker is building a canvas app and wants to give users a rich experience. Which **three** specialized control categories are available under the **+ Insert** menu in Power Apps Studio? (Select **three**.)

- A. Galleries
- B. Forms
- C. Pipelines
- D. Media
- E. Charts

<details>
<summary>Answer</summary>

**Correct answer:** A. Galleries, B. Forms, D. Media, E. Charts (any three of these four)

**Explanation:** Power Apps offers specialized controls including Galleries (for displaying record sets), Forms (for editing records), Media (for images, camera, barcode reader), and Charts (for data visualization including Power BI). Pipelines is not a canvas app control category.

</details>

---

### Question 18 — Multi-Select

When aligning multiple controls in Power Apps Studio, which **two** steps are required before using the Align feature? (Select **two**.)

- A. Select one control, then hold Shift and select the additional controls
- B. Open the Properties panel and set each control's X/Y coordinates manually
- C. Use the Align dropdown from the command bar after selecting the controls
- D. Group the controls first using the Group option
- E. Enter Preview mode before aligning

<details>
<summary>Answer</summary>

**Correct answer:** A. Select one control, then hold Shift and select the additional controls; C. Use the Align dropdown from the command bar after selecting the controls

**Explanation:** To align multiple controls, you first multi-select them using the Shift key, then choose an alignment option (such as "Align left") from the Align dropdown in the command bar.

</details>

---

### Question 19 — Multi-Select

A DataCard inside a Form control contains several child controls. Which **two** child controls are directly responsible for displaying and capturing a field's value? (Select **two**.)

- A. DataCardKey
- B. StarVisible
- C. DataCardValue
- D. ErrorMessage
- E. Default

<details>
<summary>Answer</summary>

**Correct answer:** A. DataCardKey, C. DataCardValue

**Explanation:** **DataCardKey** is the label showing the field name, while **DataCardValue** is the text input control that displays and captures the field's current value. Together they form the visible editing surface of a form field.

</details>

---

### Question 20 — Fill-in-the-Blank

In a canvas app form, the ___ property of a DataCard specifies which column from the data source provides the initial value, while the ___ property identifies which input control supplies the data used to update the record.

<details>
<summary>Answer</summary>

**Answer:** Default; Update

**Explanation:** The **Default** property points to the source column that pre-populates the DataCard, and the **Update** property identifies the input control whose value is written back to the data source when the form is submitted.

</details>

---

### Question 21 — Fill-in-the-Blank

To navigate a user to a screen called 'Admin Screen' in a canvas app, you set the button's **OnSelect** property to ___.

<details>
<summary>Answer</summary>

**Answer:** `Navigate('Admin Screen')`

**Explanation:** The `Navigate()` function accepts a screen name as its argument and transitions the user to that screen when the control is selected.

</details>

---

### Question 22 — Fill-in-the-Blank

The ___ function converts a text color name (such as "Purple") stored in a data field into a color value that Power Apps controls can use for styling.

<details>
<summary>Answer</summary>

**Answer:** `ColorValue()`

**Explanation:** `ColorValue()` takes a text string representing a color name and returns the corresponding Power Apps color value, enabling dynamic text or fill colors driven by data.

</details>

---

### Question 23 — Fill-in-the-Blank

The ___ property of a Gallery control is a Boolean that evaluates to `true` for the currently highlighted item, and only one item in the gallery can have this value set to `true` at a time.

<details>
<summary>Answer</summary>

**Answer:** IsSelected

**Explanation:** **IsSelected** is a Boolean property on each gallery item indicating whether that specific item is the currently selected one. It is used, for example, to conditionally show a highlight rectangle only on the selected row.

</details>

---

### Question 24 — Fill-in-the-Blank

To display the screen name dynamically as the label text on the 'Admin Screen', the label's **Text** property should be set to ___.

<details>
<summary>Answer</summary>

**Answer:** `'Admin Screen'.Name`

**Explanation:** Referencing a screen with dot notation (e.g., `'Admin Screen'.Name`) retrieves the screen's Name property as a text string, allowing the label to always reflect the screen name dynamically.

</details>

---

### Question 25 — Fill-in-the-Blank

In Power Apps Studio, you can quickly reorder fields in a form by opening the ___ panel (accessed via the **Edit fields** button) and using ___ to move fields up or down.

<details>
<summary>Answer</summary>

**Answer:** Fields; drag and drop

**Explanation:** The **Fields** panel, opened by selecting the form and clicking **Edit fields**, supports drag-and-drop reordering of form fields, allowing makers to arrange fields in a logical order without modifying the data source.

</details>
