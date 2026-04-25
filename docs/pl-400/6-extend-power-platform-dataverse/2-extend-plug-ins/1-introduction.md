# Introduction

A plug-in is imperative logic, used only when a declarative process, such as a business rule, flow, or workflow, can't meet your requirements.

Fundamentally, a plug-in is a .NET assembly that implements an `IPlugin` interface, found in the `Microsoft.CrmSdk.CoreAssemblies` NuGet package. The `IPlugin` interface exposes a single method, `Execute`, where custom logic is placed based on the event being handled.

## Common scenarios for plug-ins

- Canceling the event and displaying an error to the user
- Making changes to the data in the operation
- Initiating other actions by using the Organization Service to add automation

## Alternatives to plug-ins

Plug-ins should be considered a last resort. Common alternatives:

- Workflows
- Power Automate flows
- Calculated and rollup fields
- Custom actions

## Plug-in considerations

- A well-written plug-in is the most efficient way to apply business logic to Dataverse; a poorly written one can significantly hurt performance
- Plug-ins provide capabilities not available with declarative logic (e.g., working with external services), but Power Automate is approaching parity
- If synchronous logic is required, plug-ins may be needed — but on-demand workflows can also run synchronously
