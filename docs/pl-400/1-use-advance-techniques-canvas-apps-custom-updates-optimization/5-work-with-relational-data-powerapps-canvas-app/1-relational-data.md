# What is relational data?

Completed

- 6 minutes

Relating data is an essential concept when you're diving into the realm of complex app building with Power Apps. It's all about establishing connections between different data sources to enhance functionality and data organization.

Consider a travel expense app, you might want one primary record for the entire trip and then other records detailing individual expenses like food and lodging. By relating these records, you establish a connection or link between them. This connection allows for a structured relationship, enabling you to associate various expenses with a specific trip record, maintaining a coherent and organized dataset.

The following table is an example of storing all of the expense data in one Microsoft Dataverse table.

| ID | Destination | Date | Trip reason | Expense type | Expense amount |
| --- | --- | --- | --- | --- | --- |
| 1 | Seattle | 4/10/2020 | Customer Visit | Hotel | 205.75 |
| 2 | Seattle | 4/10/2020 | Customer Visit | Dinner | 31.33 |
| 3 | Seattle | 4/10/2020 | Customer Visit | Flight | 450.54 |
| 4 | Cincinnati | 5/2/2020 | Training | Cab | 23.99 |
| 5 | Cincinnati | 5/2/2020 | Training | Lunch | 12.44 |

The example above shows that there's redundant data because each row has all of the information for the entire trip. A better way to store this data would be with parent and child tables, and then create a relationship between the two entities. The next example shows what the two tables would look like.

First, the parent table with only one entry per trip.

| ID | Destination | Date | Trip reason |
| --- | --- | --- | --- |
| 1 | Seattle | 4/10/2020 | Customer Visit |
| 2 | Cincinnati | 5/2/2020 | Training |

Then, the child table that has one entry per expense item with a reference to the parent record.

| ID | Expense type | Expense amount | TripID |
| --- | --- | --- | --- |
| 1 | Hotel | 205.75 | 1 |
| 2 | Dinner | 31.33 | 1 |
| 3 | Flight | 450.54 | 1 |
| 4 | Cab | 23.99 | 2 |
| 5 | Lunch | 12.44 | 2 |

Here you see one entry for each expense. There's also a new column for TripID. This column creates the relationship by specifying the record ID of the parent record. This allows you to query the details of the associated trip.

Power Apps offers the flexibility to establish relationships between data from distinct sources. For instance, you might store customer information within a CRM system like Dynamics 365 and then utilize that data within a Microsoft Lists setup for managing sales regions.

In Power Apps, referencing the customer ID from Dynamics 365 in your sales region list follows a uniform approach. The beauty lies in the seamless integration and handling of these diverse data sources within a single app. The capability to connect and work with multiple data sources without any fuss is one of the many advantages of Power Apps. It simplifies the process, allowing you to use information from different sources cohesively within your app environment.

Note

Dataverse can define relationships using Lookup columns, creating the structure and connecting the tables for you. This is outside the scope of this primer on relationships but worth noting as you consider data sources.

In the next section, you'll learn the functions and formulas for using relationships in Power Apps.
