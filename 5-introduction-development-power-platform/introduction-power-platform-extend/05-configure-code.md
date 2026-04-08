# Determine When to Configure or When to Code

- 6 minutes

As a developer, you should approach apps on Microsoft Power Platform from the perspective that writing code for achieving desired business application functionality should be considered as an exception to no-code and low-code approaches. However, quality areas such as maintainability, upgradability, stability, and performance should also be considered when determining the best approach for a given scenario.

Learning what Microsoft Power Platform can do out of the box is important because you don't want to build something that the platform already does and just needs to be configured. For example, invoice calculations using variable multi-currency price lists are complex but well implemented and time-tested in Dynamics 365 Sales — you should consider using those built-in capabilities instead of implementing your own calculation engine.

You should also recognize that Microsoft Power Platform often implements something in a particular way that benefits the platform. It isn't uncommon for developers new to Power Platform to try to customize the platform the way they used to build custom apps. This should be avoided when possible — try to take advantage of what the platform does well, rather than trying to change it. For example, column-level security in Dataverse is an out-of-the-box feature that simply needs to be configured.

## Business Rules vs. Client Script

The advantage of business rules is that they're easy to understand and implement for a nondeveloper, and they can be included as part of a Dataverse solution for deployment in production.

However, at some point, business rules aren't capable of implementing the business requirements, or the complexity may cause developers to prefer writing the logic in client script. Scenarios where client script may be preferred include:

- Complex nested `if/then/else` logic better achieved with a `switch` statement or simple `if` blocks.
- Dynamic values not readily accessible by a business rule (e.g., form notifications and filtering choice values).

## Workflows / Power Automate Flows vs. Plugins

Dataverse offers various methods to implement logic to respond to events such as create, update, and delete of data rows. The following table can help you determine when to use one approach over another:

| Capability | Power Automate Flow | Workflow | Plugin |
|---|---|---|---|
| Synchronous or Asynchronous | Asynchronous | Either | Either |
| Access External Data | Yes, using connectors | No | Yes, using APIs (some security restrictions) |
| Maintenance | Makers | Business Users | Developers |
| Can Run As | Current user or flow owner | Current user or workflow owner | Any licensed user, system, or current user |
| Can Run On Demand | Yes | Yes | No |
| Can Nest Child Processes | Yes | Yes | Yes |
| Execution Stage | After | Before/After | Before/After |
| Triggers | Create, Column Change, Delete, On Demand, Scheduled | Create, Column Change, Delete, On Demand | Create, Column Change, Delete, other messages including custom |

## Power Apps Component Framework (PCF)

HTML web resources used to be a go-to extensibility mechanism for the client-side in model-driven apps. One of the weaknesses of this approach was low reuse of these monolithic and nonextensible elements. PCF controls have replaced HTML web resources.

PCF allows developers to create reusable components that can be used by makers instead of the standard controls — a good example of when platform advances allow businesses to focus development efforts on creating solid infrastructure and enabling app makers.

## External Systems

Communications with external systems are a common feature of solution implementations. With the adoption of Power Automate with its hundreds of connectors, interactions with external systems can now be implemented by app makers without any code.

However, there are still complex or high-performance scenarios where code is required. Developers can now concentrate their efforts on creating services and custom connectors while delegating the wiring of the building blocks to the makers.

## Portals vs. Custom Sites

Power Pages provide numerous functionalities out of the box and enable makers to create robust web sites. Developers often assist with more challenging portal tasks like sophisticated page layouts (using liquid templating language) or extending front-end site functionality using JavaScript.

For highly specialized scenarios, you can decide to create a complete custom portal using ASP.NET or similar technologies. This approach requires highly skilled developers to implement. The decision is often a compromise between a no-code implementation of standard functionality and the controlled use of developer resources to deliver specialized features.

## Summary

Deciding when to use code isn't a simple binary decision. You need to consider many factors:

- What skills and resources are available?
- How mature is your organization when it comes to application lifecycle management?
- How complex are the requirements?

Requirements often need to be evaluated on a case-by-case basis because small compromises in business constraints may simplify a solution from a complex development project to a simple configuration exercise.

Solid, up-to-date knowledge and understanding of the platform capabilities is essential for every developer to make rational, common-sense decisions when to use code vs. when to adapt the system so it can be customized and configured by makers and business users.
