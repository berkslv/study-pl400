# Quiz: Get Started with Power Apps

> **Source material:** 1-powerapps-introduction.md, 2-powerapps-building-blocks.md, 3-powerapps-related-technologies.md, 4-powerapps-ways-to-build.md, 4-5-design-app.md, 5-powerapps-create-first.md, 6-powerapps-quiz-get-started.md, 7-summary-cleanup.md, create-app-copilot.md
> **Total questions:** 25
> **Question types:** Multiple choice (single), Multiple choice (multi-select), Fill-in-the-blank

---

## Questions

### Question 1 — Single Choice

A field technician visits customer sites and currently uses a paper clipboard to record parts replacements and schedule follow-ups. Your manager asks you to replace this process with a Power Apps solution.

Which statement best describes Power Apps' core value proposition for this scenario?

- A. Power Apps requires advanced coding skills to connect to external data sources.
- B. Power Apps allows you to build custom business apps without coding experience.
- C. Power Apps only runs on desktop web browsers and cannot be used on mobile devices.
- D. Power Apps is limited to internal Microsoft data sources such as SharePoint.

<details>
<summary>Answer</summary>

**Correct answer:** B. Power Apps allows you to build custom business apps without coding experience.

**Explanation:** Power Apps provides a rapid development environment where professional solutions can be built using AI-powered development, prebuilt templates, and connectors — all without requiring coding experience. The interface is designed to let users transform manual processes to digital ones with ease.

</details>

---

### Question 2 — Single Choice

Your organization wants to begin building a Power Apps canvas app. A colleague asks where they should go to configure and customize the app.

Where do you build and customize Power Apps applications?

- A. The Power Apps Mobile app on a smartphone
- B. The Power Apps admin center
- C. The Power Apps Maker portal at make.powerapps.com
- D. Microsoft Dynamics 365

<details>
<summary>Answer</summary>

**Correct answer:** C. The Power Apps Maker portal at make.powerapps.com

**Explanation:** The Power Apps Maker portal (make.powerapps.com) is where makers sign in to create, configure, and customize their apps. The admin center is for governance tasks, not app building.

</details>

---

### Question 3 — Single Choice

You open the Power Apps Maker portal and want to use Copilot to describe app functionality using natural language.

Which requirement must be met for apps created using Copilot to function?

- A. The app must be built on a SharePoint list.
- B. The app must be published to Microsoft Teams first.
- C. The environment must include Microsoft Dataverse.
- D. The user must have a Power BI Pro license.

<details>
<summary>Answer</summary>

**Correct answer:** C. The environment must include Microsoft Dataverse.

**Explanation:** Apps created using Copilot in the Maker portal are built on Microsoft Dataverse. If Dataverse is not available in your plan, you should consider starting with a different data source included at no extra cost.

</details>

---

### Question 4 — Single Choice

A restaurant manager wants employees to record work schedules and vacation requests from their smartphones rather than signing a paper on the wall.

Which Power Apps capability directly supports this scenario?

- A. Power Apps can only be used on desktop computers.
- B. Power Apps allows sharing apps instantly so coworkers can use them on their phones and tablets.
- C. Power Apps requires a premium license for mobile device access.
- D. Power Apps sends schedules automatically via Power BI dashboards.

<details>
<summary>Answer</summary>

**Correct answer:** B. Power Apps allows sharing apps instantly so coworkers can use them on their phones and tablets.

**Explanation:** One of Power Apps' core capabilities is the ability to share apps instantly so coworkers can access them on phones and tablets. The free Power Apps Mobile app is available from device app stores.

</details>

---

### Question 5 — Single Choice

Your company needs to automate a multi-step approval process that triggers when a new incident report is submitted in your Power Apps app.

Which Microsoft Power Platform tool is best suited for this scenario?

- A. Power BI
- B. Power Apps canvas app
- C. Power Automate
- D. Power Apps Maker portal templates

<details>
<summary>Answer</summary>

**Correct answer:** C. Power Automate

**Explanation:** Power Automate is recommended when business logic goes beyond what Power Apps can perform natively, such as multi-step approvals or scheduled flows. It serves as a process automation engine for complex business workflows.

</details>

---

### Question 6 — Single Choice

Your organization requires an interactive dashboard that tracks KPIs, compares trends, and visualizes aggregated metrics from multiple data sources. Stakeholders need to explore the data interactively.

Which tool in the Microsoft Power Platform is best suited for this requirement?

- A. Power Apps canvas app with chart controls
- B. Power Automate with reporting flows
- C. Power BI
- D. SharePoint list views

<details>
<summary>Answer</summary>

**Correct answer:** C. Power BI

**Explanation:** Power BI is the analytics and reporting tool in the Microsoft Power Platform designed for in-depth data analysis and interactive visualizations. While Power Apps supports basic charts, solutions requiring robust visual exploration and reporting are better served by Power BI.

</details>

---

### Question 7 — Single Choice

A manufacturing company uses a Power BI inventory report. A business analyst wants end users to be able to submit material purchase requests without leaving the dashboard.

What integration technique makes this possible?

- A. Embedding a Power BI tile inside a Power Apps canvas app
- B. Embedding a canvas app inside a Power BI dashboard
- C. Connecting Power Automate to a Power BI data gateway
- D. Exporting Power BI data to a SharePoint list for the app to read

<details>
<summary>Answer</summary>

**Correct answer:** B. Embedding a canvas app inside a Power BI dashboard

**Explanation:** It is possible to embed a Power Apps canvas app in a Power BI dashboard so that users can act on insights without switching tools. Users can navigate app screens and interact with filters that update Power BI visualizations in real time.

</details>

---

### Question 8 — Single Choice

You are using SharePoint as the data source for your Power Apps app and notice a yellow warning icon appearing next to a gallery control.

What most likely caused this warning?

- A. The SharePoint list contains a column with special characters in its name.
- B. The query is returning more data than the SharePoint delegation limit allows.
- C. SharePoint requires a premium connector that hasn't been licensed yet.
- D. The SharePoint list is missing relational table support.

<details>
<summary>Answer</summary>

**Correct answer:** B. The query is returning more data than the SharePoint delegation limit allows.

**Explanation:** SharePoint is subject to a delegation limit. Queries returning more data than this limit may result in incomplete results, which Power Apps indicates with a warning icon in the app.

</details>

---

### Question 9 — Single Choice

A developer is building a Power Apps app connected to an Excel file stored in OneDrive, but the gallery is not displaying any data.

What is the most likely cause?

- A. Excel files cannot be used as a data source in Power Apps.
- B. The Excel file was not formatted as a table before connecting.
- C. The OneDrive for Business connector requires a premium license.
- D. The gallery control only works with Dataverse tables.

<details>
<summary>Answer</summary>

**Correct answer:** B. The Excel file was not formatted as a table before connecting.

**Explanation:** For Power Apps to access Excel data, the data must be formatted as a table within Excel. Unformatted data will not be accessible from Power Apps.

</details>

---

### Question 10 — Single Choice

A development team needs to build a high-volume enterprise app that requires relational data, large datasets, and full support for Copilot-based app generation.

Which data source best meets these requirements?

- A. SharePoint lists
- B. Excel stored in OneDrive
- C. Microsoft Dataverse
- D. A local CSV file

<details>
<summary>Answer</summary>

**Correct answer:** C. Microsoft Dataverse

**Explanation:** Microsoft Dataverse is the most powerful and scalable data source for Power Apps. It supports large datasets, automatic table relationships, high-performance querying, and fully supports Copilot for natural language-based app generation. No API configuration is needed.

</details>

---

### Question 11 — Single Choice

Your organization hosts its business data in a SQL Server database located on-premises. You want to connect this data to a Power Apps app.

Which approach allows Power Apps to access the on-premises SQL database?

- A. Export the SQL data to Excel and upload it to OneDrive.
- B. Use an on-premises Data Gateway to connect Power Apps to the local SQL database.
- C. Migrate the database to SharePoint before connecting.
- D. On-premises SQL databases are not supported by Power Apps.

<details>
<summary>Answer</summary>

**Correct answer:** B. Use an on-premises Data Gateway to connect Power Apps to the local SQL database.

**Explanation:** When SQL Server is hosted on-premises, you can use an on-premises Data Gateway to securely connect Power Apps to local SQL databases. Cloud-hosted SQL Server connects directly without a gateway.

</details>

---

### Question 12 — Single Choice

You are in the early stages of planning a Power Apps solution. Before opening the Maker portal, your project lead asks you what the app should accomplish and whether mobile functionality is required.

What phase of app development does this represent?

- A. Data model selection
- B. User interface mockup
- C. Accessibility testing
- D. Understanding user needs and defining the problem

<details>
<summary>Answer</summary>

**Correct answer:** D. Understanding user needs and defining the problem

**Explanation:** Before opening the Power Apps Maker portal, you should define user or client needs and have a clear understanding of the problem. This includes asking what the app should do, whether mobile is required, and whether you are replacing an analog process.

</details>

---

### Question 13 — Single Choice

A developer working on a canvas app notices that high-resolution images and animations are causing slow load times for mobile users in the field.

Which design principle should be prioritized to address this issue?

- A. Add a loading screen with branding to improve perceived performance.
- B. Optimize for speed and clarity by avoiding heavy media on mobile experiences.
- C. Switch to Dataverse as the data source to improve rendering speed.
- D. Use Power Automate to pre-load image data asynchronously.

<details>
<summary>Answer</summary>

**Correct answer:** B. Optimize for speed and clarity by avoiding heavy media on mobile experiences.

**Explanation:** Performance is a key UX consideration. High-resolution images and animations can hinder mobile experiences, especially on slower networks. Good app design prioritizes speed and clarity.

</details>

---

### Question 14 — Single Choice

A Power Apps maker wants to validate a screen layout before building the final app. They want to reuse approved elements in the production app to save time.

What is the recommended approach for early UI design validation?

- A. Deploy the app to production and collect user feedback.
- B. Create a mockup using Visio, PowerPoint, or a blank canvas app.
- C. Use Power BI to prototype the data visualization layout.
- D. Use a SharePoint list form as a wireframe template.

<details>
<summary>Answer</summary>

**Correct answer:** B. Create a mockup using Visio, PowerPoint, or a blank canvas app.

**Explanation:** Creating a mockup using tools like Visio, PowerPoint, or a blank canvas app helps validate design decisions early. Elements from approved prototypes can be reused in the final app, saving development time.

</details>

---

### Question 15 — Single Choice

You are creating a Power Apps canvas app from an Excel file and want each item in a gallery to display its own machine name dynamically.

Which Power Fx formula correctly retrieves the machine name for each gallery item?

- A. `Gallery1.Selected.'Machine Name'`
- B. `LookUp(Machines, ID = ThisItem.ID, 'Machine Name')`
- C. `ThisItem.'Machine Name'`
- D. `First(Machines).'Machine Name'`

<details>
<summary>Answer</summary>

**Correct answer:** C. `ThisItem.'Machine Name'`

**Explanation:** `ThisItem` is used inside a gallery to dynamically reference the current record. `ThisItem.'Machine Name'` tells Power Apps to display the Machine Name field for each item in the gallery, making each gallery item show its own data.

</details>

---

### Question 16 — Single Choice

You built a canvas app with a gallery and a form. You want the form to display the details of whichever gallery item the user selects.

Which formula should be set on the form's **Item** property?

- A. `First(Gallery1.AllItems)`
- B. `Gallery1.Selected`
- C. `ThisItem.ID`
- D. `Filter(Machines, ID = Gallery1.Selected.ID)`

<details>
<summary>Answer</summary>

**Correct answer:** B. `Gallery1.Selected`

**Explanation:** Setting the form's Item property to `Gallery1.Selected` causes the form to display the details of the currently selected item in the gallery. This formula is entered directly into the Item property of the form control.

</details>

---

### Question 17 — Single Choice

After adding an image control to a photo data card in your canvas app, you need to display the correct photo for the selected machine.

Which formula should be entered in the image control's **Image** property?

- A. `Gallery1.Selected.Photo`
- B. `ThisItem.Photo`
- C. `DataCardValue.Photo`
- D. `LookUp(Machines, ID = Form1.LastSubmit.ID, Photo)`

<details>
<summary>Answer</summary>

**Correct answer:** B. `ThisItem.Photo`

**Explanation:** Inside a form data card, `ThisItem` refers to the record bound to the form. Setting the Image property of the image control to `ThisItem.Photo` displays the photo associated with the currently selected record.

</details>

---

### Question 18 — Single Choice

You want to save changes made in a form control back to the data source when a button is pressed.

Which formula should be set on the button's **OnSelect** property?

- A. `SaveData(Form1, "local")`
- B. `Patch(Machines, Form1.Updates)`
- C. `SubmitForm(Form1)`
- D. `UpdateContext({Saved: true})`

<details>
<summary>Answer</summary>

**Correct answer:** C. `SubmitForm(Form1)`

**Explanation:** `SubmitForm(Form1)` submits the data in the form control back to the connected data source. This is the standard way to save changes made in a form when a button is selected.

</details>

---

### Question 19 — Single Choice

A maker wants to use Copilot to build an app from an Excel spreadsheet that does not have data formatted as a table.

Which statement is accurate about this scenario?

- A. Copilot requires data to be formatted as a table in Excel before it can create an app.
- B. Copilot can work with Excel spreadsheets that do not have data formatted as a table, as long as Dataverse is available.
- C. Copilot can only create apps from CSV files, not Excel files.
- D. Copilot is only available in environments without Dataverse.

<details>
<summary>Answer</summary>

**Correct answer:** B. Copilot can work with Excel spreadsheets that do not have data formatted as a table, as long as Dataverse is available.

**Explanation:** When building in a Dataverse-enabled environment, Copilot can create an app from any Excel spreadsheet — even without data formatted as a table. Copilot creates and configures the Dataverse tables automatically during the import process.

</details>

---

### Question 20 — Multi-Select

Your team is evaluating which data sources to use for a new Power Apps solution. The solution must support multiple concurrent users, large datasets, and advanced app features.

Which two data sources are considered premium options that support large datasets and advanced scenarios? (Select **two**.)

- A. SharePoint
- B. Microsoft Dataverse
- C. Excel stored in OneDrive
- D. SQL Server
- E. Local CSV files

<details>
<summary>Answer</summary>

**Correct answer:** B. Microsoft Dataverse, D. SQL Server

**Explanation:** Dataverse and SQL are premium data source options in Power Apps. Both support large datasets and advanced scenarios. Dataverse also enables Copilot features. SharePoint and Excel are non-premium options suitable for smaller datasets and learning scenarios.

</details>

---

### Question 21 — Multi-Select

You are designing a canvas app that will be deployed globally across multiple regions and used by employees with varying accessibility needs.

Which two design considerations should you plan for from the beginning? (Select **two**.)

- A. Using high-resolution images to improve visual fidelity
- B. Supporting users with vision, hearing, or motor impairments through accessible design
- C. Accounting for numeric and language differences across regions (localization)
- D. Locking all data cards to prevent accidental edits
- E. Restricting the app to desktop browsers only

<details>
<summary>Answer</summary>

**Correct answer:** B. Supporting users with vision, hearing, or motor impairments through accessible design, C. Accounting for numeric and language differences across regions (localization)

**Explanation:** Both accessibility and localization are key design considerations when building global apps. Power Apps offers built-in support for accessible design, and localization ensures features like decimal symbols and language differences are handled correctly for different regions.

</details>

---

### Question 22 — Multi-Select

A maker is planning a Power Apps solution for a multi-department organization. They need to assess business requirements before development begins.

Which three items are valid business requirement considerations for a Power Apps project? (Select **three**.)

- A. Security, privacy, or compliance requirements
- B. The number of screens in the app
- C. Storage or access restrictions for sensitive data
- D. Government regulations or organizational policies
- E. The font size used for headers in the app

<details>
<summary>Answer</summary>

**Correct answer:** A. Security, privacy, or compliance requirements, C. Storage or access restrictions for sensitive data, D. Government regulations or organizational policies

**Explanation:** Business requirements for Power Apps projects include security and compliance considerations, data storage and access restrictions, and applicable regulations or policies. UI details like font size and screen count are design decisions, not business requirements.

</details>

---

### Question 23 — Fill-in-the-Blank

To access the Power Apps Maker portal, you navigate to ___ in your web browser and sign in using your organizational ___ account.

<details>
<summary>Answer</summary>

**Answer:** make.powerapps.com; Microsoft 365

**Explanation:** The Power Apps Maker portal is located at make.powerapps.com. Makers sign in using their organizational Microsoft 365 account to begin building apps.

</details>

---

### Question 24 — Fill-in-the-Blank

In a Power Apps gallery, the formula ___ dynamically refers to the current record, allowing each control inside the gallery to display data specific to that item.

<details>
<summary>Answer</summary>

**Answer:** ThisItem

**Explanation:** `ThisItem` is a Power Fx keyword used inside gallery controls. It dynamically references the current record in the gallery, so each control inside the gallery shows its own record's data.

</details>

---

### Question 25 — Fill-in-the-Blank

Power Automate Desktop extends automation capabilities to legacy systems on a local machine by replicating routine ___ interactions, such as clicking buttons or entering data.

<details>
<summary>Answer</summary>

**Answer:** user (desktop)

**Explanation:** Power Automate Desktop replicates routine user interactions on a desktop, such as clicking buttons or entering data. When used with premium connectors, these desktop flows can be triggered from cloud-based Power Automate flows initiated through Power Apps.

</details>
