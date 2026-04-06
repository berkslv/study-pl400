# Microsoft Dataverse for apps makes relationships even easier

- 10 minutes

In the previous unit, you gained insights into using functions to establish connections between related tables. This capability enables you to construct apps that effectively utilize relational data.

## Relationships in Microsoft Dataverse

With Microsoft Dataverse, relationships are defined at the **table level**, laying a structured foundation for your data connections. Once a relationship is established in Dataverse, Power Apps provides a convenient **dot (.) notation** that allows you to navigate into related data directly.

### Benefits of Dataverse relationships

- **Dot notation**: Access related data without writing numerous `LookUp` functions.
- **Reduced complexity**: Streamlines app logic when working with related records.
- **Structured foundation**: Relationships are enforced at the data layer, not just the app layer.

For example, instead of:

```powerapps
LookUp(CustomerTable, ID = ThisItem.CustomerID, CustomerName)
```

With a Dataverse relationship configured, you can use dot notation to traverse to the related record directly within a Gallery or form.

## Configuring a relationship in Dataverse

Relationships are configured in the **Data** section of Power Apps Studio or in the Dataverse maker portal. Once configured, the relationship is available to all apps connecting to those tables.

> **Key takeaway:** Dataverse relationships remove the manual overhead of `LookUp` calls by automatically surfacing related data through dot notation, making apps simpler, more efficient, and easier to maintain.
