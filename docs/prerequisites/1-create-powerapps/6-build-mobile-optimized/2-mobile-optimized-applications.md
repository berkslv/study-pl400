# Learn about mobile-optimized apps

When you design and create a mobile-optimized canvas app using Microsoft Power Apps, consider the following key design elements.

A mobile-optimized canvas app should include:

- A clearly defined purpose
- Responsive design (Bring Your Own Device, or BYOD)
- A streamlined user interface
- Intuitive navigation
- Independence from external peripherals
- Offline capabilities
- Connectivity alerts
- Seamless setup
- Performance optimization

## Clearly defined purpose

A mobile-optimized app should serve a specific purpose. Minimizing the number of steps required to complete a task improves the user experience, especially in mobile scenarios.

Decide whether a single app should support multiple tasks—such as maintaining inventory in a warehouse—or focus on a specific function, such as creating new customers. Consider the following:

- Is it more effective to return to a home screen for different actions, or to exit and launch another app?
- Does having multiple apps improve task clarity and speed?
- Does one app attempt to handle too many actions, resulting in user confusion?

Each form within the app should have a single, clear function, expressed in a concise sentence. Avoid creating multi-purpose forms (for example, forms that combine customer creation and contact entry). Instead, separate tasks into individual forms.

## Responsive design

A mobile-optimized app should automatically adjust to the screen size and orientation of the device.

For instance, Microsoft Edge adapts its layout depending on whether the user accesses it via a desktop or mobile browser. It also adjusts when you turn your device 90 degrees.

## Streamlined user interface

Avoid placing too many fields or controls on a form.

While it's tempting to include all available fields, doing so leads to clutter and unnecessary scrolling. Instead, create concise forms for common tasks and separate forms for less frequent or advanced entries.

Minimize screen navigation, and place controls such as **Submit** buttons in easily accessible locations.

Design considerations:

- Excessive controls can lead to accidental selections.
- Add spacing around fields and buttons to account for user touch accuracy.

## Intuitive navigation

Users should be able to complete tasks without needing a manual. Organize workflows based on real usage patterns.

> There's no single correct approach to designing a user interface.

Use app analytics or usage data to determine task priority. For example:

- If sales order creation is the primary task, prioritize that navigation path.
- If users typically begin by searching for a customer, make that step prominent.

Include straightforward navigation back to the home screen. Avoid requiring users to complete multiple steps just to return to the main menu. If no further tasks are available, consider returning them to the home screen automatically.

## Independence from external peripherals

Mobile users typically don't have access to a keyboard or mouse.

Design the app as if you're holding the device yourself. For instance, determine whether on-screen keyboards impact usability when entering data.

## Offline capabilities

Users may need to use the app in locations without reliable connectivity. Ask the following:

- Will users need access to the app while offline?
- Are offline capabilities worth the added complexity?
- Are there actions—such as data retrieval or updates—that must happen on-site?

## Connectivity alerts

Because Microsoft Power Apps is a cloud-first platform, users expect consistent internet access.

Ensure that forms requiring connectivity verify availability before use. For example, if customer creation needs online access, prevent users from entering data when offline. Clearly communicate offline status using visual indicators such as banners.

## Seamless setup

Simple setup is essential for app adoption. Although Power Apps simplifies deployment, additional configuration may be necessary for connecting data sources or enabling user access.

If the user needs to enter values such as URLs or API keys, provide clear guidance on where to find them. Assume the user is opening the app for the first time and provide necessary context.

## Performance optimization

Mobile apps have limited multitasking capabilities. As a result, performance is more critical than in desktop scenarios.

To improve performance:

- Choose data sources thoughtfully and limit their complexity.
- Use efficient connectors.
- Retrieve only the records needed for each action.
- Remove unnecessary or redundant data calls.

**Planning your app's design before building it will help you create a better experience and reduce future rework.**
