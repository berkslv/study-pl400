# Work with many-to-many relationships

Many-to-many relationships provide you with the flexibility to track when multiple rows have the same related data. Unlike one-to-many relationships, many-to-many relationships don't have a concept of a primary table. The relationship is entirely symmetrical, and you can access the set of related rows starting from either side of the relationship.

To continue with the Contoso workspace-sharing data model, this unit explores how to work with many-to-many relationships in a canvas app by using the **Desk** and the **Desk Feature** tables.

Each desk can have multiple associated desk feature rows, and each desk feature can be associated with multiple desks.

- Access desk features from a desk row: `ThisItem.'Desk Features'`
- Access desks from a desk feature row: `ThisItem.Desks`

## Display related data in a gallery

To show a comma-separated list of desk features for each desk in a gallery, set the **Text** property on a label to:

```powerfx
Concat(ThisItem.'Desk Features', Name, ",")
```

> **Note:** Be aware of performance implications with this formula, especially with many records. Each desk row triggers a separate call to retrieve its desk features. Consider showing desk features only after a user selects a specific desk to minimize the number of network calls.

## Filter using a many-to-many relationship

You can use the relationship to allow a user to pick a desk feature and then use the `controlName.Selected.Desks` property to populate items in a gallery. This approach works well for single selections. Multi-selection logic requires additional workarounds, such as iterating through selected features and collecting related desks into a single collection.

## Establish the relationship

The primary way to establish a many-to-many relationship is to use the `Relate()` function:

```powerfx
Relate(deskRecord.'Desk Features', deskFeatureRecord)
```

Because the relationship has no primary table, it doesn't matter which record is the first or second parameter.

## Using many-to-many relationships in forms

When you add a many-to-many field to a form, the auto-generated formulas may contain errors. To resolve this:

1. Unlock the data card from the **Advanced** tab.
2. Verify that the **Items** property shows the correct data source (e.g., `'Desk Features'`).
3. Change the **DisplayMode** from **View** to **Edit** on the data card.
4. Clear the **Update** property to prevent form submission errors.
5. Handle relationship creation manually in the **OnSelect** property of the submit button:

```powerfx
// Step 1: Save selected desk features before form resets
ClearCollect(selectedFeatures, ComboBoxDeskFeatures.SelectedItems);

// Step 2: Submit the form
SubmitForm(FormDesk);

// Step 3: Establish the many-to-many relationships
ForAll(selectedFeatures, Relate(FormDesk.LastSubmit.'Desk Features', ThisRecord));
```

## Other design options

Many-to-many relationships are suitable for tracking associations between rows but cannot store additional data about the relationship itself. If you need to store extra information (e.g., proficiency level when tracking languages a contact speaks), consider creating a custom intersect table with N:1 relationships to both sides:

- **Contact** → **Language Spoken** ← **Language**

The **Language Spoken** table can have additional columns (e.g., proficiency, years spoken) and is worked with like any other table using one-to-many and many-to-one relationships. This pattern provides full flexibility at the cost of extra logic to manage the user experience.

### Many-to-many vs. Choices column

| Feature | Many-to-many relationship | Choices column |
| --- | --- | --- |
| Rows can be deactivated | ✅ | ❌ |
| Row-level security | ✅ | ❌ |
| Rows added at run time | ✅ | ❌ |
| Best for | Flexible, user-managed tags | Static/rarely changed lists |
