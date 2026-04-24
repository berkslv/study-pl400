# Check your knowledge

- 6 minutes

## Knowledge check questions

**1. You need to retrieve the value of the contact record's `firstname` column. What method would you use?**

- `formContext.getAttributeValue("firstname")`
- `formContext.getControl("fullname").getValue()`
- ✅ `formContext.getAttribute("firstname").getValue()`

---

**2. Your client script for the main form for the account table references column `accountclassificationcode`. How can you ensure that the script doesn't break and works correctly when other makers edit the form and potentially remove the column?**

- At the start of your script, add the following call `require('accountclassificationcode')`.
- ✅ Add the `accountclassificationcode` column to the script dependencies.
- Mark `accountclassificationcode` column as read only.

---

**3. You've been asked to hide a tab section on a model-driven app form when a record's Status Reason column changes to a given value. Which events would you need to handle for this scenario?**

- ✅ Form OnLoad, Attribute OnChange
- Form OnLoad, Form OnSave
- Attribute OnChange, Form OnSave
