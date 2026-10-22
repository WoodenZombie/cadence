# Cadence

A personal agentic assistant that helps me prepare for my exams, plan the week and keep the budget under control, all from a single Telegram chat.

> **Status:** early development. The repository currently contains the project skeleton and developer tooling. The features below are planned, not implemented yet.

## What it will do

Cadence connects the tools I already use and puts an LLM-driven agent on top of them. I write a message in Telegram, the agent figures out what I want, proposes a concrete action and executes it only after I confirm.

- **Calendar.** Create and move events in Google Calendar, including study sessions.
- **Tasks.** Capture and organise tasks in TickTick.
- **Budget.** Log expenses and check balances in Actual Budget.
- **Exam preparation.** Plan study sessions around the official exam topics and send reminders before each session.
- **Weekly planning.** Turn tasks, deadlines and study goals into a realistic plan for the week.

### Design principles

- **Confirm before acting.** The agent never changes anything on its own. Every action is a proposal with *Yes / Edit / Cancel* buttons.
- **Single user.** The bot answers only to an allowlisted Telegram user ID.
- **Everything is logged.** Each proposed and executed action is stored and can be reviewed with a `/history` command.
- **Swappable LLM.** The model sits behind a small interface, so the provider can be changed without touching the rest of the code.
- **Testable.** Integrations are adapters behind interfaces, which makes it possible to test the whole flow with a fake LLM.

## Roadmap

| Stage | Scope |
| ----- | ----- |
| E0 | Repository setup, tooling, config skeleton, research spikes on the external APIs |
| E1 | Telegram bot, action log in SQLite, LLM layer, action proposals, confirmation flow, intent routing |
| Next | Calendar, TickTick and Actual Budget adapters, study session reminders, weekly planning |

Detailed tasks are tracked in the GitHub project board.

## Getting started

The project is set up for development only at the moment; there is nothing to run yet.

### Prerequisites

- [uv](https://docs.astral.sh/uv/) to manage Python and dependencies (Python 3.13 is installed automatically)
- [just](https://github.com/casey/just) as a task runner
- [Git](https://git-scm.com/)

### Setup

```bash
git clone <repository-url>
cd <repository-folder>
just setup
```

`just setup` creates the virtual environment, installs the dependencies and installs the git hooks.

### Everyday commands

| Command | What it does |
| ------- | ------------ |
| `just` | List all available commands |
| `just check` | Lint, format, type-check and run the tests |
| `just test` | Run the test suite |
| `just hooks` | Run all pre-commit hooks on every file |
| `just commit` | Create a commit with the interactive Commitizen prompt |

## Development

- **Branches:** `<type>/<issue-number>-<short-description>`, for example `feat/10-telegram-bot-skeleton`. Work on short-lived branches and never commit to `main` directly.
- **Commits:** [Conventional Commits](https://www.conventionalcommits.org/), enforced by a Commitizen hook. Use `just commit` for the interactive prompt.
- **Code quality:** Ruff for linting and formatting, Pyright for type checking, Gitleaks to catch secrets. They all run through pre-commit.
- **Comments in code are written in English.**

## Project layout

```text
src/        application code
tests/      automated tests
```

The layout will grow as the first features land.

## License

See the [LICENSE](LICENSE) file.
