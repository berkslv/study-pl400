# Table relationships

- 6 minutes

When working with Microsoft Dataverse, organize information by storing different sets of data in separate tables to support data normalization. Table relationships define how table rows can be associated with rows from other tables.

A relationship between two tables references the primary key using a lookup column.

## Relationship types

Table relationships define how table rows are associated with rows from other tables—or even the same table. There are two types of table relationships:

- **One-to-many relationships**: In a one-to-many table relationship (1:N), many referencing (related) table rows can be associated with a single referenced (primary) table row. The referenced row is often called the *parent*, while rows in the referencing table are the *children*. A many-to-one relationship is the same structure viewed from the child table.
- **Many-to-many relationships**: In a many-to-many (N:N) relationship, many table rows can be associated with many other rows. These rows are considered peers, and the relationship is reciprocal.

### Many-to-one vs. One-to-many

The many-to-one (N:1) relationship isn't fundamentally different from one-to-many. It represents the same relationship viewed from the opposite table. For example, if Table A has a one-to-many relationship with Table B, you'll see:

- a *one-to-many* relationship listed under Table A in the Power Apps maker portal.
- a *many-to-one* relationship listed under Table B.

This is a matter of interface perspective, not a separate relationship type.

### Lookup columns

A common way to create a table relationship is by adding a column with the **Lookup** data type. This automatically creates a many-to-one relationship.

Whether the relationship is defined as one-to-many, many-to-one, or through a lookup column, the underlying structure is the same.

### Create table relationships manually

In the **Tables** screen, the *Schema* pane includes a **Relationships** link. Selecting this link opens a view that displays all relationships for the table. At the top of this view, you can select **New relationship** from the command bar to manually define a new relationship.

When creating a relationship, you choose the type. For example, a one-to-many relationship can be created with a table called **Veterinarian**. Creating this relationship also adds a **Lookup** column in the related table.

### Many-to-many relationships

Many-to-many relationships allow data rows to act as peers, without parent-child hierarchy.

> **Note**: Many-to-many relationships aren't directly supported by relational databases. Dataverse uses a hidden *intersect* table to manage these relationships. This intersect table isn't user-editable and doesn't support custom forms or columns.

To manually create a many-to-many relationship, you choose the two related tables. For example, if you have a table of **Pet Groomers** and a table of **Pets**, each pet can have multiple groomers, and each groomer can have multiple pets.

Although this relationship is defined in Dataverse, there's no visible intersect table. However, you can display related records in a form using a subgrid.
