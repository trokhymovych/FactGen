lint: ## Lint whole python project
	@echo "Run linter truthlinker and tests folders"
	flake8 wikifactgen/ tests/
	isort --check-only --diff --stdout .
	mypy wikifactgen/
	@echo "Done"

format: ## Format python code
	isort .

install: ## Create virtual environment and setup requirements
	@echo "Setup poetry virtual environment"
	poetry install
	@echo "Done"

activate_virtual_env: ## Activate virtual environment
	@echo "Activating poetry virtual environment"
	poetry shell
	@echo "Done"

test: ## Run test suit
	@echo "Running tests..."
	pytest tests --cov=wikifactgen
	@echo "Done test run"

test_cov: ## Run test suit
	@echo "Running tests..."
	pytest tests --cov=wikifactgen --cov-report=html
	@echo "Done test run"

ci_lint: ## Lint whole python package in CI runner
	poetry run flake8 wikifactgen/ tests/
	poetry run isort --check-only --diff --stdout .
	poetry run mypy wikifactgen/

ci_test: ## Lint whole python package in CI runner
	poetry run pytest tests/ --cov=wikifactgen