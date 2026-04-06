# Quiz: Reducing Complexity with Dataverse Table Relationships in Canvas Apps

> **Source material:** 1-introduction.md, 2-one-to-many-relationships.md, 3-many-to-many-relationships.md, 4-exercise.md, 5-check.md, 6-summary.md
> **Total questions:** 25
> **Question types:** Multiple choice (single), Multiple choice (multi-select), Fill-in-the-blank

---

## Questions

### Question 1 — Single Choice

A developer at Contoso is building a canvas app and wants to retrieve all desks associated with a selected location. They currently use the following formula:

```powerfx
Filter(Desks, Location = FilterLocation_1.Selected)
```

Which formula is the preferred, more concise replacement that uses Dataverse relationship navigation?

- A. `LookUp(Desks, Location = FilterLocation_1.Selected)`
- B. `FilterLocation_1.Selected.Desks`
- C. `Collect(Desks, FilterLocation_1.Selected)`
- D. `ShowColumns(Desks, "Location")`

<details>
<summary>Answer</summary>

**Correct answer:** B. `FilterLocation_1.Selected.Desks`

**Explanation:** Dataverse one-to-many relationships support dot notation to navigate directly from the parent to related child rows. This is simpler and more concise than using the `Filter()` function.

</details>

---

### Question 2 — Single Choice

A maker is building a canvas app where a gallery shows desk reservations. Each reservation row has a relationship to a Desk row, and each Desk row has a relationship to a Location row. The maker needs to display the phone number of the location for each reservation.

Which formula correctly navigates two levels of relationships?

- A. `LookUp(Locations, Location = ThisItem.Desk.Location).Phone`
- B. `ThisItem.Location.Desk.Phone`
- C. `ThisItem.Desk.Location.Phone`
- D. `Filter(Locations, Location = ThisItem.Location).Phone`

<details>
<summary>Answer</summary>

**Correct answer:** C. `ThisItem.Desk.Location.Phone`

**Explanation:** Power Fx dot notation supports multi-level relationship navigation. Starting from the child reservation row, `ThisItem.Desk` navigates to the related desk, and `.Location.Phone` continues to the location's phone column.

</details>

---

### Question 3 — Single Choice

A canvas app deletes a Location record. Desks that were associated with the deleted location remain in Dataverse with no location assigned. A developer wants to prevent this situation by automatically removing desk records when their parent location is deleted.

Which relationship behavior type should be configured?

- A. Reference
- B. None
- C. Cascade
- D. Parental

<details>
<summary>Answer</summary>

**Correct answer:** D. Parental

**Explanation:** The Parental behavior type automatically deletes all associated child records when the parent record is deleted, preventing orphaned records. The Reference (default) behavior only removes the link, leaving the child rows orphaned.

</details>

---

### Question 4 — Single Choice

A maker adds a lookup column to an edit form in a canvas app so users can select a related location for a desk record. The form must present only the valid options from the related table.

Which Power Fx function does the form use automatically to populate the dropdown with valid lookup values?

- A. `Filter()`
- B. `LookUp()`
- C. `Choices()`
- D. `Select()`

<details>
<summary>Answer</summary>

**Correct answer:** C. `Choices()`

**Explanation:** When a lookup column is added to an edit form, Power Apps uses the `Choices()` function to retrieve the table of possible values from the related primary table. You can also apply additional filters on the result of `Choices()`.

</details>

---

### Question 5 — Single Choice

A developer is using the `Patch()` function to create a new Desk record and must set the lookup column that links the desk to its location. The selected location is stored in `FilterLocation_1.Selected`.

Which formula correctly sets the lookup column in `Patch()`?

- A. `Patch(Desks, Defaults(Desks), {Location: FilterLocation_1.Selected.Location})`
- B. `Patch(Desks, Defaults(Desks), {Location: FilterLocation_1.Selected})`
- C. `Patch(Desks, Defaults(Desks), {Location: Text(FilterLocation_1.Selected)})`
- D. `Patch(Desks, Defaults(Desks), {LocationId: FilterLocation_1.Selected})`

<details>
<summary>Answer</summary>

**Correct answer:** B. `Patch(Desks, Defaults(Desks), {Location: FilterLocation_1.Selected})`

**Explanation:** When using `Patch()` to set a lookup column, you assign the column to a full record from the primary table. Passing a record object (e.g., `FilterLocation_1.Selected`) is the correct approach.

</details>

---

### Question 6 — Single Choice

A canvas app has a gallery listing desks. The maker wants to add a button that links the currently displayed desk to the selected location without using a form. The selected location row is available in `FilterLocation_1.Selected`.

Which formula correctly establishes the one-to-many relationship between the location and the desk?

- A. `Patch(Desks, ThisItem, {Location: FilterLocation_1.Selected})`
- B. `Relate(Desks, FilterLocation_1.Selected)`
- C. `Relate(FilterLocation_1.Selected.Desks, ThisItem)`
- D. `Connect(FilterLocation_1.Selected, ThisItem)`

<details>
<summary>Answer</summary>

**Correct answer:** C. `Relate(FilterLocation_1.Selected.Desks, ThisItem)`

**Explanation:** The `Relate()` function takes the collection of related rows from the primary row as the first parameter and the row to be related as the second parameter. This establishes the relationship between the location and the desk.

</details>

---

### Question 7 — Single Choice

A developer calls `Unrelate(FilterLocation_1.Selected.Desks, ThisItem)` to disassociate a desk from a location. What happens to the desk record after this operation?

- A. The desk record is permanently deleted from Dataverse.
- B. The desk record's lookup column is set to Nothing (null), potentially orphaning it.
- C. The desk record is moved to the recycle bin.
- D. The desk record is linked to a default location automatically.

<details>
<summary>Answer</summary>

**Correct answer:** B. The desk record's lookup column is set to Nothing (null), potentially orphaning it.

**Explanation:** `Unrelate()` sets the lookup column on the child record to null (Nothing), effectively removing the association. This can result in orphaned records that are no longer visible through relationship navigation in the app.

</details>

---

### Question 8 — Single Choice

A maker is building a data model where a lookup column on a table can point to a row from either a Contact table or an Account table, depending on context. This is known as which type of lookup?

- A. Polymorphic lookup (multi-table lookup)
- B. Cascade lookup
- C. Hierarchical lookup
- D. Intersect lookup

<details>
<summary>Answer</summary>

**Correct answer:** A. Polymorphic lookup (multi-table lookup)

**Explanation:** A multi-table lookup (also called a polymorphic lookup) allows a lookup column to point to a row from one of multiple tables. The built-in `Customer` column type is one example, which can reference either a Contact or an Account row.

</details>

---

### Question 9 — Single Choice

A developer is working with a multi-table lookup column in a canvas app. They need to determine at runtime which table type a lookup value belongs to before accessing its columns.

Which two Power Fx functions are used for this purpose?

- A. `IsBlank()` and `Filter()`
- B. `IsType()` and `AsType()`
- C. `TypeOf()` and `Cast()`
- D. `IsRecord()` and `AsRecord()`

<details>
<summary>Answer</summary>

**Correct answer:** B. `IsType()` and `AsType()`

**Explanation:** When working with multi-table lookup columns in Power Apps, `IsType()` is used to determine which parent table a value belongs to, and `AsType()` is used to cast the value to a specific table type so you can access its columns.

</details>

---

### Question 10 — Single Choice

In the Contoso hot desking data model, the Desk table and the Desk Feature table share a many-to-many relationship. A developer navigates from a desk row to see its associated features.

Which formula correctly accesses the desk features for a specific desk row in a gallery?

- A. `Filter(DeskFeatures, Desk = ThisItem)`
- B. `LookUp(DeskFeatures, Desk = ThisItem.Desk)`
- C. `ThisItem.'Desk Features'`
- D. `ThisItem.Desks.'Desk Features'`

<details>
<summary>Answer</summary>

**Correct answer:** C. `ThisItem.'Desk Features'`

**Explanation:** Many-to-many relationships are symmetrical and support dot notation navigation from either side. From a desk row, `ThisItem.'Desk Features'` returns the related desk feature rows through the hidden intersect table.

</details>

---

### Question 11 — Single Choice

A maker wants to display a comma-separated list of desk feature names inside each row of a desk gallery. 

Which formula achieves this?

- A. `Filter(ThisItem.'Desk Features', Name, ",")`
- B. `Join(ThisItem.'Desk Features', Name, ",")`
- C. `Concat(ThisItem.'Desk Features', Name, ",")`
- D. `Concatenate(ThisItem.'Desk Features'.Name, ",")`

<details>
<summary>Answer</summary>

**Correct answer:** C. `Concat(ThisItem.'Desk Features', Name, ",")`

**Explanation:** The `Concat()` function iterates over a table and concatenates a column value with a delimiter. Here it traverses the related desk features and concatenates each `Name` value separated by a comma.

</details>

---

### Question 12 — Single Choice

A performance-sensitive canvas app displays a gallery of 500 desk rows. A developer adds a label inside the gallery that calls `Concat(ThisItem.'Desk Features', Name, ",")` for every row.

What is the likely performance impact of this approach?

- A. No impact, because Dataverse caches the results automatically.
- B. Each desk row triggers a separate network call to retrieve its features, causing performance degradation.
- C. The formula is delegated to Dataverse and runs as a single query.
- D. Power Apps batches all feature lookups into a single request.

<details>
<summary>Answer</summary>

**Correct answer:** B. Each desk row triggers a separate network call to retrieve its features, causing performance degradation.

**Explanation:** Displaying many-to-many related data inside a gallery row triggers one network call per row to retrieve that row's related records. For large galleries, this can significantly degrade performance. A better approach is to show features only after the user selects a specific desk.

</details>

---

### Question 13 — Single Choice

A developer needs to store additional information about a many-to-many relationship — specifically, they want to record the proficiency level of a language that a contact speaks. The standard Dataverse many-to-many relationship cannot store this extra data.

What is the recommended design pattern in this scenario?

- A. Add a Choices column to the Contact table to store proficiency levels.
- B. Use a multi-table lookup column on the Language table.
- C. Create a custom intersect table with N:1 relationships to both Contact and Language, and add proficiency as a column.
- D. Use the built-in hidden intersect table and extend it with custom columns.

<details>
<summary>Answer</summary>

**Correct answer:** C. Create a custom intersect table with N:1 relationships to both Contact and Language, and add proficiency as a column.

**Explanation:** Standard many-to-many relationships use a hidden intersect table that cannot be customized. When extra data about the association is needed, the solution is to create a custom intersect table (e.g., Language Spoken) with one-to-many relationships to both sides, allowing additional columns.

</details>

---

### Question 14 — Single Choice

A maker adds a many-to-many field to an edit form in Power Apps Studio. After adding the field, the auto-generated formula causes errors. The maker wants to resolve this and handle relationship creation manually on form submit.

What must the maker do to the data card's **Update** property to prevent form submission errors?

- A. Set it to `ThisItem.'Desk Features'`
- B. Remove the data card entirely and rebuild it
- C. Clear the **Update** property
- D. Set it to `Blank()`

<details>
<summary>Answer</summary>

**Correct answer:** C. Clear the **Update** property

**Explanation:** For many-to-many fields in a form, the auto-generated Update property causes errors because Dataverse cannot update a many-to-many relationship like a regular column. Clearing the Update property and handling the relationship manually via `Relate()` in the submit button's OnSelect is the correct approach.

</details>

---

### Question 15 — Single Choice

In the Contoso hot desking exercise, a gallery is filtered to show only the current user's reservations by navigating from the Users table. The current user's email is stored in `currentUserEmail`.

Which formula correctly sets the gallery's **Items** property?

- A. `Filter(Reservations, ReservedFor = currentUserEmail)`
- B. `LookUp(Users,'Primary Email'=currentUserEmail).'Reservations (contoso_Reservation_ReservedFor_SystemUser)'`
- C. `Filter(Users, 'Primary Email' = currentUserEmail).Reservations`
- D. `Collect(Reservations, 'Primary Email' = currentUserEmail)`

<details>
<summary>Answer</summary>

**Correct answer:** B. `LookUp(Users,'Primary Email'=currentUserEmail).'Reservations (contoso_Reservation_ReservedFor_SystemUser)'`

**Explanation:** This formula uses `LookUp()` to find the current user row by email and then navigates via the one-to-many relationship to retrieve their reservations using dot notation. The relationship navigation property name reflects the schema name of the relationship.

</details>

---

### Question 16 — Multi-Select

A developer is designing the data model for the Contoso hot desking solution. Which of the following are valid Dataverse relationship types that can be created between tables? (Select **three**.)

- A. One-to-one
- B. One-to-many
- C. Many-to-many
- D. Many-to-one
- E. Zero-to-many
- F. Hierarchical

<details>
<summary>Answer</summary>

**Correct answers:** B. One-to-many, C. Many-to-many, D. Many-to-one

**Explanation:** Dataverse supports one-to-many (1:N), many-to-one (N:1, the same physical relationship from the child perspective), and many-to-many (N:N) relationships. One-to-one, zero-to-many, and hierarchical are not standard Dataverse relationship types.

</details>

---

### Question 17 — Multi-Select

A maker is fixing a many-to-many form field in Power Apps that generates errors after being auto-generated. Which of the following steps are required to correctly resolve the issue and handle the relationship manually? (Select **three**.)

- A. Delete the form and recreate it from scratch
- B. Unlock the data card from the **Advanced** tab
- C. Clear the **Update** property on the data card
- D. Change the **DisplayMode** of the data card from **View** to **Edit**
- E. Set the **DefaultSelectedItems** to a blank value
- F. Handle relationship creation in the submit button's **OnSelect** using `Relate()` and `ForAll()`

<details>
<summary>Answer</summary>

**Correct answers:** B. Unlock the data card from the **Advanced** tab, C. Clear the **Update** property on the data card, F. Handle relationship creation in the submit button's **OnSelect** using `Relate()` and `ForAll()`

**Explanation:** The correct fix requires unlocking the data card, clearing the Update property to prevent submission errors, and then manually calling `Relate()` inside a `ForAll()` loop in the submit button's OnSelect after the form is submitted.

</details>

---

### Question 18 — Multi-Select

A business analyst is evaluating whether to use a many-to-many relationship or a Choices column to store desk feature tags in the Contoso app. Which of the following are advantages of a many-to-many relationship over a Choices column? (Select **three**.)

- A. Many-to-many rows can be deactivated
- B. Many-to-many values support row-level security
- C. Many-to-many is faster to query than Choices
- D. Many-to-many rows can be added by users at run time
- E. Many-to-many relationships require less Power Fx code
- F. Many-to-many values are stored directly on the parent row

<details>
<summary>Answer</summary>

**Correct answers:** A. Many-to-many rows can be deactivated, B. Many-to-many values support row-level security, D. Many-to-many rows can be added by users at run time

**Explanation:** Compared to Choices columns, many-to-many relationship rows can be deactivated (A), secured at the row level (B), and added dynamically at run time by users (D). Choices columns are best for static lists that rarely change.

</details>

---

### Question 19 — Multi-Select

A developer is implementing a "favorite desk" feature. The icon in the gallery should appear filled when the desk is already favorited by the current user. Which two formulas correctly implement the icon's **Icon** property and **OnSelect** property? (Select **two**.)

- A. `Icon` property: `If(CountIf(ThisItem.Users, ThisRecord.User = currentUser.User) > 0, Icon.ThumbsUp, Icon.ThumbsUpFilled)`
- B. `Icon` property: `If(IsBlank(ThisItem.Users), Icon.ThumbsUpFilled, Icon.ThumbsUp)`
- C. `OnSelect` property: `If(CountIf(ThisItem.Users, ThisRecord.User = currentUser.User) > 0, Unrelate(ThisItem.Users, currentUser), Relate(ThisItem.Users, currentUser))`
- D. `OnSelect` property: `Relate(ThisItem.Users, currentUser)`
- E. `OnSelect` property: `Patch(Desks, ThisItem, {Users: currentUser})`

<details>
<summary>Answer</summary>

**Correct answers:** A (Icon property) and C (OnSelect property)

**Explanation:** The `CountIf()` check determines whether the current user is already related to the desk. The Icon property shows ThumbsUp (filled) when already favorited and ThumbsUpFilled (outline) when not. The OnSelect uses `Unrelate()` if already favorited and `Relate()` if not.

</details>

---

### Question 20 — Multi-Select

A maker wants to filter a gallery of desks so that only desks matching both the selected location and the selected feature are shown. Which components must be included in the **Items** formula for the desk gallery? (Select **two**.)

- A. A filter on `Location.Location` matching the selected location
- B. A `LookUp()` to find the desk by name
- C. A condition using `Desk in filterFeatures.Selected.Desks.Desk` to filter by selected feature
- D. A `Concat()` to build a list of feature names
- E. A `ForAll()` to iterate over all features

<details>
<summary>Answer</summary>

**Correct answers:** A. A filter on `Location.Location` matching the selected location, C. A condition using `Desk in filterFeatures.Selected.Desks.Desk` to filter by selected feature

**Explanation:** The correct formula is `Filter(Desks, Location.Location = FilterLocation.Selected.Location, IsBlank(filterFeatures.Selected) || Desk in filterFeatures.Selected.Desks.Desk)`. It filters by both location and the many-to-many relationship to the selected feature.

</details>

---

### Question 21 — Fill-in-the-Blank

In a Dataverse many-to-many relationship, the association between the two tables is tracked by a special hidden table called a(n) ___.

<details>
<summary>Answer</summary>

**Answer:** intersect table (also accepted: relationship table)

**Explanation:** Many-to-many relationships use a hidden intersect table (also called a relationship table) to map how rows of one table relate to rows of another. This table is managed automatically by Dataverse and cannot be customized with additional columns.

</details>

---

### Question 22 — Fill-in-the-Blank

When navigating from a child row to its parent in a one-to-many relationship in Power Fx, you use ___ notation rather than the verbose `LookUp()` function.

<details>
<summary>Answer</summary>

**Answer:** dot

**Explanation:** Power Fx dot notation allows you to traverse Dataverse relationships directly, such as `ThisItem.Location.Address`, instead of writing a full `LookUp()` expression. This is the preferred approach for concise and readable formulas.

</details>

---

### Question 23 — Fill-in-the-Blank

The relationship behavior type that automatically deletes all child records when the parent record is deleted is called ___.

<details>
<summary>Answer</summary>

**Answer:** Parental

**Explanation:** The Parental behavior type configures a relationship so that when the primary (parent) record is deleted, all associated child records are automatically deleted as well. This prevents orphaned child rows.

</details>

---

### Question 24 — Fill-in-the-Blank

When working with a multi-table lookup column in a canvas app, you use the ___ function to determine the parent table type of a lookup value, and the ___ function to cast it to a specific table type.

<details>
<summary>Answer</summary>

**Answer:** `IsType()` / `AsType()`

**Explanation:** `IsType()` checks whether a polymorphic lookup value belongs to a specific table, and `AsType()` casts the value to that table type so you can access its typed columns. Both functions are required when working with multi-table (polymorphic) lookups in Power Apps.

</details>

---

### Question 25 — Fill-in-the-Blank

In the Contoso hot desking data model, the ___ table and the ___ table share a many-to-many relationship, which means a single row on either side can be associated with multiple rows on the other side.

<details>
<summary>Answer</summary>

**Answer:** Desk / Desk Feature (either order is acceptable)

**Explanation:** The many-to-many relationship between Desk and Desk Feature allows each desk to have multiple features and each feature to be associated with multiple desks. This relationship is managed through a hidden intersect table in Dataverse.

</details>

---
