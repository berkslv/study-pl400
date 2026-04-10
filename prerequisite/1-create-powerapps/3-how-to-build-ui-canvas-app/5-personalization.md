# Personalization

- 3 minutes

Microsoft Power Apps supports personalization based on each user's identity information, such as email address, display name, and profile photo. You can use the **User** function to access this data from a user's Microsoft account.

## User function properties

| Property | Description |
| --- | --- |
| `User().Email` | Email address of the current user |
| `User().FullName` | Full name of current user |
| `User().Image` | Profile image of current user |

## Add personalization with User function

1. On the **Home Screen**, insert an **Image** control.
2. Position the image in the upper-right corner of the header rectangle, aligned with the right edge. Resize it to fit within the header.
3. In the **Image** property formula bar, enter:

    ```
    User().Image
    ```

    > **Note:** If your organization has an image for you, you'll see your image appear; otherwise, you'll see a silhouette placeholder.

4. Insert a **Text label** control and in the **Text** property, enter:

    ```
    User().FullName
    ```

5. Position the **Text label** control to the left of the **Image** control.
6. Insert another **Text label** control and position it at the bottom-left corner of the **Home Screen**.
7. In the **Text** property, enter:

    ```
    User().Email
    ```

8. Using the command bar size input field, set the size to `8`.

This example displays personalized information for the signed-in user. You can reuse this information elsewhere in your app—for example, to send a message to the current user using their email address retrieved by the **User** function.
