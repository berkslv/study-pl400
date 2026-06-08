# Determine when to configure or when to code

Completed

- 6 minutes

As a developer, you should approach apps on Microsoft Power Platform from the perspective that writing code for achieving desired business application functionality should be considered as an exception to no-code and low-code approaches. However, quality areas such as maintainability, upgradability, stability, and performance should also be considered when you're determining what is the best approach for a given scenario.

Learning what Microsoft Power Platform can do out of the box is important because you don't want to build something that they already do and just needs to be configured. That also applies to the functionality implemented in the available Dynamics 365 apps. For example, invoice calculations using variable multi-currency price lists are complex, but they're well implemented, and time-tested in Dynamics 365 Sales. If this functionality is required, you should consider using Dynamics 365 Sales built-in capabilities instead of implementing your own calculation engine.

You should also recognize that Microsoft Power Platform often implements something in a particular way that benefits the platform. This may be different if you're used to doing it in custom application code. It isn't uncommon for developers that are new to building Microsoft Power Platform solutions to try to customize the platform the way they used to build custom apps previously. This should be avoided when possible and you should try to take advantage of what the platform does well, rather than try to change it to what you are used to doing. For example, in the past you may have implemented column-level security using custom code. This is, however, not required in Dataverse where column-level security is an out-of-the-box feature and simply needs to be configured.

## Business rules vs. client script

The advantage of business rules is that they're easy to understand and implement for a nondeveloper, and they can be included as part of a Dataverse solution for deployment in production. In the organizations where developer skills aren't easily available and application lifecycle management isn't implemented, business rules would be a preferred way to implement logic even if some workarounds are required, for example, intermediate calculated fields holding the values to check in a rule.

However, at some point, business rules aren't capable of implementing the business requirements, or maybe the complexity that the rules cause developers to prefer writing the logic in client script. One scenario might be if you have a complex nested "if/then/else" logic that would be better achieved in a *switch* statement or simple sequence of *if* blocks. The other one is when you're dealing with dynamic values that aren't readily accessible by a business rule. For example, form notifications and filtering out choice values aren't available through business rules.

## Workflows/Power Automate flows vs. plugins

Dataverse offers various methods to implement logic to respond to events in the system, in particular to the data changes such as create, update, delete of the data rows. Business requirements can be satisfied by no-code solutions using workflow and Power Automate and by extending Dataverse using either server-side (plugins) or client-side (script) code.

You can evaluate the options using an approach similar to the one used in the business rules vs. client script discussion: evaluate business requirements and organization capabilities to implement them. There are also some fundamental differences in capabilities. The following table can help you determine when it might be better to use one or another approach.

| Capability | Power Automate Flow | Workflow | Plugin |
| --- | --- | --- | --- |
| Synchronous or Asynchronous | Asynchronous | Either (Power Automate flows are recommended instead of asynchronous workflows) | Either |
| Access External Data | Yes, using connectors | No | Yes, using APIs, some security restrictions |
| Maintenance | Makers | Business Users | Developers |
| Can Run As | Current user or flow owner | Current user or workflow owner | Any licensed user, system, or current user |
| Can Run On Demand | Yes | Yes | No |
| Can Nest Child Processes | Yes | Yes | Yes |
| Execution Stage | After | Before/After | Before/After |
| Triggers | Create, Column Change, Delete, On Demand, Scheduled | Create, Column Change, Delete, On Demand | Create, Column Change, Delete, other messages including custom |

Microsoft Power Platform continuously evolves and as a developer you should be aware of new and upcoming features. For example, if your solution required custom settings or configuration values, previously you would have had to use custom tables to store these values and then use custom code or platform tools to deploy the data. The new addition of environment variables simplified this task and reduced it to declaring your variables, including them as part of the solutions, and setting the values, all without any code.

## Power Apps Component Framework (PCF)

For many years, HTML web resources used to be a go-to extensibility mechanism for the client-side in model-driven apps. One of the weaknesses of this approach was low reuse of these monolithic and nonextensible elements. Now HTML web resources have been replaced by PCF controls.

PCF allows developers to create reusable components that can be used by makers instead of the standard controls. This is a good example of when advances in the platform capabilities allow business to focus their development efforts on creating solid infrastructure and enabling app makers.

## External systems

Communications with external systems are a common feature of the solution implementations. From simple tasks like sending an SMS message or updating currency exchange rates, to complex data synchronization scenarios, it used to be an exclusive developer domain. Implementations were using plugins, event publishing via service endpoints, and webhooks.

However, with the adoption of Power Automate with its hundreds of connectors, the interactions with external systems can now be implemented by app makers without using any code.

It doesn't mean, however, that the developer's role is redundant. There are plenty of complex or high-performance scenarios where code is required. In addition, developers can now concentrate their efforts on creating services and custom connectors while delegating the wiring of the building blocks to the makers.

## Portals vs. custom sites

Power Pages provide numerous functionalities out of the box and enable makers to create robust web sites and extend them as needed. Developers often assist with more challenging portal tasks like sophisticated page layouts (using liquid templating language) or extending front-end site functionality using JavaScript.

For highly specialized scenarios, you can decide to create a complete custom portal using ASP.NET or similar technologies. This approach isn't uncommon but requires highly skilled developers to implement. Again, the decision is often a compromise between a no-code implementation of standard, but generalized functionality and controlled use of developer's resources to deliver specialized features.

Deciding on when to use code isn't a simple binary decision. You need to take into consideration many factors: what skills and resources do you have available, how mature is your organization when it comes to the application lifecycle management, how complex are the requirements, etc. Often the requirements need to be evaluated on a case-by-case basis because small compromise in the business constraints may simplify the solution and reduce it from a complex development project to a simple configuration exercise.

Solid, up to date, knowledge, and understanding of the platform capabilities is essential for every developer to be able to make rational, common sense decisions when to use code vs. when to adapt the system so that it can be customized and configured by makers and business users.
