# Summary: Working with Relational Data in Power Apps Canvas Apps

> **Source files:** 1-relational-data.md, 2-work-with-relationships.md, 3-exercise.md, 4-cds-for-apps.md

---

## Relational Data Concepts

- **Relational data** connects records across tables to avoid redundancy and maintain organized datasets.
- **Single-table (flat) storage** is redundant: trip-level data repeats on every expense row.
- **Parent/child table design** eliminates redundancy:
  - **Parent table** — one record per logical entity (e.g., one row per trip).
  - **Child table** — one record per detail item, with a foreign key column referencing the parent's ID.
- The **foreign key column** (e.g., `TripID`, `CustomerID`) creates the relationship by storing the parent record's ID.
- Power Apps supports relationships between **different data sources** (e.g., Dynamics 365 CRM + Microsoft Lists); reference by the shared ID field using the same approach as same-source relationships.
- **Dataverse Lookup columns** define relationships at the table level and connect tables automatically (enforced at the data layer).

---

## Filter and LookUp Functions for Relational Data

### Filter — Show child records for a selected parent

Set Gallery2's **Items** property to:

```powerapps
Filter(InvoiceTable, CustomerID = Gallery1.Selected.ID)
```

| Argument | Value | Notes |
|---|---|---|
| source | `InvoiceTable` | Child table |
| logical_test | `CustomerID = Gallery1.Selected.ID` | `CustomerID` from child; ID from selected parent gallery row |

- Gallery2 shows only the invoices belonging to the customer selected in Gallery1.

### LookUp — Resolve a foreign key to a human-readable value

Set a label's **Text** property to:

```powerapps
LookUp(CustomerTable, ID = ThisItem.CustomerID, CustomerName)
```

| Argument | Value | Notes |
|---|---|---|
| source | `CustomerTable` | Parent table |
| logical_test | `ID = ThisItem.CustomerID` | Matches the parent record |
| result | `CustomerName` | Column value to return |

- Replaces a numeric foreign key ID with the corresponding name from the parent table.

### Performance Warning — LookUp inside a Gallery

- `LookUp` inside a Gallery fires **one data source query per visible record**.
- Hundreds of records → hundreds of network calls → degraded performance.
- **Mitigation:** Load all parent records into an in-memory **collection** once, then run `LookUp` against the collection instead of the live data source.

---

## Gallery Setup for Parent-Child Display

### Display parent records (Gallery1)

1. Insert a **Gallery** control.
2. Set **Items** to the parent table (e.g., `CustomerTable`).

### Display child records filtered by selected parent (Gallery2)

1. Insert a second **Gallery** control.
2. Set **Items** to `Filter(ChildTable, ForeignKeyColumn = Gallery1.Selected.ID)`.

### Display child records with resolved parent values (Gallery3)

1. Insert a **Gallery** control.
2. Set **Items** to the child table.
3. Set **Layout** to *Title, Subtitle, and body*.
4. Set **Title** to `Text(ThisItem.InvoiceDate, DateTimeFormat.ShortDate)`.
5. Set **Subtitle** to child amount column.
6. Set **Body** label **Text** to `LookUp(ParentTable, ID = ThisItem.ForeignKeyColumn, DesiredColumn)`.

---

## Exercise: Shopping Cart with Collections

### Data model (all in-memory collections)

- **Products** — reference table (ID, Name, Category)
- **ReceiptHeader** — parent table (ID, Name, Date); one record per checkout
- **ReceiptLineItems** — child table (ID, ProductID, ReceiptHeaderID); one record per cart item
- `ReceiptLineItems.ReceiptHeaderID` → `ReceiptHeader.ID` (one-to-many)
- `ReceiptLineItems.ProductID` → `Products.ID` (one-to-many)

> **Note:** Collections only store data temporarily (in memory). For persistence, use the `Patch` function with Dataverse or SharePoint.

### Screen 1: Shopping Cart

1. Go to [make.powerapps.com](https://make.powerapps.com/) → **+ Create** → **Blank canvas app** → name **Shopping Cart**, format **Tablet**.
2. Insert a **Button**; set **OnSelect** to populate the Products collection:

```powerappsfl
ClearCollect(Products,
 {ID:1, Name:"T-Shirt", Category: "Clothing"},
 {ID:2, Name:"Sweatshirt", Category: "Clothing"},
 {ID:3, Name:"Socks", Category: "Clothing"},
 {ID:4, Name:"Necklace", Category: "Jewelry"},
 {ID:5, Name:"Ring", Category: "Jewelry"},
 {ID:6, Name:"Coffee Mug", Category: "Misc."},
 {ID:7, Name:"Keychain", Category: "Misc."}
)
```

3. Hold **Alt** and select the button to load the collection into memory.
4. Insert **Vertical Gallery** (Gallery1); set **Items** = `Products`; **Layout** = Title and Subtitle; **Title** = Category, **Subtitle** = Name; position on the left.
5. Set Gallery1 **OnSelect** to add the tapped product to the cart:

```powerappsfl
Collect(colCart, ThisItem)
```

6. Insert **Vertical Gallery** (Gallery2); set **Items** = `colCart`; **Layout** = Title and Subtitle; **Title** = Category, **Subtitle** = Name; delete the chevron icon; position on the right.
7. Hold **Alt** and tap Gallery1 items to populate the cart in Gallery2.
8. Insert a **Check Out Button**; set **OnSelect** to:

```powerappsfl
Collect(
  ReceiptHeader,
   {
        ID: If(
            IsEmpty(ReceiptHeader),
            1,
            Last(ReceiptHeader).ID + 1
        ),
        Name: User().FullName,
        Date: Today()
    }
);
ForAll(
    colCart,
    Collect(
        ReceiptLineItems,
        {
            ID: If(
                IsEmpty(ReceiptLineItems),
                1,
                Last(ReceiptLineItems).ID + 1
            ),
            ProductID: ThisRecord.ID,
            ReceiptHeaderID: Last(ReceiptHeader).ID
        }
    )
);
Clear(colCart)
```

- Creates one **ReceiptHeader** record with user name, today's date, and an auto-incremented ID.
- Iterates **colCart** with `ForAll` + `Collect` to write one **ReceiptLineItems** record per cart item.
- Clears **colCart** after checkout.

### Screen 2: Order History

9. Create a **New Screen** (Screen2).
10. Insert **Gallery3** (left); set **Items** = `ReceiptHeader`; set Subtitle text = `ThisItem.Date`.
11. Insert **Gallery4** (right):
    - **Items**:

      ```powerappsfl
      Filter(ReceiptLineItems, ReceiptHeaderID=Gallery3.Selected.ID)
      ```

    - **Title** text:

      ```powerappsfl
      LookUp(Products, ID=ThisItem.ProductID).Name
      ```

    - **Subtitle** text:

      ```powerappsfl
      LookUp(ReceiptHeader, ID=ThisItem.ReceiptHeaderID).Name
      ```

12. Selecting a receipt in Gallery3 displays its line items in Gallery4.

---

## Microsoft Dataverse Relationships

- Relationships are defined at the **table level** in Dataverse (Data section of Power Apps Studio or the Dataverse maker portal).
- Once configured, relationships are available to **all apps** connecting to those tables.
- Dataverse relationships expose related data via **dot (.) notation**, eliminating manual `LookUp` calls.

### Dot notation vs. LookUp

Without Dataverse relationship (manual LookUp):
```powerapps
LookUp(CustomerTable, ID = ThisItem.CustomerID, CustomerName)
```

With Dataverse relationship (dot notation):
```powerapps
ThisItem.Customer.CustomerName
```

- **Dot notation** benefits: less code, reduced complexity, no extra network calls per record, enforced at data layer.

---

## References

- [Collections in Power Apps](https://learn.microsoft.com/en-us/power-apps/maker/canvas-apps/create-update-collection/)
- [Patch function in Power Apps](https://learn.microsoft.com/en-us/power-apps/maker/canvas-apps/functions/function-patch/)
- [Performance considerations with Power Apps](https://powerapps.microsoft.com/blog/performance-considerations-with-powerapps/)
