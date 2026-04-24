# Summary: Build, Package, and Debug a Power Apps Code Component (PCF)

> **Source files:** 1-introduction.md, 2-package-code-component.md, 3-debug-code-component.md

---

## Overview

- Code components (PCF) require custom code and consist of three elements: **manifest**, **implementation**, and **resources**.
- Used to replace or extend built-in controls (e.g., gauge for percentage, barcode renderer, drag-and-drop grid).
- Can wrap existing web framework components (React, Angular, etc.).
- Exercise builds an **editable field component**: read-only by default, editable on user request.

---

## Prerequisites and Tooling

- **Node.js** (LTS recommended, e.g., v20.12.2) — verify with `npm --version` and `Node --version`
- **Visual Studio Code**
- **Power Platform Tools extension** for VS Code
- **Power Platform CLI** (MSI install for Windows-level access)
- **MSBuild** (via Visual Studio or Visual Studio Build Tools) — required for solution packaging

---

## Creating a New Component Project

1. Open VS Code terminal and navigate to your working directory.
2. Create and enter the project folder:
   ```console
   md source
   cd source
   md editable-pcf
   cd editable-pcf
   ```
3. Initialize the PCF project:
   ```console
   pac pcf init --namespace SampleNamespace --name EditablePCF --template field
   ```
4. Install build tools:
   ```console
   npm install
   ```
5. Open the project in VS Code:
   ```console
   code -a .
   ```

---

## Manifest Configuration (`ControlManifest.Input.xml`)

- Set `version` to `1.0.0` and `description-key` to `Edits project name`.
- Update `property` node: set `name="Name"`, `display-name-key="Name"`, `description-key="A name"`.
- Add CSS resource reference in `resources` node:
  ```css
  <css path="css/EditablePCF.css" order="1" />
  ```

---

## Adding CSS Styling

- Create a `css` folder inside the component folder.
- Create `EditablePCF.css` with:
  ```css
  .SampleNamespace\.HelloPCF {
        font-size: 1.5em;
      }
  ```
- CSS filename must exactly match the `path` attribute in the manifest — mismatch is a common build error.

---

## Building the Component

```console
npm run build
```

- Compiled output written to `out/controls/EditablePCF/`
- Build artifacts: `css/` folder, `bundle.js` (bundled source), `ControlManifest.xml` (uploaded to Dataverse)

---

## Implementing Component Logic (`index.ts`)

### Private Variables

```TypeScript
private context: ComponentFramework.Context<IInputs>;
private container: HTMLDivElement;
private notifyOutputChanged: () => void;
private isEditMode: boolean;
private name: string | null;
```

### `init` Method

```TypeScript
public init(context: ComponentFramework.Context<IInputs>, notifyOutputChanged: () => void, state: ComponentFramework.Dictionary, container: HTMLDivElement) {
    this.context = context;
    this.notifyOutputChanged = notifyOutputChanged;
    this.container = container;
    this.isEditMode = false;

    const message = document.createElement("span");
    message.innerText = `Project name ${this.isEditMode ? "" :context.parameters.Name.raw}`;

    const text = document.createElement("input");
    text.type = "text";
    text.style.display = this.isEditMode ? "block" : "none";

    if (context.parameters.Name.raw) {
        text.value = context.parameters.Name.raw;
        const messageContainer = document.createElement("div");
        messageContainer.appendChild(message);
        messageContainer.appendChild(text);

        const button = document.createElement("button");
        button.textContent = this.isEditMode ? "Save" : "Edit";
        button.addEventListener("click", () => { this.buttonClick(); });

        this.container.appendChild(messageContainer);
        this.container.appendChild(button);
    }
}
```

### `buttonClick` Method

```TypeScript
public buttonClick() {
    const text = this.container.querySelector("input")!;
    const message = this.container.querySelector("span")!;
    const button = this.container.querySelector("button")!;

    if (!this.isEditMode) {
        text.value = this.name ?? "";
    } else if (text.value != this.name) {
        this.name = text.value;
        this.notifyOutputChanged();
    }

    this.isEditMode = !this.isEditMode;
    message.innerText = `Project name ${this.isEditMode ? "" : this.name}`;
    text.style.display = this.isEditMode ? "inline" : "none";
    text.value = this.name ?? "";
    button.textContent = this.isEditMode ? "Save" : "Edit";
}
```

### `updateView` Method

```TypeScript
public updateView(context: ComponentFramework.Context<IInputs>): void {
    this.name = context.parameters.Name.raw;
    const message = this.container.querySelector("span")!;
    message.innerText = `Project name ${this.name}`;
}
```

### `getOutputs` Method

```TypeScript
public getOutputs(): IOutputs {
    return {
        Name: this.name ?? undefined
    };
}
```

### `destroy` Method

```TypeScript
public destroy() {
    this.container.querySelector("button")!.removeEventListener("click", this.buttonClick);
}
```

---

## Running the Test Harness

```console
npm run build
npm start
```

- `npm start` launches a browser with the component in the **Power Apps component test harness**.
- Watch mode (auto-reloads on changes):
  ```console
  npm start watch
  ```
- Watch mode tracks: `index.ts`, `ControlManifest.Input.xml`, imported libraries, and manifest resources.
- Stop the watcher: `CTRL+C`, then `Y`.

---

## Packaging and Deploying

### Option 1: Push via CLI (development/testing)

```console
pac pcf push --publisher-prefix msl
```

- Creates a temporary solution `PowerAppsTools_msl` and pushes directly to the authenticated Dataverse environment.
- Requires an Auth Profile set up in the Power Platform VS Code extension pointing to the target environment.
- Target environment must have **Component Framework** enabled in Power Platform Admin Center.

### Option 2: Create Solution ZIP (pipelines/manual deploy)

1. Create and enter a `Solution` folder:
   ```console
   md Solution
   cd Solution
   ```
2. Initialize solution project:
   ```console
   pac solution init --publisher-name mslearn --publisher-prefix msl
   ```
3. Add PCF component reference:
   ```dotnetcli
   pac solution add-reference --path ..
   ```
4. Build solution (first time use `/restore`):
   ```console
   "C:\Program Files (x86)\Microsoft Visual Studio\2022\BuildTools\MSBuild\Current\Bin\MSBuild.exe" /t:build /restore
   ```
5. Solution ZIP is output to `Solution\bin\Debug\` (or `bin\Release\` for release builds).

- Default package type is **Managed**. To change, edit `.cdsproj`:
  ```xml
  <PropertyGroup>
    <SolutionPackageType>Unmanaged</SolutionPackageType>
  </PropertyGroup>
  ```
- Release build: `msbuild /p:configuration=Release`

---

## Testing and Debugging

### Test Harness Features

- **Context Inputs**: Set Form Factor (Web, Tablet, Phone), explicit width/height.
- **Data Inputs**: Provide field values; for dataset components, load CSV mock data.
- CSV format example:
  ```
  name, telephone1, address1_city
  Joe, 123-555-0100, Seattle
  Mary, 123-555-0101, Atlanta
  Steve, 123-555-0102, Redmond
  ```

### Browser DevTools (Edge / Chrome / Firefox / Safari)

- Open DevTools: **F12**
- **Elements panel**: Inspect rendered HTML; use "Select element" icon or right-click > Inspect.
- **Console panel**: View `console.log()` output; run ad-hoc script in live environment context.
- **Sources panel**: Set breakpoints in `index.ts`; step through logic; inspect variable values at runtime.

---

## References

- [Connecting to your environment](https://learn.microsoft.com/en-us/power-apps/developer/component-framework/import-custom-controls#connecting-to-your-environment)
- [Deploying code components](https://learn.microsoft.com/en-us/power-apps/developer/component-framework/import-custom-controls#deploying-code-components)
- [Google Chrome DevTools](https://developers.google.com/web/tools/chrome-devtools)
- [Microsoft Edge DevTools](https://learn.microsoft.com/en-us/microsoft-edge/devtools-guide-chromium)
- [Mozilla Firefox Debugger](https://developer.mozilla.org/docs/Tools/Debugger)
- [Package a code component](https://learn.microsoft.com/en-us/power-apps/developer/component-framework/import-custom-controls)
- [Safari Developer Tools](https://support.apple.com/guide/safari-developer/welcome/mac)
- [Sample components (Angular/React)](https://learn.microsoft.com/en-us/power-apps/developer/component-framework/use-sample-components/)
- [Visual Studio Build Tools](https://visualstudio.microsoft.com/downloads/#build-tools-for-visual-studio-2022)
