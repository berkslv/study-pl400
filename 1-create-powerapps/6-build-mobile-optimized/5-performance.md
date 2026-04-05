# Identify performance considerations for a mobile-optimized canvas app

Power Apps provides built-in tools that help make it easier to identify performance issues. The **App checker** is a valuable tool for diagnosing app problems.

In addition to using the **App checker**, more advanced users can use **Power Apps Monitor** to identify potential performance bottlenecks. However, **App checker** is the most accessible performance troubleshooting feature.

## Reduce data access

To improve performance, reduce the amount of data your app needs to access. Apps that retrieve less data generally perform better. Also, minimizing the number of "gates" or connectors that data must pass through can enhance speed.

## Choose the right data source

Among the data sources available, **Dataverse** typically offers the best performance. Because Microsoft Power Apps and **Dataverse** exist within the same environment, data access doesn't require API calls.

Other sources may introduce latency:

- Data from an on-premises server must go through an on-premises data gateway.
- Cloud-based SQL databases are strong options, but still rely on API calls.
- **SharePoint** can be effective for smaller data loads but may slow down as list size increases due to API dependencies.

## Performance optimization tips

- Limit the amount of data the app retrieves.
- Design galleries and forms to source data from a single data source when possible.

Performance is especially critical in mobile scenarios. As your app scales, continue to prioritize efficient data access and responsiveness.
