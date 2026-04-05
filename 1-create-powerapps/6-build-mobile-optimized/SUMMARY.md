# Summary: Building Mobile-Optimized Canvas Apps in Power Apps

> **Source files:** mobile-optimized-applications.md, performance.md, introduction.md, components.md, responsive-designs.md

---

## Key Design Elements for Mobile-Optimized Canvas Apps

- **Clearly defined purpose** — serve a specific function; minimize steps to complete tasks
- Each form should have a single, clear function expressible in one concise sentence
- Avoid multi-purpose forms (e.g., combining customer creation and contact entry)
- **Responsive design** — auto-adjust to screen size and orientation (BYOD)
- **Streamlined UI** — avoid too many fields/controls; minimize scrolling
- Add spacing around fields and buttons to account for touch accuracy; excessive controls cause accidental selections
- Place **Submit** buttons in easily accessible locations
- **Intuitive navigation** — organize workflows based on real usage patterns; provide easy return to home screen
- Use app analytics or usage data to determine task priority
- **Independence from external peripherals** — design without assuming keyboard/mouse access
- **Offline capabilities** — evaluate whether offline use is required given added complexity
- **Connectivity alerts** — verify connection before allowing data entry; use visual indicators (banners) to communicate offline status
- **Seamless setup** — provide clear guidance for any required configuration (URLs, API keys)
- **Performance optimization** — choose efficient data sources, retrieve only needed records, remove redundant data calls

---

## Canvas App Creation and Display Settings

### Creating the App

- Go to **Power Apps home page** > **Create** > **Start with a blank canvas**
- Select a **Format** (phone, tablet, or responsive) before the app is created
- **Phone layout**: vertical orientation, vertical scrolling
- **Tablet layout**: landscape orientation
- **Responsive layout**: uses predefined container templates; containers must be used for responsiveness to work

### Display Settings (`Settings > Display`)

- **Orientation**: sets default layout — portrait or landscape
- **Scale to fit**: turn **Off** for responsive design (On by default)
- **Lock aspect ratio**: maintains height-to-width ratio when Scale to fit is On
- **Lock orientation**: when On, enforces orientation setting; when Off, users can switch

### Built-in Responsive Layout Templates (via **Layout** tab on new screen)

- **Split screen**
- **Sidebar**
- **Header and footer**
- For custom layouts: use containers, formulas, and conditional logic

---

## Controls, Forms, and Containers

### Form and Control Design

- Design buttons to be easily tapped — ideally at top or bottom, extending edge to edge
- Place action buttons (e.g., delete) on the side matching user hand preference
- Add spacing between fields and screen edges to reduce touch errors and prevent system gesture triggers
- Display mandatory fields near the top of the form
- Grids should scroll in only one direction (vertical or horizontal) and span screen width
- Ensure consistent scrolling behavior across multiple forms

### Containers

- **Horizontal container** and **Vertical container** use auto-layout to position child elements and distribute space
- Auto-layout containers let Power Apps manage spacing and alignment dynamically
- Use containers to maintain responsive behavior across form factors

---

## Offline Capabilities and Connectivity

### Offline Functions

- **`SaveData`** — persists data to device local storage
- **`LoadData`** — retrieves data from device storage
- **`ClearData`** — deletes stored data

### Connectivity Monitoring

- Use the **`Connection`** signal to monitor connectivity status
- Use an **Icon** control with conditional color: `If(Connection.Connected, Color.Green, Color.LightSteelBlue)`
- Use the **`Notify`** function to display messages or conditionally disable controls

---

## Performance Optimization

- Use **App checker** (most accessible performance troubleshooting tool) to diagnose issues
- Advanced: use **Power Apps Monitor** to identify bottlenecks
- Reduce the amount of data the app retrieves
- Minimize the number of connectors/gates data must pass through
- Design galleries and forms to source data from a single data source when possible

### Data Source Performance Ranking

| Data Source | Notes |
|---|---|
| **Dataverse** | Best performance — no API calls needed (same environment as Power Apps) |
| **Cloud SQL** | Strong option, but relies on API calls |
| **SharePoint** | Effective for small data loads; slows as list size grows |
| **On-premises server** | Must go through on-premises data gateway — additional latency |

---

## Hands-On: Building a Responsive App (Step-by-Step)

1. Download [App in a Day files](https://github.com/MicrosoftDocs/mslearn-developer-tools-power-platform/raw/master/in-a-day/AIAD/AppinADayStudentFiles.zip), extract, and open **Machine-Order-Data.xlsx**
2. Go to **make.powerapps.com** > **Create** > **Start with a blank canvas** > **Responsive**
3. Open **Settings** > **Display** tab > toggle **Scale to fit** to **Off**
4. Add a new screen with **Sidebar** layout; name it `Catalog Screen`
5. Add another new screen with **Success** template; name it `Success Screen`
6. Delete **Screen1**
7. In the Catalog Screen's sidebar container, insert a **Vertical gallery**; connect to **OneDrive for Business** > **Machine-Order-Data.xlsx** > **Machines** table
8. Set gallery field formulas:
   ```
   Title: ThisItem.'Machine Name'
   Subtitle: ThisItem.Price
   Image: ThisItem.Photo
   ```
9. Select **MainContainer2**; insert an **Edit form** connected to the **Machines** table
10. Add fields: Photo, Machine ID, Machine Name, Color, Description, Feature, Price, Machine Type, Machine Type ID, Avg. Cups/Week, Avg. Espressos/Week
11. Set form **Item** property:
    ```
    Gallery1.Selected
    ```
12. Set form **Fill** property:
    ```
    Color.LightSteelBlue
    ```
13. In **HeaderContainer2**, insert a **Text label** with:
    - **Text**: `"Contoso Coffee Catalog"`
    - **Size**: `20`, **Height**: `Parent.Height`, **Width**: `200`
14. Insert an **Image** control into **HeaderContainer2**:
    - **Image**: `User().Image`, **Height**: `Parent.Height`
15. Insert a **Globe** icon into **HeaderContainer2** for connectivity indicator:
    - **Height**: `20`, **Width**: `20`
    - **Color**: `If(Connection.Connected, Color.Green, Color.LightSteelBlue)`
16. Set **HeaderContainer2** horizontal justify to **End** (right-justify)
17. Set **HeaderContainer2 Fill**:
    ```
    Color.LightSteelBlue
    ```
18. In **MainContainer2**, insert a **Button** with:
    - **Text**: `"Save"`, **Width**: `Parent.Width`
    - **OnSelect**: `SubmitForm(Form1)`
19. Set form **OnSuccess** property:
    ```
    Navigate('Success Screen')
    ```
20. On **Success Screen**, set the **Check** icon **OnSelect**:
    ```
    Back()
    ```
21. Enter preview mode; test with Phone dropdown (e.g., iPhone 12) to observe responsive layout behavior

---

## References

- [App in a Day files (download)](https://github.com/MicrosoftDocs/mslearn-developer-tools-power-platform/raw/master/in-a-day/AIAD/AppinADayStudentFiles.zip)
- [Considerations for optimized performance in Power Apps](https://powerapps.microsoft.com/blog/considerations-for-optimized-performance-in-power-apps/)
- [Create responsive layouts in canvas apps](https://learn.microsoft.com/en-us/power-apps/maker/canvas-apps/create-responsive-layout/)
- [Develop offline-capable canvas apps](https://learn.microsoft.com/en-us/power-apps/maker/canvas-apps/offline-apps/)
- [Improve the performance of your canvas app](https://learn.microsoft.com/en-us/power-apps/maker/canvas-apps/performance-tips/)
- [Introducing Monitor to debug apps and improve performance](https://powerapps.microsoft.com/blog/introducing-monitor-to-debug-apps-and-improve-performance/)
- [Use auto-layout container controls](https://learn.microsoft.com/en-us/power-apps/maker/canvas-apps/build-responsive-apps#auto-layout-containers)
- [Use LoadData and SaveData in an offline app](https://learn.microsoft.com/en-us/power-apps/maker/canvas-apps/functions/function-savedata-loaddata/)
- [Use the Connection formula](https://learn.microsoft.com/en-us/power-apps/maker/canvas-apps/functions/signals#connection)
