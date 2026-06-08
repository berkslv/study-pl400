# Plug-ins usage scenarios

Completed

- 5 minutes

It's best practice to approach customizing a model-driven Power App with the idea that writing code is a last-resort method for achieving desired business application functionality. Quality areas such as maintainability, upgradability, stability, and performance should factor in when determining the best approach for a given scenario. Considering these quality areas is one of the most important skills that any Power Apps developer can have.

## Business rules vs. plug-ins

Occasionally, business rules aren't able to achieve certain objectives, or maybe their complexity causes developers to prefer writing the logic in a plug-in. One scenario could be if you have a complex "if/then/else" situation that would be more easily achieved in a *switch* statement, or when you're dealing with dynamic values that aren't readily accessible with a business rule. Client scripting is also an option for this scenario.

## Workflows/flows vs. plug-ins/client script

Circumstances might occur when existing limitations require you to develop plug-ins to accomplish certain activities.

The following table can help you determine when it might be more appropriate to use a workflow versus a plug-in or client script.

| Circumstance | Workflow | Plug-in | Client Script |
| --- | --- | --- | --- |
| Synchronous | Either | Either | Synchronous |
| Access External Data | No | Yes | Yes (with limitations) |
| Maintenance | Business Users | Developers | Developers |
| Can Run As | User | Any licensed user or current user | User |
| Can Run On Demand | Yes | No | No |
| Can Nest Child Processes | Yes | Yes | No |
| Execution Stage | Before/After | Before/After | Before/After |
| Triggers | Create, Field Change, Status Change, Assign to Owner, On Demand | Create, Field Change, Status Change, Assign to Owner, Delete, along with many other specialized triggers | Field Change or Form Load |
