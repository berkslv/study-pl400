# Summary: Getting Started with Power Apps

> **Source files:** 1-powerapps-introduction.md, 2-powerapps-building-blocks.md, 3-powerapps-related-technologies.md, 4-powerapps-ways-to-build.md, 4-5-design-app.md, 5-powerapps-create-first.md, create-app-copilot.md

---

## What is Power Apps

- Suite of apps, services, and connectors for building custom business apps without coding
- Provides a rapid development environment using AI-powered development, prebuilt templates, and connectors to hundreds of data sources
- Works in web browsers and on mobile devices
- Enables transformation of manual business processes to digital ones

---

## Power Apps Maker Portal

- Access at [make.powerapps.com](https://make.powerapps.com/) using an organizational Microsoft 365 account
- Left-hand menu includes: **Home**, **Create**, **Apps** tabs
- Copilot text input field appears at top center for natural language app generation
- Apps created via Copilot are built on Microsoft Dataverse (may require additional licensing)
- **Create** page options: start with Copilot, connect to data, use a page design, or blank canvas
- **Do more with your apps** section: Copilot agents, Power Automate flows, websites, AI Hub
- **App from templates** section: prebuilt examples (not recommended for production data)
- **Power Apps Mobile** app available on device app stores; sign in with Microsoft 365 credentials

---

## Data Sources

### SharePoint
- Lists function like tables; document libraries for storing or reading files
- Supports simple and multi-column list structures; multiple lists per app
- Key considerations:
  - Use simple column types: Text, Number, Yes/No, Date and time
  - Avoid complex column types and mandatory columns (enforce required inputs in-app)
  - Use simple column names without special characters or spaces
  - No relational table support — create key fields manually for relationships
  - Subject to delegation limits; large queries may return incomplete results (warning icon displayed)

### Excel
- Non-premium data source; data must be formatted as a **table** in Excel
- Image columns must be labeled `[image]` to display in galleries
- If file is open by another user, read/write operations may be blocked — not recommended for multi-user live apps
- Best suited for learning scenarios and small datasets

### Dataverse
- Most powerful and scalable data source for Power Apps
- No API configuration needed — native data access within the same environment
- Supports large datasets, high-performance querying, automatic table relationships
- Fully supports Copilot for natural language app generation
- Access via **Start with data** in the Power Apps Maker Portal
- Requires premium licensing (Power Apps Per App or Per User Plan)

### SQL
- Premium data source suited for large-scale, enterprise-grade apps
- Cloud-hosted SQL: straightforward connection
- On-premises SQL: use an **on-premises Data Gateway** for secure connectivity
- Supports relational data and large volumes

---

## Power Platform Related Technologies

### Power Automate
- Creates automated workflows triggered by events in Power Apps; can return data to the app
- A single flow can: update data sources, download data, write files, generate PDFs, send email, schedule calendar events, send Teams messages, start approval processes
- Recommended for business logic beyond native Power Apps capabilities (e.g., multi-step approvals, scheduled flows)
- Example use cases:
  - Initiate follow-up on new incident report submission
  - Trigger process when new data is created in another system
  - Send daily email notifications with links to relevant Power Apps forms

### Power Automate Desktop
- Extends automation to legacy systems on local machines
- Replicates routine user interactions (clicking buttons, entering data)
- Desktop flows can be triggered from cloud-based Power Automate flows, initiated through Power Apps (requires premium connectors)

### Power BI
- Analytics and reporting tool; connects to multiple data sources
- Creates interactive visualizations, reports, and dashboards
- Reports are private by default; sharing requires **Power BI Pro license** for both creator and viewers
- Can embed Power BI tiles in a Power Apps canvas app
- Can embed a Power Apps canvas app in a Power BI dashboard (e.g., submit purchase requests from within a dashboard)
- Choose Power BI for: KPI tracking, trend comparison, aggregated metric visualization
- Choose Power Apps for: simpler charts, forms, or basic visual context

---

## Designing a Power Apps App

### Understanding User Needs
- Define user/client needs before opening the Maker portal
- Key questions: What should the app do? Is mobile required? Will it handle hundreds or thousands of rows? Are we replacing an analog process?
- Think in terms of new capabilities, not direct replication of legacy processes

### Business Requirements
- Identify early: security, privacy, compliance requirements; storage/access restrictions; government regulations; authentication and authorization needs

### Data Model Selection
- Consider existing infrastructure, data volume, and whether multiple sources are needed
- **SharePoint / Excel**: no extra cost; suitable for small to medium volumes
- **Dataverse / SQL**: premium; required for large datasets, relationships, Copilot features

### User Experience (UX)
- Canvas apps offer full UI control; prioritize simplicity and intuitiveness
- Avoid high-resolution images and animations for mobile (performance impact on slower networks)
- Key design elements:
  - Custom branding (logos, colors, fonts)
  - Pop-ups to confirm user actions
  - Show/hide controls based on user permissions
  - Confirmation prompts to prevent repeated actions
- Use appropriate controls for simplicity (e.g., slider for numeric ranges)

### User Interface (UI)
- Create mockups using Visio, PowerPoint, paper, or a blank canvas app prototype
- Prototype elements can be reused in the final app
- **Accessibility**: support users with vision, hearing, or motor impairments; built-in Power Apps support available
- **Localization**: account for numeric formats (decimal symbols) and language differences in global apps

---

## Building Apps — Procedures

### Build a Three-Screen App from Excel
1. Upload Excel file to OneDrive (must be formatted as a table)
2. In Maker Portal → **Apps** → **Start with an app template** → **From Excel** (under Data-centered mobile apps)
3. Select the OneDrive file and table → **Create app**
4. If formula error occurs, select **Data** → reconnect to data source
5. In `BrowseGallery1`, select `Title1` → set **Text** property to `ThisItem.'Machine Name'`
6. Set `Subtitle1` **Text** to `ThisItem.Price`
7. Set `Body1` **Text** to `ThisItem.Color`
8. To add images: shift-select Title1, Subtitle1, Body1 → set **X** property to `80`
9. Insert **Image** control → set **Image** property to `ThisItem.Photo`
10. Preview with Play button (F5); exit preview with X; save app

### Create a Blank Canvas App
1. Maker Portal → **Create** → **Start with a blank canvas app** → **Tablet size**
2. Save app with name (e.g., "Contoso Coffee Machines")
3. Insert **Vertical gallery** → connect to **OneDrive for Business** → select Excel file → select **Machines** table
4. Set gallery properties: `ThisItem.'Machine Name'`, `ThisItem.Price`, `ThisItem.Photo`
5. Resize gallery to fill left half of screen
6. Insert **Edit form** → position on right half of screen → connect to **Machines** data source
7. Add fields via **Edit fields** → **Add field**
8. Set form **Item** property to `Gallery1.Selected`
9. For photo display: delete DataCardValue in photo card → insert **Image** control → set Image property to `ThisItem.Photo` → unlock data card if prompted
10. Fix formula errors: replace `DataCardValue.Y + DataCardValue.Height` with `ImageControl.Y + ImageControl.Height`; replace `DataCardValue.Text` with `ImageControl.Image`
11. Insert **Button** → set **Text** to `"Save Changes"` → set **OnSelect** to `SubmitForm(Form1)`
12. Insert **Rectangle** for header → set **Height** to `75` → position at top spanning full width
13. Insert **Text label** → set **Text** to `"Contoso Coffee Machines"` → set **Size** to `24` → set **Color** to white → center-align → position in rectangle

### Build an App from Excel Using Copilot (Dataverse required)
1. Download and extract a sample Excel file
2. Maker Portal → **Start with data** → **Create with Excel or .CSV file** → **Create new tables**
3. Select **Import an Excel file or .CSV** → select file → toggle query table inclusion on → **Import**
4. Review generated table; toggle **Use first row as column headers** if needed
5. Use Copilot pane to adjust column types (e.g., change to Choice type)
6. Select **Save and open app** → app opens in Power Apps Studio
7. Use Copilot panel in Studio to make further changes (still in Preview mode)
8. Save (floppy disk icon) → provide name → **Save** → **Publish**
9. Test with Play (preview) mode; test search (Dataverse search works across all text fields, case-insensitive)

---

## Key Power Fx Formulas

```powerfx
// Display field value for current gallery item
ThisItem.'Machine Name'
ThisItem.Price
ThisItem.Color
ThisItem.Photo

// Link form to gallery selection
Gallery1.Selected

// Submit form data
SubmitForm(Form1)

// Fix image position formula after DataCardValue deletion
Image2.Y + Image2.Height

// Fix image update formula
Image2.Image
```

---

## References

- [Machine Order Data file](https://github.com/MicrosoftDocs/mslearn-developer-tools-power-platform/raw/master/power-apps/Machine-Order-Data.zip)
- [Power Apps Maker Portal](https://make.powerapps.com/)
- [Product List sample worksheet](https://github.com/MicrosoftDocs/mslearn-developer-tools-power-platform/raw/master/power-apps/copilot/ProductList.zip)
