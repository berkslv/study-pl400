# Power Apps data sources

- 9 minutes

When you're learning to use Power Apps, there are several data source options available at no extra cost. Power Apps can connect to hundreds of data sources, though some require additional licensing. This unit highlights some of the most popular options.

## SharePoint

SharePoint enables you to build data lists and document libraries. A SharePoint list functions like a table and can serve as a backend data source for your app. Document libraries allow for storing documents or reading table data, such as spreadsheet files from OneDrive.

SharePoint lists can be simple single-column lists (for example, dropdown data) or multi-column lists with complex structures. Multiple SharePoint lists or document libraries can be connected to a single app.

Key design considerations when using SharePoint as a data source:

- Use simple column types such as Text, Number, Yes/No, or Date and time. Avoid complex SharePoint column types unless necessary.
- Avoid mandatory columns in SharePoint. Required inputs can be enforced within the app.
- Use simple column names without special characters or spaces. You can apply display names within the app.
- SharePoint lists don't have relational table support. Create key fields manually if relationships are needed.
- SharePoint is subject to a delegation limit. Queries returning more data than this limit may result in incomplete results, indicated by a warning icon in the app.

## Excel

Excel is a non-premium data source supported by Power Apps. Excel tabular data can also be imported into SharePoint or Dataverse.

Important considerations:

- Data must be formatted as a table in Excel. Unformatted data won't be accessible from Power Apps.
- Image columns must be labeled with "[image]" to appear in galleries. Fields may need adjustment for correct data display.
- If the Excel file is open by another user, read/write operations may be blocked. For apps with multiple users, Excel isn't recommended as a live data source.

Excel is useful for learning scenarios and smaller datasets, though SharePoint is more robust.

## Dataverse

Microsoft Dataverse is the most powerful and scalable data source available for Power Apps. When an environment includes Dataverse, data tables are available directly within the same environment as your apps. Power Apps enables easy creation and import of Dataverse tables.

Key benefits:

- No API configuration is needed—data access is native.
- Supports large datasets and can be scaled with additional licensing.
- Provides high-performance querying and automatic table relationships.
- Enables building connected data experiences across multiple tables.
- Fully supports Copilot for natural language-based app generation.

From the **Power Apps Maker Portal**, use **Start with data** to create or select Dataverse tables. This provides full access to Power Apps generative AI features.

## SQL

SQL is a premium data source suited for large-scale apps. Many organizations already manage business data in SQL, and it can be connected to Power Apps easily.

- If hosted in the cloud (for example, Microsoft SQL Server), connecting is straightforward.
- If hosted on-premises, you can use an on-premises Data Gateway to securely connect Power Apps to local SQL databases.

SQL supports relational data and large volumes, making it ideal for enterprise-grade solutions.

## Summary

This unit introduced four common data source options:

- **SharePoint** and **Excel** are available without extra cost. They're ideal for learning and small to medium data volumes.
- **Dataverse** and **SQL** are premium options. They support large datasets, relationships, and advanced scenarios. Dataverse also enables Copilot features.

Power Apps supports connecting to all these sources within a single app, and even allows custom connectors for unsupported systems.

In the next unit, you'll build an app from Excel using Copilot.
