# Use PowerShell on Windows, default shell elsewhere
set windows-shell := ["powershell.exe", "-NoLogo", "-Command"]

# Show the list of available recipes by default
default:
    @just --list

# Install all dependencies and git hooks
setup:
    uv sync
    uv run pre-commit install

# Lint the code and apply safe fixes
lint:
    uv run ruff check --fix

# Format the code
fmt:
    uv run ruff format

# Run the type checker
typecheck:
    uv run pyright

# Run the test suite
test *args:
    uv run pytest {{args}}

# Run all pre-commit hooks on every file
hooks:
    uv run pre-commit run --all-files

# Run everything that CI will run
check: lint fmt typecheck test

# Create a commit with commitizen
commit:
    uv run cz commit

# Bump the version and update the changelog
bump:
    uv run cz bump
