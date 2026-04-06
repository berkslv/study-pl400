# Summary: Working with Dataverse Table Relationships in Canvas Apps

> **Source files:** 1-introduction.md, 2-one-to-many-relationships.md, 3-many-to-many-relationships.md, 4-exercise.md

---

## Dataverse Relationship Types

- **One-to-many (1:N / parent-child):** A primary (parent) table row associates with many related (child) rows via a lookup column on the child.
- **Many-to-one (N:1):** Same physical relationship as 1:N but navigated from child → parent; used in canvas apps when displaying parent data from a child record.
- **Many-to-many (N:N):** Uses a hidden *intersect table* to map associations; fully symmetrical — no concept of primary table.
- **Multi-table lookup (polymorphic lookup):** A lookup column can point to rows from multiple tables. Use `IsType()` and `AsType()` Power Fx functions to determine and work with the parent table type.
  - Built-in example: `Customer` column (can reference Contact or Account).
  - Activity tables support lookups to any activity-tracking-enabled table.

---

## One-to-Many Relationships

### Navigation with Dot Notation

- Use dot notation instead of `Filter()` to traverse relationships — simpler and more concise.

```powerfx
// Filter approach (verbose)
Filter(Desks, Location = FilterLocation_1.Selected)

// Dot notation (preferred)
FilterLocation_1.Selected.Desks
```

- Apply additional filters on top of relationship navigation:

```powerfx
Filter(FilterLocation_1.Selected.Desks, Status = 'Status (Desks)'.Active)
```

### Navigate from Child to Parent

```powerfx
// Verbose lookup approach
LookUp(Locations, Location = ThisItem.Location).Address

// Dot notation (preferred)
ThisItem.Location.Address
```

- Multi-level navigation is supported:

```powerfx
ThisItem.Location.'Primary Contact'.'Full Name'
```

### Adding and Updating Related Rows

- Use an **edit form** with the lookup column; the form uses `Choices()` to populate the dropdown:

```powerfx
Filter(Choices([@Desks].contoso_Location), Status = 'Status (Locations)'.Active)
```

- Pre-set the lookup using **DefaultSelectedItems** on the data card and hide the field if the value is already known.

- Use `Patch()` to set a lookup column — pass a record from the primary table:

```powerfx
Patch(Desks, ThisItem, {Location: FilterLocation_1.Selected})
```

### Relate and Unrelate Functions

```powerfx
// Establish a relationship
Relate(FilterLocation_1.Selected.Desks, ThisItem)

// Remove a relationship (sets lookup to null)
Unrelate(FilterLocation_1.Selected.Desks, ThisItem)
```

> **Warning:** `Unrelate()` sets the lookup column to `Nothing` (null). Avoid creating orphaned rows the app cannot display.

### Relationship Behaviors

- **Reference (default):** Deletes the link between tables when the parent is deleted; child rows become orphaned.
- **Parental:** Automatically deletes child rows when the parent row is deleted — prevents orphaned records.
- **ForAll approach (manual):** Use `ForAll()` to delete child records before deleting the parent row.
- Always understand the configured behavior before implementing delete logic in canvas apps.

---

## Many-to-Many Relationships

- The relationship is fully symmetrical; navigate from either side:

```powerfx
ThisItem.'Desk Features'   // Access desk features from a desk row
ThisItem.Desks             // Access desks from a desk feature row
```

### Display Related Data

```powerfx
// Comma-separated list of features for each desk in a gallery
Concat(ThisItem.'Desk Features', Name, ",")
```

> **Performance note:** Each desk row triggers a separate network call to retrieve its features. Show features only after a user selects a specific desk to minimize calls.

### Filtering with Many-to-Many

- Single-selection filtering: use `controlName.Selected.Desks` as the gallery **Items**.
- Multi-selection requires iterating selected items and collecting related rows into a single collection.

```powerfx
// Filter desks by selected location and selected feature
Filter(Desks, Location.Location = FilterLocation.Selected.Location, IsBlank(filterFeatures.Selected) || Desk in filterFeatures.Selected.Desks.Desk)
```

### Establish the Relationship

```powerfx
// Either record can be first parameter — relationship is symmetrical
Relate(deskRecord.'Desk Features', deskFeatureRecord)
```

### Many-to-Many in Forms

Auto-generated form formulas for many-to-many fields may contain errors. Manual fix steps:

1. Unlock the data card from the **Advanced** tab.
2. Verify the **Items** property references the correct data source (e.g., `'Desk Features'`).
3. Change **DisplayMode** from **View** to **Edit** on the data card.
4. Clear the **Update** property to prevent form submission errors.
5. Handle relationship creation manually in the submit button's **OnSelect**:

```powerfx
// Step 1: Save selected items before form resets
ClearCollect(selectedFeatures, ComboBoxDeskFeatures.SelectedItems);

// Step 2: Submit the form
SubmitForm(FormDesk);

// Step 3: Establish the many-to-many relationships
ForAll(selectedFeatures, Relate(FormDesk.LastSubmit.'Desk Features', ThisRecord));
```

### Many-to-Many vs. Choices Column

| Feature | Many-to-many relationship | Choices column |
| --- | --- | --- |
| Rows can be deactivated | ✅ | ❌ |
| Row-level security | ✅ | ❌ |
| Rows added at run time | ✅ | ❌ |
| Best for | Flexible, user-managed tags | Static/rarely changed lists |

### Custom Intersect Table Pattern

- Many-to-many relationships cannot store additional data about the association.
- If extra data is needed (e.g., proficiency level), create a **custom intersect table** with N:1 relationships to both sides:
  - Example: **Contact** → **Language Spoken** ← **Language**
  - The intersect table can have additional columns (e.g., proficiency, years spoken).
  - Treated like any other table using standard one-to-many / many-to-one patterns.

---

## Exercise Reference Formulas

```powerfx
// Filter gallery to current user's reservations (1:N navigation)
LookUp(Users,'Primary Email'=currentUserEmail).'Reservations (contoso_Reservation_ReservedFor_SystemUser)'

// Show desk name from reservation (reservation → desk)
ThisItem.Desk.Name

// Two-level navigation (reservation → desk → location phone)
ThisItem.Desk.Location.Phone

// Three-level navigation with null check
If(IsBlank(ThisItem.Desk.Location.'Primary Contact'),"No Primary Contact",ThisItem.Desk.Location.'Primary Contact'.'Full Name')

// Favorite icon — filled if desk is already favorited (M:N)
If(CountIf(ThisItem.Users, ThisRecord.User = currentUser.User) > 0, Icon.ThumbsUp, Icon.ThumbsUpFilled)

// Toggle favorite on icon select
If(CountIf(ThisItem.Users, ThisRecord.User = currentUser.User) > 0, Unrelate(ThisItem.Users, currentUser), Relate(ThisItem.Users, currentUser))

// Concatenate desk features (M:N)
Concat(ThisItem.'Desk Features', Name, " , ")
```

> **Delegation warning:** `CountIf` has delegation limitations. For large datasets, use an alternative approach.

---

## References

- [ContosoHotDesking_1_0_0_0.zip](https://github.com/MicrosoftDocs/mslearn-developer-tools-power-platform/blob/master/power-apps/relational-data/ContosoHotDesking_1_0_0_0.zip)
- [Power Apps maker portal](https://make.powerapps.com/)
