# Summary

This module explored how you can use Microsoft Dataverse relationships in canvas apps from Power Apps. Just as real-life objects are related to each other, relationships in Dataverse link rows from one table to another. Relationships can also provide constraints and behaviors that apply when actions are performed on the rows.

You learned how Dataverse tables and relationships can work together to tell the story of your data. By using relationships properly, apps can hide unnecessary complexities of the data model. The Power Fx language provides user-friendly dot notation to reference related data and to efficiently navigate tables through relationships.

## Key takeaways

- **One-to-many (1:N):** A parent table row can be associated with many child rows via a lookup column on the child. Use dot notation (`ThisItem.Location.Address`) instead of `LookUp()` for concise navigation.
- **Many-to-one (N:1):** The same physical relationship viewed from the child side. Use dot notation to navigate from child to parent.
- **Many-to-many (N:N):** A hidden intersect table maps associations between two tables. Use `Relate()` and `Unrelate()` to manage associations. Cannot store additional data about the relationship itself.
- **Relationship behaviors:** Control what happens to child rows when a parent is deleted. Use **Parental** behavior to automatically cascade deletes.
- **Choices() function:** Use to populate dropdown/combo box controls with valid lookup values without adding the lookup table as a separate data source.
- **Custom intersect table:** When you need to store extra data about a many-to-many association, create your own intersect table with two N:1 relationships instead.
