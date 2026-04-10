# Understanding navigation

- 5 minutes

Many of the apps that you build in Microsoft Power Apps have more than one screen, so it's essential to understand the two main navigation functions.

## Navigate function

The `Navigate` function allows users to move from one screen to another. For example, if your app has two screens and you want to give users a way to go to your second screen, you could add a `Button` control with the `OnSelect` property as follows:

```
Navigate(Screen2)
```

With the app in play or preview mode, users select the button and automatically go to Screen2. You could use this formula in an Icon control (such as an arrow) or you could use it in the `OnSuccess` property of a form. You can use the `Navigate` function wherever you need to enable users to move to a specific screen.

The `Navigate` function also supports optional visual transitions between screens. You can use the `ScreenTransition` parameter to control the animation effect. Power Apps provides several transition types that offer different user experiences. For example, to add a **Cover** transition to the previous formula:

```
Navigate(Screen2, ScreenTransition.Cover)
```

In this case, **Screen2** would slide in from the right to cover the current screen. Screen transitions are covered in more detail in a later unit.

The **Navigate** function can also be used to pass parameters between screens using context variables. While this feature is beyond the scope of this module, it's useful to know that Navigate can transfer data as users move through the app.

## Back function

The second screen navigation function is `Back`. This function returns users to the previous screen. Unlike **Navigate**, which requires a target screen to be specified, **Back** relies on navigation history. If there's no prior screen—such as when opening an app directly to a specific screen—the **Back** function won't work.

The **Back** function also supports screen transitions. If a screen was reached using **Navigate** with a transition effect, using **Back** reverses that transition by default. Alternatively, you can explicitly define the transition for returning. More on that in the next unit.

## Hidden screens

You can include screens in your app without providing visible navigation to them. These hidden screens can serve purposes such as:

- **Documentation** – Include notes for yourself or other developers.
- **Template** – Store branded or styled controls to reuse across screens.

Hidden screens aren't accessible to users but remain visible in the design environment, making them a useful tool for app development and maintenance.

Now that you've explored navigation options in Power Apps, the next unit will cover the detailed syntax and parameters of the Navigate and Back functions.
