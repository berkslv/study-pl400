# Plug-in execution context

Dataverse provides a wealth of context data whenever a plug-in (or custom workflow extension) runs via the `IWorkflowContext` class.

## Accessing IPluginExecutionContext

In plug-ins, `IPluginExecutionContext` is accessed through `IServiceProvider`:

```csharp
public class SamplePlugin : IPlugin
{
    public void Execute(IServiceProvider serviceProvider)
    {
        // Obtain the execution context from the service provider.
        IPluginExecutionContext context = (IPluginExecutionContext)
            serviceProvider.GetService(typeof(IPluginExecutionContext));
    }
}
```

In custom workflow extensions, it is accessed via `CodeActivityContext`:

```csharp
public class SampleWorkflowExtension : CodeActivity
{
    protected override void Execute(CodeActivityContext context)
    {
        // Obtain the execution context from the code activity context.
        IWorkflowContext workflowContext = context.GetExtension<IWorkflowContext>();
    }
}
```

Both `IPluginExecutionContext` and `IWorkflowContext` implement `IExecutionContext`.

## IExecutionContext properties

### InputParameters

- Contained in the `InputParameters` collection, of type `Entity`
- Shows entity values presented to the plug-in **prior** to the operation

**Use case — validate and cancel:**
1. Register plug-in on Pre-Validation stage on Create/Update
2. Read values from `InputParameters` (retrieve `Target` on Create)
3. Throw `InvalidPluginExecutionException` if validation fails

**Use case — modify before save:**
1. Register plug-in on Pre-Operation stage on Create/Update
2. Edit values in `InputParameters` (retrieve `Target` on Create)

### OutputParameters

- Contained in `OutputParameters`, of type `Entity`
- Only available in the **PostOperation** stage (after the operation)

**Use case — modify returned values:**
1. Register plug-in on PostOperation stage on Create/Update
2. Edit values in `OutputParameters` (retrieve `Target` on Create)

### PreEntityImages and PostEntityImages

- Immutable snapshots of data before/after the operation
- Ideal for logging or custom auditing
- More efficient than using a `Retrieve` request inside a plug-in

### SharedVariables

- Pass data from a plug-in to a later step in the pipeline
- Useful for preventing infinite-recursion (runaway) plug-ins

**Example pattern — limit run count to 5:**
1. Check if `RunCount` shared variable exists; if not, initialize to 0
2. If `RunCount > 5`, throw `InvalidPluginExecutionException`
3. Increment `RunCount` by 1 at end of plug-in

> **Note:** This is an extra safeguard. Build plug-ins to avoid this scenario in the first place. Dataverse also provides its own safeguards, but they are more resource-intensive.
