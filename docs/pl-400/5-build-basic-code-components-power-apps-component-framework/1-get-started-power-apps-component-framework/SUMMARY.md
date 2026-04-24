# Summary: Getting Started with Power Apps Component Framework

> **Source files:** 1-introduction.md, 2-architecture.md, 3-tooling.md, 4-manifest.md, 5-demo.md

---

## Overview

- Power Apps component framework enables creation of reusable code components for Power Apps and Power Pages.
- Used when out-of-the-box components don't meet app maker needs.
- Code components are visual controls that can also include business logic.
- Replaces the older HTML web resource approach with a modern, supported framework.

### Advantages

- Rich framework APIs: component lifecycle management, contextual data, metadata.
- Support for client frameworks such as React and AngularJS.
- Seamless server access via Web API, utility/data formatting methods, device features (camera, location, microphone).
- Optimized for performance and reusability.
- Responsive web design support.
- All files bundleable into a single solution file.

### Component Types

- **Field** — Custom control for a single field on a form (e.g., slider instead of text box, with custom business logic per available data).
- **Dataset** — Custom control to display rows of data (e.g., daily scheduler instead of a grid, with drag-and-drop support).

### Ecosystem

- **Creator Kit** — Collection of pre-built PCF controls using the Fluent UI framework; source available on [GitHub](https://github.com/microsoft/powercat-creator-kit/).
- **PCF Gallery** — Community-built open-source code components at [pcf.gallery](https://pcf.gallery/).
- **Community forum** — [Power Apps component framework, ALM & Pro Dev](https://powerusers.microsoft.com/t5/Power-Apps-Component-Framework/bd-p/pa_component_framework/).

---

## Architecture

- Built with HTML, CSS, and TypeScript. React and Fluent UI are popular UI framework choices.

### Component Composition

- **Manifest** (`ControlManifest.Input.xml`) — Declares properties available to the hosting application.
- **Implementation** — TypeScript class implementing the `StandardControl` interface.
- **Resource files** — CSS, images, localization files, etc.

```typescript
export class FirstControl implements ComponentFramework.StandardControl<IInputs, IOutputs> {}
```

### StandardControl Interface Methods (Lifecycle)

| Method | Required | Description |
| --- | --- | --- |
| `init` | Required | Initialize component instance; kick off remote calls. Cannot initialize dataset values here. |
| `updateView` | Required | Called when any value in the property bag changes. Must handle pending load states with a visual indicator. |
| `getOutputs` | Optional | Called before receipt of new data; use when dynamically managing bound properties. |
| `destroy` | Required | Cleanup and release memory when component is removed from the DOM (e.g., call `ReactDOM.unmountComponentAtNode`). |

### Life Cycle Flow

1. Framework calls `init()`.
2. If interactive, component calls `notifyOutputChanged` to notify the host of output changes.
3. Framework calls `getOutputs` to retrieve values for all bound properties.
4. Runtime notifies the host, which validates output:
   - Valid → `updateView` called with new value.
   - Invalid (e.g., business rule rejection) → `updateView` called with old value and an error message.

---

## Tooling

| Step | Tool(s) |
| --- | --- |
| Create | Power Platform CLI |
| Implement | Any code editor or IDE |
| Build | Power Platform CLI or VS Code |
| Debug | Power Platform CLI (test harness) |
| Package | Power Platform CLI + Visual Studio msbuild |

### Power Platform CLI Key Commands

Update CLI to latest:
```bash
pac install latest
```

Initialize a component project (field example):
```bash
pac pcf init --namespace Contoso --name Slider --template field
```

Initialize with automatic npm install:
```bash
pac pcf init --namespace Contoso --name Slider --template field --run-npm-install
```

Install dependencies:
```bash
npm install
```

Build (validates manifest, transpiles TypeScript):
```bash
npm run build
```

Test locally with test harness:
```bash
npm start
```

Test harness with watch mode:
```bash
npm start watch
```

Push to Dataverse environment:
```bash
pac pcf push --publisher-prefix dev
```

### Solution Management (Visual Studio / msbuild)

Initialize a solution:
```bash
pac solution init --publisher-name Contoso --publisher-prefix contoso --outputDirectory vssolution
```

Add component reference to solution:
```bash
pac solution add-reference --path <path to your Power Apps component framework project>
```

First build (restores NuGet packages):
```bash
msbuild /t:build /restore
```

Subsequent builds:
```bash
msbuild
```

- Generated solution files output to `\bin\debug\` or `\bin\release\`.
- If `msbuild` is not recognized, run from Developer Command Prompt for Visual Studio.
- Can deploy automatically using [Microsoft Power Platform Build Tools](https://marketplace.visualstudio.com/items?itemName=microsoft-IsvExpTools.PowerPlatform-BuildTools).

### IDE

- Recommended: Visual Studio Code or Visual Studio.
- Power Platform extension for VS Code available at [Visual Studio Marketplace](https://marketplace.visualstudio.com/items?itemName=microsoft-IsvExpTools.powerplatform-vscode).

---

## Component Manifest (`ControlManifest.Input.xml`)

- Initialized by `pac pcf init`; must be customized to specify properties, resources, and feature usage.

### Properties

- Define the contract between the code component and the hosting app.
- App makers can statically set property values or dynamically bind to data columns.

**Property Attributes:**

| Attribute | Description |
| --- | --- |
| `of-type` | Data type (e.g., `SingleLine.Text`, `Enum`, `Whole.None`, `Lookup.Simple`). Do not change after publishing. |
| `usage` | `input`, `output`, or `bound` (model-driven only). `bound` expects a table column. |
| `required` | Whether a value is required. Adding required properties to published components affects existing apps. |
| `default-value` | Default value; only allowed for `input` usage in model-driven apps. |

**Best Practices:**
- Avoid too many properties.
- Use clear names and descriptions.
- Include style properties for flexibility across apps.
- Do not rename or remove properties after publishing — breaking change for consuming apps.

### Resources

CSS resources:
```xml
<css path="css/ComponentCommon.css" order="1" />
<css path="css/ProgressIndicator.css" order="2" />
```

Localized string property definition:
```xml
<property name="PercentComplete"
          description-key="PercentComplete_Desc"
          display-name-key="PercentComplete"
          required="true"
          usage="input"
          of-type="Whole.None"
          default-value="40" />
```

Corresponding `.resx` entries:
```xml
<data name="PercentComplete" xml:space="preserve">
    <value>Percent Complete</value>
</data>
<data name="PercentComplete_Desc" xml:space="preserve">
    <value>Percent Complete is the current value for how much has been completed.</value>
</data>
```

Loading multiple locale resx files:
```xml
<resx path="strings/ProgressIndicator.1033.resx" version="1.0.0" />
<resx path="strings/ProgressIndicator.1035.resx" version="1.0.0" />
<resx path="strings/ProgressIndicator.3082.resx" version="1.0.0" />
```

### Feature Usage

- Framework device, utility, and WebAPI features must be declared before use.
- Only available for model-driven app components.

Enable WebAPI feature:
```xml
<feature-usage>
    <uses-feature name="WebAPI" required="true" />
</feature-usage>
```

---

## References

- [Fluent UI framework](https://developer.microsoft.com/fluentui/)
- [Microsoft Power Platform Build Tools](https://marketplace.visualstudio.com/items?itemName=microsoft-IsvExpTools.PowerPlatform-BuildTools)
- [PCF Gallery](https://pcf.gallery/)
- [Power Apps component framework, ALM & Pro Dev community forum](https://powerusers.microsoft.com/t5/Power-Apps-Component-Framework/bd-p/pa_component_framework/)
- [Power Platform VS Code extension](https://marketplace.visualstudio.com/items?itemName=microsoft-IsvExpTools.powerplatform-vscode)
- [PowerCAT Creator Kit on GitHub](https://github.com/microsoft/powercat-creator-kit/)
- [React](https://reactjs.org/)
