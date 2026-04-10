# Summary: Introduction to Expressions in Power Automate

> **Source files:** 1-introduction.md, 2-get-started.md, 3-comments.md, 4-functions.md, 5-expressions.md, 6-exercise.md

---

## What Are Expressions

- Expressions are a set of simple functions that enable you to return and transform data in a flow.
- Used for calculations, data transformation, type conversion, comparisons, date/time manipulation, and string formatting.
- Power Automate runs on top of Azure Logic Apps and uses the same functions — Logic Apps documentation applies equally.
- The authoritative function reference is hosted on the Logic Apps documentation side.
- Function names are **not** case-sensitive.

---

## Expression Editor

- Open the expression editor by selecting the **fx** button (lower half of the blue formula button on any action input field), or by typing `/` in the input field.
- The formula bar provides auto-suggest pop-ups showing syntax, required/optional parameters, and links to reference docs.
- A `?` suffix on a parameter name (e.g., `format?`) indicates it is optional.
- Dynamic content from the flow can be added directly inside expressions.
- Select **Add** to save an expression — navigating away without clicking Add discards changes (no AutoSave).
- In the legacy designer, select **Update** instead of **Add**.
- Use **Copilot** inside the expression editor to create expressions using natural language.

> **Tip:** Use a **Manually trigger a flow** trigger + **Compose** action as a minimal test harness for writing and validating expressions.

---

## Text / String Syntax

- String literals inside expressions must use **single quotes** (`'`), not double quotes.
- To escape a single quote within a string, double it: `''`.

**Example — concat:**
```
concat('Today is ', outputs('Compose'))
```

---

## Notes / Comments

- Add a note to any action: select the ellipsis (`...`) → **Add a note**.
- Paste a copy of the expression into the note for quick review without reopening the formula editor.

---

## Function Categories (10 total)

### String Functions
- Modify strings, search within strings, format output.

```
formatNumber(12.5,'C')           // Returns $12.50
formatNumber(12.5,'C','ja-JP')   // Returns ¥13
```

See [Standard numeric format strings](https://learn.microsoft.com/en-us/dotnet/standard/base-types/standard-numeric-format-strings/) for all format codes.

---

### Collection Functions
- Work with arrays and strings: check emptiness, get first/last item, join, union, intersection.

```
length('I love Power Automate.')   // Returns 22 (spaces count)
```

---

### Logical Functions
- Evaluate conditions, compare values, implement if/else logic.

```
If(greater(12,10),'Yes','No')   // Returns Yes
```

> **Note:** A **Condition** action is also available for if/else logic without writing an expression.

---

### Conversion Functions
- Change data types: text to number, encoding changes, etc.

```
Int('12')                                        // Returns integer 12
Float('12.4')                                    // Returns float 12.4
If(greater(Int('12'), Float('12.4')),'Yes','No') // Returns No
```

---

### Math Functions
- Arithmetic, min/max, random numbers.
- Addition and subtraction require separate functions (`add`, `sub`) — adding negative numbers does **not** substitute for `sub`.

```
add(12, 13)          // Returns 25
add(add(12,13),15)   // Returns 40
rand(1,10)           // Returns random number 1–10
```

---

### Date and Time Functions
- Return current date/time, convert time zones, extract date/time parts.
- Most data sources exchange data with Power Automate in UTC format.

```
convertFromUtc(utcNow(), 'Eastern Standard Time', 'dd-MM-yyyy hh:mm tt')
// Returns 09-02-2024 11:28 AM
```

See [Custom date and time format strings](https://learn.microsoft.com/en-us/dotnet/standard/base-types/custom-date-and-time-format-strings/) for all format codes.

---

### Referencing Functions
- Access outputs of actions and triggers.
- Power Automate auto-generates these expressions when you insert dynamic content.

```
triggerOutputs()?['headers']?['x-ms-user-name-encoded']
```

---

### Workflow Functions
- Retrieve metadata about the running flow instance.

```
workflow().run.id   // Returns the current flow run ID
```

Useful for error reporting and logging.

---

### URI Parsing Functions
- Extract components of a URI (host, path, query string, etc.).

```
uriQuery('https://flow.microsoft.com/fakeurl?Test=Yes')   // Returns ?Test=Yes
```

---

### Manipulation Functions
- Work with objects: find first non-null value, access properties, xpath matching.

```
coalesce(null, 'Power Automate', 'Power Apps')   // Returns Power Automate
```

---

## Complex Expressions

- A **complex expression** nests the output of one function as an input to another — no special syntax required.
- **Best practice:** Build complex expressions incrementally across separate **Compose** actions, validate each step, then combine into a single final expression.

### Step-by-step example — "Is a date + N days a Thursday?"

**Step 1 — Add days to a date:**
```
addDays(triggerBody()?['date'], triggerBody()?['number'])
// Input: 2024-02-09 + 2 → Output: 2024-02-11T00:00:00.0000000
```

**Step 2 — Get day of week (Sunday=0 … Saturday=6):**
```
dayOfWeek(outputs('Compose'))
// Returns 0 for Sunday
```

**Step 3 — Check if Thursday (4):**
```
if(equals(outputs('Compose_1'),4), 'You chose a Thursday', 'You didn''t choose a Thursday')
```

**Final combined expression:**
```
if(equals(dayOfWeek(addDays(triggerBody()['date'], triggerBody()['number'])),4), 'You chose a Thursday', 'You did not choose a Thursday')
```

---

## Exercise: Carpet Cost Calculator

**Flow structure:**

| Step | Action | Purpose |
|------|--------|---------|
| Trigger | Manually trigger a flow | Accept Square Footage and Cost as number inputs |
| Compose 1 | `mul(...)` | Multiply square footage × cost per sq ft |
| Compose 2 | `formatNumber(..., 'C2')` | Format result as currency |

**Compose 1 expression:**
```
mul(triggerBody()?['number'],triggerBody()?['number_1'])
```
- `number` = Square Footage (first trigger input)
- `number_1` = Cost (second trigger input)

**Compose 2 expression:**
```
formatNumber(outputs('Compose'), 'C2')
```
- `C` = currency format; `2` = two decimal places
- If Copilot named the first action `Compose1`, use `outputs('Compose1')` instead.

**To test:** Save → Test → Manually → Test → enter values → Run flow → Done → expand each step to view outputs.

---

## References

- [Custom date and time format strings](https://learn.microsoft.com/en-us/dotnet/standard/base-types/custom-date-and-time-format-strings/)
- [List of time zone values](https://msdn.microsoft.com/library/gg154758.aspx/)
- [Power Automate](https://flow.microsoft.com/)
- [Standard numeric format strings](https://learn.microsoft.com/en-us/dotnet/standard/base-types/standard-numeric-format-strings/)
- [Workflow Definition Language functions reference (Logic Apps)](https://learn.microsoft.com/en-us/azure/logic-apps/workflow-definition-language-functions-reference/)
