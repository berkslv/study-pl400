# Summary: Introduction to Developing with Microsoft Dataverse

> **Source files:** 1-introduction.md, 2-extensibility.md, 3-framework.md

---

## When to Use Code Extensibility

- Code extensions are required when automation needs to occur that existing features don't support and can't be built with low-code techniques like Power Automate.
- Extensibility points frequently execute as server-side code via **plug-ins**.
- Power Automate and Flow enable asynchronous automation but cannot fully replicate plug-in capabilities for synchronous rules.
- Plug-ins are required when implementing synchronous operations within a model-driven application.

---

## Dataverse Architecture Overview

- Dataverse is a **software-as-a-service (SaaS)** platform — underlying storage is abstracted from developers.
- Provides a **metadata-driven architecture** enabling creation of custom tables and extension of existing tables.
- Customizations (tables, columns, relationships, forms, views) are stored as metadata within a **Dataverse solution**.
- Solutions are used to package and transport customizations across environments.
- Microsoft first-party apps built on Dataverse: **Dynamics 365 Sales**, **Dynamics 365 Customer Service**, **Dynamics 365 Field Service**.

### Metadata and Tooling

- Dataverse exposes an **OData V4 RESTful endpoint** (the Dataverse Web API) to view and manipulate metadata.
- **Metadata Browser** is a Microsoft-provided solution installable into any model-driven Power App.
- **XrmToolbox** offers a community metadata browser plugin.

---

## .NET Assemblies (Plug-ins)

- Plug-ins are managed code classes registered to run when specific Dataverse events occur.
- Plug-in execution pipeline has three stages: **Pre-Validation**, **Pre-Operation**, **PostOperation**.
- Plug-ins can be configured to run **synchronously** or **asynchronously**.
  - Synchronous: execute immediately at the registered stage; the entire operation waits until complete.
  - Asynchronous: executed via a system job after the operation completes; **only available for PostOperation stage**.
- Plug-ins can also implement logic for **Dataverse Custom API messages**.
- Registration is performed using the **Plugin Registration Tool**.

---

## Dataverse APIs

- **Dataverse Web API**: RESTful OData interface; usable by any application capable of HTTP requests/responses.
- **SDK for .NET**: Typed .NET classes; **required** for Dataverse plug-in development.
- For most non-plug-in uses, either API style can be chosen based on what fits the build.

---

## Event Framework

- Dataverse exposes events indicating where processing is in the pipeline.
- Subscribing to events involves three decisions:
  1. Which **message** (operation type) to handle: Create, Retrieve, RetrieveMultiple, Update, Delete, Associate, Disassociate.
  2. Which **pipeline stage** to execute in: Pre-Validation, Pre-Operation, or PostOperation.
  3. Which **execution mode**: synchronous or asynchronous.

### Event Messages

- Basic data operation messages: `Create`, `Retrieve`, `RetrieveMultiple`, `Update`, `Delete`, `Associate`, `Disassociate`.
- Contextual messages exist depending on table type (e.g., `CalculateRollupField` for tables with rollup columns).
- Custom messages can be found by searching the `Microsoft.Sdk.Messages` namespace for classes ending in `*Request`.
- Custom messages can be created by defining custom **Actions**.

### Pipeline Stages

| Stage | Purpose |
|---|---|
| **Pre-Validation** | Runs before security checks; use for permission validation or to cancel operations before the transaction. Throw `InvalidPluginExecutionException` to cancel. |
| **Pre-Operation** | Runs before the record is saved; use to change table values prior to persistence. |
| **PostOperation** | Runs after the operation; use to modify message properties before the response is returned. Avoid triggering additional table updates here. |

### Execution Modes

- **Synchronous**: runs at the registered pipeline stage; multiple plug-ins at the same stage are ordered by the **execution order** attribute in the Plugin Registration Tool.
- **Asynchronous**: dispatched as a system job; executes after the operation completes; only registerable on **PostOperation**.

---

## References

- [Asynchronous service](https://learn.microsoft.com/en-us/power-apps/developer/data-platform/asynchronous-service)
- [Browse table definitions in your environment](https://learn.microsoft.com/en-us/power-apps/developer/common-data-service/browse-your-metadata)
- [Create your own actions](https://learn.microsoft.com/en-us/power-apps/developer/data-platform/custom-actions)
- [Dataverse Developer Guide](https://learn.microsoft.com/en-us/power-apps/developer/data-platform/overview)
- [Microsoft.Sdk.Messages namespace](https://learn.microsoft.com/en-us/dotnet/api/microsoft.xrm.sdk.messages/)
- [Register a plug-in](https://learn.microsoft.com/en-us/power-apps/developer/data-platform/register-plug-in)
- [Understand the Execution Context](https://learn.microsoft.com/en-us/power-apps/developer/data-platform/understand-the-data-context)
- [Use messages with the Organization service](https://learn.microsoft.com/en-us/power-apps/developer/data-platform/org-service/use-messages)
- [XrmToolbox Metadata Browser](https://www.xrmtoolbox.com/plugins/MsCrmTools.MetadataBrowser/)
