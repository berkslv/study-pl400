# Exercise - Work with relational data

- 10 minutes

In this exercise, you learn how to access related data and how to create related records in multiple tables. We use [collections](https://learn.microsoft.com/en-us/power-apps/maker/canvas-apps/create-update-collection/) which only temporarily store data. For a persistent solution, use the [Patch](https://learn.microsoft.com/en-us/power-apps/maker/canvas-apps/functions/function-patch/) function with Dataverse or SharePoint.

## Scenario: Shopping Cart

We create a shopping cart using three tables:

- **Products** — reference table
- **ReceiptHeader** — parent table (one per checkout)
- **ReceiptLineItems** — child table (one per cart item, with foreign keys to ReceiptHeader and Products)

The ReceiptLineItems table has two foreign keys:
- `ReceiptHeaderID` → references `ReceiptHeader.ID` (one-to-many)
- `ProductID` → references `Products.ID` (one-to-many)

## Steps

### Screen 1: Shopping Cart

1. Go to [make.powerapps.com](https://make.powerapps.com/).
2. Select **+ Create** → **Blank app** → **Blank canvas app**.
3. Name the app **Shopping Cart**, select **Tablet** format, then select **Create**.

4. Select **Insert** from the top menu and insert a **Button**.
5. Set the button's **OnSelect** property to:

```powerappsfl
ClearCollect(Products,
 {ID:1, Name:"T-Shirt", Category: "Clothing"},
 {ID:2, Name:"Sweatshirt", Category: "Clothing"},
 {ID:3, Name:"Socks", Category: "Clothing"},
 {ID:4, Name:"Necklace", Category: "Jewelry"},
 {ID:5, Name:"Ring", Category: "Jewelry"},
 {ID:6, Name:"Coffee Mug", Category: "Misc."},
 {ID:7, Name:"Keychain", Category: "Misc."}
)
```

6. Hold **Alt** and select the button to populate the **Products** collection in memory.

7. Add a **Vertical Gallery** (Gallery1) and set **Items** to **Products**.
8. Change **Layout** to **Title and Subtitle**.
9. In the **Fields** pane, set **Title** to **Category** and **Subtitle** to **Name**.
10. Move Gallery1 to the far left side of the screen.
11. Set Gallery1's **OnSelect** property to:

```powerappsfl
Collect(colCart, ThisItem)
```

12. Add a second **Vertical Gallery** (Gallery2) with:
    - **Items** set to **colCart**
    - **Layout** set to **Title and Subtitle**
    - **Title** = **Category**, **Subtitle** = **Name**
    - Delete the right-pointing chevron icon from the gallery.
13. Position Gallery2 on the right side of the screen.

14. Hold **Alt** and select items in Gallery1 to add them to Gallery2 (the cart).

15. Add a second **Button**, set its **Text** to `"Check Out"`, and set **OnSelect** to:

```powerappsfl
Collect(
  ReceiptHeader,
   {
        ID: If(
            IsEmpty(ReceiptHeader),
            1,
            Last(ReceiptHeader).ID + 1
        ),
        Name: User().FullName,
        Date: Today()
    }
);
ForAll(
    colCart,
    Collect(
        ReceiptLineItems,
        {
            ID: If(
                IsEmpty(ReceiptLineItems),
                1,
                Last(ReceiptLineItems).ID + 1
            ),
            ProductID: ThisRecord.ID,
            ReceiptHeaderID: Last(ReceiptHeader).ID
        }
    )
);
Clear(colCart)
```

**What this formula does:**
- Creates a single **ReceiptHeader** record with user info, today's date, and an auto-incremented ID.
- For every item in **colCart**, adds a **ReceiptLineItems** record linking the product to the receipt.
- Clears **colCart** after checkout.

16. Hold **Alt** and select the **Check Out** button to submit the cart.

### Screen 2: Order History

17. Create a **New Screen** (Screen2).
18. Add two **Vertical Galleries** formatted the same as Screen 1.
    - **Gallery3** (left): set **Items** to **ReceiptHeader**; change **Subtitle** text to `ThisItem.Date`.
    - **Gallery4** (right):
      - Set **Items** to:

        ```powerappsfl
        Filter(ReceiptLineItems, ReceiptHeaderID=Gallery3.Selected.ID)
        ```

      - Set **Title** text to:

        ```powerappsfl
        LookUp(Products, ID=ThisItem.ProductID).Name
        ```

      - Set **Subtitle** text to:

        ```powerappsfl
        LookUp(ReceiptHeader, ID=ThisItem.ReceiptHeaderID).Name
        ```

19. You now have a functioning order history page. Selecting a receipt in Gallery3 shows its line items in Gallery4.

## Summary

This exercise demonstrates:
- Using **collections** to simulate parent/child relational tables.
- Using **Filter** to show child records for a selected parent.
- Using **LookUp** to resolve foreign key IDs to human-readable values.
- Using **ForAll** with **Collect** to write multiple related records at once.
