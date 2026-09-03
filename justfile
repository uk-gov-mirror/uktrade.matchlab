# Run the test suite
test *ARGS:
    uv run pytest {{ARGS}}

# Run the benchmark suite
bench *ARGS:
    uv run python -m benchmarks {{ARGS}}

# Review a dummy testkit-generated pipeline in the evaluation TUI
eval:
    uv run matchlab review scripts.test_eval:entities --tag demo

# Delete all compiled Python files
clean:
    find . -type f -name "*.py[co]" -delete
    find . -type d -name "__pycache__" -delete

# Run a local documentation development server
docs:
    uv run zensical serve

# Reformat and lint
format:
    uvx ruff@latest format .
    uvx ruff@latest check . --fix
    uvx uv-sort@latest pyproject.toml

# Run type checking
check *ARGS:
    uvx ty@latest check --output-format concise {{ARGS}}
