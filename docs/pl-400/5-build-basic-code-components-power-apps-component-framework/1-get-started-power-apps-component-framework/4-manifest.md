# Component manifest

Configuring the component manifest is an essential step in building a code component. The `ControlManifest.Input.xml` file is initialized with your choices (like name and component type) when you use the `pac pcf init` command. You must still customize the file to specify properties, resources, and any framework features you use.

## Component properties

Properties define a contract between the code component and the hosting application. They abstract the maker from implementation details while providing configurable capabilities. Common uses:

- Pass business data into and from the code component (e.g., a geolocation to render on a map).
- Control component features and behaviors (e.g., enable/disable zoom on a map).
- Allow styling customization (e.g., pin color on a map).

### Property attributes

| Attribute | Description |
| --- | --- |
| **of-type** | Defines the data type (e.g., `SingleLine.Text`, `Enum`, `Whole.None`, `Lookup.Simple`). Avoid changing data types after publishing. |
| **usage** | Identifies if the property is `input`, `output`, or `bound` (model-driven apps). `bound` expects a table data column. |
| **required** | Indicates if a value is required. Consider impact on existing apps when adding required properties to published components. |
| **default-value** | Provides a default value (only allowed for `input` usage in model-driven apps). Helps makers understand intended use. |

### Best practices for properties

- Avoid having too many properties requiring the maker to navigate a long list.
- Use clear property names and provide descriptions informing the maker of purpose.
- Consider adding style properties to allow use across a variety of applications.
- Avoid renaming or removing properties after publishing — these are breaking changes for existing consuming apps.

## Component resources

The `resource` node in the manifest identifies resource files the component requires. Initially only contains the required **code** element.

### CSS

```xml
<css path="css/ComponentCommon.css" order="1" />
<css path="css/ProgressIndicator.css" order="2" />
```

### Localized strings (resx)

Property manifest attributes `display-name-key` and `description-key` look up localized values from a loaded **resx** resource file.

Example property definition:

```xml
<property name="PercentComplete"
          description-key="PercentComplete_Desc"
          display-name-key="PercentComplete"
          required="true"
          usage="input"
          of-type="Whole.None"
          default-value="40" />
```

Corresponding entries in a `.resx` file:

```xml
<data name="PercentComplete" xml:space="preserve">
    <value>Percent Complete</value>
</data>
<data name="PercentComplete_Desc" xml:space="preserve">
    <value>Percent Complete is the current value for how much has been completed.</value>
</data>
```

Loading resx files for multiple locales in the manifest:

```xml
<resx path="strings/ProgressIndicator.1033.resx" version="1.0.0" />
<resx path="strings/ProgressIndicator.1035.resx" version="1.0.0" />
<resx path="strings/ProgressIndicator.3082.resx" version="1.0.0" />
```

## Component feature usage

Framework device, utility, and WebAPI features must be declared in the manifest before use. Only available for components used in a model-driven app.

Example enabling the WebAPI feature:

```xml
<feature-usage>
    <uses-feature name="WebAPI" required="true" />
</feature-usage>
```
