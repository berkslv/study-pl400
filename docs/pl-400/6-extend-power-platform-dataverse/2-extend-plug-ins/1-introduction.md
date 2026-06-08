# Introduction

Completed

- 5 minutes

A plug-in is imperative logic, used only when a declarative process, such as a business rule, flow, or workflow, can't meet your requirements.

Fundamentally, a plug-in is merely a .NET assembly that implements an IPlugin interface, which can be found in the Microsoft.CrmSdk.CoreAssemblies NuGet package. The IPlugin interface exposes a single method, Execute, which is where you can place any custom logic that you want to invoke based on whatever event you're handling.

Common scenarios of when to use plug-ins are:

- Canceling the event and displaying an error to the user.
- Making changes to the data in the operation.
- Initiating other actions by using the Organization Service to add automation.

## Alternatives to plug-ins

Plug-ins should be considered a last resort in many cases. Although plug-ins are powerful and, if well written, highly performant, it's important to minimize the amount of custom/imperative logic that you place into your system, because it can affect maintainability, upgradability, and so on.

Common alternatives to plug-ins are:

- Workflows
- Power Automate flows
- Calculated and rollup fields
- Custom actions

## Plug-in considerations

Plug-ins perform better when you consider their performance, capabilities, and ability to run synchronously.

A well-written plug-in will always be the most efficient way to apply business logic to Microsoft Dataverse. However, a poorly written plug-in can create a significant negative impact on the performance of your environment.

Plug-ins provide several capabilities that aren't available with declarative business logic, such as efficiently working with external services in code. Nevertheless, Power Automate is rapidly approaching parity with plug-ins.

If synchronous logic is required for your application, plug-ins might be required. However, on-demand workflows can also run synchronously and should be considered, depending on your requirements.
