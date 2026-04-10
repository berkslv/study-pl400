# Summary: Customizing Canvas Apps in Power Apps

> **Source files:** 1-improve-apps-with-customization.md, 2-1-create-navigation-model.md, 2-explore-screens-and-controls.md, 3-get-started-with-functions.md, 4-knowledge-check.md

---

## Controls in Power Apps

- A **control** is a UI element that produces an action or shows information.
- Controls are accessed via the **+ Insert** tab, which includes a search field.
- Key specialized control types:
  - **Galleries** — Layout containers holding a set of controls that show records from a data source.
  - **Forms** — Show details about data and allow creating/editing records.
  - **Media** — Background images, camera button, barcode reader.
  - **Charts** — Add charts including Power BI data for instant data analysis.

---

## Gallery Controls and Properties

- Gallery items contain controls visible in the **Tree view** panel with type icons.
- `Select(Parent)` is the default **OnSelect** for child controls inside a gallery — selecting any child control selects the parent gallery item.
- The Gallery's own **OnSelect** defaults to `false` (no action until defined).
- **IsSelected** — Boolean (`true`/`false`) indicating if a gallery item is selected; only one item can be selected at a time.
- Notable built-in gallery controls:
  - **Separator** — Always-visible rectangle (can be colored).
  - **NextArrow1** — Selects parent by default; can be changed to an Edit icon.
  - **Image control** — Automatically populated from an image field in the data source.
- Fields in a gallery (e.g., `Title1`, `Subtitle1`) use the formula pattern:
  ```
  ThisItem.'ColumnName'
  ```
- Selecting a gallery field in the canvas highlights it in the **Tree view** panel.
- Modifying the **Text** property of a field on the first gallery row applies to all rows.
- Gallery **Layout** can be changed from the **Properties** panel (e.g., "Image, title, subtitle, and body").

### Customizing Gallery Fields

1. Select the gallery control (**Gallery1**) — confirmed by dark grey highlight in **Tree view**.
2. In the **Properties** panel, change **Layout** to the desired template (e.g., "Image, title, subtitle, and body").
3. Select the target label inside the gallery (e.g., **Body1**).
4. Update its **Text** property in the formula bar (e.g., `ThisItem.Type`).

---

## Form Controls and Properties

- Two critical form properties:
  - **DataSource** — The table connected to the form; determines where updates are written.
  - **Item** — The record selected from the gallery to display in the form.
- Each field in a form is represented as a **DataCard** in the **Tree view**, containing:
  - **DataCardKey** — Label showing the field name.
  - **DataCardValue** — Text input control for the field value.
  - **StarVisible** — Asterisk label shown when the field is required.
  - **ErrorMessage** — Label shown when required input is missing on submit.
- Two important properties per DataCard:
  - **Default** — Specifies which column provides the default value.
  - **Update** — Specifies which input control provides the data for record updates.
- To save form changes, use the **SubmitForm** function:
  ```
  SubmitForm(Form1)
  ```

### Customizing Form Fields

1. Select the form control, then choose **Edit fields** in the command bar.
2. Hover over a field in the **Fields** panel to reveal the ellipsis (**More actions**); select **Remove** to delete unwanted fields (e.g., Machine ID, Product Type ID).
3. Reorder fields via drag and drop in the **Fields** panel.
4. Expand a field entry to change its **Control type** (e.g., from "Edit text" to "Edit multi-line text" for multi-line fields).
5. Close the **Fields** panel by clicking outside it or pressing **Edit fields** again.
6. To resize a DataCard input: select the DataCard → select the inner `DataCardValue` control → drag its bottom edge to expand.

---

## Screens and Navigation

- The screen at the **top of the Tree view** is the default landing screen when the app is shared.
- Add screens via **New screen** button in the **Tree view** panel; select a template (e.g., Blank).
- Rename screens using the ellipsis menu in the Tree view.
- Reorder screens using the ellipsis → **Move up** command.

### Adding Screens (Procedure)

1. Select **Screen1** in the **Tree view**, then select **New screen** → **Blank**.
2. Repeat to add additional screens.
3. Rename screens (e.g., "Catalog Screen", "Home Screen", "Admin Screen").
4. Reposition screens using ellipsis → **Move up**.

### Screen Navigation Functions

- **`Navigate(ScreenName)`** — Navigates to the specified screen. Set on a button's **OnSelect** property:
  ```
  Navigate('Catalog Screen')
  ```
  ```
  Navigate('Admin Screen')
  ```
- **`Back()`** — Returns the user to the previous screen. Only works if the screen was reached via `Navigate()`:
  ```
  Back()
  ```
- Button **OnSelect** is the property to set for all user-triggered formula execution (not `OnClick`).
- Use **Align** dropdown in the command bar to align multiple controls at once (select with Shift).
- `Back()` will only function correctly if the user navigated to that screen through the app (not directly in preview).

---

## Formulas and Functions

- Formulas can be applied to any control property expecting a given data type.
- **`Text(value, format)`** — Formats a value as text with a pattern:
  ```
  Text(Value(ThisItem.'Price'), "$ ##.00")
  ```
  - `Value()` converts a field to a numeric type before formatting.
  - For locales using comma as decimal separator (e.g., France, Spain):
    ```
    Text(Value(ThisItem.'Price'); "$ ##,00")
    ```
- **`ColorValue(colorString)`** — Converts a text color name into a usable color value:
  ```
  ColorValue(ThisItem.'Primary Color')
  ```
  - Used in the **Color** property of a label to dynamically match a data field's color name.
- Color constants can be used directly (e.g., `Color.Purple`); Power Apps auto-suggests color values while typing.
- Screen name references can be used in label **Text** properties:
  ```
  'Admin Screen'.Name
  ```
  ```
  'Home Screen'.Name
  ```
- To duplicate a control: select the ellipsis next to the control → **Copy** → ellipsis again → **Paste**. This creates a new control with a suffixed name (e.g., `Subtitle1_1`).

---

## Key Knowledge Check Answers

- **OnSelect** (not `OnClick`) is the property used to define what happens when a user selects a button or control.
- **Navigate** and **Back** are the functions used to change screens.
- **Gallery** control purpose: display and select from all records from a data source (not for editing a single record).
