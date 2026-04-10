# Notes make things easier

> Module: Introduction to expressions in Power Automate | Unit 3 of 8 | 2 minutes

When you look at the *convertToUtc* expression you wrote earlier, you might notice that you need to scroll to see the whole formula in the function bar. A common technique to make reviewing your expression easier is to use notes and paste the whole formula into the note. That way you won't need to open up the pop-up formula editor.

To add a note, select the ellipse to show the menu, then select **Add a note**. In the note box, you can type any text or paste a copy of the expression used in your action.

## Defining text

When you use text in a Power Automate expression, use single quotes (`'`) at the beginning and end of each string. For example, to combine the string `"Today is "` (with an extra space) and the output from a Compose action, use the **concat** function:

```
concat('Today is ', outputs('Compose'))
```

These little details help you become more effective when working with expressions. One of the great things about expressions is that they're consistent — as you learn about one function you can often apply those learnings to the next function, rapidly speeding up your learning.
