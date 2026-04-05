# Configure multiple forms

Users of model-driven applications encounter different forms for the same table depending on their role, job tasks, and desired outcomes.

## Form Order

Form order defines the order in which a user sees the available forms, within the set of allowed forms for their security roles.

- Configure form order from **Form settings** by dragging and dropping forms
- Save the reordering with the **Save and publish** button

## Access to Forms

You can assign a security role (or collection of security roles) to control access to a form. For example:
- Sales users can have a *Contact* form with LinkedIn Sales Navigator widgets
- Non-sales users can have a copy of the form without unnecessary components

> **Note**: Controlling user access to forms is not necessarily a secure means to prevent access to data. Users may still access data via advanced find or background automation.

## Form Types and Behaviors

### Main
- Primary user interface for viewing and interacting with data
- Widest range of options; available for model-driven apps
- Responsive to the size and type of device (including Dynamics 365 for Outlook and tablets)
- Design once and deploy everywhere
- **AutoSave** is the default behavior (administrators can disable it)

### Quick Create
- Streamlined data entry with full support for form scripts and business rules
- Appears when a user selects **Create** from the navigation bar or **+ New** from a lookup or subgrid
- Used by model-driven apps and Dynamics 365 mobile apps for creating new rows
- Only one quick-create form can be designated for use (set by form order)
- Cannot be assigned to security roles; users can't switch between them
- Must be enabled for the table

### Quick View
- Added to another form as a quick view control
- Provides a template to view information about a related table row within a form
- App users won't need to navigate to a different row to see related information
- Associated with a lookup column included in a form
- Data is **not editable** in quick view controls
- Quick view forms **do not support** form scripts

### Card
- Used in views for model-driven apps
- Presents information in a compact format suitable for **mobile devices**
- Added to apps differently: added to views using the **Read-only Grid** control (not as an app component)

## Miscellaneous Form Details

- Each table must have a designated **fallback form** — the form all users see if they don't have a matching security role assigned
  - Fallback forms only apply to main forms (not quick create, quick view, or card forms)
- When a user has access to multiple forms, they see a **form selector** near the top of the form
- You can designate a main form as **inactive** to make it invisible to all users regardless of security role
