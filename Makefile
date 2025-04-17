 .RECIPEPREFIX := >
 .PHONY: all format lint typecheck security test coverage pre-commit

 all: format lint typecheck security test

 format:
 > black .
 > isort .

 lint:
 > flake8 .

 typecheck:
 > mypy .

 security:
 > bandit -r .
 > pip-audit --exit-code-only

 test:
 > pytest --maxfail=1 --disable-warnings --cache-clear

 coverage:
 > coverage run -m pytest
 > coverage report -m

 pre-commit:
 > pre-commit run --all-files