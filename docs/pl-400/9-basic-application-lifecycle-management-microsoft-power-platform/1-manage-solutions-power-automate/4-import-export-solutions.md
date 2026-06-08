# Exercise - Import and export solutions

Completed

- 10 minutes

Consider a scenario where you have a solution that includes an app, table, and a flow. You now want to export this solution from one tenant, which is the source, and then import it to another tenant, which is the destination.

1. In the source tenant, sign in to Power Apps and then select **Solutions**, which is available in the left vertical navigation. Select **Export solution**.

[![Screenshot of the Power Apps Solutions page with Volunteer Request selected and the Export button highlighted.](media/new-export-solution.svg)](media/new-export-solution.svg#lightbox)
2. Select **Publish**. This selection will make sure that all changes that are made to this solution are part of this published solution.

[![Screenshot of the Before you export dialog with the Publish button highlighted.](media/publish-solution-ssm-new.png)](media/publish-solution-ssm-new.png#lightbox)
3. Select **Next** once the customizations are finished publishing.
4. You then need to decide which environment this solution will be exported to. If it's a test or a production environment, then select **Managed** (recommended). If you're moving it to another development environment, select **Unmanaged** and then select **Export**.

[![Screenshot of the Export this solution dialog with Export as set to Managed and the Export button highlighted.](media/select-managed-unmanaged-ssm.png)](media/select-managed-unmanaged-ssm.png#lightbox)

    Note

    Solution Version numbers are used to keep track of the functionality contained in a particular solution release. Versioning is used in Microsoft Power Platform to determine if code being imported is a solution or a patch. Power Platform solution versions are in the format &lt;major&gt;.&lt;minor&gt;.&lt;build&gt;.&lt;revision&gt;. When you create a new version, you will be asked to enter the version number. This defaults to 1.0.0.0 and auto increments based on the Solution update. An update must have a higher major, minor, build or revision number than the parent solution. For example, for a base solution version 1.0.0.0, a small update could be version 1.0.0.1, or a slightly more significant update could have version 1.0.1.0. A substantially more significant update could be version 2.2.0.0.

    In the upper left of the screen, you should see a message stating that the solution was exported, and a download button will appear on the right side. Select the download button to get a zip file of your solution.

[![Screenshot of Power Automate with the message Volunteer Request was exported and will download soon.](media/new-solution-download.svg)](media/new-solution-download.svg#lightbox)

    The zipped file name contains the solution name, if it's managed or unmanaged, and the version number.

[![Screenshot of zipped file named VolunteerRequest_1_0_0_1_managed.zip.](media/zipped-file-name-ssm.png)](media/zipped-file-name-ssm.png#lightbox)
5. Go to your destination tenant, sign in to Power Apps, and then select **Solutions**, which is available in the left vertical navigation. Select **Import**.

[![Screenshot of the Power Apps Solutions page with the Import button highlighted.](media/new-solution-import.svg)](media/new-solution-import.svg#lightbox)
6. If you receive an authentication window, enter your credentials to continue.

[![Screenshot of the Microsoft &quot;Pick an account&quot; authentication window.](media/authentication-window-ss.png)](media/authentication-window-ss.png#lightbox)
7. Select the zipped file that was exported.

[![Screenshot of the Open dialog showing the zipped file that was exported.](media/exported-zip-ss.png)](media/exported-zip-ss.png#lightbox)
8. Select **Next**.

[![Screenshot of Import Solution wizard Select Solution Package with the VolunteerRequest file selected and the Next button highlighted.](media/new-import-solution.svg)](media/new-import-solution.svg#lightbox)
9. Select **Import**.
10. If you receive warnings, then you can select the warning or download the log file.

You'll now see your solution imported successfully in the new tenant.

[![Screenshot of Solutions list with Volunteer Request highlighted.](media/solution-imported-successfully-ssm.png)](media/solution-imported-successfully-ssm.png#lightbox)
