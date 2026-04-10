# Recall: Introduction to Expressions in Power Automate

> **Source files:** 1-introduction.md, 2-get-started.md, 3-comments.md, 4-functions.md, 5-expressions.md, 6-exercise.md

---

## Keywords

| Term | Definition |
|------|------------|
| Expression | A formula using one or more functions that returns or transforms data in a Power Automate flow. |
| Formula bar | The expression editor pop-up where you type, combine, and save function expressions. |
| Dynamic content | Runtime values from triggers or prior actions that can be referenced inside expressions. |
| Complex expression | Two or more nested functions where the output of one function serves as input to another. |
| `concat` | String function that combines two or more strings into one output string. |
| `convertFromUtc` | Date/time function that converts a UTC timestamp to a specified destination time zone. |
| `coalesce` | Manipulation function that returns the first non-null value from a list of arguments. |
| `formatNumber` | String function that formats a number using a standard or custom format string (e.g., currency). |
| `addDays` | Date/time function that adds a specified number of days to a given date value. |
| `dayOfWeek` | Date/time function that returns the day-of-week as an integer (Sunday = 0 … Saturday = 6). |
| Referencing functions | Functions (e.g., `triggerBody()`, `outputs()`) used to access outputs of triggers and actions. |
| Compose action | A lightweight Power Automate action used to evaluate and test expressions in isolation. |

---

## Main Ideas

- Power Automate expressions are built on Azure Logic Apps functions; the official function reference is hosted in the Logic Apps documentation.
- The expression editor is opened by clicking the **fx** button on any action input field, or by typing `/` in the input field.
- Function names are **not** case-sensitive in the formula bar.
- Always select **Add** (or **Update** in the legacy designer) after writing an expression — Power Automate does not auto-save formula edits.
- Functions are grouped into 10 categories: String, Collection, Logical, Conversion, Math, Date and Time, Referencing, Workflow, URI Parsing, and Manipulation.
- String literals inside expressions must be wrapped in **single quotes** (`'like this'`).
- Math functions use named operations (`add`, `sub`, `mul`) — you cannot use arithmetic operators or add negative numbers to simulate subtraction.
- Most data sources exchange dates with Power Automate in **UTC format**; use date/time functions to convert to local time zones.
- A best practice for complex expressions is to build each piece in separate **Compose** actions, validate them independently, then merge into one final expression.
- The `Compose` action with a `Manually trigger a flow` trigger is the recommended sandbox for writing and testing expressions.
- Hover over dynamic content in a flow to reveal the underlying referencing expression Power Automate generated for it.
- Notes (added via the ellipse menu on any action) are useful for storing a copy of a long expression for easy review without reopening the formula editor.

---

## Mini Quiz

### Q1 — Single Choice

You need to multiply two number inputs from a manual trigger in Power Automate.

Which expression correctly multiplies `Square Footage` (first input) by `Cost` (second input)?

- A. `add(triggerBody()?['number'], triggerBody()?['number_1'])`
- B. `mul(triggerBody()?['number'], triggerBody()?['number_1'])`
- C. `multiply(triggerBody()?['number'], triggerBody()?['number_1'])`
- D. `number * number_1`

<details>
<summary>Answer</summary>

**Correct answer:** B. `mul(triggerBody()?['number'], triggerBody()?['number_1'])`

**Explanation:** Power Automate uses the `mul()` function for multiplication. Arithmetic operators like `*` are not supported; you must use named math functions.

</details>

---

### Q2 — Fill-in-the-Blank

In the expression editor, you must select the ___ button to save your expression; Power Automate does not ___ changes to formulas.

<details>
<summary>Answer</summary>

**Answer:** Add (or Update in the legacy designer) | auto-save

**Explanation:** The source material explicitly states "Always be sure to select **Add** when editing an expression" and that "Power Automate doesn't have AutoSave."

</details>

---

### Q3 — Single Choice

You want to return the first non-null value from a set of variables. Which function should you use?

- A. `first()`
- B. `if()`
- C. `coalesce()`
- D. `concat()`

<details>
<summary>Answer</summary>

**Correct answer:** C. `coalesce()`

**Explanation:** `coalesce` is a Manipulation function that scans its arguments in order and returns the first non-null value, e.g., `coalesce(null, 'Power Automate', 'Power Apps')` returns `Power Automate`.

</details>

---

### Q4 — Fill-in-the-Blank

Power Automate expressions share the same functions as ___ because flows run on top of that platform. The official function reference documentation is hosted on the ___ documentation site.

<details>
<summary>Answer</summary>

**Answer:** Azure Logic Apps | Logic Apps (not Power Automate)

**Explanation:** The introduction states that "Flows in Power Automate run on top of Azure Logic Apps" and the Reference Guide for functions is hosted on the Logic Apps side of the documentation.

</details>

---

### Q5 — Single Choice

A flow adds 2 days to the date `2024-02-09` using `addDays`, then passes the result to `dayOfWeek`. What integer does `dayOfWeek` return?

- A. 1
- B. 4
- C. 0
- D. 6

<details>
<summary>Answer</summary>

**Correct answer:** C. 0

**Explanation:** Adding 2 days to February 9, 2024 yields February 11, 2024, which is a Sunday. `dayOfWeek` returns `0` for Sunday.

</details>

---

### Q6 — Single Choice

You want to format a number as US currency with two decimal places. Which expression is correct?

- A. `formatNumber(outputs('Compose'), 'C')`
- B. `formatNumber(outputs('Compose'), 'C2')`
- C. `formatCurrency(outputs('Compose'), 2)`
- D. `format(outputs('Compose'), 'USD', 2)`

<details>
<summary>Answer</summary>

**Correct answer:** B. `formatNumber(outputs('Compose'), 'C2')`

**Explanation:** The exercise demonstrates `formatNumber(outputs('Compose'), 'C2')` where `C` is the currency format specifier and `2` sets the number of decimal places.

</details>

---

### Q7 — Fill-in-the-Blank

When using text (string literals) inside a Power Automate expression, you must wrap the text in ___ quotes, not double quotes.

<details>
<summary>Answer</summary>

**Answer:** single (`'`)

**Explanation:** The source states "use single quotes (`'`) at the beginning and end of each string" when using text in expressions, as shown in `concat('Today is ', outputs('Compose'))`.

</details>

---
