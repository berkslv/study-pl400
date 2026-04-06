# Summary

This module explored how you can use Power Fx formulas to work with Microsoft Dataverse choice columns. Choice columns present the user with a fixed list of values that are defined by the maker. They allow the selection of a single value or multiple values.

## Key takeaways

- **Choice columns** store data as numeric values; only the label is usable in formulas.
- Use **`Choices()`** to get a table of possible values for use in dropdowns, combo boxes, and filter formulas.
- **Single choice** columns can be referenced directly (e.g., `ThisItem.Category`).
- **Multiple choices** columns return a table; use `Concat()` to display them as a comma-separated string.
- Use **`Filter()`** with a choice column value to filter gallery rows. Use the fully qualified reference (e.g., `'Category (Accounts)'.'Preferred Customer'`).
- Filtering on **choices** (multi-select) columns causes delegation warnings; use Dataverse views as a workaround.
- **Edit forms** automatically configure dropdowns/combo boxes and the `Choices()` function for choice columns.
- Use **`Patch()`** to update choice column values programmatically, prefixing the value with the Choice set name.
- To clear a choice column value with `Patch()`, set it to **`Blank()`**.
