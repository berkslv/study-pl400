---
name: create-recall-content-from-docs
description: >
  Reads all markdown files in a given directory (or directories) containing
  Microsoft Learn documents and generates a compact RECALL.md file per directory.
  The file contains a keyword table, main ideas, and a mini quiz (5–10 questions)
  for quick content recall and self-testing. Use this skill when asked to create
  a recall document, recall card, or study recap from documentation stored as
  markdown files.
---

The user will provide one or more folder paths containing markdown files retrieved from a Microsoft Learn module. Your job is to read those files and produce a `RECALL.md` in each folder.

## Step-by-step instructions

1. **Discover source files**
   - For each provided folder, list all `.md` files.
   - **Exclude** the following from processing:
     - Any existing `RECALL.md`, `SUMMARY.md`, or `QUIZ.md`
     - Files whose name contains `quiz`, `summary`, or `cleanup` (case-insensitive)
   - Read all remaining files in parallel to collect their full content.

2. **Extract keywords**
   - Identify the 8–15 most important technical terms, concepts, components, and named features from across all the files.
   - For each term, write a single-sentence definition (≤ 20 words) grounded in the source material.
   - Exclude generic words; prefer domain-specific vocabulary.

3. **Extract main ideas**
   - Produce 8–15 bullet points capturing the most essential facts, definitions, capabilities, and constraints from the source material.
   - **Strip** all of the following:
     - Time estimates, welcome/intro filler, motivational language
     - Recap sentences ("In this module, you learned…")
     - Redundant repetition
   - **Keep**: definitions, feature lists, procedures, decision criteria, limits, warnings, code samples.
   - Each bullet must be a standalone, concrete fact — no prose paragraphs.

4. **Generate mini quiz**
   - Produce **5–10 questions** total (scale to content richness).
   - Mix question types:
     - **Single choice (A/B/C/D):** ~60% of questions. Four options, one correct. Lead with a short scenario or context, then the question stem.
     - **Fill-in-the-blank:** ~40% of questions. Use `___` for each blank. Keep questions concise.
   - Quality rules:
     - Each question must be answerable from the source files alone.
     - No trick questions, double negatives, or "all of the above" options.
     - Distractors must be plausible (related but incorrect terms).
     - Do not repeat the same fact across questions.
     - Use present tense and active voice.

5. **Format RECALL.md**
   - Use the exact structure below. Do not deviate from headings or table format.

```
# Recall: <Derived module topic title>

> **Source files:** <comma-separated list of source .md file names used>

---

## Keywords

| Term | Definition |
|------|-----------|
| <Term> | <One-sentence definition ≤ 20 words> |
| <Term> | <One-sentence definition ≤ 20 words> |

---

## Main Ideas

- <Key fact, definition, or concept>
- <Key fact, definition, or concept>

---

## Mini Quiz

### Q1 — <Single Choice | Fill-in-the-Blank>

<Optional one-sentence scenario.>

<Question stem?>

- A. <Option>
- B. <Option>
- C. <Option>
- D. <Option>

<details>
<summary>Answer</summary>

**Correct answer:** <Letter and option text>

**Explanation:** <1–2 sentence explanation referencing the source content.>

</details>

---

### Q2 — Fill-in-the-Blank

<Sentence with one or more ___ blanks.>

<details>
<summary>Answer</summary>

**Answer:** <word or phrase for each blank, in order>

**Explanation:** <1–2 sentence explanation.>

</details>

---
```

   - Rules:
     - Use `---` horizontal rules between all major sections and between quiz questions.
     - Do not include a section that contains no content after filtering.
     - Keep the Keywords table and Main Ideas list tight — this is a recall card, not a full summary.

6. **Write the file**
   - Save the output as `RECALL.md` in the same folder as the source markdown files.
   - If a `RECALL.md` already exists, overwrite it.
   - If the user provided multiple directories, repeat steps 1–5 for each directory independently.
   - Confirm to the user how many source files were processed per directory, the number of quiz questions generated, and the file path(s) written.
