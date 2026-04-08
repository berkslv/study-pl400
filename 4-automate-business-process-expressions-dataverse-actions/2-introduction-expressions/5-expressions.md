# Write complex expressions

> Module: Introduction to expressions in Power Automate | Unit 5 of 8 | 5 minutes

When you combine more than one function to get the result you want, this is known as a **complex expression**. There are no special syntax, operators, or considerations — you simply use the output of one function as an input to another.

## Examples from previous units

**Add three numbers:**

```
add(add(12,13),15)
```

Returns `40`.

**Convert UTC now to Eastern Standard Time with format:**

```
convertFromUtc(utcNow(), 'Eastern Standard Time', 'dd-MM-yyyy hh:mm tt')
```

Returns `09-02-2024 11:28 AM`.

## Building a complex expression step by step

A best practice is to build complex expressions piece by piece in separate Compose steps, then combine everything into one final expression.

### Setup

Create a **Manually trigger a flow** with two inputs:
- A **Number** input
- A **Date** input

### Step 1 — Add days to a date

In a Compose action, use **addDays** combined with **triggerBody** referencing functions:

```
addDays(triggerBody()?['date'], triggerBody()?['number'])
```

> **Tip:** To reference trigger body fields, start typing `addDays()`, then with your cursor inside the parentheses, switch to the **Dynamic content** tab and select your fields. Power Automate writes the referencing expression for you.

If you input date `2024-02-09` and number `2`, the output is `2024-02-11T00:00:00.0000000` (UTC format for February 11, 2024).

### Step 2 — Get day of week

In a second Compose action, use **dayOfWeek**:

```
dayOfWeek(outputs('Compose'))
```

Returns `0` for Sunday. Sunday = 0, Monday = 1, … Saturday = 6.

### Step 3 — Check if it's Thursday

In a third Compose action, use **if** + **equals**:

```
if(equals(outputs('Compose_1'),4), 'You chose a Thursday', 'You didn''t choose a Thursday')
```

For February 9, 2024, returns `"You didn't choose a Thursday."` (Thursday = 4).

### Final combined expression

Once all steps are validated, merge everything into a single Compose:

```
if(equals(dayOfWeek(addDays(triggerBody()['date'], triggerBody()['number'])),4), 'You chose a Thursday', 'You did not choose a Thursday')
```

The output for February 9, 2024 is `"You didn't choose a Thursday."` You can then remove the preliminary Compose actions to clean up the flow.
