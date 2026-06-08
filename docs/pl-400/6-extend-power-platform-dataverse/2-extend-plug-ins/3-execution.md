# Plug-in execution context

Completed

- 5 minutes

Whenever a plug-in (or custom workflow extension) runs, Microsoft Dataverse provides a wealth of data about the context of the current operation. Both plug-ins and custom workflow assemblies have access to an IWorkflowContext class, which is accessible through differing methods.

In plug-ins, the *IPluginExecutionContext* is accessible through the *IServiceProvider* parameter of the *Execute* method by calling the *GetService* method.

```c
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

In custom workflow extensions, the *IPluginExecutionContext* is passed as a parameter of the *Execute* method of type *CodeActivityContext*.

```c
public class SampleWorkflowExtension : CodeActivity

{

protected override void Execute(CodeActivityContext context)

{

// Obtain the execution context from the code activity context.

IWorkflowContext workflowContext = context.GetExtension();

}

}
```

Both *IPluginExecutionContext* and *IWorkflowContext* implement the *IExecutionContext* interface. Each also exposes information that is specific to their type. For more information, see [Understand the execution context](/en-us/power-apps/developer/data-platform/understand-the-data-context?azure-portal=true).

## IExecutionContext properties

Two of the most notable properties of the *IExecutionContext* interface are *InputParameters* and *OutputParameters*. Other frequently used properties are *PreEntityImages*, *PostEntityImages*, and *SharedVariables*.

### InputParameters

InputParameters are contained in the execution context's InputParameters collection and are of type *Entity*. This property enables you to see what entity values were presented to the plug-in prior to the implementation of a given operation.

For example, if you want to validate your data and prevent it from being saved if validation isn't successful, the steps that you take would be similar to the following:

1. Register your plug-in to run on the Pre-Validation stage on Create and/or Update of the entity that you want to validate.
2. Validate data in your plug-in by reading the values from the InputParameters collection. On Create, you'll want to retrieve the Target collection.
3. Throw an InvalidPluginExecutionException if the provided data isn't valid.

Or, perhaps you want to update values on your entity (such as stripping special characters from a phone number) before the data is saved. You might handle this situation with the following steps:

1. Register your plug-in to run on the Pre-Operation stage on Create and/or Update of the entity that you want to update.
2. Update the data in your plug-in by editing the values from the InputParameters collection. On Create, you'll want to retrieve the Target collection.

### OutputParameters

Output parameters are contained in the execution context's OutputParameters collection and are of the type *Entity*. Output parameters are only provided after the given operation has occurred. As such, you'll only be able to use this collection when you're handling events in the PostOperation stage. 

For example, if you want to change the values that are returned by the operation, you can modify them by conducting the following steps:

1. Register your plug-in to run on the PostOperation stage on Create and/or Update of the entity that you want to update.
2. Update the data in your plug-in by editing the values from the OutputParameters collection. On Create, you'll want to retrieve the Target collection.

### PreEntityImages and PostEntityImages

When registering plug-ins to run against the event framework, you can provide an immutable copy, or snapshot, of the data. This is ideal, especially when you need to reference values of the data before or after an operation has occurred, for example, for logging or custom auditing purposes. 

While you can retrieve entity values by using the Organization Context from within a plug-in with a Retrieve request, using entity images to conduct this task is much more efficient and highly advised. 

### SharedVariables

Shared variables allow you to configure data that can be passed from a plug-in to a step that occurs later in the implementation pipeline. While we highly recommend that you configure plug-ins to be stateless and not have any dependencies on external events, there are sometimes exceptions to this rule. 

One exception might be when you want to ensure that you don't have any "runaway" plug-ins in your environment. That is, they're activating under an infinite-recursion scenario. You can also use the execution context to determine the depth in which your plug-in is currently running, but under certain situations, it might be appropriate to manually track. For example, perhaps your plug-in is mistakenly starting Update logic within a plug-in that is configured to run on Update of the entity, which in turn is causing it to run infinitely. To troubleshoot this, you could build a pattern to count the number of times that this plug-in is able to run. An example might be to configure a limit of five runs of a plug-in with the following steps: 

1. In the plug-in, check if the RunCount shared variable exists, and if it doesn't, create one that is initialized to zero.
2. Check if the RunCount variable's value is greater than five, and if it is, throw an InvalidPluginExecutionException.
3. At the end of your plug-in, increment the RunCount variable by 1.

Note

This is only an extra safeguard against a bug that accidentally causes your plug-ins to overrun your resources. You should make sure that you are building your plug-ins in such a way that this scenario won't ever occur. Dataverse also provides safeguards to prevent "runaway" plug-ins such as these, but their recovery methods are much more resource-intensive than this method and more difficult to diagnose.
