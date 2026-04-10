# Dataverse auditing

- 4 minutes

Microsoft Dataverse supports an auditing feature designed to meet internal and external auditing, compliance, security, and governance policies common to many enterprises. Dataverse auditing logs changes made to customer records in an environment with a Dataverse database. It also logs user access through an app or through the SDK in an environment.

Dataverse auditing is supported on all custom and most customizable tables and columns. Audit logs are stored in Dataverse and consume log storage capacity. You can view audit logs in the **Audit History** tab for a single record, or in the **Audit Summary View** to see all audited operations in a single environment. Audit logs can also be retrieved using the Web API or the SDK for .NET.

## Key concepts

- Auditing can be configured at three levels: environment, table, and column. Table-level auditing requires that environment-level auditing be enabled. Column-level auditing requires that both environment-level and table-level auditing be enabled.
- To enable user access auditing (Log access) or activity logging (Read logs), auditing must be enabled at the environment level.
- You must have the System Administrator or System Customizer role—or equivalent permissions—to enable or disable auditing.
- Auditing can be configured manually in the Power Platform admin center or the Power Apps portal, or programmatically.

## Configure tables and columns for auditing in Power Apps

This procedure requires the System Administrator or System Customizer role—or equivalent permissions.

1. Sign in to Power Apps using the appropriate credentials.
2. Select the desired environment.
3. To configure a table for auditing, select **Tables**.
4. Select a table.
5. Select **Properties** from the *Table properties* pane.
6. In the *Edit table* panel on the right side of the screen, expand **Advanced options**.
7. Under *For this table*, select the checkbox next to **Audit changes to its data**.
8. Select **Save**.
9. Select **Back** to return to the table viewer. Next, configure auditing for a column.
10. In the **Schema** pane, select **Columns**.
11. Select the column you want to audit to open the **Edit column** pane.
12. Expand **Advanced options**, then select the checkbox next to **Enable auditing**.
13. Select **Save**.

With this setup, Microsoft Dataverse can track changes to a table or a specific column. Audit data is accessible in model-driven apps under the **Audit History** tab for a record. To view auditing at the environment level, use the **Audit Summary View** in the Power Platform admin center. It provides a comprehensive list of all audit logs in the environment.
