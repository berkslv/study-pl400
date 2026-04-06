# Exercise - Use the Concurrent function to test performance

- 4 minutes

This hands-on exercise explores how to use the Concurrent function to enhance performance.

1. Sign into [Power Apps](https://make.powerapps.com/).
2. From the Home screen left side navigation menu, select **+ Create > Blank app > Create** (from under the Blank canvas app).
3. Name your app with an appropriate title and select **Create**.
4. First, we build two collections *without* using the Concurrent function. Insert a **Button** control, name it `btnCollection`, set its **Text** property to `"Collection"` and set its **OnSelect** property to this formula:

    ```powerappsfl
    Set(varStart,Now());
    ClearCollect(colFruit,
        {Name: "banana", Category: "fruit", AvgCost: .49},
        {Name: "peach", Category: "fruit", AvgCost: 1.12},
        {Name: "strawberry", Category: "fruit", AvgCost: 2.99},
        {Name: "apple", Category: "fruit", AvgCost: 0.98},
        {Name: "orange", Category: "fruit", AvgCost: 1.49},
        {Name: "pear", Category: "fruit", AvgCost: 0.97},
        {Name: "cantaloupe", Category: "fruit", AvgCost: 3.99},
        {Name: "pineapple", Category: "fruit", AvgCost: 2.49},
        {Name: "cherry", Category: "fruit", AvgCost: 4.99},
        {Name: "mango", Category: "fruit", AvgCost: .99}
    );
    ClearCollect(colVegetable,
        {Name: "carrot", Category: "vegetable", AvgCost: .95},
        {Name: "lettuce", Category: "vegetable", AvgCost: 1.69},
        {Name: "potato", Category: "vegetable", AvgCost: 5.14},
        {Name: "zuccini", Category: "vegetable", AvgCost: 1.99},
        {Name: "broccoli", Category: "vegetable", AvgCost: 1.49},
        {Name: "cabbage", Category: "vegetable", AvgCost: 2.48},
        {Name: "celery", Category: "vegetable", AvgCost: 1.65},
        {Name: "asparagus", Category: "vegetable", AvgCost: 2.99},
        {Name: "kale", Category: "vegetable", AvgCost: 1.99},
        {Name: "cauliflower", Category: "vegetable", AvgCost: 3.24}
    );
    Set(varSpeedCollect, Text(DateDiff(varStart, Now(), TimeUnit.Milliseconds)));
    ```

5. **Insert** a Text label, set its **BorderThickness** property to `3`, rename it to `lblSpeedCollect`, and set its **Text** property to:

    ```powerappsfl
    varSpeedCollect
    ```

6. Press and hold **Alt Key**, and select the **Collection** button. The `lblSpeedCollect` label displays in milliseconds the amount of time it took to run the process.

7. Now lets add the Concurrent functionality to our app to compare the performance. Insert another **Button** control, name it `btnConcurrent`, set its **Text** property to `"Concurrent"` and set its **OnSelect** property to this formula:

    ```powerappsfl
    Set(varStart,Now());
    Concurrent(
        ClearCollect(collectFruit,
            {Name: "banana", Category: "fruit", AvgCost: .49},
            {Name: "peach", Category: "fruit", AvgCost: 1.12},
            {Name: "strawberry", Category: "fruit", AvgCost: 2.99},
            {Name: "apple", Category: "fruit", AvgCost: 0.98},
            {Name: "orange", Category: "fruit", AvgCost: 1.49},
            {Name: "pear", Category: "fruit", AvgCost: 0.97},
            {Name: "cantaloupe", Category: "fruit", AvgCost: 3.99},
            {Name: "pineapple", Category: "fruit", AvgCost: 2.49},
            {Name: "cherry", Category: "fruit", AvgCost: 4.99},
            {Name: "mango", Category: "fruit", AvgCost: .99}
        ),
        ClearCollect(collectVegetable,
            {Name: "carrot", Category: "vegetable", AvgCost: .95},
            {Name: "lettuce", Category: "vegetable", AvgCost: 1.69},
            {Name: "potato", Category: "vegetable", AvgCost: 5.14},
            {Name: "zucchini", Category: "vegetable", AvgCost: 1.99},
            {Name: "broccoli", Category: "vegetable", AvgCost: 1.49},
            {Name: "cabbage", Category: "vegetable", AvgCost: 2.48},
            {Name: "celery", Category: "vegetable", AvgCost: 1.65},
            {Name: "asparagus", Category: "vegetable", AvgCost: 2.99},
            {Name: "kale", Category: "vegetable", AvgCost: 1.99},
            {Name: "cauliflower", Category: "vegetable", AvgCost: 3.24}
        )
    );
    Set(varSpeedConcurrent, Text(DateDiff(varStart, Now(), TimeUnit.Milliseconds)));
    ```

8. Insert another **Text label**, set its **BorderThickness** property to `3`, rename it to `lblSpeedConcurrent`, and set its **Text** property to:

    ```powerappsfl
    varSpeedConcurrent
    ```

9. Press and hold **Alt Key**, and select the **Concurrent** button. This creates the same two collections and you should notice that it takes half the time to build.

You can see that by adding the **Concurrent** function, we enhanced the performance of building our collections. You can use this to run multiple processes at once, bearing in mind that you can't predict the order in which formulas within the Concurrent function start and end. As long as your results aren't dependent on other results within your Concurrent function, all tasks can run at the same time. This technique can provide a significant performance boost for your app.
