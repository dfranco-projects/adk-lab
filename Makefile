.PHONY: install
install:
	@if [ -d ".venv" ]; then \
		echo "Warning: virtual environment '.venv' already exists. Skipping initialization and syncing dependencies."; \
		. .venv/bin/activate && uv sync; \
	else \
		bash ./bin/install.sh; \
	fi
