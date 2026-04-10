# The three types of variables in Power Apps

In Power Apps, you can use variables to temporarily store information that you need to reference while an app is running. Common scenarios include keeping a running count, managing UI state, improving performance by avoiding repeated calculations, or temporarily storing lists of data.

Variables are a key driver for imperative logic in Power Apps because they allow you to "build the sandwich" piece by piece.

To support you in these needs, Power Apps has three different types of variables.

- **Global variables** -- The most traditional type of variable. You use the **Set** function to create and set its value. Then you can reference its values anywhere within your app. A common use is to store a user's DisplayName when the app loads and then reference the variable throughout the app.

- **Context variables** -- A context variable is only available on the screen where you create it using the **UpdateContext** function. Context variables are commonly used for functionality that controls a pop-up screen, for example, where you want to use the same variable name on multiple screens but maintain the value separately.

- **Collections** -- A collection is a special type of variable for storing a table of data. You can create the collection manually or by loading another data sources table into it. Collections are available throughout your app, like global variables, and they're created using the **Collect** or **ClearCollect** function.

When choosing which type of variable to use, consider where you'll use it and the structure of the data you want to store. When in doubt, use a global variable as it has the most flexibility.

## How all of the variable types are the same

With Power Apps, variables are easy to use. You don't have to initialize, declare, or type a variable. You create the variable with the appropriate function, and Power Apps does the rest. When you assign the value to a variable Power Apps will automatically determine the type.

It's also important to note if you're new to variables that variables are temporary and only available to the current user in their current session. When the user closes Power Apps, all of the information stored in variables is no longer available. If you need to store information for use later or by other users, then you'll need to write that information to a data source. Variables are temporary by nature.

In the next units, you'll explore each variable type in more detail. The next unit covers the global variable.
