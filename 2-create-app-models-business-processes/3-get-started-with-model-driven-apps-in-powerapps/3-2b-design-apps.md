# Design model-driven apps

- 12 minutes

Before you begin building your Power Apps solution, you want to map out what you need the app to do. First, what do you want to accomplish with the app? In other words, what are your business requirements or user needs? Second, since model-driven apps start with data, you need to develop a data model. Third, keeping your business requirements in mind, you add business logic to the design. Finally, you determine how you want to display the output.

Important factors to consider for model-driven app design:

- Business requirements
- Data Model
- Business Logic
- Output

By going through a simple design process, you can flush out any minor issues and prevent them from becoming larger problems after the app is in production.

Create model-driven apps using the App Designer. You choose the tables, dashboards, Business Process flows, forms, and other components that you want to make available in your app, and then Power Apps creates the app for you.

## Business requirements

The first step in the process is to understand your business requirements. Work with app stakeholders to consider your security, accessibility, data, and design needs.

Dataverse has a robust security model. Consider how securing your app's data affects your app and what security model best supports your business needs. There are lots of options available, including hierarchy security and row-level security.

Additionally, identify any government regulations or authentication/authorization requirements (if applicable). You may want to implement multifactor authentication but will need to think about how such requirements affect users connecting to your application.

Finally, does your app need to be available when the user is disconnected from the internet? This availability is called Offline Mode and is supported by Dataverse and Model-driven apps when using iOS or Android clients.

## Data model

When conducting data modeling, here are a couple of important questions to ask yourself:

- What type of data will your solution be storing and or collecting?
- How will this data relate to the other data you're working with?

Consider the three most important elements of your data model as *table*, *column*, and *relationship*. Once you've clearly defined the tables that you will be creating, decide which columns will be in each table and the relationship between the tables. After this, you can develop and tweak forms, views, and visualizations. Data is the foundation of a model-driven app.

Model-driven apps use a metadata-driven architecture. The app's design is based on how your data is modeled, and there's no need to write custom code to alter the app design. Metadata means "data about data" and defines the data structure stored in the system.

> **Note:** If a column type needs to be changed to a different column type (e.g., text column to a choice), then you'll need to delete the column and recreate with the correct column type. Doing this causes you to lose all the data in the column.

## User Interface (UI) and User Experience (UX)

When you build a Model-driven app, Power Apps determines most of the UI and UX for you. You define the data model to build from, and then Power Apps determines the controls to be used in the app. You can modify these controls by changing what table assets are included. In the App Designer, you can update the Forms, Views, Charts, and Dashboards for your app; you can also control the navigation options.

## Business logic

You can incorporate business logic into your app in two ways: setting **Business Rules** on Dataverse tables or building **Business Process Flows**.

**Business Rules** are used to set requirements for users when interacting with data. With business rules you can make a column required, set a default value, or show or hide a column based on other criteria.

**Business Process Flows** guide users through using your app. They're only available for Model-driven apps. These flows visually guide users to the next step in a process and facilitate more user actions at each step. Business Process Flows let you bring automation to your app and make it more of a guided experience.

## Output

Apps often need data visualization. To meet this need, you can create dashboards with custom filters and visual graphics, integrating all the data directly into your app. When creating dashboards, make sure they're simple for users to consume without overwhelming them with data. Provide high-level snapshots of your data and allow users to apply filters and drill downs to dive deeper into the data if needed.

## Industry accelerators

Microsoft collaborates with various industries to tailor the Dataverse data model to their needs. Whether you're in Health, Finance, Banking, Education, Non-Profit, Automotive, or Media, Microsoft regularly releases accelerators and foundational components to help you quickly set up your solution.
