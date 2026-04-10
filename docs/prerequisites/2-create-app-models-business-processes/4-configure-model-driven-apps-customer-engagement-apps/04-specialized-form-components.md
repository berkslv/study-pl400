# Use specialized form components

Power Apps provides controls for model-driven apps that allow users to visualize and interact with data within table columns.

## Grid Controls

You can configure Grid controls for a Table or a Form as:

- **Read-only subgrid** - present a view of data related to the current record; users can view and open records from within the grid
- **Editable grid** - allows users rich in-line editing of records directly from views and subgrids (web, tablet, or phone)
- **Power Apps grid control (preview)** - next evolution allowing users to view, open, and edit records from views and subgrids (read-only by default, can be configured as editable)

## Display Controls

Display controls present information not directly related to table data:

### Calendar
Allows users to view scheduled activities and their associated details in a calendar format.

### Embedded Canvas App
Enables rich data integration of various data sources right next to contextual data from the host model-driven form.

### Web Resource
An HTML page or image file that can be displayed within the form.

### Knowledge Search
(Requires Dynamics 365 Customer Service app) Makes it easy for users to find knowledge articles to answer common customer questions without leaving the record.

### External Website (iFrame)
- Add inline frames to integrate content from another website within a form
- Insert an **External website** display control and input a URL
- Configure how the iframe renders after adding it

### Quick View
- Displays data from a row selected in a lookup on the form
- Displays non-editable data
- When the table's primary column is included, it becomes a link to open the related row

### Timeline Control
- Captures activities like notes, appointments, emails, phone calls, and tasks
- Ensures tracking and visibility of all interactions with the related table over time
- Helps app users see all activity history in one place
- Configurable by app makers to display relevant information and enable creating new activity records

## Input Controls

Input controls provide means for users to input data:

| Control | Description |
| --- | --- |
| **Checkbox** | Choose between binary values |
| **Number input** | Tap plus/minus buttons to change numeric values in configurable increments |
| **Option set** | Present a set of choices for data entry |
| **Pen input** | Capture written input as signatures |
| **Rich text editor** | Editing area for formatting text |
| **Star rating** | Rating input control |
| **Toggle** | Binary toggle input |

## Other Controls

- **Business card reader** - detects business cards and extracts their information
- **Power BI report** - add a report directly to your form
- **Get more components** - available at the bottom of the Components panel to access additional environment components
