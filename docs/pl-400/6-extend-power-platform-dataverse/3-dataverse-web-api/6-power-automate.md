# Call Power Automate Actions from the Web API

Dataverse *actions* are reusable operations with observable side effects (e.g., creating or updating rows). They can be invoked through the Dataverse Web API.

- Pre-built actions exist in Dataverse; custom actions can be created using the **Custom API** feature.
- Actions encapsulate low-code automations accessible via Web API request/response.

## Run Actions with the Web API

When an action is created, the framework creates a corresponding Web API request message. Run it using a POST operation:

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

## Call Pre-built Dataverse Actions

Dataverse includes built-in actions for common operations. Some actions apply only to model-driven or Dynamics 365 apps (e.g., **CalculatePrice** for Dynamics 365 Sales).

See the [Web API Action Reference](https://learn.microsoft.com/en-us/dynamics365/customer-engagement/web-api/actions?view=dynamics-ce-odata-9) for available pre-built actions.

## Unbound vs. Bound Actions

| Type | Description | Analogy |
|------|-------------|---------|
| **Unbound** | Not tied to a specific table; generic logic | SQL stored procedure |
| **Bound** | Tied to a specific table row; requires row ID in URI | SQL trigger (but can also be called on demand) |

### Bound action example

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

This calls `contoso_AddNoteToContact` for a specific contact and passes `NoteTitle` and `NoteText` parameters to create a new note.

## More Details

See [Use Web API actions](https://learn.microsoft.com/en-us/power-apps/developer/common-data-service/webapi/use-web-api-actions/).
