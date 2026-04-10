# Exercise - Create table relationships

- 6 minutes

In this unit, you create a table and then add relationships between tables. You learn how to:

- Create a relationship by using a lookup column.
- Add a one-to-many table relationship.

The simplest way to add a table relationship is to create a lookup column to another table. This action automatically creates a parent-child relationship between tables.

> **Note**: The **Pet** table referred to in this unit was created in the previous exercise. You need to create the related tables to add relationships.

## Create a custom table and add a column

1. Sign in to the [Power Apps maker portal](https://make.powerapps.com/).
2. In the left navigation pane, select **Tables**, then select **New table**, and select **Set advanced properties**.
3. In the *Properties* section of the **New table** pane, enter the following values:
   - **Display name**: *Trick*
   - **Description**: *Pet Tricks*
4. Select the *Primary column* tab and enter the following:
   - **Display name**: *Trick Name*
5. At the bottom of the pane, select **Save**.
6. On the **Trick** table, select **New**, then select **Column**.
7. In the **New column** pane, enter:
   - **Display name**: *Level*
   - **Data type**: *Choice*
8. Create the choice values:
   1. Select **New choice** to open the **New choice** pane.
   2. In the **Display name** field, enter *Level*.
   3. Under **Choices**, in the **Label** and **Value** fields, enter *Beginner* and *1*, respectively.
   4. Select **New choice** and add *Proficient* with a value of *2*.
   5. Select **New choice** again and add *Expert* with a value of *3*.
   6. Select **Save**.
9. Under **Sync this choice with**, select *Level*, then select **Save**.

## Create a relationship by using a lookup column

1. On the **Trick** table, select **New**, then select **Column**.
2. In the **New column** pane, enter:
   - **Display name**: *Pet*
   - **Data type**: *Lookup*
   - **Related table**: *Pet*
3. Select **Save**.

This action creates a many-to-one relationship between the Trick and Pet tables. The **Pet** table now has a one-to-many relationship with the **Trick** table, even though a corresponding column wasn't added manually.

## Add a one-to-many relationship

1. In the Power Apps maker portal, select **Tables** from the left navigation pane, then select the **Account** table.
2. In the **Schema** pane, select **Relationships** to view existing relationships.
3. At the top left, select **New relationship**, then select **One-to-many** from the dropdown.
4. In the **One-to-many** pane on the right, in the **Related (Many)** list, select **Pet**.
5. Select **Done**.

A new column named Account, of the Lookup data type, is automatically added to the Pet table.
