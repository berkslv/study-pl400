# PL-400: Microsoft Power Platform Developer

Study resources for the [PL-400](https://learn.microsoft.com/en-us/certifications/exams/pl-400/) certification exam, based on Microsoft Learn content with practice quizzes.

## Structure

Each module contains numbered notes from Microsoft Learn, exercises, knowledge checks, and a `QUIZ.md` for self-assessment.

## Adding New Modules with Copilot CLI Skills

This repo uses two agent skills to streamline adding content:

| Skill | Description |
|-------|-------------|
| `retrieve-microsoft-learn-as-markdown` | Fetches a Microsoft Learn module and saves all units as markdown files |
| `generate-quiz-from-docs` | Reads markdown files in a folder and generates a `QUIZ.md` with practice questions |

To add a new module:

1. Ask Copilot to use the `retrieve-microsoft-learn-as-markdown` skill with the URL of the target Microsoft Learn module.
2. Ask Copilot to use the `generate-quiz-from-docs` skill on the new module folder to create a `QUIZ.md`.

## Contributing

Open issues or pull requests to improve notes, fix errors, or add new modules.
