# Imperative versus declarative development

This module includes some concepts that might appear to be very developer focused but don't worry. The goal is to help you understand and apply some of these concepts to build better apps.

There are two main ways to approach development:

Imperative development focuses on how to achieve a goal. Declarative development focuses on what result you want.

Imperative development gives you more control because you define each step of the process. That flexibility often comes with more complexity. Declarative development is simpler and easier to read, but it can limit how much control you have over execution.

## Imperative

To better understand imperative programming think about the sandwich that you want for lunch. In imperative programming, you focus on creating the sandwich in your "code." You go to the kitchen, get the ingredients, put the sandwich together, and then send it to the user. You spend numerous time on the steps, but you have all of the specific functions you want to make it exactly the way you want. No tomatoes? No problem. In a completely made up programming language, your code might look something like this.

```
Function Create Sandwich

{ Go to kitchen;

Get ingredients;

Remove tomato;

Assemble sandwich;}

Function Send Sandwich

{ Destination Mouth;}
```

As you can see, there are lots of steps in the process, but you get a sandwich exactly the way you want. This is the approach you see in languages like C# or other popular coding languages. The focus is on pushing the data.

## Declarative

For declarative programming, think of the same scenario, your sandwich for lunch. The difference is now you're focused on producing the sandwich, not how to make a sandwich. This is much less complex, but you might also run into the issue with tomatoes. If the function you use to get the sandwich doesn't support the option of no tomato you're out of luck. Your code may be as straight forward as follows.

```
GetSandwich(Kitchen, Mouth)
```

That made up function takes two inputs, where to get the sandwich from and where to send it. There was no option to remove tomatoes. It would be up to the creator of the GetSandwich function to add an option for no Tomato, which might look like this.

```
GetSandwich(Kitchen, Mouth, {Tomato: false})
```

Low-code tools like Excel use this approach to development. The focus is on pulling data.

## Power Apps supports both imperative and declarative methodologies

Power Apps has capabilities for both imperative and declarative logic. Throughout this training, there has been a focus on declarative formulas. In the remainder of this module, the focus is on imperative concepts and methodologies in Power Apps. The key component of imperative logic in Power Apps is variables.

The next unit covers the different types of variables and how to use them in an imperative mode.
