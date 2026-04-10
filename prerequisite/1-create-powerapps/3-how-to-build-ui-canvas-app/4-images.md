# Images

- 5 minutes

The **Image** control in Microsoft Power Apps is a **Media** control that displays images from local files or connected data sources. Adding an image—such as a company logo or user photo—helps enhance the visual design of your app. If your data source includes images, you can display them in a **Gallery** control. You can also use an image as a screen background.

> **Note:** Keep in mind that the number and size of images may impact app performance as Microsoft Power Apps loads them. Always consider the image file size and optimize accordingly.

## Key properties

| Property | Description |
| --- | --- |
| **Image** | Specifies the image file name or URL |
| **Image position** | Defines how the image appears within the control (Fill, Fit, Stretch, Tile, Center) |
| **Transparency** | Sets how much background content is visible through the image |

## Insert an image into your app

1. Open your app in **Edit mode**. Select the **Media** button from the left-side rail (you may need to select the ellipsis to reveal it). The **Tree view** panel switches to the **Media** panel.
2. Select the **+ Add Media** button in the **Media** panel, then select **Upload**.
3. In the **Open** dialog box, find and select your image file and choose **Open**. The file appears in the **Images** list with a thumbnail preview.
4. To add the image, either select it from the **Media** panel or insert an **Image** control and set its **Image** property to the uploaded file.

    > **Note:** After inserting an **Image** control, the Properties panel includes a dropdown for the **Image** property. You can also use a formula to display different images conditionally. If the result evaluates to `Data type: image`, the control displays the image accordingly.

5. Resize and position the **Image** control in the top-left corner of the header rectangle. Adjust the **Image position** property to see how each setting (e.g., **Center, Fill, Tile**) affects the image. In this example, **Fit** is the most appropriate option.
