#!bin/bash
set -e

declare VENV_DIR=$(pwd)/.venv
if ! [ -d "$VENV_DIR" ]; then
    python3 -m venv $VENV_DIR
fi

. $VENV_DIR/bin/activate
pip install uv

if ! [ -f "pyproject.toml" ]; then
    uv init .
fi
uv sync

echo ""
echo "✅ Setup complete. Your virtual environment is ready."
