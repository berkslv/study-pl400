# Use interactive streams and tiles

Interactive dashboards are a one-stop workplace for app users to view real-time information and take action. They're fully configurable, security-role based, and deliver workload information from multiple inputs.

## Dashboard Types

### Multi-stream Dashboards

Multi-stream dashboards display data in real-time over multiple streams:
- No limit on how many streams you can configure
- Data in each stream can be based on a single table
- Each stream can be based on a different table
- Available as **home page dashboards** or **table-specific dashboards**
  - Table-specific dashboards are configured in a different part of the UI and partially preloaded with table-specific configuration

**Multi-stream dashboard layout:**
- A row of **visual filters** at the top
- Data streams displayed below
- Option to hide visual filters by toggling **Hide Visual Filter** from the screen header

**Tile View:**
- Toggle with **Switch to Tile View** button from the command bar
- Stream data is displayed as interactive summary tiles showing the count of rows within each stream
- Toggle back with **Switch to Stream View**

### Single-stream Dashboards

Single-stream dashboards display data in real time over a single stream:
- Based on a table view with visual filters already applied
- Provides a more detailed view of a given table
- Good for monitoring smaller but more complex data
- Always displays tiles on the **right side** of the screen

## Interactive Tiles

Interactive tiles provide summarized insights about your data:
- Show aggregated view of data across queues/views
- Select a tile to drill down to underlying rows
- The content represents the count of rows within a given stream
- Hovering over "View" shows which view the tile's stream is pulled from
- Selecting a tile produces a flyout of the rows in that stream

## Configuring Interactive Dashboard Columns

1. From the Model-driven app editor, select **Dashboards** and select the dashboard to modify
2. In the dashboard editor, select any element and then select **Edit Component** in the command bar
3. A **Set Properties** pop-up enables tweaking the component's properties

## Adding an Existing Dashboard to Your App

1. From the Model-driven app editor, select **+ Add page** from the command bar
2. In the **Add page** pop-up, select **Dashboard** then **Next**
3. The **Add dashboard page** allows selection of the dashboard to add

## Composing Custom Interactive Dashboards

1. Select **Solutions** from the maker portal home screen
2. Select your solution and then the **Objects** tab
3. From the **+ New** drop-down in the command bar, select **Dashboard**
4. Choose from layout options (number of columns) or **Power BI embedded**
5. The **Dashboard: New** screen opens in a separate browser tab

In the dashboard editor, blank sections contain icons to insert:
- **Chart** - add interactive charts (select record, view, and chart type; preview appears on the right)
- **List** - add a list view from your tables
- **Assistant** - only available for one tile per dashboard
- **IFrame** - add an inline frame with a URL
- **Web Resource** - add an HTML page or other web resource

6. When finished, save and close, then insert the new dashboard into the app from the app editor
