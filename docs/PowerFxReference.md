# Power FX Reference Sheet

> A comprehensive cheat-sheet of the most important and commonly used Power FX functions for Power Apps canvas apps, organized by functional group.  
> Sources: [Microsoft Learn – Formula reference (canvas apps)](https://learn.microsoft.com/en-us/power-platform/power-fx/formula-reference-canvas-apps) · [Matthew Devaney – Complete Power Apps Functions List](https://www.matthewdevaney.com/the-complete-power-apps-functions-list/)

---

## Table of Contents

1. [Logical Functions](#1-logical-functions)
2. [Text Functions](#2-text-functions)
3. [Date & Time Functions](#3-date--time-functions)
4. [Math Functions](#4-math-functions)
5. [Statistical Functions](#5-statistical-functions)
6. [Table & Data Functions](#6-table--data-functions)
7. [Collection Functions](#7-collection-functions)
8. [Forms & Controls Functions](#8-forms--controls-functions)
9. [Information Functions](#9-information-functions)
10. [Error Functions](#10-error-functions)
11. [Variable Functions](#11-variable-functions)
12. [Navigation Functions](#12-navigation-functions)
13. [Data Source Functions](#13-data-source-functions)
14. [AI Functions](#14-ai-functions)
15. [Web Functions](#15-web-functions)
16. [Color Functions](#16-color-functions)
17. [Offline Functions](#17-offline-functions)
18. [Signals Functions](#18-signals-functions)
19. [Utility Functions](#19-utility-functions)

---

## 1. Logical Functions

> Control program flow with conditions, comparisons, and boolean logic.

| Function | Syntax | Description | Parameters | Example |
|----------|--------|-------------|------------|---------|
| **If** | `If(condition, trueResult [, falseResult])` | Returns one value if a condition is true, another if false. Supports chaining (else-if). | `condition`: boolean expression · `trueResult`: value when true · `falseResult`: value when false (optional) | `If(Score >= 60, "Pass", "Fail")` |
| **Switch** | `Switch(expression, match1, result1 [, match2, result2, …, default])` | Matches an expression against a list of values; evaluates the corresponding result. | `expression`: value to test · `matchN`: value to compare · `resultN`: result when matched · `default`: fallback | `Switch(Status, "Active", "✅", "Inactive", "❌", "Unknown")` |
| **And** | `And(logical1, logical2 [, …])` or `logical1 && logical2` | Returns `true` if **all** arguments are true. | `logicalN`: boolean expressions | `And(Age >= 18, HasConsent)` |
| **Or** | `Or(logical1, logical2 [, …])` or `logical1 \|\| logical2` | Returns `true` if **any** argument is true. | `logicalN`: boolean expressions | `Or(Role = "Admin", Role = "Manager")` |
| **Not** | `Not(logical)` or `!logical` | Returns the opposite boolean value. | `logical`: boolean expression | `Not(IsBlank(Email))` |
| **EndsWith** | `EndsWith(text, end)` | Returns `true` if `text` ends with `end` (case-insensitive). | `text`: string to check · `end`: ending string | `EndsWith(FileName, ".pdf")` |
| **StartsWith** | `StartsWith(text, start)` | Returns `true` if `text` starts with `start` (case-insensitive). | `text`: string to check · `start`: starting string | `StartsWith(PhoneNumber, "+1")` |
| **Match** | `Match(text, pattern [, options])` | Extracts a single match of a regex pattern from text; returns a record. | `text`: input string · `pattern`: regex · `options`: match options | `Match("2024-01-15", "\d{4}-\d{2}-\d{2}").FullMatch` |
| **MatchAll** | `MatchAll(text, pattern [, options])` | Extracts **all** matches of a regex pattern; returns a table. | `text`: input string · `pattern`: regex · `options`: match options | `MatchAll("cat bat rat", "[a-z]at")` |
| **IsMatch** | `IsMatch(text, pattern [, options])` | Returns `true` if text matches the pattern; does not extract. | `text`: input string · `pattern`: regex or `Match.*` enum · `options`: IsMatch options | `IsMatch(Email, Match.Email)` |

---

## 2. Text Functions

> Manipulate, format, search, and transform text strings.

| Function | Syntax | Description | Parameters | Example |
|----------|--------|-------------|------------|---------|
| **Concatenate** | `Concatenate(text1, text2 [, …])` or `text1 & text2` | Joins multiple text strings into one. | `textN`: strings to join | `Concatenate(FirstName, " ", LastName)` |
| **Concat** | `Concat(table, expression [, separator])` | Joins text from all rows of a table using an expression. | `table`: data source · `expression`: text formula per row · `separator`: optional delimiter | `Concat(Items, Title, ", ")` |
| **Text** | `Text(value [, formatString [, language]])` | Converts any value to a formatted text string. | `value`: number/date/etc. · `formatString`: e.g. `"[$-en-US]mmmm dd, yyyy"` or `"#,##0.00"` | `Text(Price, "$#,##0.00")` |
| **Value** | `Value(text [, language])` | Converts a numeric text string to a number. | `text`: string representation of a number · `language`: locale code | `Value("1,234.56")` |
| **Len** | `Len(text)` | Returns the number of characters in a string. | `text`: string | `Len(Description)` |
| **Left** | `Left(text, numChars)` | Returns the leftmost N characters. | `text`: string · `numChars`: count | `Left(ProductCode, 3)` |
| **Right** | `Right(text, numChars)` | Returns the rightmost N characters. | `text`: string · `numChars`: count | `Right(PhoneNumber, 4)` |
| **Mid** | `Mid(text, startNum, numChars)` | Returns characters from within a string. | `text`: string · `startNum`: 1-based start position · `numChars`: count | `Mid(ISBN, 4, 6)` |
| **Find** | `Find(findText, withinText [, startNum])` | Returns the start position of one string within another (case-sensitive). Returns blank if not found. | `findText`: search string · `withinText`: target string · `startNum`: starting position (default 1) | `Find("@", EmailAddress)` |
| **Replace** | `Replace(oldText, startNum, numChars, newText)` | Replaces characters at a specific position. | `oldText`: original string · `startNum`: start position · `numChars`: how many to replace · `newText`: replacement | `Replace(PhoneNum, 1, 3, "+44")` |
| **Substitute** | `Substitute(text, oldText, newText [, instanceNum])` | Replaces occurrences of a substring by matching. | `text`: original · `oldText`: string to replace · `newText`: replacement · `instanceNum`: which occurrence (blank = all) | `Substitute(Description, "old", "new")` |
| **Split** | `Split(text, separator)` | Splits a string on a separator; returns a single-column table named `Result`. | `text`: string to split · `separator`: delimiter | `Split("a,b,c", ",")` |
| **Trim** | `Trim(text)` | Removes leading, trailing, and extra interior spaces. | `text`: string | `Trim("  hello   world  ")` → `"hello world"` |
| **TrimEnds** | `TrimEnds(text)` | Removes only leading and trailing spaces. | `text`: string | `TrimEnds("  hello world  ")` → `"hello world"` |
| **Lower** | `Lower(text)` | Converts all letters to lowercase. | `text`: string | `Lower("Power Apps")` → `"power apps"` |
| **Upper** | `Upper(text)` | Converts all letters to uppercase. | `text`: string | `Upper("power apps")` → `"POWER APPS"` |
| **Proper** | `Proper(text)` | Capitalizes the first letter of each word. | `text`: string | `Proper("john smith")` → `"John Smith"` |
| **Char** | `Char(number)` | Returns the ASCII character for a given code. | `number`: ASCII code (1–255) | `Char(10)` — newline character |
| **UniChar** | `UniChar(number)` | Returns the Unicode character for a given code point. | `number`: Unicode code point | `UniChar(9829)` → `"♥"` |
| **GUID** | `GUID()` or `GUID(string)` | Creates a new GUID or converts a GUID string to a GUID value. | `string`: optional GUID text | `GUID()` |
| **Boolean** | `Boolean(text)` | Converts the string `"true"` or `"false"` to a boolean. | `text`: `"true"` or `"false"` | `Boolean("true")` → `true` |
| **ParseJSON** | `ParseJSON(jsonString)` | Parses a JSON string and returns an untyped object. Use `Text()`, `Value()` etc. to cast fields. | `jsonString`: valid JSON text | `Value(ParseJSON(apiResponse).price)` |
| **JSON** | `JSON(value [, format])` | Serializes a table, record, or value to a JSON string. | `value`: data · `format`: `JSONFormat` enum (e.g. `JSONFormat.IndentFour`) | `JSON(MyCollection, JSONFormat.IndentFour)` |
| **EncodeUrl** | `EncodeUrl(text)` | URL-encodes a string (replaces special chars with `%XX`). | `text`: string to encode | `EncodeUrl("hello world")` → `"hello%20world"` |
| **PlainText** | `PlainText(text)` | Strips HTML/XML tags from a string. | `text`: HTML/XML string | `PlainText("<b>Hello</b>")` → `"Hello"` |
| **Decimal** | `Decimal(text [, language])` | Converts text to a decimal number. | `text`: string · `language`: locale | `Decimal("1.23")` |
| **Float** | `Float(text [, language])` | Converts text to a floating-point number. | `text`: string · `language`: locale | `Float("3.14")` |

---

## 3. Date & Time Functions

> Work with date and time values, arithmetic, formatting, and locale-aware operations.

| Function | Syntax | Description | Parameters | Example |
|----------|--------|-------------|------------|---------|
| **Now** | `Now()` | Returns the current local date and time. | — | `Now()` |
| **Today** | `Today()` | Returns the current local date (time is midnight). | — | `Today()` |
| **UTCNow** | `UTCNow()` | Returns the current UTC date and time (timezone-independent). | — | `UTCNow()` |
| **UTCToday** | `UTCToday()` | Returns the current UTC date (timezone-independent). | — | `UTCToday()` |
| **Date** | `Date(year, month, day)` | Constructs a date value from year, month, and day. | `year`, `month`, `day`: numbers | `Date(2024, 12, 25)` |
| **Time** | `Time(hour, minute, second)` | Constructs a time value. | `hour`, `minute`, `second`: numbers | `Time(14, 30, 0)` |
| **DateAdd** | `DateAdd(date, number, units)` | Adds/subtracts an interval to a date. | `date`: date/time · `number`: amount (negative to subtract) · `units`: `TimeUnit.Days`, `.Months`, `.Years`, `.Hours`, etc. | `DateAdd(Today(), 30, TimeUnit.Days)` |
| **DateDiff** | `DateDiff(startDate, endDate [, units])` | Returns the difference between two dates. | `startDate`, `endDate`: date/time values · `units`: `TimeUnit` enum (default days) | `DateDiff(HireDate, Today(), TimeUnit.Years)` |
| **DateValue** | `DateValue(dateText [, language])` | Parses a date string into a date value. | `dateText`: date string · `language`: locale | `DateValue("January 15, 2024")` |
| **TimeValue** | `TimeValue(timeText [, language])` | Parses a time string into a time value. | `timeText`: time string · `language`: locale | `TimeValue("2:30 PM")` |
| **DateTimeValue** | `DateTimeValue(text [, language])` | Parses a date and time string into a combined value. | `text`: date+time string · `language`: locale | `DateTimeValue("2024-01-15 14:30:00")` |
| **Year** | `Year(date)` | Extracts the year from a date. | `date`: date/time value | `Year(Today())` → `2024` |
| **Month** | `Month(date)` | Extracts the month (1–12) from a date. | `date`: date/time value | `Month(Today())` |
| **Day** | `Day(date)` | Extracts the day of the month (1–31) from a date. | `date`: date/time value | `Day(Today())` |
| **Hour** | `Hour(datetime)` | Extracts the hour (0–23) from a date/time. | `datetime`: date/time value | `Hour(Now())` |
| **Minute** | `Minute(datetime)` | Extracts the minute (0–59) from a date/time. | `datetime`: date/time value | `Minute(Now())` |
| **Second** | `Second(datetime)` | Extracts the second (0–59) from a date/time. | `datetime`: date/time value | `Second(Now())` |
| **Weekday** | `Weekday(date [, startOfWeek])` | Returns the weekday number (1 = Sunday by default). | `date`: date value · `startOfWeek`: `StartOfWeek` enum | `Weekday(Today(), StartOfWeek.Monday)` |
| **WeekNum** | `WeekNum(date [, startOfWeek])` | Returns the week number of the year. | `date`: date value · `startOfWeek`: `StartOfWeek` enum | `WeekNum(Today())` |
| **ISOWeekNum** | `ISOWeekNum(date)` | Returns the ISO 8601 week number. | `date`: date value | `ISOWeekNum(Today())` |
| **EDate** | `EDate(date, months)` | Returns a date the specified number of months before/after a date. | `date`: start date · `months`: number of months | `EDate(InvoiceDate, 1)` — one month later |
| **EOMonth** | `EOMonth(date, months)` | Returns the last day of the month N months from a date. | `date`: start date · `months`: offset months | `EOMonth(Today(), 0)` — last day of current month |
| **TimeZoneOffset** | `TimeZoneOffset([datetime])` | Returns the offset between UTC and the user's local time in minutes. | `datetime`: optional date/time | `TimeZoneOffset()` |
| **IsToday** | `IsToday(date)` | Returns `true` if the date is today (local time). | `date`: date/time value | `IsToday(DueDate)` |
| **IsUTCToday** | `IsUTCToday(date)` | Returns `true` if the timezone-independent date is today. | `date`: timezone-independent date value | `IsUTCToday(CreatedOn)` |
| **Text (date format)** | `Text(date, "[$-en-US]mmmm dd, yyyy")` | Formats a date as a string using a format pattern. | `date`: date value · `format`: locale-prefixed format pattern | `Text(Today(), "[$-en-US]mmmm dd, yyyy")` → `"January 15, 2024"` |

---

## 4. Math Functions

> Perform arithmetic, rounding, and numeric operations.

| Function | Syntax | Description | Parameters | Example |
|----------|--------|-------------|------------|---------|
| **Abs** | `Abs(number)` | Returns the absolute value. | `number`: numeric value | `Abs(-42)` → `42` |
| **Round** | `Round(number, numDigits)` | Rounds to the nearest value at the specified decimal places. | `number`: value · `numDigits`: decimal places (negative rounds left of decimal) | `Round(3.567, 2)` → `3.57` |
| **RoundUp** | `RoundUp(number, numDigits)` | Rounds toward positive infinity. | `number`, `numDigits` | `RoundUp(3.1, 0)` → `4` |
| **RoundDown** | `RoundDown(number, numDigits)` | Rounds toward zero. | `number`, `numDigits` | `RoundDown(3.9, 0)` → `3` |
| **Trunc** | `Trunc(number [, numDigits])` | Removes the fractional portion (truncates toward zero). | `number`: value · `numDigits`: decimal places (default 0) | `Trunc(3.999)` → `3` |
| **Int** | `Int(number)` | Rounds down to the nearest integer (toward negative infinity). | `number`: value | `Int(-3.1)` → `-4` |
| **Mod** | `Mod(number, divisor)` | Returns the remainder after division. | `number`: dividend · `divisor`: divisor | `Mod(10, 3)` → `1` |
| **Power** | `Power(base, exponent)` or `base ^ exponent` | Raises a number to a power. | `base`: base number · `exponent`: power | `Power(2, 8)` → `256` |
| **Sqrt** | `Sqrt(number)` | Returns the square root. | `number`: non-negative value | `Sqrt(144)` → `12` |
| **Exp** | `Exp(number)` | Returns *e* raised to the given power. | `number`: exponent | `Exp(1)` → `2.718...` |
| **Ln** | `Ln(number)` | Returns the natural logarithm. | `number`: positive value | `Ln(Exp(1))` → `1` |
| **Log** | `Log(number [, base])` | Returns the logarithm; default base is 10. | `number`: value · `base`: logarithm base | `Log(100)` → `2` |
| **Pi** | `Pi()` | Returns the value of π (3.14159…). | — | `Pi() * Radius ^ 2` |
| **Rand** | `Rand()` | Returns a pseudo-random decimal between 0 (inclusive) and 1 (exclusive). | — | `Round(Rand() * 100, 0)` — random integer 0–100 |
| **RandBetween** | `RandBetween(bottom, top)` | Returns a random integer between bottom and top (inclusive). | `bottom`: lower bound · `top`: upper bound | `RandBetween(1, 6)` — dice roll |
| **Sum** | `Sum(table, expression)` or `Sum(value1, value2, …)` | Sums a column expression over a table, or a list of numbers. | `table`: data source · `expression`: numeric formula per row | `Sum(Orders, Quantity * UnitPrice)` |
| **Dec2Hex** | `Dec2Hex(number [, places])` | Converts a decimal number to a hexadecimal string. | `number`: decimal integer · `places`: minimum digit width | `Dec2Hex(255)` → `"FF"` |
| **Hex2Dec** | `Hex2Dec(number)` | Converts a hexadecimal string to a decimal number. | `number`: hex string | `Hex2Dec("FF")` → `255` |

---

## 5. Statistical Functions

> Aggregate and analyze collections of values.

| Function | Syntax | Description | Parameters | Example |
|----------|--------|-------------|------------|---------|
| **Average** | `Average(table, expression)` or `Average(v1, v2, …)` | Calculates the arithmetic mean. | `table`: source · `expression`: numeric formula | `Average(Scores, Value)` |
| **Max** | `Max(table, expression)` or `Max(v1, v2, …)` | Returns the maximum value. | `table`: source · `expression`: numeric formula | `Max(Products, Price)` |
| **Min** | `Min(table, expression)` or `Min(v1, v2, …)` | Returns the minimum value. | `table`: source · `expression`: numeric formula | `Min(Products, Price)` |
| **Count** | `Count(table)` | Counts rows in a single-column table that contain numbers. | `table`: single-column numeric table | `Count(Scores)` |
| **CountA** | `CountA(table)` | Counts non-empty rows in a single-column table. | `table`: single-column table | `CountA(Names)` |
| **CountIf** | `CountIf(table, condition)` | Counts rows satisfying one or more conditions. | `table`: source · `condition`: boolean formula | `CountIf(Orders, Status = "Pending")` |
| **CountRows** | `CountRows(table)` | Counts the total number of rows in a table. | `table`: any table | `CountRows(Employees)` |
| **Sum** | `Sum(table, expression)` | Sums a numeric expression over a table. | `table`: source · `expression`: numeric formula | `Sum(Cart, Price * Qty)` |
| **StdevP** | `StdevP(table, expression)` | Returns the standard deviation of a population. | `table`: source · `expression`: numeric formula | `StdevP(Measurements, Value)` |
| **VarP** | `VarP(table, expression)` | Returns the variance of a population. | `table`: source · `expression`: numeric formula | `VarP(Measurements, Value)` |

---

## 6. Table & Data Functions

> Query, filter, shape, and transform tables and data sources.

| Function | Syntax | Description | Parameters | Example |
|----------|--------|-------------|------------|---------|
| **Filter** | `Filter(table, condition1 [, condition2, …])` | Returns rows matching all conditions. Supports delegation. | `table`: source · `conditionN`: boolean formula | `Filter(Products, Category = "Books", Price < 20)` |
| **LookUp** | `LookUp(table, condition [, result])` | Returns the first matching record (or a field from it). | `table`: source · `condition`: boolean formula · `result`: field expression | `LookUp(Employees, ID = SelectedID, FullName)` |
| **Search** | `Search(table, searchText, column1 [, column2, …])` | Returns rows where any specified column contains the search string (case-insensitive). | `table`: source · `searchText`: string · `columnN`: column names (as text) | `Search(Products, SearchInput.Text, "Name", "Description")` |
| **Sort** | `Sort(table, expression [, order])` | Sorts a table by a formula expression. | `table`: source · `expression`: sort key · `order`: `SortOrder.Ascending` (default) or `SortOrder.Descending` | `Sort(Employees, LastName)` |
| **SortByColumns** | `SortByColumns(table, column1 [, order1, column2, order2, …])` | Sorts by one or more columns by name. | `table`: source · `columnN`: column name string · `orderN`: `SortOrder` enum | `SortByColumns(Inventory, "Category", SortOrder.Ascending, "Price", SortOrder.Descending)` |
| **AddColumns** | `AddColumns(table, name1, expression1 [, …])` | Returns a table with additional calculated columns. | `table`: source · `name1`: new column name · `expression1`: formula | `AddColumns(Orders, "Total", Quantity * UnitPrice)` |
| **DropColumns** | `DropColumns(table, column1 [, …])` | Returns a table without the specified columns. | `table`: source · `columnN`: column names | `DropColumns(RawData, "InternalID", "AuditLog")` |
| **ShowColumns** | `ShowColumns(table, column1 [, …])` | Returns a table with only the specified columns. | `table`: source · `columnN`: column names | `ShowColumns(Employees, "Name", "Email")` |
| **RenameColumns** | `RenameColumns(table, oldName1, newName1 [, …])` | Returns a table with renamed columns. | `table`: source · `oldNameN`: current name · `newNameN`: new name | `RenameColumns(Source, "emp_id", "EmployeeID")` |
| **Distinct** | `Distinct(table, expression)` | Returns a single-column table of unique values. | `table`: source · `expression`: formula for the value to deduplicate | `Distinct(Orders, CustomerName)` |
| **GroupBy** | `GroupBy(table, column1 [, column2, …], groupName)` | Groups rows into a nested table. | `table`: source · `columnN`: grouping columns · `groupName`: name for the nested records column | `GroupBy(Orders, "Category", "OrdersPerCategory")` |
| **Ungroup** | `Ungroup(table, groupName)` | Reverses a `GroupBy`, flattening nested tables. | `table`: grouped table · `groupName`: nested column name | `Ungroup(GroupedOrders, "OrdersPerCategory")` |
| **ForAll** | `ForAll(table, formula)` | Evaluates a formula for every row; returns a table of results. | `table`: source · `formula`: expression (use `ThisRecord` to reference the row) | `ForAll(Emails, Notify(Subject))` |
| **Table** | `Table(record1 [, record2, …])` | Creates an in-memory table from records. | `recordN`: inline records `{col: value}` | `Table({Name: "Alice", Age: 30}, {Name: "Bob", Age: 25})` |
| **First** | `First(table)` | Returns the first record of a table. | `table`: source | `First(SortByColumns(Products, "Price")).Name` |
| **FirstN** | `FirstN(table, count)` | Returns the first N records. | `table`: source · `count`: number of rows | `FirstN(Leaderboard, 10)` |
| **Last** | `Last(table)` | Returns the last record of a table. | `table`: source | `Last(AuditLog).Timestamp` |
| **LastN** | `LastN(table, count)` | Returns the last N records. | `table`: source · `count`: number of rows | `LastN(Transactions, 5)` |
| **Index** | `Index(table, index)` | Returns the record at a specific 1-based row position. | `table`: source · `index`: row number | `Index(Choices, 3)` |
| **Sequence** | `Sequence(records [, start, step])` | Generates a single-column table of sequential numbers. Useful with `ForAll`. | `records`: row count · `start`: first value (default 1) · `step`: increment (default 1) | `ForAll(Sequence(5), Value * 2)` → `2, 4, 6, 8, 10` |
| **Shuffle** | `Shuffle(table)` | Returns the table rows in a random order. | `table`: source | `Shuffle(QuizQuestions)` |
| **Choices** | `Choices(column)` | Returns a table of valid choices for a lookup column. | `column`: fully qualified lookup column reference | `Choices([@'Accounts'].Status)` |

---

## 7. Collection Functions

> Create and modify in-memory collections and persist changes to data sources.

| Function | Syntax | Description | Parameters | Example |
|----------|--------|-------------|------------|---------|
| **Collect** | `Collect(collection, item1 [, item2, …])` | Adds records to a collection (creates it if it doesn't exist). Does not remove existing records. | `collection`: named collection · `itemN`: record, table, or value | `Collect(Cart, {Product: ProductName, Qty: 1})` |
| **ClearCollect** | `ClearCollect(collection, item1 [, item2, …])` | Clears all records from a collection and then adds new records. | `collection`: named collection · `itemN`: new records | `ClearCollect(SelectedItems, Filter(Products, InStock))` |
| **Clear** | `Clear(collection)` | Removes all records from a collection. | `collection`: named collection | `Clear(Cart)` |
| **Patch** | `Patch(dataSource, baseRecord, changeRecord1 [, …])` | Creates or updates a record in a data source. Returns the modified record. | `dataSource`: source · `baseRecord`: existing record or `Defaults(source)` for new · `changeRecordN`: fields to set | `Patch(Accounts, LookUp(Accounts, ID=EditID), {Status: "Active"})` |
| **Remove** | `Remove(dataSource, record1 [, record2, …] [, All])` | Deletes specific records from a data source. | `dataSource`: source · `recordN`: records to remove · `All`: removes all matching records | `Remove(Tasks, BrowseGallery.Selected)` |
| **RemoveIf** | `RemoveIf(dataSource, condition1 [, condition2, …])` | Deletes all records satisfying the conditions. | `dataSource`: source · `conditionN`: boolean formula | `RemoveIf(Tasks, Status = "Completed")` |
| **Update** | `Update(collection, oldRecord, newRecord [, All])` | Replaces a record in a collection with a new record. | `collection`: in-memory collection · `oldRecord`: record to replace · `newRecord`: replacement | `Update(Cart, EditItem, {Product: "Pen", Qty: 3})` |
| **UpdateIf** | `UpdateIf(dataSource, condition, changeRecord)` | Modifies all records in a data source that match a condition. | `dataSource`: source · `condition`: boolean formula · `changeRecord`: fields to update | `UpdateIf(Tasks, AssignedTo = CurrentUser, {Status: "In Review"})` |
| **Relate** | `Relate(table1RelatedField, record)` | Creates a relationship between two records (one-to-many or many-to-many). | `table1RelatedField`: the related table column · `record`: record from the related table | `Relate(Account.Contacts, NewContact)` |
| **Unrelate** | `Unrelate(table1RelatedField, record)` | Removes a relationship between two records. | `table1RelatedField`: the related column · `record`: record to unrelate | `Unrelate(Account.Contacts, RemovedContact)` |

---

## 8. Forms & Controls Functions

> Manage form modes, submit data, and interact with control states.

| Function | Syntax | Description | Parameters | Example |
|----------|--------|-------------|------------|---------|
| **NewForm** | `NewForm(form)` | Switches a form control into **New** mode so a new record can be created. | `form`: form control name | `NewForm(Form1)` |
| **EditForm** | `EditForm(form)` | Switches a form control into **Edit** mode to modify an existing record. | `form`: form control name | `EditForm(Form1)` |
| **ViewForm** | `ViewForm(form)` | Switches a form control into **View** mode (read-only). | `form`: form control name | `ViewForm(Form1)` |
| **ResetForm** | `ResetForm(form)` | Resets a form to the last saved state of its item; discards unsaved changes. | `form`: form control name | `ResetForm(Form1)` |
| **SubmitForm** | `SubmitForm(form)` | Validates and saves the form's current item to its data source. Triggers `OnSuccess` or `OnFailure`. | `form`: form control name | `SubmitForm(Form1)` |
| **Reset** | `Reset(control)` | Resets any input control to its default value, discarding user input. | `control`: input control name | `Reset(TextInput1)` |
| **Select** | `Select(control [, rowOrColumn, childControl])` | Programmatically fires the `OnSelect` of a control — useful in testing or cascading logic. | `control`: target control · `rowOrColumn`: gallery row (optional) · `childControl`: nested control (optional) | `Select(Button1)` |
| **SetFocus** | `SetFocus(control)` | Moves keyboard/input focus to the specified control. | `control`: input control | `SetFocus(SearchInput)` |

---

## 9. Information Functions

> Inspect values, data types, and states of controls and variables.

| Function | Syntax | Description | Parameters | Example |
|----------|--------|-------------|------------|---------|
| **IsBlank** | `IsBlank(value)` | Returns `true` if the value is blank/null/empty string. | `value`: any expression | `IsBlank(TextInput1.Text)` |
| **IsBlankOrError** | `IsBlankOrError(value)` | Returns `true` if the value is blank **or** an error. | `value`: any expression | `IsBlankOrError(LookupResult)` |
| **IsEmpty** | `IsEmpty(table)` | Returns `true` if a table has zero rows. | `table`: table or collection | `IsEmpty(Cart)` |
| **IsError** | `IsError(value)` | Returns `true` if the value is an error. | `value`: any expression | `IsError(DivisionResult)` |
| **IsNumeric** | `IsNumeric(value)` | Returns `true` if the value can be interpreted as a number. | `value`: any expression | `IsNumeric(TextInput1.Text)` |
| **IsMatch** | `IsMatch(text, pattern [, options])` | Returns `true` if the text matches a regex pattern or built-in `Match.*` enum. | `text`: string · `pattern`: regex or `Match` enum | `IsMatch(ZipCode, "\d{5}")` |
| **IsToday** | `IsToday(date)` | Returns `true` if the date falls on today in local time. | `date`: date/time value | `IsToday(DueDate)` |
| **IsUTCToday** | `IsUTCToday(date)` | Returns `true` if the timezone-independent date is today. | `date`: timezone-independent date | `IsUTCToday(CreatedOn)` |
| **IsType** | `IsType(value, tableType)` | Returns `true` if a polymorphic record reference is of the specified table type. | `value`: record reference · `tableType`: table identifier | `IsType(Owner, Accounts)` |
| **DataSourceInfo** | `DataSourceInfo(source, info, column)` | Returns metadata about a data source (e.g. max length, required). | `source`: data source · `info`: `DataSourceInfo.*` enum · `column`: column name | `DataSourceInfo(Accounts, DataSourceInfo.MaxLength, "Name")` |

---

## 10. Error Functions

> Detect, handle, and generate errors gracefully.

| Function | Syntax | Description | Parameters | Example |
|----------|--------|-------------|------------|---------|
| **IfError** | `IfError(value1, replacement1 [, value2, replacement2, … , defaultResult])` | Evaluates values in order; returns the first non-error value, or its corresponding replacement. | `valueN`: expression that may error · `replacementN`: fallback · `defaultResult`: final fallback | `IfError(1/0, -1)` → `-1` |
| **Error** | `Error(record)` | Generates a custom error with a specific error record. Use inside `IfError` replacements. | `record`: error record with `Kind`, `Message`, etc. | `Error({Kind: ErrorKind.Validation, Message: "Value out of range"})` |
| **Errors** | `Errors(dataSource [, record])` | Returns a table of errors from the last change to a data source. Use after `Patch`/`SubmitForm`. | `dataSource`: source · `record`: specific record (optional) | `Errors(Accounts)` — check for patch errors |
| **IsError** | `IsError(value)` | Returns `true` if the value is an error value. | `value`: any expression | `IsError(ParseJSON(BadJSON))` |
| **IsBlankOrError** | `IsBlankOrError(value)` | Returns `true` if blank **or** error — useful for combined null/error guarding. | `value`: any expression | `If(IsBlankOrError(result), "N/A", Text(result))` |

---

## 11. Variable Functions

> Store and manage state with global variables, context variables, and named values.

| Function | Syntax | Description | Parameters | Example |
|----------|--------|-------------|------------|---------|
| **Set** | `Set(variableName, value)` | Sets the value of a **global variable** (app-wide, all screens). Creates it if it doesn't exist. | `variableName`: identifier · `value`: any value | `Set(IsLoading, true)` |
| **UpdateContext** | `UpdateContext({name1: value1 [, name2: value2, …]})` | Sets one or more **context variables** scoped to the current screen. | Record of name:value pairs | `UpdateContext({ShowModal: true, SelectedID: Gallery1.Selected.ID})` |
| **With** | `With({name1: value1, …}, formula)` | Assigns named values for use within a formula scope — avoids repeating sub-expressions. | `{nameN: valueN}`: scope record · `formula`: expression using those names | `With({price: Product.Price, tax: Product.Price * 0.1}, price + tax)` |

> **Tip:** Use `Set` for cross-screen state, `UpdateContext` for screen-local state, and `With` for intermediate calculations within a single formula.

---

## 12. Navigation Functions

> Move between screens and control app lifecycle.

| Function | Syntax | Description | Parameters | Example |
|----------|--------|-------------|------------|---------|
| **Navigate** | `Navigate(screen [, transition [, contextRecord]])` | Displays a different screen. Optionally passes context variables. | `screen`: target screen · `transition`: `ScreenTransition.*` enum · `contextRecord`: record of context vars to set | `Navigate(DetailScreen, ScreenTransition.Fade, {SelectedItem: Gallery1.Selected})` |
| **Back** | `Back([transition])` | Returns to the previously viewed screen. | `transition`: `ScreenTransition.*` enum (optional) | `Back(ScreenTransition.UnCover)` |
| **Exit** | `Exit([logout])` | Exits the app. Optionally signs out the current user. | `logout`: `true` to sign out (optional) | `Exit()` |

---

## 13. Data Source Functions

> Inspect, refresh, and manage connections to external data sources.

| Function | Syntax | Description | Parameters | Example |
|----------|--------|-------------|------------|---------|
| **Refresh** | `Refresh(dataSource)` | Retrieves fresh data from the data source, discarding cached data. | `dataSource`: connected data source | `Refresh(Accounts)` |
| **Revert** | `Revert(dataSource [, record])` | Reloads records from a data source and clears any pending errors. | `dataSource`: source · `record`: optional specific record | `Revert(Tasks)` |
| **Defaults** | `Defaults(dataSource)` | Returns a record with the default values for all columns of a data source — use with `Patch` to create new records. | `dataSource`: data source | `Patch(Accounts, Defaults(Accounts), {Name: "New Corp"})` |
| **RecordInfo** | `RecordInfo(record, infoType)` | Returns metadata about a specific record (e.g. whether the user can edit it). | `record`: data record · `infoType`: `RecordInfo.*` enum | `RecordInfo(Gallery1.Selected, RecordInfo.EditPermission)` |
| **DataSourceInfo** | `DataSourceInfo(source, info, column)` | Returns metadata about a data source column (max length, required, display name, etc.). | `source`: data source · `info`: `DataSourceInfo.*` enum · `column`: column name | `DataSourceInfo(Contacts, DataSourceInfo.Required, "Email")` |
| **AsType** | `AsType(value, tableType)` | Casts a polymorphic record reference to a specific table type, enabling typed field access. | `value`: record reference · `tableType`: table identifier | `AsType(Owner, Accounts).Name` |

---

## 14. AI Functions

> Use built-in AI capabilities for text analysis and generation.

| Function | Syntax | Description | Parameters | Example |
|----------|--------|-------------|------------|---------|
| **AIClassify** | `AIClassify(text, categories [, allowMultiple])` | Classifies text into one or more of the provided categories. | `text`: input string · `categories`: table of category strings · `allowMultiple`: boolean | `AIClassify(FeedbackText, ["Positive","Negative","Neutral"])` |
| **AIExtract** | `AIExtract(text, entity)` | Extracts named entities (names, dates, phone numbers, etc.) from text. | `text`: input string · `entity`: entity type (e.g. `"PhoneNumber"`) | `AIExtract(EmailBody, "PhoneNumber")` |
| **AIReply** | `AIReply(text)` | Drafts a contextual reply to the given message. | `text`: the original message | `AIReply(IncomingMessage.Text)` |
| **AISentiment** | `AISentiment(text)` | Detects sentiment — returns `"Positive"`, `"Negative"`, or `"Neutral"`. | `text`: input string | `AISentiment(ReviewText)` |
| **AISummarize** | `AISummarize(text)` | Generates a concise summary of the provided text. | `text`: input string | `AISummarize(ArticleContent)` |
| **AITranslate** | `AITranslate(text, targetLanguage)` | Translates text to the target language (e.g. `"fr"`, `"de"`). | `text`: source string · `targetLanguage`: ISO language code | `AITranslate(Message, "es")` |

> **Note:** AI functions require a Copilot/AI-enabled Power Apps environment.

---

## 15. Web Functions

> Launch URLs, encode data, access parameters, and interact with the browser.

| Function | Syntax | Description | Parameters | Example |
|----------|--------|-------------|------------|---------|
| **Launch** | `Launch(address [, paramName1, paramValue1, …] [, target])` | Opens a URL or canvas app. Supports named parameters and launch targets. | `address`: URL or app ID · `paramNameN`/`paramValueN`: query parameters · `target`: `LaunchTarget.*` enum | `Launch("https://bing.com/search", "q", SearchInput.Text, LaunchTarget.New)` |
| **Param** | `Param(name)` | Reads a parameter passed to the app at launch. | `name`: parameter name string | `Param("recordId")` |
| **EncodeUrl** | `EncodeUrl(text)` | Encodes a string for safe use in a URL (replaces spaces and special chars with `%XX`). | `text`: string to encode | `"https://example.com/search?q=" & EncodeUrl(SearchBox.Text)` |
| **Download** | `Download(url)` | Downloads a file from a URL to the device and returns the local URI. | `url`: file URL | `Download(Attachment.Value)` |
| **PlainText** | `PlainText(html)` | Strips HTML/XML tags and returns plain text. | `html`: HTML/XML string | `PlainText("<p>Hello <b>World</b></p>")` → `"Hello World"` |
| **HashTags** | `HashTags(text)` | Extracts all `#hashtag` strings from text; returns a single-column table. | `text`: source string | `HashTags(TweetText)` |

---

## 16. Color Functions

> Create and manipulate color values for control properties.

| Function | Syntax | Description | Parameters | Example |
|----------|--------|-------------|------------|---------|
| **Color** | `Color.colorName` | Accesses a built-in named color constant. | `colorName`: a color name (e.g. `Red`, `AliceBlue`) | `Color.SteelBlue` |
| **ColorValue** | `ColorValue(cssText)` | Converts a CSS color name or hex code string to a color value. | `cssText`: CSS color string | `ColorValue("#FF5733")` |
| **RGBA** | `RGBA(red, green, blue, alpha)` | Creates a color from red, green, blue (0–255) and alpha (0–1) components. | `red`, `green`, `blue`: 0–255 · `alpha`: 0.0–1.0 | `RGBA(255, 87, 51, 1)` |
| **ColorFade** | `ColorFade(color, fadeDelta)` | Lightens or darkens a color. Positive delta lightens; negative darkens. Range: -1 to 1. | `color`: color value · `fadeDelta`: -1 to 1 | `ColorFade(Color.Blue, 0.5)` — lighter blue |

---

## 17. Offline Functions

> Save and load data locally on the device for offline scenarios.

| Function | Syntax | Description | Parameters | Example |
|----------|--------|-------------|------------|---------|
| **SaveData** | `SaveData(collection, name)` | Saves a collection to the device's local storage under a given name. | `collection`: in-memory collection · `name`: storage key string | `SaveData(OfflineQueue, "PendingOrders")` |
| **LoadData** | `LoadData(collection, name [, ignoreNonExistent])` | Loads a previously saved collection from local storage into a named collection. | `collection`: target collection · `name`: storage key · `ignoreNonExistent`: suppress error if key missing | `LoadData(OfflineQueue, "PendingOrders", true)` |
| **ClearData** | `ClearData([name])` | Removes a saved collection from local storage. Omit `name` to clear all saved data. | `name`: storage key (optional) | `ClearData("PendingOrders")` |

> **Use case:** On app start, call `LoadData` if `Connection.Connected` is `false`. Sync queued records with `ForAll` + `Patch` when back online, then `ClearData`.

---

## 18. Signals Functions

> Read device sensors, network state, and current user/app information.

| Function | Syntax | Description | Parameters | Example |
|----------|--------|-------------|------------|---------|
| **App** | `App.property` | Returns information about the running app (e.g. `App.ActiveScreen`, `App.Width`, `App.Height`). | `property`: app property name | `App.ActiveScreen.Name` |
| **User** | `User().property` | Returns information about the signed-in user (`FullName`, `Email`, `Image`). | `property`: `FullName`, `Email`, `Image` | `User().Email` |
| **Language** | `Language()` | Returns the IETF language tag for the current user's locale. | — | `Language()` → `"en-US"` |
| **Connection** | `Connection.Connected` / `Connection.Type` | Returns network state (`Connected`: boolean) and type (`"WiFi"`, `"Mobile"`, etc.). | — | `If(Connection.Connected, Refresh(Data), LoadData(Offline, "cache", true))` |
| **Location** | `Location.Latitude` / `Location.Longitude` / `Location.Altitude` | Returns GPS coordinates. Requires enabling the Location signal. | — | `"Lat: " & Text(Location.Latitude, "0.0000")` |
| **Compass** | `Compass.Heading` | Returns the compass heading in degrees (0–360). | — | `Compass.Heading` |
| **Acceleration** | `Acceleration.X` / `.Y` / `.Z` | Returns device accelerometer values in m/s². | — | `Acceleration.Z` |
| **Enable / Disable** | `Enable(signal)` / `Disable(signal)` | Enables or disables a signal (e.g. `Location`) to control battery usage. | `signal`: signal reference | `Enable(Location)` |

---

## 19. Utility Functions

> Miscellaneous helpers for blank values, notifications, concurrency, and more.

| Function | Syntax | Description | Parameters | Example |
|----------|--------|-------------|------------|---------|
| **Blank** | `Blank()` | Returns a blank (null) value. Use to clear a field or set a null in a data source. | — | `Patch(Accounts, Selected, {Phone: Blank()})` |
| **Coalesce** | `Coalesce(value1, value2 [, …])` | Returns the first non-blank value. | `valueN`: expressions | `Coalesce(UserInput, DefaultValue, "N/A")` |
| **Notify** | `Notify(message [, notificationType [, timeout]])` | Shows a banner notification at the top of the app. | `message`: string · `notificationType`: `NotificationType.*` enum · `timeout`: ms | `Notify("Saved!", NotificationType.Success, 3000)` |
| **Concurrent** | `Concurrent(formula1, formula2 [, …])` | Evaluates multiple formulas in parallel — great for speeding up multiple `ClearCollect` or `Refresh` calls. | `formulaN`: formulas to run concurrently | `Concurrent(ClearCollect(A, DataA), ClearCollect(B, DataB))` |
| **With** | `With({name: value, …}, formula)` | Creates a named scope to avoid repeating sub-expressions. | Scope record · formula | `With({d: DateDiff(Start,End,TimeUnit.Days)}, If(d>30,"Overdue","On time"))` |
| **JSON** | `JSON(value [, format])` | Serializes to a JSON string. | `value`: data · `format`: `JSONFormat` enum | `JSON(Form1.Updates)` |
| **ParseJSON** | `ParseJSON(jsonString)` | Deserializes a JSON string to an untyped object. Cast with `Text()`, `Value()`, etc. | `jsonString`: valid JSON | `Text(ParseJSON(apiResult).name)` |
| **GUID** | `GUID()` | Generates a new globally unique identifier. | — | `Set(NewID, GUID())` |
| **Concat** (utility) | `Concat(table, expr, separator)` | Joins all row values into a single string (useful for CSV-style output). | `table`, `expr`, `separator` | `Concat(Tags, Value, "; ")` |
| **PDF** *(experimental)* | `PDF(target [, options])` | Exports a screen or container to a PDF byte object. | `target`: screen or container · `options`: record | `PDF(Screen1)` |
| **Print** | `Print()` | Opens the browser's print dialog for the current screen. | — | `Print()` |
| **Run** | `flowName.Run(param1, param2, …)` | Triggers a Power Automate flow with the Power Apps trigger. | `paramN`: flow input parameters | `MyFlow.Run(Form1.LastSubmit.ID)` |

---

## Quick Reference — Operators

| Operator | Description | Example |
|----------|-------------|---------|
| `&` | Text concatenation | `"Hello" & " " & "World"` |
| `&&` / `And` | Logical AND | `A > 0 && B > 0` |
| `\|\|` / `Or` | Logical OR | `A = 1 \|\| B = 1` |
| `!` / `Not` | Logical NOT | `!IsBlank(x)` |
| `^` / `Power` | Exponentiation | `2^10` → `1024` |
| `=` | Equals (comparison) | `Status = "Active"` |
| `<>` | Not equals | `Role <> "Guest"` |
| `in` | Membership in a table/collection | `"Admin" in RolesTable.Name` |
| `exactin` | Case-sensitive membership | `"admin" exactin RolesTable.Name` |
| `[@tableName]` | Disambiguate a global data source name | `[@Accounts]` |
| `ThisRecord` | Reference the current record in `ForAll`/`Filter` | `ForAll(Items, ThisRecord.Price * 1.1)` |
| `As` | Rename `ThisRecord` in nested contexts | `ForAll(Orders As o, o.Total)` |

---

*Last updated: April 2026 · Based on Power FX for canvas apps*
