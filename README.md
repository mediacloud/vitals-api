# FastAPI server for Media Cloud Vitals page https://vitals.mediacloud.org/

### Script *MUST* run on same server as dokku statsd/graphite/grafana service container

## To test code in development:

* Run `make install` to create virtual environment
* `. .venv/bin/activate` to activate venv
* `./test.sh` to run api.py outside docker

## To lint/check code before commit, run `make lint`

## To adjust requirements:

* Add to `pyproject.toml`
* Run `make lock`
* commit pyproject.toml and uv.lock to git

## To setup dokku staging-vitals-api:

* `./setup.sh staging`

## To setup dokku production vitals-api:

* `./setup.sh prod`

## To test code in staging

Merge main to staging, push to github.com/mediacloud/vitals-api and run:

* `make deploy`

## To deploy code for production

1. Update pyproject.toml version, run `make lock` commit to the main branch, and push to github
2. Merge into staging branch, push and run `make deploy`
3. Merge into prod branch, push and run `make deploy`
