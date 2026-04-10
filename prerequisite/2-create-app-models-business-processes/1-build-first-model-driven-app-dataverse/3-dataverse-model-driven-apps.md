# Model-driven apps, powered by Microsoft Dataverse

- 5 minutes

When creating a model-driven app, you use tables from Microsoft Dataverse as your building blocks. Model-driven apps start with your data model, building up from the shape of your core business data and processes in Dataverse to model forms, views, charts, and other components.

It's important to ensure that your business data and business processes at the data level are structured properly before you compose your app, but you can also make adjustments as you create your application. Model-driven apps will automatically generate a UI that is responsive across devices; however, this outcome relies heavily on how your data is modeled in Dataverse.

## Approach to model-driven app making

When creating model-driven apps, it's important to focus on three areas:

- Modeling business data
- Defining business processes
- Composing the app

More information on creating model-driven apps is included in the [Create relationships, business rules, calculations, and roll-ups in Dataverse](https://learn.microsoft.com/en-us/training/paths/create-relationships-common-data-service/) Learning Path and in [Overview of building model-driven apps](https://learn.microsoft.com/en-us/power-apps/maker/model-driven-apps/model-driven-app-overview/).

Consider the Asset Checkout app, which has three data tables: Product, Reservation, and Review.

These three tables have established relationships. As an example, there's a many-to-one relationship for the **Associated Product** column between the **Review** table and **Product** table.

Similarly, a many-to-one relationship is setup using the **Product Reservation** column between the **Reservation** and **Product** table.

In the app designer, you can see each table has its own form.

Because of the direct connection to Dataverse tables, model-driven apps give you flexibility to choose which form you want to include on any page, and which view or chart to display. When you choose to edit a form, view, or chart, the app editor takes you directly to the Dataverse table where you modify or create these elements. As soon as you publish any changes you make to the table, the app form/view/chart changes as well. Not only that, but any other model-driven app using that table as a data source will instantly gain access to the views/forms/charts that you modify or create.
