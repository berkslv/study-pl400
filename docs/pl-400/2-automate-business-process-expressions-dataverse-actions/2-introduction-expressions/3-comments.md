# Notes make things easier

Completed

- 2 minutes

When you look at the *convertToUtc* expression you wrote earlier, you might notice that you need to scroll to see the whole formula in the function bar. A common technique to make reviewing your expression easier is to use notes and paste the whole formula into the note. That way you won't need to open up the pop-up formula editor.

[![Screenshot of pasting the formula into the comment.](media/paste-formula.svg)](media/paste-formula.svg#lightbox)

To add a note, select the ellipse to show the menu. Then select **Add a note**.

[![Screenshot of selecting the ellipsis to reveal the &quot;Add a note&quot; option.](media/add-note.svg)](media/add-note.svg#lightbox)

In the note box, you can type any text you want. This can be text or just a copy and paste of the expression used in your action.

## Defining text

When you use text in a Power Automate expression, you use the single quote (') at the beginning and end of each string. For example, if you wanted to combine the string "Today is " (with an extra space) and the output from our expression above, you would use the **Concat** function. Your syntax would be:

`concat('Today is ', outputs('Compose'))`

[![Screenshot of the concat function syntax.](media/concat-function.svg)](media/concat-function.svg#lightbox)

These little details help you become more effective when working with expressions. One of the great things about expressions is that they're consistent. As you learn about one function you can often apply those learnings to the next function, rapidly speeding up your learning.
