# Summary: Configuring Model-Driven Apps — Forms, Views, Charts, and Dashboards

> **Source files:** 01-forms-overview.md, 02-forms-elements.md, 03-configure-multiple-forms.md, 04-specialized-form-components.md, 05-configure-views.md, 06-configure-grids.md, 07-configure-special-views.md, 08-configure-charts.md, 09-dashboards-overview.md, 10-streams-tiles.md, 11-knowledge-check.md

---

## Form Types

| Form type | Description |
| --- | --- |
| **Main** | Primary UI for viewing and interacting with table data; most options; responsive |
| **Quick Create** | Streamlined data entry; appears on **Create** / **+ New** actions; one per table |
| **Quick View** | Embeds in a Main form to display related row data from a lookup; read-only |
| **Card** | Compact format for mobile devices; used in views via the Read-only Grid control |

- Each table can have any or all form types associated with it
- **Card** forms are the correct choice when displaying form data on a dashboard

---

## Form Design and Structure

- Forms have a **header**, **body** (tabs → sections → columns), and **footer**
- Goal for Main forms: design **one per table** usable everywhere
- First tab should contain the **highest-priority data**
- Fewer tabs with logical grouping = better usability and performance (especially mobile)
- A column can be added to the same form multiple times; values are always identical across occurrences
- Deleting a non-required field or hiding a required field does not affect stored data

### Form Designer Interface

- **Canvas** (center) — live form preview
- **Command bar** (top) — quick functions and navigation
- **Side menu** (left panel) — Table columns, Components, Form settings

### Components Menu

- **Layout choices** — control physical structure
- **Grid components** — data entry via grid
- **Display components** — calendars, external websites, Canvas apps, other items
- **Input components** — checkboxes, option sets, toggles, pen inputs

### Show/Hide Form Elements

- Tabs, sections, columns, iFrames, and web resources can be shown/hidden via the **Properties** panel
- Use form scripts or business rules to control visibility
- **Best practice**: hide an element by default; use scripts to show it only when logic requires

---

## Form Settings, Security, and Access

- **Security roles** can be assigned to control which form a user sees
- **Form order** determines which form appears first for a given role (drag-and-drop in Form settings, then **Save and publish**)
- **Fallback form** — the form shown to users whose security role has no matching form assigned; applies to Main forms only
- Designating a Main form as **inactive** hides it from all users regardless of security role
- When a user has access to multiple forms, a **form selector** appears near the top
- > **Warning**: Form-level security does not prevent data access via Advanced Find or background automation

### Main Form Behaviors

- **AutoSave** is on by default (administrators can disable it)
- Responsive to device type and size (web, Outlook, tablet, mobile)

### Quick Create Form Constraints

- Only **one** quick-create form can be active (set by form order)
- Cannot be assigned to security roles; users cannot switch between them
- Must be **enabled for the table** before it can be used

### Quick View Form Constraints

- Data is **not editable** in quick view controls
- **Does not support** form scripts
- When the table's primary column is included, it becomes a link to open the related row

---

## Form Event Handlers

- Require a **JavaScript library** to be added first
- Each element supports up to **50 separate event handlers**

| Element | Event | Trigger |
| --- | --- | --- |
| Form | OnLoad | Form loads |
| Form | OnSave | Data is saved |
| Tab | TabStateChange | Tab expanded or collapsed |
| Column | OnChange | Data in column changes and control loses focus |
| IFrame | OnReadyStateComplete | IFrame content finishes loading |

---

## Specialized Form Components

### Grid Controls

| Control | Description |
| --- | --- |
| **Read-only subgrid** | View data related to the current record; open but not edit inline |
| **Editable grid** | Rich inline editing of records from views and subgrids (web, tablet, phone) |
| **Power Apps grid control** (preview) | View, open, and edit records; read-only by default, configurable as editable |

**Adding an Editable Grid to a Form:**

1. Select **Solutions** → your solution → **Objects** → **Apps**
2. Open your model-driven app in the app editor
3. In the **Pages** panel, expand the table and select the form (hover → pencil icon)
4. On the form canvas, select the area where the grid should go
5. Select **Components** from the left navigation rail (or command bar)
6. Expand **Grid** (or search "grid") → select **Editable Grid**
7. In the **Add Editable Grid** pane: choose table, view/layout, and target devices (Web/Mobile/Tablet) → **Done**
8. Configure additional options in the **Properties** pane on the right
9. Select **Save and publish**

### Display Controls

| Control | Description |
| --- | --- |
| **Calendar** | View scheduled activities in calendar format |
| **Embedded Canvas App** | Rich data integration from various sources alongside model-driven form data |
| **Web Resource** | HTML page or image file rendered within the form |
| **Knowledge Search** | Find knowledge articles without leaving the record (requires Dynamics 365 Customer Service) |
| **External Website (iFrame)** | Inline frame showing external website content; configure URL and render settings |
| **Quick View** | Non-editable data from a related row selected in a lookup |
| **Timeline Control** | Activity history (notes, appointments, emails, calls, tasks); configurable by makers |

### Input Controls

| Control | Description |
| --- | --- |
| **Checkbox** | Binary value selection |
| **Number input** | Tap +/− to change numeric values in configurable increments |
| **Option set** | Set of choices for data entry |
| **Pen input** | Capture written/signature input |
| **Rich text editor** | Text formatting area |
| **Star rating** | Rating input |
| **Toggle** | Binary toggle input |

### Other Controls

- **Business card reader** — detects and extracts business card information
- **Power BI report** — add a report directly to a form
- **Get more components** — access additional environment components from the Components panel

---

## Views

### View Types

| Type | Description |
| --- | --- |
| **Personal** | Created by an individual user; visible only to that user; can be shared |
| **System** | Application-required views; auto-created for system/custom tables; editable only by system admins or customizers; cannot be deleted or deactivated; not shown in view selector |
| **Public** | General-purpose; all app users access via view selector; can be added to subgrids/dashboard lists; customizable by makers |

- System-defined public views **cannot be deleted**
- Custom public views in an unmanaged solution **can** be deleted by their creator

### Creating/Editing a Public View

1. In the maker portal, open your **unmanaged** solution → app editor
2. In the **Pages** panel, select the table → expand to show **Views**
3. To edit: hover over the view → pencil icon (or ellipsis → **Edit** / **Edit in a new tab** / **Remove**)
4. To create: select **+ New View** → enter a name → **Create**
5. In the view editor:
   - Add columns from the **Table columns** pane (click) or **+ View column** button
   - Drag and drop to reorder; select column name → **Remove** to delete; use **Undo**
6. To filter: select a column header → **Filter by** → choose condition and value → **Apply**
7. For multiple filters: repeat column selection method, or use **Edit filters...** from the properties pane
8. Select **Publish** from the command ribbon to save and publish

### Editing System Views

- Select **Show more** in the **Views** property pane to reveal all four system views
- System admins can edit system views the same way as public views

### View Designer Interface

- **Left panel**: Table columns
- **Right panel**: Properties panel
- Columns can be resized and reordered (drag and drop)
- Sort/filter from column header options

---

## Charts

- Charts provide an **interactive view of data** within model-driven apps
- Created per-table and can be added to dashboards

### Creating/Configuring a Chart

1. From the maker portal → **Tables** → select the target table
2. In the **Data experiences** pane → **Charts**
3. Select an existing chart or **+ New chart** from the command bar
4. The chart editor opens in a **separate browser tab**
5. In the editor:
   - Name the chart and select the **chart type**
   - Under **Legend Entries (series)**: select data and aggregation method (Average, Count: All, Count: Non-empty, Max, Min, Sum)
   - Under **Horizontal (Category) Axis Labels**: select a complementary field
   - Preview is live if the table has data
   - Optionally add a description
6. Select **Save & Close**

---

## Dashboards

- Show several areas of the application in a single display
- Allow users to view real-time information and take action from one centralized location
- Security-role based; fully configurable
- Can embed charts, lists (views), iFrames, web resources, and Power BI

### Interactive Dashboard Types

| Type | Characteristics |
| --- | --- |
| **Multi-stream** | Multiple data streams, each based on a single (potentially different) table; no stream limit; available as home page or table-specific dashboards |
| **Single-stream** | One stream based on a table view with visual filters applied; tiles always on the right side; detailed view for complex data |

### Multi-stream Dashboard Layout

- Row of **visual filters** at the top (can be hidden via **Hide Visual Filter** toggle)
- Data streams displayed below
- **Tile View**: toggle via **Switch to Tile View** — shows count of rows per stream as summary tiles
- Toggle back with **Switch to Stream View**

### Interactive Tiles

- Show aggregated/count data across queues or views
- Selecting a tile drills down to the underlying rows (flyout)
- Hovering over "View" shows which view backs that tile's stream

### Adding an Existing Dashboard to an App

1. In the model-driven app editor → **+ Add page** from the command bar
2. Select **Dashboard** → **Next**
3. Select the dashboard to add

### Composing a Custom Interactive Dashboard

1. **Solutions** → select solution → **Objects** tab
2. **+ New** drop-down → **Dashboard**
3. Choose layout (number of columns) or **Power BI embedded**
4. In the **Dashboard: New** editor (separate browser tab), insert components:
   - **Chart** — select record, view, and chart type
   - **List** — table view
   - **Assistant** — limited to one per dashboard
   - **IFrame** — inline frame with URL
   - **Web Resource** — HTML page or other resource
5. Save and close, then add the dashboard to the app from the app editor

### Configuring Dashboard Columns

1. In the model-driven app editor, select the dashboard → **Edit Component** from the command bar
2. The **Set Properties** pop-up enables tweaking component properties

---

## References

- [Create a card form](https://learn.microsoft.com/en-us/power-apps/maker/model-driven-apps/create-card-forms/)
- [Create and edit quick create forms](https://learn.microsoft.com/en-us/power-apps/maker/model-driven-apps/create-edit-quick-create-forms/)
- [Create and edit quick view forms](https://learn.microsoft.com/en-us/power-apps/maker/model-driven-apps/create-edit-quick-view-forms/)
- [Design considerations for main forms](https://learn.microsoft.com/en-us/power-apps/maker/model-driven-apps/design-considerations-main-forms/)
