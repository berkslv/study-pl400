# Exercise - Work with Dataverse relational data

In this exercise, you'll enhance the Contoso Hot Desking canvas app to work with Dataverse one-to-many and many-to-many relationships.

## Objectives

- Work with one-to-many and many-to-one relationships
- Work with many-to-many relationships

## Prerequisite

An environment with Microsoft Dataverse.

---

## Exercise 1: Import a solution

### Task 1: Import the starting solution

1. Download the [ContosoHotDesking_1_0_0_0.zip](https://github.com/MicrosoftDocs/mslearn-developer-tools-power-platform/blob/master/power-apps/relational-data/ContosoHotDesking_1_0_0_0.zip) file.
2. Navigate to [Power Apps maker portal](https://make.powerapps.com/) and select your environment.
3. Select **Solutions > Import Solution**.
4. Select **Browse**, choose the zip file, and select **Open**.
5. Select **Next** twice.
6. In the **Select a connection** dropdown, select your connection or create a **+ New connection**.
7. Select **Import** and wait for the import to complete.

### Task 2: Load sample data

1. Open the **Contoso hot desking** solution.
2. Select **Cloud flows** and open the **Load Sample Hot Desk Data** flow.
3. Select **Run > Run flow > Done**.
4. Wait for the flow to complete (select **Refresh** to check status — look for **Succeeded**).

### Task 3: Run apps

1. Open the **Hot Desking Manager** application.
2. Verify sample data exists in **Desks view**, **Locations view**, and **Desk Features view**.
3. Select three locations and select **Edit**. Set a **Primary Contact** user and select **Save**.
4. Open the **Hot Desking** application in **Edit** mode.
5. Select **HomeScreen** and select **Play**.
6. Select **New Reservation**, choose a building, desk type, and desk. Select a future date and book a time slot.
7. Add at least four reservations with different combinations.
8. Close the preview (**X** in upper right).
9. Expand **ReserveDeskScreen > Gallery3 > Button1** and review the **OnSelect** formula. A `Patch()` function creates a new Reservation row with relationships to the desk and current user.
10. Review other formulas to understand the app structure, then select **Back**.

---

## Exercise 2: Create a relationship

### Task: Create a many-to-many relationship

1. Select **Tables** and open the **Desk** table.
2. Select **Relationships** from the **Schema** pane.
3. Select **+ New relationship > Many-to-many**.
4. Set **Related (Many) Table** to **User** and select **Done**.
5. Select **Back**, return to your solution, and select **Publish all customizations**. Wait for publishing to complete.

---

## Exercise 3: Add information to a reservation display

### Task: Edit the application

1. Open the **Hot Desking** application in **Edit** mode.
2. Expand **HomeScreen** and select **Gallery5**.
3. Change the **Items** formula to filter for the current user's reservations using the one-to-many relationship:

    ```powerfx
    LookUp(Users,'Primary Email'=currentUserEmail).'Reservations (contoso_Reservation_ReservedFor_SystemUser)'
    ```

4. Select the **Edit gallery** icon, then go to **Insert > Text label**.
5. Set the new label's **Text** to (uses the reservation → desk relationship):

    ```powerfx
    ThisItem.Desk.Name
    ```

6. Resize and reposition the label.
7. Insert another **Label** and set its **Text** to (two levels deep: reservation → desk → location):

    ```powerfx
    ThisItem.Desk.Location.Phone
    ```

8. Resize and reposition the label.
9. Insert one more **Label** and set its **Text** to (three levels deep with a null check):

    ```powerfx
    If(IsBlank(ThisItem.Desk.Location.'Primary Contact'),"No Primary Contact",ThisItem.Desk.Location.'Primary Contact'.'Full Name')
    ```

10. Resize and reposition the label.
11. Select **Save** and stay in the app edit screen.

---

## Exercise 4: Add a favorite desk

### Task: Add a favorite

1. Expand **FindDeskScreen** and select **GalleryDesks**.
2. Select the **Edit** gallery icon.
3. Go to **Insert > Icons** and insert any icon.
4. Set the icon's **Icon** property to (shows thumbs up filled if already favorited):

    ```powerfx
    If(CountIf(ThisItem.Users, ThisRecord.User = currentUser.User) > 0, Icon.ThumbsUp, Icon.ThumbsUpFilled)
    ```

    > **Note:** `CountIf` has a delegation limitation. For large datasets, consider an alternate approach.

5. Set the icon's **OnSelect** property to relate or unrelate the desk and current user:

    ```powerfx
    If(CountIf(ThisItem.Users, ThisRecord.User = currentUser.User) > 0, Unrelate(ThisItem.Users, currentUser), Relate(ThisItem.Users, currentUser))
    ```

6. Reposition the icon within the gallery.
7. While in edit mode, go to **Insert > Text label**.
8. Set the label's **Text** to (concatenates desk feature names using the many-to-many relationship):

    ```powerfx
    Concat(ThisItem.'Desk Features', Name, " , ")
    ```

9. Resize and reposition the label.
10. **Save** the app and select **Play** to preview.
11. Select the **thumbs up** icon for a desk — the icon should toggle between filled and outline states.
12. Close the preview.

---

## Exercise 5: Filter desks

### Task: Filter for features

1. Select **GalleryDesks**.
2. Modify the **Items** formula to filter desks by the selected feature from a dropdown:

    ```powerfx
    Filter(Desks, Location.Location = FilterLocation.Selected.Location, IsBlank(filterFeatures.Selected) || Desk in filterFeatures.Selected.Desks.Desk)
    ```

3. Save your changes.
4. Select **Play** to preview the app.
5. Select a feature from the dropdown list — only desks that have the selected feature should display.
6. Test with different buildings and features to verify expected behavior.
7. Close the preview and close the app designer.
