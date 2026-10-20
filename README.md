# FastAPI server for Media Cloud Vitals page https://vitals.mediacloud.org/

### Script *MUST* run on same server as dokku statsd/graphite/grafana service container

## To test code in development:

* Run `make install` to create virtual environment
* `. .venv/bin/activate` to activate venv
* `./test.sh` to run api.py outside docker

## To lint/check code before commit, run `make lint`

## To add new requirements:

* Add to `pyproject.toml`
* Run `make lock`
* commit pyproject.toml and uv.lock to git

## To setup dokku staging-vitals-api and git remote dokku_staging

* `./setup.sh staging`

## To setup dokku production vitals-api and git remote dokku_prod

* `./setup.sh prod`

## To test code in staging

(NOTE: there are no prod/staging branches)

* `git push dokku_staging`

## To deploy code for production

(NOTE: there are no prod/staging branches)

* `git push dokku_prod`
