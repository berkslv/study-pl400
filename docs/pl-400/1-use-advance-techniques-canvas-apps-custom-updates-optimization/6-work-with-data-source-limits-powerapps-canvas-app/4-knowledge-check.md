# Module assessment

## Work with data source limits (delegation limits) in a Power Apps canvas app — Knowledge Check

**Question 1:** What happens when you delegate a function to a data source?

- Only the first 500 records return from the data source.
- The first 500 records process and then the matches are returned.
- **✓ The data source processes the function against all of the data and returns only the matches.**
- A maximum of 2000 records return.

---

**Question 2:** What should you do when you see the warning triangle and blue line that delegation isn't occurring?

- Adjust the row limit from 500 to 2000 records and then ignore the warning.
- **✓ Determine if the limited returned data causes issues for the functionality of your app and design your app as appropriate.**
- Ignore it, warnings aren't significant and the user knows how to deal with the warning.
- Try a different function because Power Apps doesn't run if there are warnings.

---

**Question 3:** When combining delegable and non-delegable functions in a formula, what happens?

- The data is only limited for the non-delegable portion, which in no way affects the delegable functions.
- You can't combine delegable and non-delegable functions in the same formula.
- Power Apps generates errors only if the app has more than 2000 records.
- **✓ The delegable functions might become non-delegable reducing the amount of data returned by the formula.**
