# Data load strategies

Power Apps provides users with an efficient way to work with their business data and processes. Apps can access data by using connectors. By evaluating your users' needs and how data is loaded, you can develop a strategy to improve performance.

## Key evaluation questions

As you evaluate your app, consider the following key questions:

- **Is the initial data that is being shown to the user useful?** Preloading a large quantity of unfiltered records can result in unintentional slowness.
- **Does the app offer the correct data filters?** Adding controls so that users can enter criteria to reduce the number of rows that are displayed can be helpful for user productivity and performance.
- **Are you incurring overhead from showing related data?** If you use related values in a gallery, the app might perform lookup queries for each row that is shown. Preloading the related data into a collection can be more efficient.
- **Do you know what data is static and what data is updated frequently?** Caching of infrequently changing or static data can help improve performance. Caching data that frequently changes can present stale data to the user.
- **Do you want to show a loading indicator to the user?** If you're binding data from the connector directly to the control, you don't have the option of showing and hiding a loading indicator.
- **How much data will be loaded from the data source?** If you're considering caching, make sure that the data source doesn't have more rows than configured for the data row limit in the app settings.
- **Do you need to calculate columns or manipulate the data that you loaded?** If the data source supports required calculations, try to implement these columns in the data source itself (e.g., Dataverse calculated and rollup columns).
- **How frequently do you need to see data added/modified by another app or automation?** If you're preloading data into a collection, the updated information will only display if you reload the collection.

## Direct data source binding

When you set the **Items** property of a gallery to the table of a tabular connector, or use an expression like a `Filter()` function based on the table, you're doing direct data source binding. For example:

```powerappsfl
SortByColumns(Filter([@Desks], StartsWith(Title, TextSearchBox1.Text)), "Title", If(SortDescending1, Descending, Ascending))
```

### Advantages of direct binding

- Data is retrieved directly from the connector as the criteria on the filter changes (declarative approach).
- Not limited by the **Data row limit** app setting if your connector supports delegation.
- For example, with 100,000 contact rows in Dataverse, Power Apps loads an initial set and gets more as the user scrolls (`getRows` followed by `getMoreRows` calls handled automatically).
- Data displayed in controls is automatically refreshed when data is modified elsewhere in the app.
- You can manually refresh by using `Refresh(tableName)`.

### Disadvantages

- No option to show a loading indicator to the user.

## Preload data into a collection

Preloading data into a collection allows you to control the load of the data in either **App.OnStart** or **OnVisible** properties.

- **App.OnStart** - Good choice if you need the same data on multiple screens.
- **OnVisible** - Allows you to defer the load until that screen is used.

Either option allows you to show a loading indicator while the data is loaded.

```powerappsfl
ClearCollect(colDesks, Desks)
```

### Advantages

- Allows showing a loading indicator during data load.
- Allows the user to modify and review multiple rows without saving each one, then commit all changes at once:

```powerappsfl
Patch(Desks, colDesks)
```

### Disadvantages

- Data isn't refreshed unless you call `ClearCollect()` again to bring in the latest data.

## Load from persisted storage

A variation of the simple preload approach is to load data from your device's local storage first and then continue to load directly from the data source. This strategy is helpful when the data source is slow or available intermittently.

To implement this pattern:

1. Load the data, if it exists, from the device's local storage using `LoadData()`.
2. Load data directly from the data source connector into the same collection.
3. Use `SaveData()` to persist the most recent data to the device's local storage.

```powerappsfl
LoadData(colDesks, "LocalDesks", true);

ClearCollect(colDesks, Desks);

SaveData(colDesks, "LocalDesks");
```

To handle occasional connectivity issues, add a conditional check:

```powerappsfl
LoadData(colDesks, "LocalDesks", true);

If(Connection.Connected,
    ClearCollect(colDesks, Desks);
    SaveData(colDesks, "LocalDesks")
)
```

## Preload into a variable

When working with non-tabular connectors, such as Office 365 Users, you can improve performance by saving the results from a function call into a variable.

### Inefficient approach (calls connector three times)

```powerappsfl
Set(profileDisplayName, Office365Users.MyProfileV2().displayName);

Set(profileHireDate, Office365Users.MyProfileV2().hireDate);

Set(profileCity, Office365Users.MyProfileV2().city);
```

### Efficient approach (calls connector once)

```powerappsfl
Set(profile, Office365Users.MyProfileV2());

Set(profileDisplayName, profile.displayName);

Set(profileHireDate, profile.hireDate);

Set(profileCity, profile.city);
```

You could simplify further to a single variable and use dot notation to access properties whenever required:

```powerappsfl
Set(profile, Office365Users.MyProfileV2());
```

Then use `profile.hireDate` instead of a separate `profileHireDate` variable.

## Load data concurrently

If you're preloading multiple items from connectors, by default they run one at a time sequentially. You can run them in parallel by using the `Concurrent()` function:

```powerappsfl
Concurrent(
    ClearCollect(colDesks, Desks),
    ClearCollect(colDeskFeatures, 'Desk Features'),
    Set(userProfile, Office365Users.MyProfileV2())
)
```

## Load data once

If you use **OnVisible** to defer the preload, it will run each time the screen is navigated to, potentially refreshing your collection too frequently. To avoid this situation, check first if you have already loaded the data:

```powerappsfl
If(IsEmpty(colDesks), ClearCollect(colDesks, Desks))
```

## App settings and data loading

- **Data row limit** - Applies when using collections to preload data. Can make larger datasets unsuitable for preloading.
- **Delay load** - Delays running screen expression calls until they're needed, then runs them on demand. Turned on by default for all new apps and can be turned on manually for older apps.
