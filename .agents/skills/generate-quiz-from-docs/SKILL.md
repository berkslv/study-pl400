---
name: generate-quiz-from-docs
description: >
  Reads all markdown files in a given folder and generates a QUIZ.md file
  containing Microsoft-style multiple choice and fill-in-the-blank exam questions.
  Use this skill when asked to create a quiz, practice assessment, or exam questions
  from documentation or study material stored as markdown files.
---

The user will provide a folder path that contains markdown files retrieved from Microsoft documentation. Your job is to read those files and produce a `QUIZ.md` in the same folder.

## Step-by-step instructions

1. **Discover source files**
   - List all `.md` files in the provided folder, excluding any existing `QUIZ.md`.
   - Read every file in parallel to collect the full content.

2. **Analyse the content**
   - Identify key concepts, features, configuration steps, decision points, API behaviours, and best-practice guidelines covered across all the files.
   - Group related concepts by topic/section so questions are spread evenly across the material.

3. **Generate questions**
   - Produce a minimum of **20 questions** total (scale up if content is rich).
   - Mix question types as follows:
     - **Multiple choice – single answer (A/B/C/D):** ~60 % of questions. Present exactly 4 options; only one is correct. Mirror real exam phrasing: scenario-first, then the question stem at the end.
     - **Multiple choice – multiple answers:** ~20 % of questions. State explicitly how many options to select (e.g. "Select **two**"). Provide 5–6 options.
     - **Fill-in-the-blank:** ~20 % of questions. Use `___` to mark each blank. Provide an **Answer** line beneath the question showing the correct term(s).
   - Follow these Microsoft exam quality rules:
     - Lead with a realistic scenario or use case before asking the question.
     - Avoid trick questions, double negatives, and "all of the above" / "none of the above" options.
     - Distractors (wrong options) must be plausible — use related but incorrect terms or concepts.
     - Each question must be answerable from the source material alone.
     - Do **not** repeat the same fact across multiple questions.
     - Use present tense and active voice.

4. **Format QUIZ.md**
   - Use the exact template below. Do not deviate from the heading and numbering style.

```
# Quiz: <Derived topic title>

> **Source material:** <list the markdown file names used, comma-separated>
> **Total questions:** <N>  
> **Question types:** Multiple choice (single), Multiple choice (multi-select), Fill-in-the-blank

---

## Questions

### Question 1 — <Type: Single Choice | Multi-Select | Fill-in-the-Blank>

<Scenario paragraph if applicable.>

<Question stem ending with a question mark or colon.>

- A. <Option>
- B. <Option>
- C. <Option>
- D. <Option>

<details>
<summary>Answer</summary>

**Correct answer:** <Letter(s) and option text>

**Explanation:** <1–3 sentence explanation referencing the source content.>

</details>

---

### Question 2 — <Type>
...
```

   For **fill-in-the-blank** questions, use this variant inside the `<details>` block instead of A/B/C/D options:

```
### Question N — Fill-in-the-Blank

<Sentence with one or more ___ blanks.>

<details>
<summary>Answer</summary>

**Answer:** <word or phrase for each blank, in order>

**Explanation:** <1–3 sentence explanation.>

</details>
```

   For **multi-select** questions, add `(Select <N>.)` at the end of the question stem and list 5–6 lettered options.

5. **Write the file**
   - Save the output as `QUIZ.md` in the same folder as the source markdown files.
   - If a `QUIZ.md` already exists, overwrite it.
   - Confirm to the user how many questions were generated and list the source files that were used.
