# Summary

Understanding your data source and its potential impact on app functionality is key when creating apps. In this module, we explored the concept of delegation in Power Apps — what it is, the factors influencing its availability, and ways to tweak delegation limits. Here are the key takeaways:

- **Delegation boosts performance** by minimizing data exchanges between Power Apps and the data source, allowing calculations to occur in the backend data vs. Power Apps.
- **The ability to delegate varies** based on the function, predicate, and data source used.
- **When delegation isn't possible**, Power Apps alerts the app creator within the Power Apps Studio but doesn't notify the app user.
- **By default, a nondelegable query returns 500 records**, but this can be increased to a maximum of 2,000 for more extensive data retrieval.

In the upcoming module, you dive into expanding your access to various data sources by constructing custom connectors.
