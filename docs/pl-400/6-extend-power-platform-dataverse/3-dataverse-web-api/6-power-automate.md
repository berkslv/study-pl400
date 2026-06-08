# Call Power Automate actions from the Web API

Completed

- 10 minutes

Dataverse contains a feature that allows power users to create their own custom sets of business logic called actions. From a developer perspective, consider an *action* a "reusable operation, which may have observable side effects." These side effects include creating or updating rows.

Dataverse has several pre-built actions, and developers can create custom actions using the **Custom API** feature of Dataverse.

A feature of actions is your ability to invoke them through the Dataverse Web API. As a result, you can encapsulate your low-code automations so that you can use them in nearly any scenario by interacting with them through their associated Web API request and response.

While this lesson doesn't cover how to create actions in detail, we assume you already have a basic understanding of building them. You can review their documentation if you need more information on creating an action. See the [Create Custom APIs](/en-us/power-apps/developer/data-platform/custom-api/?azure-portal=true) section for detailed information on how to build Dataverse actions.

## Run actions with the Web API

When a new action is created in your Dataverse environment, the framework also creates a corresponding Web API request message. You can run these requests by using a POST operation similar to the following example:

```odata
POST [Organization URI]/api/data/v9.2/WinOpportunity HTTP/1.1
Accept: application/json
Content-Type: application/json; charset=utf-8
OData-MaxVersion: 4.0
OData-Version: 4.0

{
 "Status": 3,
 "OpportunityClose": {
  "subject": "Won Opportunity",
  "opportunityid@odata.bind": "[Organization URI]/api/data/v9.2/opportunities(b3828ac8-917a-e511-80d2-00155d2a68d2)"
 }
}
```

The above example is an HTTP request call to the **WinOpportunity** action for an opportunity with an `opportunityid` value of **b3828ac8-917a-e511-80d2-00155d2a68d2**.

## Call pre-built Dataverse actions

Dataverse comes with a set of existing actions that you can use to perform common operations. Some of these actions might only apply to model-driven or Dynamics 365 apps. For example, the **CalculatePrice** action calculates the price in an opportunity/quote/order/invoice, so it would only apply to a Dynamics 365 Sales app where that functionality exists.

For more information about which pre-built actions are available for use through the Web API, see the [Web API Action Reference](/en-us/dynamics365/customer-engagement/web-api/actions?view=dynamics-ce-odata-9/?azure-portal=true&amp;preserve-view=true).

## Unbound vs. bound actions

An action can be built as unbound, meaning it doesn't have a Dataverse table correlated to it. Or it can be built as bound, meaning the logic is tied to a specific table row. SQL developers could consider these actions as similar to stored procedures (unbound actions) versus triggers (bound actions). However, unlike SQL triggers, you can also run bound actions on demand by providing a corresponding table row ID as its parameter.

Unbound actions are beneficial for generic logic that runs outside the context of a specific table row, such as the WinOpportunity action that was referenced earlier. To run a bound action against a specific row, you must provide the ID of that row in the URI of your request:

```odata
POST [Organization URI]/api/data/v9.2/contacts(94d8c461-a27a-e511-80d2-00155d2a68d2)/Microsoft.Dynamics.CRM.contoso_AddNoteToContact HTTP/1.1
Accept: application/json
Content-Type: application/json; charset=utf-8
OData-MaxVersion: 4.0
OData-Version: 4.0

{
 "NoteTitle": "New Note Title",
 "NoteText": "This is the text of the note"
}
```

The preceding example calls a custom action that was previously built in the solution called `contoso_AddNoteToContact` for a contact with the ID of **94d8c461-a27a-e511-80d2-00155d2a68d2** and then passes the parameters NoteTitle and NoteText to the action. The expected behavior for this procedure would be that a new note would be added to the corresponding contact with the title and text provided.

## More details

For more information on how to call actions in code, see [Use Web API actions](/en-us/power-apps/developer/common-data-service/webapi/use-web-api-actions/?azure-portal=true).
