# Types of functions

> Module: Introduction to expressions in Power Automate | Unit 4 of 8 | 12 minutes

Functions are grouped into 10 different categories including string, logic, and math. The categories are organized to make finding a particular function easier.

The expression editor shows available functions grouped by category (scrollable list) and includes a **Search** input to jump directly to a function. You can also enlist **Copilot** to help you create an expression using natural language.

Keep in mind that the examples below use static text and values to make them easy to test. In your flows, you can substitute dynamic content in place of static data — just ensure the dynamic data is the correct format for the function.

## String functions

String (text) functions modify strings, find characters in a string, format strings, and more.

**Example — formatNumber (currency):**

```
formatNumber(12.5,'C')
```

Returns `$12.50`. The `'C'` represents the Currency numeric format string. See [Standard numeric format strings](https://learn.microsoft.com/en-us/dotnet/standard/base-types/standard-numeric-format-strings/) for all options.

To format as Japanese Yen, add the locale parameter:

```
formatNumber(12.5,'C','ja-JP')
```

Returns `¥13`.

## Collection functions

Used for arrays and strings — check emptiness, grab first/last item, join, union, intersection, etc.

**Example — length:**

```
length('I love Power Automate.')
```

Returns `22`. Spaces count as characters.

## Logical functions

Used to work with conditions, compare values, and perform logic-based evaluations (If statements).

**Example — if + greater:**

```
If(greater(12,10),'Yes','No')
```

Returns `Yes`. Work from the inside out: `greater(12,10)` returns `true`, so the first value `'Yes'` is returned.

> **Important:** There is also a **Condition** action that lets you write If statements without an expression. You can insert one by selecting the plus icon and searching for **Condition**, or by asking Copilot.

## Conversion functions

Used to change data types — convert text to numbers, change file encoding, etc.

**Example — int:**

```
Int('12')
```

Returns the integer `12`.

**Example — float:**

```
Float('12.4')
```

Returns the float `12.4`.

**Example — combining conversion with logic:**

```
If(greater(Int('12'), Float('12.4')),'Yes','No')
```

Returns `No` because 12 is not greater than 12.4.

## Math functions

Used for arithmetic operations, finding min/max, generating random numbers, etc.

> **Important:** Power Automate uses separate functions for addition (`add`) and subtraction (`sub`) — you cannot add negative numbers to simulate subtraction.

**Example — add two numbers:**

```
add(12, 13)
```

Returns `25`.

**Example — add three numbers:**

```
add(add(12,13),15)
```

Returns `40`.

**Example — random number 1–10:**

```
rand(1,10)
```

## Date and time functions

Used to return the current date/time, change time zones, extract date/time parts, and more. Most data sources use UTC format when exchanging data with Power Automate.

**Example — convert UTC now to Eastern Standard Time:**

```
convertFromUtc(utcNow(), 'Eastern Standard Time', 'dd-MM-yyyy hh:mm tt')
```

Returns `09-02-2024 11:28 AM`. See [Custom date and time format strings](https://learn.microsoft.com/en-us/dotnet/standard/base-types/custom-date-and-time-format-strings/) for all format options.

## Referencing functions

Used to work with the outputs of actions and triggers. Most of the time Power Automate writes these for you when you add **dynamic content**.

**Example — hover over dynamic content to see the underlying expression:**

```
triggerOutputs()?['headers']?['x-ms-user-name-encoded']
```

This is the expression Power Automate generates when you add the **User name** dynamic content from a trigger.

## Workflow functions

Used to retrieve information about your flow (closely related to referencing functions).

**Example — get current flow run ID:**

```
workflow().run.id
```

Useful for error reporting or logging.

## URI parsing functions

Used to dissect a URI string (host, path, query string, etc.).

**Example — extract query string:**

```
uriQuery('https://flow.microsoft.com/fakeurl?Test=Yes')
```

Returns `?Test=Yes`.

## Manipulation functions

Used to work with specific objects — find first non-blank value, work with properties, find xpath matches.

**Example — coalesce (first non-null value):**

```
coalesce(null, 'Power Automate', 'Power Apps')
```

Returns `Power Automate`.
