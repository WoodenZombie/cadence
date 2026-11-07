# Agent instructions

## Project

A personal agentic assistant (Telegram bot) for exam preparation, weekly planning and budget.
See README.md for the overview.

## Architecture

Ports and adapters. Dependency rule:

- `domain/` imports nothing from the project.
- `ports/` and `services/` depend only on `domain/` and `ports/`.
- `adapters/` depend on `domain/` and `ports/`, never on each other.
- Wiring happens only in the entry point.

## Conventions

- Python 3.14, dependencies are managed with uv. Run everything via `just` or `uv run`.
- All comments in code are written in English.
- Conventional Commits; branches are named `<type>/<issue-number>-<description>`.
- The agent never changes external systems without a user confirmation.
- Secrets live only in `.env`, never in code or config files.

## Before finishing a task

Run `just check` and make sure it passes.
