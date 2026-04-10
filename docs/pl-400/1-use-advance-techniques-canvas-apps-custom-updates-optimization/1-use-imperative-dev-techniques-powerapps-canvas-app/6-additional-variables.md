# Additional variable concepts

Now that you have an understanding of Power Apps logic concepts and variable types, there a few additional concepts to expand on that will help you integrate variables into your app.

## Variables can self-reference

This concept applies to both global and context variables. Sometimes you need to make a variable that points to itself. This is often done when you want to either do a counter type variable where it increments a value or you're appending a string. With Power Apps this is easy to implement. Place the following formula on the **OnSelect** property of a button to set up a counter.

```
Set(varCounter, varCounter + 1)
```

Next to the button put a **Label**, and in the **Text** property, put **varCounter**. The first time that you select the button your value will be 1. If you select the button a second time the value will be 2. Use the following table to see the literal translation.

| Value of varCounter before the button press | Button press | Formula | Values | Value of varCounter after button press |
|---|---|---|---|---|
| 0 | First | Set(varCounter, varCounter + 1) | Set(varCounter, 0 + 1) | 1 |
| 1 | Second | Set(varCounter, varCounter + 1) | Set(varCounter, 1 + 1) | 2 |
| 2 | Third | Set(varCounter, varCounter + 1) | Set(varCounter, 2 + 1) | 3 |

When the app first starts, the value of varCounter is 0, and it's incremented by 1 each the time the button is selected. It's important to remember that the default value of a variable varies based on the variable type if you don't set the default property.

- Text variables are ""
- Number variables are 0
- Boolean variables are false

## A variable can store a single record

This concept applies to global and context variables. Collections differ slightly because they're a table made up of one or more records, meaning storing and retrieving a record is different for a collection.

In the previous units, you learned how to store a single value in a global or context variable. You can also store a record in the variable. When you do this, you can then reference the different fields or columns by using the dot (.) notation.

In this example, you'll store the entire user record in a global variable named **varUser**. To do so, use the following function.

```
Set(varUser, User())
```

This stores the entire user record in the variable. The user record has three columns Email, FullName, and Image. You can retrieve the values of the individual columns using the dot (.) notation. To display the user's email address, add a Label control to the screen and set the text property to:

```
varUser.Email
```

This example stores the record from an action-based data source. You could also use the **LookUp** function as a way to retrieve and store a record from a tabular data source, like Microsoft Dataverse, in a variable.

## Variables don't auto update

A common point of confusion for people who are new to variables is that variables don't automatically update. For example, they can use a variable to store the number of customer invoices using OnStart for the app. Then in the app, the user creates a new invoice. The variable doesn't distinguish the number of invoices in the system that have changed. The variable will only update when:

- The user closes the app and then opens it again. This causes OnStart to perform the operation to calculate the number of invoices.

- You implement functionality to update the variable after the user creates an invoice.

Be aware of this common point of confusion if you're new to using variables to track data.
