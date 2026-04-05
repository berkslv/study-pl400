# Dual-write vs. virtual tables

- 4 minutes

Microsoft Dataverse supports multiple methods to connect with external data sources. Dual-write and virtual tables enable Dataverse to interact with this external data and write changes back to the original data source.

## Dual-write

Dual-write is a built-in integration feature that provides near-real-time synchronization between customer engagement apps and finance and operations apps. By enabling data to flow seamlessly across applications, Dual-write supports unified experiences across departments.

Dual-write delivers tightly coupled, bidirectional integration between finance and operations apps and Dataverse. Changes made in finance and operations apps are automatically written to Dataverse, and vice versa. This bidirectional sync enables a consistent and integrated user experience across applications.

Additional capabilities include:

- Support for both online and offline scenarios
- Alignment with low-code/no-code development principles

## Virtual tables

Finance and operations apps are exposed in Dataverse as a virtual data source, allowing full create, read, update, and delete (CRUD) operations from within Dataverse and the Microsoft Power Platform. By design, virtual table data remains in the source application and isn't duplicated in Dataverse.

Key facts about virtual tables:

- All Open Data Protocol (OData) tables in finance and operations apps are available as virtual tables in Dataverse.
- Makers can use this external data to build customer engagement experiences without duplicating data.
- Full CRUD capabilities are supported directly on the source data.
- Power Pages can use virtual tables to power external-facing websites for collaboration scenarios.

## When to use Dual-write vs. virtual tables

Dual-write and virtual tables are part of the shared data layer that supports integration between finance and operations apps and Dataverse. These technologies are complementary and can be used together depending on your integration needs.

Use **Dual-write** when:

- You need near-real-time synchronization of data across Dataverse and finance and operations apps.
- Your scenario requires full offline capabilities.
- You want a tightly integrated and replicated dataset across environments.

Use **virtual tables** when:

- You want to access external data in real time without duplicating it in Dataverse.
- You're working with large datasets and want to minimize storage usage in Dataverse.
- Your use case involves read-heavy scenarios or light CRUD operations that don't require local data storage.

The decision between dual-write and virtual tables depends on the data ownership model, the need for replication, and offline requirements specific to your solution.
