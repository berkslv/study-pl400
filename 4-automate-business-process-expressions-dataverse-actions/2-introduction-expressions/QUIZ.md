# Quiz: Introduction to Expressions in Power Automate

> **Source material:** 1-introduction.md, 2-get-started.md, 3-comments.md, 4-functions.md, 5-expressions.md, 6-exercise.md, 7-check.md, 8-summary.md
> **Total questions:** 24
> **Question types:** Multiple choice (single), Multiple choice (multi-select), Fill-in-the-Blank

---

## Questions

### Question 1 — Single Choice

A developer is new to Power Automate and wants to understand expressions. They have heard the term used frequently but are unsure of the exact definition.

Which of the following best describes what an expression is in Power Automate?

- A. A conditional branch in a flow that routes data to different actions
- B. A set of simple functions that return data in the format you need
- C. A UI element that displays calculated output directly on the canvas
- D. A type of trigger that starts a flow based on a formula condition

<details>
<summary>Answer</summary>

**Correct answer:** B. A set of simple functions that return data in the format you need

**Explanation:** According to the introduction unit, expressions in Power Automate are "a set of simple functions that enable you to return data." They allow you to write formulas to get data in the desired shape — such as converting dates, dividing numbers, or combining strings.

</details>

---

### Question 2 — Single Choice

A Power Automate developer is searching online for documentation about a specific expression function. Most of the search results point to Azure Logic Apps documentation rather than Power Automate documentation.

Why is it acceptable for a Power Automate developer to rely on Azure Logic Apps function documentation?

- A. Power Automate and Logic Apps functions share the same names but have different syntax
- B. Power Automate is being deprecated in favor of Azure Logic Apps
- C. Power Automate flows run on top of Azure Logic Apps and both use the same functions
- D. Azure Logic Apps documentation is more up-to-date than Power Automate documentation

<details>
<summary>Answer</summary>

**Correct answer:** C. Power Automate flows run on top of Azure Logic Apps and both use the same functions

**Explanation:** The introduction unit states that "Flows in Power Automate run on top of Azure Logic Apps" and that both products use the same functions. The official Reference Guide for Power Automate functions is even hosted on the Logic Apps side of the documentation.

</details>

---

### Question 3 — Single Choice

A maker wants to open the expression editor in Power Automate while configuring an action's input field. They are using the modern designer.

Which of the following methods can be used to open the expression editor? (Select **two**.)

- A. Double-click the canvas background
- B. Select the **fx** button on the right side of the input field
- C. Type a forward slash (`/`) in the input field
- D. Right-click the trigger to access formula options
- E. Press **Ctrl+E** on the keyboard

<details>
<summary>Answer</summary>

**Correct answer:** B. Select the **fx** button on the right side of the input field, C. Type a forward slash (`/`) in the input field

**Explanation:** The "Get started with expressions" unit explains two ways to open the expression editor: selecting the **fx** button that appears on the right side of an input field, or typing a forward slash (`/`) directly into the input field to bring up options as a drop-down selection.

</details>

---

### Question 4 — Single Choice

A flow developer finishes writing an expression in the formula bar of the expression editor. They click elsewhere on the screen before saving.

What is the result of this action?

- A. The expression is auto-saved because Power Automate has AutoSave enabled
- B. The expression is saved in draft form and can be retrieved later
- C. The expression is lost because Power Automate does not have AutoSave
- D. The expression is flagged as invalid and highlighted in red

<details>
<summary>Answer</summary>

**Correct answer:** C. The expression is lost because Power Automate does not have AutoSave

**Explanation:** The "Get started with expressions" unit explicitly warns: "Always be sure to select **Add** when editing an expression — if you select out of the inputs, you will lose your changes. Power Automate doesn't have AutoSave."

</details>

---

### Question 5 — Single Choice

A developer is using the legacy designer in Power Automate and has finished writing an expression in the formula bar.

Which button must they select to save the expression in the legacy designer?

- A. Add
- B. Done
- C. Apply
- D. Update

<details>
<summary>Answer</summary>

**Correct answer:** D. Update

**Explanation:** The "Get started with expressions" unit notes that in the legacy designer, you select **Update** to save your formula, whereas the modern designer uses the **Add** button.

</details>

---

### Question 6 — Single Choice

A developer needs to represent the string `Hello World` inside a Power Automate expression.

Which of the following is the correct syntax?

- A. `"Hello World"`
- B. `Hello World`
- C. `'Hello World'`
- D. `[Hello World]`

<details>
<summary>Answer</summary>

**Correct answer:** C. `'Hello World'`

**Explanation:** The "Notes make things easier" unit states that when you use text in a Power Automate expression, you must use single quotes at the beginning and end of each string. Double quotes and other delimiters are not valid string syntax in these expressions.

</details>

---

### Question 7 — Single Choice

A maker wants to combine the static text `"Today is "` with the output from a Compose action named `Compose` in a Power Automate expression.

Which expression correctly implements this?

- A. `join('Today is ', outputs('Compose'))`
- B. `concat('Today is ', outputs('Compose'))`
- C. `append('Today is ', outputs('Compose'))`
- D. `merge('Today is ', outputs('Compose'))`

<details>
<summary>Answer</summary>

**Correct answer:** B. `concat('Today is ', outputs('Compose'))`

**Explanation:** The "Notes make things easier" unit provides this exact example, showing that the **concat** function is used to combine a static string with dynamic content from a Compose action output.

</details>

---

### Question 8 — Single Choice

A developer adds a note to an action in their Power Automate flow. They paste the full expression into the note.

What is the primary benefit of this practice?

- A. It causes Power Automate to validate the formula automatically
- B. It makes the expression available to other flows in the environment
- C. It allows reviewing the full formula without opening the expression editor pop-up
- D. It replaces the expression in the input field with the note text

<details>
<summary>Answer</summary>

**Correct answer:** C. It allows reviewing the full formula without opening the expression editor pop-up

**Explanation:** The "Notes make things easier" unit explains that pasting the expression into a note is "a common technique to make reviewing your expression easier" so you "won't need to open up the pop-up formula editor" to see the full formula.

</details>

---

### Question 9 — Single Choice

A developer needs to format the number `12.5` as a currency value in US dollars using a Power Automate expression.

Which expression produces the output `$12.50`?

- A. `currency(12.5, 'USD')`
- B. `formatNumber(12.5, 'C')`
- C. `toCurrency(12.5)`
- D. `format(12.5, 'currency')`

<details>
<summary>Answer</summary>

**Correct answer:** B. `formatNumber(12.5, 'C')`

**Explanation:** The "Types of functions" unit shows that `formatNumber(12.5,'C')` returns `$12.50`. The `'C'` parameter represents the Currency numeric format string. This is a string function.

</details>

---

### Question 10 — Single Choice

A developer uses the expression `length('I love Power Automate.')` in a Power Automate flow.

What value does this expression return?

- A. 21
- B. 22
- C. 20
- D. 23

<details>
<summary>Answer</summary>

**Correct answer:** B. 22

**Explanation:** The "Types of functions" unit provides this exact example, noting that `length('I love Power Automate.')` returns `22` because spaces count as characters. The string has 22 total characters including spaces and the period.

</details>

---

### Question 11 — Single Choice

A developer writes the following expression: `If(greater(12,10),'Yes','No')`.

What does this expression return?

- A. `No`, because `greater` returns false when comparing integers
- B. An error, because `if` and `greater` cannot be nested
- C. `Yes`, because `greater(12,10)` evaluates to `true`
- D. `No`, because 12 and 10 are equal in length

<details>
<summary>Answer</summary>

**Correct answer:** C. `Yes`, because `greater(12,10)` evaluates to `true`

**Explanation:** The "Types of functions" unit explains this example: work from the inside out — `greater(12,10)` returns `true`, so the `if` function returns the first value `'Yes'`. Logical functions allow you to write If statements using expressions.

</details>

---

### Question 12 — Single Choice

A Power Automate developer needs to perform subtraction in an expression. They try writing `add(10, -2)` to subtract 2 from 10.

Will this approach work?

- A. Yes, because `add` accepts negative numbers as a valid way to subtract
- B. No, because you must use the `subtract` function for this
- C. No, because Power Automate uses separate functions for addition (`add`) and subtraction (`sub`) — you cannot add negative numbers to simulate subtraction
- D. Yes, but only if the values are declared as float types first

<details>
<summary>Answer</summary>

**Correct answer:** C. No, because Power Automate uses separate functions for addition (`add`) and subtraction (`sub`) — you cannot add negative numbers to simulate subtraction

**Explanation:** The "Types of functions" unit includes an important note: "Power Automate uses separate functions for addition (`add`) and subtraction (`sub`) — you cannot add negative numbers to simulate subtraction." Use `sub(10, 2)` instead.

</details>

---

### Question 13 — Single Choice

A developer needs to add three numbers — 12, 13, and 15 — using Power Automate expressions. There is no single function that accepts three arguments.

Which expression correctly returns `40`?

- A. `add(12, 13, 15)`
- B. `sum(12, 13, 15)`
- C. `add(add(12,13),15)`
- D. `math(12+13+15)`

<details>
<summary>Answer</summary>

**Correct answer:** C. `add(add(12,13),15)`

**Explanation:** The "Types of functions" unit demonstrates nesting `add` functions to add more than two numbers: `add(add(12,13),15)` returns `40`. The inner `add(12,13)` evaluates to `25`, which is then passed to the outer `add` along with `15`.

</details>

---

### Question 14 — Single Choice

A maker needs to retrieve the current date and time in Eastern Standard Time with the format `dd-MM-yyyy hh:mm tt`.

Which expression achieves this?

- A. `convertToUtc(now(), 'Eastern Standard Time', 'dd-MM-yyyy hh:mm tt')`
- B. `convertFromUtc(utcNow(), 'Eastern Standard Time', 'dd-MM-yyyy hh:mm tt')`
- C. `getLocalTime('Eastern Standard Time', 'dd-MM-yyyy hh:mm tt')`
- D. `timeZoneConvert(utcNow(), 'Eastern Standard Time')`

<details>
<summary>Answer</summary>

**Correct answer:** B. `convertFromUtc(utcNow(), 'Eastern Standard Time', 'dd-MM-yyyy hh:mm tt')`

**Explanation:** The "Types of functions" unit provides this exact example under Date and Time functions. `utcNow()` retrieves the current UTC time and `convertFromUtc` converts it to the target time zone with the specified format string.

</details>

---

### Question 15 — Single Choice

A developer is analyzing a flow and sees a dynamic content field called **User name** that Power Automate generated automatically. When they hover over it, they see the underlying expression.

Which of the following represents the category of function that Power Automate used to generate this expression?

- A. String functions
- B. Math functions
- C. Referencing functions
- D. Workflow functions

<details>
<summary>Answer</summary>

**Correct answer:** C. Referencing functions

**Explanation:** The "Types of functions" unit explains that referencing functions "work with the outputs of actions and triggers" and that "most of the time Power Automate writes these for you when you add dynamic content." The example `triggerOutputs()?['headers']?['x-ms-user-name-encoded']` is a referencing function.

</details>

---

### Question 16 — Single Choice

A developer writes the expression `coalesce(null, 'Power Automate', 'Power Apps')`.

What value does this expression return?

- A. `null`
- B. `Power Apps`
- C. `Power Automate`
- D. An error, because `null` is not a valid argument

<details>
<summary>Answer</summary>

**Correct answer:** C. `Power Automate`

**Explanation:** The "Types of functions" unit explains that `coalesce` returns the first non-null value. Since the first argument is `null`, it is skipped, and `'Power Automate'` is returned as the first non-null value.

</details>

---

### Question 17 — Single Choice

A developer needs to extract the query string from the URL `https://flow.microsoft.com/fakeurl?Test=Yes`.

Which expression achieves this?

- A. `urlQuery('https://flow.microsoft.com/fakeurl?Test=Yes')`
- B. `uriQuery('https://flow.microsoft.com/fakeurl?Test=Yes')`
- C. `parseQuery('https://flow.microsoft.com/fakeurl?Test=Yes')`
- D. `getQueryString('https://flow.microsoft.com/fakeurl?Test=Yes')`

<details>
<summary>Answer</summary>

**Correct answer:** B. `uriQuery('https://flow.microsoft.com/fakeurl?Test=Yes')`

**Explanation:** The "Types of functions" unit shows that URI parsing functions use `uriQuery` to extract the query string from a URL. The expression `uriQuery('https://flow.microsoft.com/fakeurl?Test=Yes')` returns `?Test=Yes`.

</details>

---

### Question 18 — Single Choice

A developer builds a complex expression step by step using multiple Compose actions to validate each component, then merges everything into a single final expression.

What is the recommended approach for building complex expressions according to best practices?

- A. Write the entire complex expression at once without intermediate steps to save time
- B. Build complex expressions piece by piece in separate Compose steps, validate each, then combine into one final expression
- C. Use a Condition action instead of nesting functions, as nesting is unsupported
- D. Complex expressions should only be built by Copilot, not manually

<details>
<summary>Answer</summary>

**Correct answer:** B. Build complex expressions piece by piece in separate Compose steps, validate each, then combine into one final expression

**Explanation:** The "Write complex expressions" unit states: "A best practice is to build complex expressions piece by piece in separate Compose steps, then combine everything into one final expression." This allows validating each component before merging.

</details>

---

### Question 19 — Single Choice

A developer inputs the date `2024-02-09` and the number `2` into a flow that uses `addDays(triggerBody()?['date'], triggerBody()?['number'])`.

What is the output of this expression?

- A. `2024-02-09T00:00:00.0000000`
- B. `2024-02-11T00:00:00.0000000`
- C. `2024-02-07T00:00:00.0000000`
- D. `February 11, 2024`

<details>
<summary>Answer</summary>

**Correct answer:** B. `2024-02-11T00:00:00.0000000`

**Explanation:** The "Write complex expressions" unit explains that adding 2 days to `2024-02-09` results in `2024-02-11T00:00:00.0000000` in UTC format. The `addDays` function returns the date in ISO 8601 UTC format.

</details>

---

### Question 20 — Single Choice

In the exercise for this module, a developer creates a flow to calculate carpet cost. The first Compose action multiplies Square Footage by Cost per square foot. The second Compose action formats the result.

Which expression does the second Compose action use to format the multiplication result as currency with 2 decimal places?

- A. `formatNumber(outputs('Compose'), 'USD')`
- B. `toCurrency(outputs('Compose'), 2)`
- C. `formatNumber(outputs('Compose'), 'C2')`
- D. `formatCurrency(outputs('Compose'), 2, '$')`

<details>
<summary>Answer</summary>

**Correct answer:** C. `formatNumber(outputs('Compose'), 'C2')`

**Explanation:** The exercise unit specifies the expression `formatNumber(outputs('Compose'), 'C2')` where `C` formats as currency and `2` sets the number of decimal places. The output of the first Compose action is passed as the number to format.

</details>

---

### Question 21 — Multi-Select

A developer is reviewing the 10 categories of functions available in Power Automate expressions.

Which of the following are valid function categories in Power Automate? (Select **three**.)

- A. Workflow functions
- B. Rendering functions
- C. URI Parsing functions
- D. Event functions
- E. Manipulation functions
- F. Animation functions

<details>
<summary>Answer</summary>

**Correct answer:** A. Workflow functions, C. URI Parsing functions, E. Manipulation functions

**Explanation:** The "Types of functions" and summary units list the 10 valid categories: String, Collection, Logical, Conversion, Math, Date and Time, Referencing, Workflow, URI Parsing, and Manipulation. Rendering, Event, and Animation functions are not categories in Power Automate expressions.

</details>

---

### Question 22 — Multi-Select

A maker wants to use a simple, low-risk environment to test expressions without worrying about other trigger inputs or production data.

Which two components does the documentation recommend using for this purpose? (Select **two**.)

- A. A **Scheduled trigger**
- B. A **Compose** action
- C. A **Manually trigger a flow** trigger
- D. A **Send an email** action
- E. An **Initialize variable** action

<details>
<summary>Answer</summary>

**Correct answer:** B. A **Compose** action, C. A **Manually trigger a flow** trigger

**Explanation:** The "Get started with expressions" unit recommends: "Use a **Manually trigger a flow** trigger and a **Compose** action as a simple setup for writing and testing expressions without worrying about other inputs or actions." This is also reinforced in the summary unit's key takeaways.

</details>

---

### Question 23 — Multi-Select

A developer reviews the key takeaways for working with expressions in Power Automate.

Which of the following statements are correct? (Select **three**.)

- A. Function names in Power Automate expressions are case-sensitive
- B. Power Automate and Azure Logic Apps share the same expression functions
- C. Strings in expressions use single quotes
- D. Complex expressions require a special syntax operator to nest functions
- E. Copilot can help create expressions from natural language descriptions
- F. The **fx** button opens the expression editor in an action's input field

<details>
<summary>Answer</summary>

**Correct answer:** B. Power Automate and Azure Logic Apps share the same expression functions, C. Strings in expressions use single quotes, E. Copilot can help create expressions from natural language descriptions

**Explanation:** The summary unit's key takeaways confirm: Power Automate and Azure Logic Apps share the same functions; strings use single quotes; and Copilot can help create expressions. Function names are NOT case-sensitive (A is wrong), complex expressions use no special syntax beyond nesting (D is wrong), and while F is partially true, the question asks for three of the most clearly-stated takeaways from the module's summary.

</details>

---

### Question 24 — Fill-in-the-Blank

In Power Automate, a ___ expression is created by combining more than one function so that the output of one function becomes the input of ___. There are no special syntax or operators required — you simply ___ functions within each other.

<details>
<summary>Answer</summary>

**Answer:** complex; another; nest

**Explanation:** The "Write complex expressions" unit defines this concept: "When you combine more than one function to get the result you want, this is known as a **complex expression**. There are no special syntax, operators, or considerations — you simply use the output of one function as an input to another." This is called nesting functions.

</details>

---

### Question 25 — Fill-in-the-Blank

To open the expression editor, you can select the ___ button in an action's input field, or type a ___ in the input field to bring up the options as a drop-down selection. After writing your expression, you must select the ___ button to save it (in the modern designer).

<details>
<summary>Answer</summary>

**Answer:** fx; forward slash (`/`); Add

**Explanation:** The "Get started with expressions" unit explains both methods: the **fx** button or typing `/` opens the expression editor. The **Add** button must be selected to save — Power Automate does not have AutoSave, so forgetting to click Add will discard your changes.

</details>
