# PL-400: Microsoft Power Platform Developer

Study resources for the [PL-400](https://learn.microsoft.com/en-us/certifications/exams/pl-400/) certification exam, based on Microsoft Learn content with practice quizzes.

## Structure

Each module contains numbered notes from Microsoft Learn, exercises, knowledge checks, and a `QUIZ.md` for self-assessment.

## Adding New Modules with Copilot CLI Skills

This repo uses four agent skills to streamline adding and studying content:

- **`retrieve-microsoft-learn-as-markdown`** — Fetches a Microsoft Learn module and saves all units as markdown files in a dedicated folder.
  - *Example:* "`retrieve-microsoft-learn-as-markdown` `https://learn.microsoft.com/en-us/training/modules/intro-to-power-apps/` under .\3-use-advance-techniques-canvas-apps-custom-updates-optimization"
  - *Note:* You should update the order number like 1- or 2- in beginnig of the newly created module.

- **`generate-quiz-from-docs`** — Reads all markdown files in a folder and generates a `QUIZ.md` with Microsoft-style multiple choice and fill-in-the-blank exam questions.
  - *Example:* "Use the `generate-quiz-from-docs` skill on the `1-create-powerapps` folder"

- **`summarize-microsoft-learn`** — Reads all markdown files in a folder and generates a concise `SUMMARY.md` retaining only definitions, concepts, procedures, best practices, and code samples.
  - *Example:* "Use the `summarize-microsoft-learn` skill on the `2-create-app-models-business-processes` folder"

- **`create-recall-content-from-docs`** — Reads all markdown files in a folder and generates a compact `RECALL.md` with a keyword table, main ideas, and a mini quiz for quick content recall and self-testing.
  - *Example:* "Use the `create-recall-content-from-docs` skill on the `3-use-advance-techniques-canvas-apps-custom-updates-optimization` folder"

To add and study a new module:

1. Ask Copilot to use the `retrieve-microsoft-learn-as-markdown` skill with the URL of the target Microsoft Learn module.
2. Optionally, ask Copilot to use the `generate-quiz-from-docs` skill on the new module folder to create a `QUIZ.md`.
3. Optionally, ask Copilot to use the `summarize-microsoft-learn` skill to get a dense `SUMMARY.md`.
4. Optionally, ask Copilot to use the `create-recall-content-from-docs` skill to get a `RECALL.md` for quick review.

## Contributing

Open issues or pull requests to improve notes, fix errors, or add new modules.
