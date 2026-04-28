# Use policies for data conversion

Policy templates can be used to convert data from one structure to another. This process is commonly done to simplify the maker's task of using a custom connector to provide data to the actions or to work with the response data from the action results. For example, the API might provide a comma-separated list of users who have access to the record. Converting that list to an array would make it easier to use the list in an app or flow.

The following policy templates currently support converting data structures:

- Convert an array to an object
- Convert an object to an array
- Convert delimited string into an array of objects

Each policy can be run against the request (input data) or the response (output data) from one or more actions. When you run a policy on the request, you're shaping the data that is provided by the maker to determine how the API wants to see it. For example, the Microsoft Planner connector uses the **Convert array to object** on its **Update task details** action. This action allows the user to provide an array of external reference links and then associate them with the task.

## Convert array to object

To convert what is provided by the flow action to what is expected by the API, the connector can be configured with multiple policy templates to transform the data. For example:

- **Set Property** - To set the `previewPriority` field to `"!"`
- **Set Property** - To set the `@odata.type` expression
- **Convert array to object** - To reshape the array and include type and alias as properties

## Convert delimited string into an array

A string with multiple values is more difficult for apps and flows to work with than an array. To improve usability, you can use the **Convert delimited string** policy template on the response. This would result in a new array property being added to the response.

## Key configuration details

The **Run policy on** parameter decides if the policy applies to the request or response. If you need both, you'll need to configure two policy templates.

Each convert policy template has a **target object or collection** parameter, which gives the starting point for where the policy logic will get the data to transform. The most common starting point is using the `@body()` expression, which points to the body of the request or response.

For example, if the response was an object with a property named **invoices** that was an array of invoice objects, each having a **tags** property, you would target `@body().invoices` as the collection.

### Important notes

- Apply policies only to actions with request/response data that matches the configurations.
- The **Get Invoice** action (returns a single invoice) needs different policy templates than **List Invoice** (returns an array).
- After configuring response policy templates, reimport the sample data on the action response so apps and flows have visibility to the transformed data.
- If a policy causes an error, you'll typically see an HTTP status 500. You can remove an action from the operations list to isolate whether the policy is the cause.

Convert policy templates offer a configuration-focused approach to transforming data to and from your underlying API and can make your connector actions easier to use.
