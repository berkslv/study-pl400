# Dataverse Extensibility

- 5 minutes

In this topic, we explore the extensibility points of Dataverse available to developers. The architecture of Dataverse puts in place a message-driven architecture for processing of requests. Each request message is processed through an event pipeline that has extension points for running custom business logic implemented by plugins.

A key concept is that regardless of how data is accessed it's always processed as a message through the event pipeline, and any custom business logic is executed. There's no way to modify Dataverse data directly that would bypass running system or registered custom logic.

## Using the Dataverse API

Dataverse provides two styles of APIs that developers can use to interact with data: Web API and Organization Service.

### Dataverse Web API

The Web API is available at an OData v4 RESTful endpoint. Use this for any programming language that supports HTTP requests and authentication using OAuth 2.0.

### Dataverse Organization Service

The Organization Service is a .NET SDK with .NET assemblies provided by Microsoft along with typed class generators for table classes.

When using the Organization Service from a Dataverse plugin, the service is instantiated and available to the plugin code without the need to authenticate. The following is an example from a simple plugin that gets an instance and uses it to create an account table row:

```csharp
public void Execute(IServiceProvider serviceProvider)
{
    IPluginExecutionContext pluginContext = serviceProvider.Get<IPluginExecutionContext>();
    IOrganizationServiceFactory factory = serviceProvider.Get<IOrganizationServiceFactory>();
    IOrganizationService orgService = serviceProvider.GetOrganizationService(pluginContext.UserId);

    Entity newAccount = new Entity("account");                  
    newAccount["name"] = "Fourth Coffee";
    Guid accountid = orgService.Create(newAccount);
}
```

You can also use the Organization service outside of plugins, for example from an ASP.NET custom portal, an Azure Function, or a console application. The `ServiceClient` class implements the `IOrganizationService` interface and supports .NET full framework 4.6.2, 4.7.2, 4.8 and .NET Core 3.0, 3.1, 5.0, 6.0.

```csharp
ServiceClient serviceClient =
    new ServiceClient("Url=https://yourenv.crm.dynamics.com;AuthType=OAuth;AppId=;RedirectUri=http://localhost;LoginPrompt=Always");

Entity newAccount = new Entity("account");                  
newAccount["name"] = "Fourth Coffee";
Guid accountid = serviceClient.Create(newAccount);
```

The APIs support their own approaches to building data queries in addition to supporting FetchXML — a proprietary query language used in Dataverse that allows complex queries to be crafted across related tables.

## Event Pipeline

When you perform an action like create a record in an app or via the API, a Create message is processed by Dataverse through the event pipeline. Each stage except for the main operation can have a plugin attached to it to run custom logic.

**Pipeline stages (top to bottom):**

1. Pre-Validation
2. Pre-Operation
3. Main Operation
4. Post-Operation

Having a strong understanding of how messages are processed can help you understand behaviors, and how and where best to implement custom logic.

## Building Plugins

Plugins are .NET classes that implement the `IPlugin` interface provided by the Dataverse SDK assemblies. That interface requires you implement only one method named `Execute`:

```csharp
public sealed class MyFirstPlugin : IPlugin
{
    public void Execute(IServiceProvider serviceProvider)
    {
        //Business Logic 
    }
}
```

The `Execute` method has one parameter of type `IServiceProvider`. Available services include:

- **IPluginExecutionContext** - Gives access to the message being processed and information about the requestor.
- **ITracingService** - Gives access to write to the Tracelog for diagnostic purposes.
- **IOrganizationServiceFactory** - Gives access to retrieve an `OrganizationService` for use in accessing data from the plugin.

The following is an example of using `GetService` to get the execution context:

```csharp
IPluginExecutionContext context = (IPluginExecutionContext)
    serviceProvider.GetService(typeof(IPluginExecutionContext));
```

Use `context.InputParameters` to access the originating message, and `context.OutputParameters` to access what is being returned to the caller.

To have a plugin execute, it must be registered to run for a specific message using the Plugin Registration tool.

## Custom APIs

Operations in Dataverse are defined as messages. Custom APIs offer a code-first way to define new messages that extend Dataverse web services. These messages can then be invoked just like system messages, but to execute custom business logic.

For example, instead of having each API caller implement a predefined sequence of calls to find a customer, you could implement a `findcustomer` custom API. The API would implement the required logic and return consistent results — and if any changes are required, they need to be implemented in only one place.

To define a new custom API:
1. Create a custom API record (through maker portal, through code, or using Dataverse solutions).
2. Identify the custom API name, and the request and response parameters.
3. Create a plugin and register it on the **Main Operation** stage of the pipeline.

> Custom API implementation is the only scenario where a plugin can be registered on the Main Operation stage.

Once implemented, you can use the custom message from the Dataverse APIs, Power Apps and Power Automate:

```csharp
var req = new OrganizationRequest("fabrikam_findcustomer")
{
    ["CustomerName"] = "Contoso",
    ["CustomerAddress"] = "1 Redmond Way"
};

var resp = serviceClient.Execute(req);
```

Custom APIs can also be used to trigger other automation — for example, creating a Custom API that contains data about an event that occurred in another system, allowing Power Automate, Azure integrations, or asynchronous plugins to initiate further automations.
