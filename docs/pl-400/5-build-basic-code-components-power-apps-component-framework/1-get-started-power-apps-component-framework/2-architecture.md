# Power Apps component framework architecture

You can implement code components using HTML, CSS, and TypeScript. While you aren't required to use any particular UI Framework, [React](https://reactjs.org/) and [Fluent UI](https://developer.microsoft.com/fluentui#/) are popular choices.

## Component composition

A Power Apps component has three key areas:

- A **manifest** input file — identifies properties available for the hosting application.
- Its **implementation** — code implementing the `StandardControl` interface.
- Any other **resource files** the component might need.

A manifest is used to identify any properties that are available for use by the application hosting the component. When app makers use the code component, they can statically set a value for the properties or dynamically bind it to one of the available data columns in the application.

When you create a component, your code needs to implement an interface that provides a consistent way for the hosting app to interact with your component. Your code component accomplishes this by implementing the **StandardControl** interface:

```typescript
export class FirstControl implements ComponentFramework.StandardControl<IInputs, IOutputs> {}
```

## Power Apps component life cycle

When you develop a component, you implement all or some of the **StandardControl** interface methods depending on your component requirements. These methods allow the hosting runtime to manage the life cycle of the code component.

| Method | Description |
| --- | --- |
| **init** | Required. Use this method to initialize the component instance. Components can kick off remote server calls and other initialization actions. You can't initialize dataset values with this method; you must use the updateView method. |
| **updateView** | Required. This method is called when any value in the component's property bag has changed. If you started any load data requests in the init method that might not be finished, your code must handle this state and provide a visual loading indicator. |
| **getOutputs** | Optional. Called by the framework before the receipt of new data. Use this method when dynamically managing bound properties in a control. |
| **destroy** | Required. Invoked when the component is to be removed from the Document Object Model (DOM) tree. Use the destroy method to cleanup and release any memory the component uses. For example, if you're using React, use `ReactDOM.unmountComponentAtNode` inside the destroy method. |

### Life cycle flow

1. The framework calls your component's **init()** function.
2. If your component is interactive, you notify the host that the component's output has changed by calling **notifyOutputChanged**.
3. The framework runtime calls **getOutputs** to get values for all bound properties.
4. The runtime notifies the host, which validates the output.
   - If valid → calls **updateView** on your component.
   - If invalid (e.g., a business rule rejected the new output) → calls **updateView** with the old value and an error message.
