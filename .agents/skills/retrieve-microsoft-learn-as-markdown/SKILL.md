---
name: retrieve-microsoft-learn-as-markdown
description: 'Fetch a Microsoft Learn module and save all units as markdown files'
---

Fetch the Microsoft Learn module at this URL and save each unit as a markdown file:

URL: ${input:url:Paste the Microsoft Learn module URL here (e.g. https://learn.microsoft.com/en-us/training/modules/...)}

Follow these steps:

1. Call `microsoft_docs_fetch` on the module index URL to get the module overview as markdown. The response will include a list of unit links as relative paths (e.g. `[Unit title](unit-slug)`).
2. Resolve each unit link to its full URL by appending the slug to the module base URL.
3. Call `microsoft_docs_fetch` on each unit URL in parallel to get clean markdown content.
4. Derive the output folder name from the module slug (last path segment of the module URL).
5. Save each unit as `<folder>/<unit-slug>.md`. Create the folder if it doesn't exist.
6. Format each file with proper markdown: `#` for the page title, `##`/`###` for sections, fenced code blocks for code/formulas, and bullet lists for list items.
