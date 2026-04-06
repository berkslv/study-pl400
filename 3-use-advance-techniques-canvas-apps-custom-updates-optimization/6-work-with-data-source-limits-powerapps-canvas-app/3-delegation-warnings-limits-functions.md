# Delegation warnings, limits, and non-delegable functions

Power Apps uses visuals to help you, the app maker, understand when delegation is occurring. The maker portal also has one setting you can adjust to increase the amount of data returned when delegation isn't possible.

## Delegation warnings

Anytime you use a nondelegable function, Power Apps underlines it with a squiggly line and displays a yellow warning triangle.

This gives you a clear visual indicator that delegation isn't happening, which means you might not see all of your data. It's important to understand a couple of things about this visual indicator.

- Power Apps provides this warning whatever the size of your data source. Even if your data source only has a few items and delegation isn't technically causing you a problem, the warning still shows. Remember the first 500 items are returned by default and processed locally. The warning appears anytime that your formula isn't delegated.
- The warning indicator only processes on the first thing that causes the delegation issue. Only the first field that caused delegation is underlined with a squiggly line. For example, if both `FirstName` and `LastName` would cause delegation, only `FirstName` is underlined. This can be confusing because people try to troubleshoot what is the difference between `FirstName` and `LastName` instead of the real issue, which is the `Search` function. If you come across this confusion, rearrange your formula to validate that whichever field is first shows the issue.
- This visual indicator is only present when you are in the maker portal, building the app. When a user is running the app, they don't receive any notification that delegation isn't occurring and that they might only be seeing partial results. Keep this in mind when designing your app and build accordingly.

## Change the number of records returned when delegation isn't available

When a formula can't delegate to the data source for any reason, then by default Power Apps retrieves the first 500 records from that data source and then processes the formula locally. Power Apps does support adjusting this limit from 1 to 2000. You can adjust this limit in the Advanced settings.

1. From the Maker portal, select **Settings** from the menu across the top of the screen. If you don't see **Settings**, click on the three ellipses.
2. Under **App settings**, keep the **General** tab selected and scroll down to the **Data row limit**.
3. Set the Data row limit for nondelegable queries for any value between 1 to 2000.
4. After you set the limit, select the **close** in the lower right to save your change and return to the Maker portal.

There are two primary reasons that you might want to adjust this limit.

- **Increase the limit**: If you're working with data where 500 records aren't enough, but less than 2000 is. For example, if you have a customer list and you know you'll never have more than 1,000 customers, then you could design your app to ignore delegation and always return all 1,000 records.
- **Lower the limit**: Set it to 1 or 10 to help with testing. If you run into scenarios where you aren't sure if a nondelegable function is causing problems with your app, you can lower the limit and then test. If you set the limit to 1 and your gallery is only presenting one record, you know that you have a nondelegable function. This setting speeds up your troubleshooting process.

## Nondelegable functions

In the previous unit, you learned about the functions that are delegable and how they relate to the various data sources. These other functions, not covered in that unit, aren't delegable. The following are notable functions that don't support delegation.

- `First`, `FirstN`, `Last`, `LastN`
- `Choices`
- `Concat`
- `Collect`, `ClearCollect` (Neither of these functions return a delegation warning, but they aren't delegable)
- `CountIf`, `RemoveIf`, `UpdateIf`
- `GroupBy`, `Ungroup`

All of these functions aren't delegable. So by adding them to a formula you might take a previously delegable function and make it not delegable.

## Partially supported delegable functions

The table shaping functions below are partially delegable. This means, formulas in their arguments can be delegated. However, the output of these functions is subject to the nondelegation record limit.

- `AddColumns`
- `DropColumns`
- `ShowColumns`
- `RenameColumns`

A common pattern is to use `AddColumns` and `LookUp` to merge information from one table into another, commonly referred to as a *Join* in database parlance. For example:

```powerappsfl
AddColumns( Products, "Supplier Name", LookUp( Suppliers, Suppliers.ID = Product.SupplierID ).Name )
```

Although `Products` and `Suppliers` are potentially delegable data sources, and the `LookUp` function is delegable, the `AddColumns` function possesses partial delegability. So the outcome of the entire formula remains constrained to the initial segment of the `Products` data source.

While the `LookUp` function and its associated data source allow for delegation, facilitating the discovery of Suppliers across a vast dataset, it comes with a caveat. `LookUp` necessitates separate queries to the data source for each of the initial records in `Products`, resulting in increased network activity. However, if the `Suppliers` dataset is relatively small and remains stable, an alternative approach involves caching the data source within the app. Employing a `Collect` call during app initialization (using `OnVisible` on the opening screen) allows subsequent `LookUp` operations directly within the cached data source, mitigating network chatter.
