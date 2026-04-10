# Exercise - Introduction to formulas in canvas apps

- 8 minutes

Did you know that we can add formulas to our controls in Power Apps? If you provide the input Power Apps is looking for, you can put in any variation so long as the formula reflects the type of input the control expects.

In the following exercise, we're going to modify our gallery so that the "Price" will show a currency value, and we're going to modify the text color of our "Type" field to appear as the coffee machine color. This app builds upon the app that we created in the last unit.

## Steps

1. Select "Catalog Screen" from the **Tree view** panel.

   > **Note:** You can also switch screens from the drop-down menu in the lower corner of the current display screen.

2. Select your Gallery to expand it and then select the ellipsis next to the **Subtitle1** control. Select **Copy >** and then **Copy**.

3. Select the ellipsis next to **Subtitle1** again, and select paste. This creates a duplicate named **Subtitle1_1**. Select the new subtitle and drag it below **Subtitle1**.

4. Select **Subtitle1** under the gallery in the **Tree View** and set the **Text** property to format price as currency:

   ```
   Text(Value(ThisItem.'Price'), "$ ##.00")
   ```

   > **Note:** This formula takes the value of 'Price' (declared as numeric using `Value()`), then formats it as text with a dollar sign and decimal places.
   >
   > If your formula returns an error due to locale settings (e.g., France or Spain where a comma is the decimal separator):
   > ```
   > Text(Value(ThisItem.'Price'); "$ ##,00")
   > ```

5. Select the **Subtitle1_1** control and find the **Color** property (currently `RGBA(0, 0, 0, 1)`).

6. Change the **Color** property to `Color.Purple`. Power Apps will auto-suggest color values as you type.

7. Now change the **Color** property to use the machine's primary color dynamically:

   ```
   ColorValue(ThisItem.'Primary Color')
   ```

   The `ColorValue()` function converts a text color name into a color value. The text color in the label now matches the coffee machine's **Primary Color** for each item.

8. Holding down the **Shift** key, select the **Rectangle1** and **Label1** controls from the top of your "Catalog Screen". Right-click and select **Copy** (or use Ctrl+C).

9. Select the "Home Screen" and paste the two controls. Reposition them so they're centered at the top of the screen.

10. Select the "Admin Screen" and repeat the paste. Also reposition the controls.

11. Select the label control in the header of your "Admin Screen" and set its **Text** property to:

    ```
    'Admin Screen'.Name
    ```

12. Select the label control in the header of your "Home Screen" and set its **Text** property to:

    ```
    'Home Screen'.Name
    ```

Our app is taking shape now as we enhance the UX by using functions with our control formulas.
