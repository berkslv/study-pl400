---
name: summarize-microsoft-learn
description: >
  Reads all markdown files in a given Microsoft Learn module directory and
  generates a SUMMARY.md file with a concise, information-dense summary.
  Strips storytelling, filler, and motivational language — retains only
  definitions, concepts, procedures, best practices, and code samples.
  Use this skill when asked to summarize a Microsoft Learn module or directory.
---

The user will provide a folder path containing markdown files retrieved from a Microsoft Learn module. Your job is to read those files and produce a `SUMMARY.md` in the same folder.

## Step-by-step instructions

1. **Discover source files**
   - List all `.md` files in the provided folder.
   - **Exclude** the following from processing:
     - Any existing `SUMMARY.md` or `QUIZ.md`
     - Files whose name contains `quiz`, `summary`, or `cleanup` (case-insensitive)
   - Read all remaining files in parallel to collect their full content.

2. **Filter each file's content**
   - **Strip out** (do not include in the summary):
     - Time estimates (lines like `- 4 minutes`, `- 10 minutes`, etc.)
     - Welcome / intro filler (e.g. "Welcome to your learning journey!", "We're excited to partner with you...")
     - Recap sentences that just list what was already covered (e.g. "In this module, you learned about...", "You explored...", "Continue with the next module...")
     - Motivational or marketing language
     - Redundant repetition of facts already captured from an earlier file
   - **Retain everything else**, especially:
     - Definitions and explanations of concepts, features, and components
     - Capability and feature lists (bullet points)
     - Named connectors, APIs, services, UI elements, and their roles
     - Step-by-step procedures and configuration instructions
     - Decision criteria, constraints, limits, and best practices
     - Warnings, notes, and important callouts
     - Code samples and formulas — preserve these as fenced code blocks exactly as they appear in the source

3. **Organise the content**
   - Group extracted information into logical topic sections. Derive section titles from the subject matter (not from file names).
   - Within each section, use:
     - **Bullet points** for individual facts, definitions, and feature items
     - **Numbered lists** for sequential steps or procedures
     - **Fenced code blocks** for all code samples, formulas, and expressions
   - Do **not** write prose paragraphs. Every sentence must carry concrete information.
   - Do **not** repeat the same fact across multiple sections.

4. **Format SUMMARY.md**
   - Use the exact structure below:

```
# Summary: <Derived module topic title>

> **Source files:** <comma-separated list of source .md file names used>

---

## <Major Topic 1>

- <Fact, definition, or concept>
- <Fact, definition, or concept>

### <Sub-topic if needed>

- <Fact>
- <Fact>

1. <Step one>
2. <Step two>
3. <Step three>

```<language if known>
<code sample>
```

---

## <Major Topic 2>

...

---

## References

- [<Link text>](<URL>)
- [<Link text>](<URL>)
```

   - Rules:
     - The `## References` section must contain all unique external URLs found across all source files, deduplicated and sorted alphabetically by link text.
     - Omit the `## References` section entirely if no external links are present in the source files.
     - Use `---` horizontal rules between major sections.
     - Do not add any section that contains no information after filtering.

5. **Write the file**
   - Save the output as `SUMMARY.md` in the same folder as the source markdown files.
   - If a `SUMMARY.md` already exists, overwrite it.
   - Confirm to the user how many source files were processed and list their names.
