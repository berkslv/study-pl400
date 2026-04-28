# Write a Service Bus Event Listener that consumes Microsoft Dataverse messages

## Types of supported Service Bus contracts

Microsoft Dataverse supports various methods to consume Azure Messaging Service Bus queue messages: queue, one-way, two-way, or REST. If using two-way and REST, you're able to return a string of information back to Dataverse.

### Queue

An active queue listener isn't required to send an event to a queue. You can consume queued messages on your own timeline using a "destructive" or "non-destructive" read. A destructive read reads the message from the queue and removes it, whereas a non-destructive read doesn't remove the message from the queue. This method is useful for "send-and-forget" scenarios where it isn't critical that the message is received at a given point in time.

### Topic

Topic listeners are similar to queue listeners, except that one or more listeners can subscribe to receive messages for a given topic. This type is useful if you require multiple consumers for a given message.

### One-way

One-way contracts require an active event listener to consume a message you post to the Service Bus queue. If no active listener is available, the post fails. If the post fails, Dataverse retries posting the message in exponentially larger and larger time spans until the asynchronous system job is eventually canceled. In this case, the System Job status of this event is set to **Failed**.

### Two-way

Two-way contracts are similar to one-way contracts, except they also let you return a string value from the listener. If you've registered a custom Azure-aware plug-in to post your message, you can then consume this returned data within your plug-in. A common application of this scenario might be if you want to retrieve the ID of a row created in an external system as part of your listener's process to maintain it in your Dataverse environment.

### REST

REST contracts are similar to two-way contracts except that you publish it to a REST endpoint.

## Write a queue listener

In the previous exercise, you registered a Service Endpoint that publishes messages to a Service Bus Endpoint whenever account data is updated in your Dataverse environment. This exercise now describes how to consume those messages.

1. Create a C# Console Application in Visual Studio that targets .NET 4.6.2 or higher.
2. Add the following NuGet packages:
   - WindowsAzure.ServiceBus
   - Microsoft.CrmSdk.CoreAssemblies

3. In the application's Main method, paste the following code. Replace the Endpoint URL with your Azure Service Bus Namespace's Endpoint URL and the queue name if it differs:

   ```csharp
   string connectionString =@"[ENDPOINT URL]";
   string queueName = "mslearnsamplequeue";
   QueueClient queueClient = QueueClient.CreateFromConnectionString(connectionString, queueName, ReceiveMode.PeekLock);
   ```

4. To consume your message, use the **OnMessage** method, which lets you process a Service Bus queue message in an event-driven message pump.

   ```csharp
   queueClient.OnMessage(message =>
   {
     //get RemoteExecutionContext based on Message Format
     RemoteExecutionContext context = null;

     if (message.ContentType == "application/msbin1") //.NETBinary Message Format
     {
       context = message.GetBody<RemoteExecutionContext>();
     }
     else if (message.ContentType == "application/json") //JSON Message Format
     {
       context = message.GetBody<RemoteExecutionContext>(new DataContractJsonSerializer(typeof(RemoteExecutionContext)));
     }
     else if (message.ContentType == "application/xml") //XML Message Format
     {
       context = message.GetBody<RemoteExecutionContext>(new DataContractSerializer(typeof(RemoteExecutionContext)));
     }
     try
     {
       var target = context.InputParameters["Target"] as Entity;

       foreach (var field in target.Attributes)
       {
         Console.WriteLine($"Name: {field.Key} Value: { field.Value}");
       }
     }
     catch (Exception ex)
     {
       Console.WriteLine(ex.ToString());
     }
   });
   ```

5. Lastly add a `Console.ReadLine()` to the main method to allow for multiple messages to be processed. Note this isn't a scalable method for handling event-processing, but is sufficient for exercise purposes. You'd want to have a more scalable solution that you host in an Azure Durable function or other service of your preference.

   ```csharp
   Console.ReadLine();
   ```

6. Hit **F5** to run your application. If there are already messages in your queue from your previous exercise, they should get processed and their message contents should be displayed on the console screen. If not, you can invoke an update by making an update to an Account in your Dataverse environment.
