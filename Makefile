.PHONY: install uninstall
.DEFAULT_GOAL := install

install:
	@echo "\033[1;33m=> Running installation...\033[0m"
	@if [ -d ".venv" ]; then \
		echo "Virtual environment '.venv' already exists. Synchronizing dependencies..."; \
		. .venv/bin/activate && uv sync; \
		echo "\n\033[0;32m✨ Installation updated.\033[0m"; \
	else \
		bash bin/install.sh; \
	fi

uninstall:
	@echo "\033[1;31m=> Removing virtual environment and cached data...\033[0m"
	@rm -rf .venv
	@rm -rf .uv.cache
	@find . -type f -name "*.pyc" -delete
	@find . -type d -name "__pycache__" -exec rm -rf {} +
	@echo "\033[0;32m✅ Cleaned.\033[0m"
