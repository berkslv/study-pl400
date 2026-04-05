# Explore controls and screens in canvas apps

- 12 minutes

In this unit, we're going to examine the controls that we've already added to our app, both at the Gallery and the Form, we're also going to add some screens to our app to get ready for our next unit.

## Controls in Power Apps

A control is a UI element that produces an action or shows information. Many controls in Power Apps are like controls that you've used in other apps: labels, text-input boxes, drop-down lists, navigation elements, and so on.

In addition to these typical controls, Power Apps has more specialized controls, which you can find on the **+ Insert** button, which includes a search field to help you find what you're looking for.

A few controls that can add interest and impact to your apps include:

- **Galleries** - Controls that are layout containers that hold a set of controls that show records from a data source.
- **Forms** - Controls that show details about your data and let you create and edit records.
- **Media** - Controls that let you add background images, including a camera button (so that users can take pictures from the app), a barcode reader for quickly capturing identification information, and more.
- **Charts** - Controls that let you add charts, including *Power BI* data, so that users can perform instant analysis of their data.

To see what controls are available, select the **+ Insert** tab, and then expand the different fields. As you do, you'll see the utility of the search field to assist you in quickly finding what you're looking for.

## Gallery Controls and Properties

Inside of the gallery on the screen you should see different controls. The type of control has an icon just to the left of the name indicating what type of control it is. Notice how you have two shape controls including a rectangle and a separator.

- Go ahead and select the **Rectangle** control in your Tree view. It defaults to the **OnSelect** property, which says `Select(Parent)`. Unless you designate a different **OnSelect** property for any of these gallery controls, they'll all default to `Select(Parent)`, meaning that selecting that control selects that item.
- Now select the **Gallery** control itself and look at the **OnSelect** property for the gallery. It's currently set as `false`, so that means that selecting any control in your gallery will do nothing, until you define an action.

**IsSelected** is a Boolean value, evaluating to `true` or `false`, for whether this item in the Gallery is selected or not. Only one item in our Gallery can be selected at any time. If you put your app in **Preview** mode, try selecting some different coffee makers and notice how the Rectangle control only appears to the one that you've selected.

Other notable controls:

- **Separator** - A rectangle that is always visible (currently colored white so it doesn't appear on a white screen).
- **NextArrow1** - Currently does nothing other than select the parent from the gallery. You can change it to an **Edit** pencil icon to give users an indication they need to press it to edit that coffee machine.
- **Image control** - Since we defined an image field in your data, Power Apps was able to discern what goes into this field from the data.

## Form Controls and Properties

The two most important properties for the form are:

- **DataSource** - The table of data connected to the form. Important so that when your form gets updated, it knows where to write the data.
- **Item** - The item selected from our gallery.

Inside of the form, when you select a Field, that field is portrayed as a **DataCard** in the Tree view. Each **DataCard** contains four different controls:

- **DataCardKey** - Label control showing the field name.
- **DataCardValue** - Text input control for the field value.
- **StarVisible** - Text label with an asterisk that appears if the field is required.
- **ErrorMessage** - Text label that appears if required input is missing on form submit.

Two important properties for each form data card:

- **Default** - Tells which column from our data provides the default value for that card.
- **Update** - Tells from which input control comes the data Power Apps uses to update that record.

To save changes in a form, Power Apps needs a **SubmitForm** command. The "Save changes" button uses:

```
SubmitForm(Form1)
```

## Adding Screens

Follow this procedure to add screens to your app:

1. Select your **Screen1** in the **Tree view** panel, then select the **New screen** button and select the **Blank** screen template.
2. Repeat to add a third screen.
3. Rename your three screens:
   - **Screen1** → "Catalog Screen"
   - **Screen2** → "Home Screen"
   - **Screen3** → "Admin Screen"
4. Reposition the screens in the Tree view using the ellipsis button, then the **Move up** command.

Now that we have a better understanding of gallery and form controls and we know how to add screens to our app, let's continue to modify our app to enhance the UX.
