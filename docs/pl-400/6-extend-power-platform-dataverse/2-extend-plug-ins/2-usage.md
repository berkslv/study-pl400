# Plug-ins usage scenarios

Writing code is a last-resort method for achieving desired business application functionality. Quality areas — maintainability, upgradability, stability, and performance — should factor into the approach decision.

## Business rules vs. plug-ins

Business rules may not achieve certain objectives or their complexity may make a plug-in preferable — e.g., complex if/then/else logic better expressed as a `switch` statement, or dynamic values not accessible via business rules. Client scripting is also an option.

## Workflows/flows vs. plug-ins/client script

| Circumstance | Workflow | Plug-in | Client Script |
|---|---|---|---|
| Synchronous | Either | Either | Synchronous |
| Access External Data | No | Yes | Yes (with limitations) |
| Maintenance | Business Users | Developers | Developers |
| Can Run As | User | Any licensed user or current user | User |
| Can Run On Demand | Yes | No | No |
| Can Nest Child Processes | Yes | Yes | No |
| Execution Stage | Before/After | Before/After | Before/After |
| Triggers | Create, Field Change, Status Change, Assign to Owner, On Demand | Create, Field Change, Status Change, Assign to Owner, Delete, + many specialized triggers | Field Change or Form Load |
