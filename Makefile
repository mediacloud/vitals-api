# from rss-fetcher
#	from mc-providers (removed make test), from es-tools, from sitemap-tools

# to create development environment: `make`
# to run pre-commit linting/formatting: `make lint`

VENVDIR=.venv
VENVBIN=$(VENVDIR)/bin
VENVDONE=$(VENVDIR)/.done

help:
	@echo Usage:
	@echo "make install -- installs pre-commit hooks, dev environment"
	@echo "make lint -- runs pre-commit checks"
	@echo "make deploy -- run deployment script"
	@echo "make list-outdated -- list outdated dependencies"
	@echo "make lock -- make uv.lock"
	@echo "make update -- update .pre-commit-config.yaml"
	@echo "make clean -- remove development environment"

## run pre-commit checks on all files
lint:	$(VENVDONE)
	$(VENVBIN)/pre-commit run --all-files

# create venv with project dependencies
# pre-commit is in dev optional-requirements
# with uv, mypy is run in dev venv
install $(VENVDONE): Makefile pyproject.toml
	uv sync --python `cat .python-version` --extra dev --extra deploy --extra mypy
	$(VENVBIN)/pre-commit install
	touch $(VENVDONE)

## deploy code via Dokku
deploy:	lint
	$(VENVBIN)/python deploy.py deploy

## update .pre-commit-config.yaml
update:	$(VENVDONE)
	$(VENVBIN)/pre-commit autoupdate

## make uv.lock
requirements uv.lock lock: pyproject.toml
	uv lock

# list outdated requirements
# https://github.com/astral-sh/uv/issues/6794
# discusses automagic update
list-outdated:
	uv pip list --outdated

## clean up development environment
clean:
	-$(VENVBIN)/pre-commit clean
	rm -rf $(VENVDIR) build *.egg-info .pre-commit-run.sh.log \
		__pycache__ .mypy_cache
