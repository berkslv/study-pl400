# Set up an app for Application Insights

> 4 minutes

Sending telemetry from a canvas app requires the following steps:

1. Provision an Application Insights resource at the [Azure portal](https://portal.azure.com/).
2. Edit your canvas app to set up the **Instrumentation Key** and then publish the app.

Now, when users run your published app outside of Power Apps Studio, it will send telemetry to Application Insights.

## Manage usage and costs for Application Insights

The pricing for Application Insights is a pay-as-you-go model based on data volume that is ingested and, optionally, for longer data retention. Each billing account includes 5 GB of log data ingestion, so you might find that low usage apps that log sporadic data have no extra ingestion cost.

When setting up your Application Insights resource, you can choose the default Log Analytics workspace or you can create a custom workspace.

## Multiple apps in one Application Insights resource

You can set up multiple apps to log data to the same Application Insights resource by setting up each to use the same Instrumentation key. Contained in the details of the logged events is an `ms-appId` property that will be tracked to keep each app data identifiable. The default visualizations will mix the data from all apps, which makes analyzing a single app difficult. However, you can view the combined usage of all apps in one place.

When you set up multiple apps so that each has its own Application Insights resource and Instrumentation key, the event data is separated. This approach will help make it easier to visualize single app usage patterns but not usage across a set of apps.

If you plan to use Application Insights for multiple apps, make sure that you consider how you will consume the data.

## Move from development to production

After you have set up an Instrumentation key on your app and have saved and published the app, whenever the published app is run, it will send telemetry to Application Insights. By default, if you transport the app to test and production environments, the app will use the same Instrumentation key and will log to the same Application Insights resource. The only time that the app will not send data is if it's run from Power Apps Studio while you are building the app.

> **Note:** Environment variables are not currently supported for configuring the Instrumentation key.

If you are using Microsoft Power Platform CLI to unpack and pack an application that has the Instrumentation key set up, the key is unpacked into a file named `AppInsightsKey.json`. You could use the CLI along with a source control strategy to allow the app to have different keys.

## No access to your company Azure subscription

You can still use Application Insights capability, even if you don't have permissions to set up the required Azure resources. Ask your Microsoft Entra ID administrator to create the Application Insights resource in the company Azure subscription. The administrator would then share the Instrumentation key with you to use in the application. The administrator can also grant you access to the Application Insights resource so that you can view and analyze the data that has been collected.
