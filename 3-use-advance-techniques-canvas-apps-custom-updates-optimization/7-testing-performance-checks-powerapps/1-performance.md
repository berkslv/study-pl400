# The importance of thinking about performance

- 8 minutes

The performance of an app is important to keep users happy. Apps can go from mediocre to great based on performance. And sometimes it can be a simple change like caching data in a collection or removing redundant calls to the data source.

In this module, you'll learn about common performance problems, ways to mitigate their impact, and how to perform testing to discover the issues.

## The most common performance bottleneck - Data sources

The most common app performance problems come from interactions with data sources. Almost every app has one or more data source. Power Apps natively supports over 200 different connections to these data sources and using these connections is key to a great app.

Calling these data sources from your app is often the largest bottleneck in your app because of the time it takes to call across the network to the data source, process the request on the data source side, return the data to Power Apps across the network, and then for Power Apps to process and display the data. Optimizing these interactions with data sources are key to great performance. The following sections highlight some of the most common mistakes.

### Too many refreshes

Using the Refresh function, you can force Power Apps to update the data it has gathered from a given data source. This seems like a great function to run because you get the freshest data in your app. But, Power Apps will often handle this refresh for you. For example, when you use a Form to submit a new record to a data source displayed in a Gallery control, Power Apps will automatically refresh that connection. If you include a Refresh function when you navigate to the Gallery screen you're now refreshing the data that Power Apps already refreshed. This is redundant and slows down your app for no reason.

> **Note:** Do not use the Refresh function until you are certain it is needed.

### Too many lookups

As you start to use relational data, a common mistake is not to consider the ramifications of a LookUp function inside of a Gallery. When you place a LookUp function on a Label inside of the Gallery, then that LookUp will be performed once for every record in the Gallery. That means if you have 100 records in the Gallery the app has to perform 100 individual LookUp calls to the data source to render. Depending on the data source, this could take minutes to render. A better approach is only to display the related data using a details screen or to use a Collection to cache the data from the data source, then the LookUp doesn't have to execute across the network.

> **Note:** Be careful when making additional calls to remote data sources if you use controls that display multiple records.

### Storing data in the wrong data source

Different data sources are optimized for different workloads and this should be a consideration when choosing where to store data. One example is storing images or files. A common use of Power Apps is to capture images either using the Camera control or the device's built-in camera app. After the user has taken the image, it needs to be saved. One option is to store the image in the same SQL Server database as the other app data. While possible, it's important to note that SQL Server is inefficient in storing images. Writing and reading the image file to an SQL database is slow, causing your app to run slow. A better option is to store Power Apps images in the Azure Blob Storage. Azure Blob Storage is faster than writing the same data to SQL Server. This minor change to the underlying structure of your app can have a useful impact on user satisfaction.

> **Note:** Choose the optimal data source for your app to get maximum performance.

## Other performance considerations

While data sources might be the largest bottlenecks, there are other easily overlooked changes you can make to get optimal performance. Some other common issues include:

- **Asset size** - When you're designing your app it's great to include company logos and other visual assets. When you add these assets to your app, make sure the assets are optimized for the size of your app. The higher the resolution of a file, the larger the file size, and the more resources it takes for your app to store and display the image. Use an image editing tool to resize your files to the size you need for your app.
- **Republish your app** - The Power Apps team is constantly updating Power Apps to bring new features and to increase performance. The only way that your app takes advantage of these advancements is for you to open the app and publish again. Your app stays on the version that it was published on until you do this. So periodically revisiting your app to move to the latest version provides you with the best possible performance.
- **Build focused apps** - Power Apps supports building apps with as many screens as you can imagine, but too many screens aren't a good idea. You should build your apps focused on a specific audience and process. This allows you to optimize the user experience for one audience, makes building and troubleshooting the app easier, and reduces the size of the app. If you have one app for everything, consider breaking it into smaller apps by role.

## Optimize performance in small steps

As you work through this module, you're going to learn about the different techniques and options for optimizing performance. Before you get too deep in optimizing your app, remember that the most important thing is that your app works. A fast-performing app that only throws errors when the user uses it has no value.

It's often easier to build your app so that it accomplishes its goals and is fully functional. After the app works, you can then revisit the app for changes you can make to increase performance - making those changes one at a time confirming they don't break functionality. This methodology of making small changes will have the highest rate of success. As you become more comfortable with the different performance concepts, you'll learn to build the app with them from the start. But in the meantime, build an app that works and then optimize.

## Additional information

To supplement the concepts in this module, there are two additional reading options to help you increase your performance mindset.

- [Performance considerations with Power Apps](https://www.microsoft.com/power-platform/blog/power-apps/performance-considerations-with-powerapps/) - Discusses better ways to load data, patterns, limits, custom APIs, and file optimization.
- [Power Apps Canvas App Coding Standards and Guidelines](https://www.microsoft.com/power-platform/blog/wp-content/uploads/2024/06/PowerApps-canvas-app-coding-standards-and-guidelines.pdf) - This is a living document that not only covers performance and testing techniques but also explores standards and documentation of your app.

Now that you're aware of the benefits of optimizing performance and some of the common issues to look out for, the remainder of this module will provide you with techniques to increase performance and how to use various methods for testing your app.
