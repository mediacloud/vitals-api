"""
vitals-api deploy script using mc-deploy (in system-dev-ops repo,
installed in development venv thru "dev" optional-dependencies in
pyproject.toml)

WORK IN PROGRESS!!
"""

import sys

from mc_deploy.dokku import DokkuDeploy
from mc_deploy.pyproject import PyProjectMixin


class VitalsApiDeploy(PyProjectMixin, DokkuDeploy):
    INST_BASE = "vitals-api"
    PROJECT_REPO = "vitals-api"

    # XXX needs "dokku graphite:link ObscureStatsServiceName"
    # XXX read file(s) override settings_get_new to configure MCWEB_TOKEN!!!


d = VitalsApiDeploy()
sys.exit(d.run())
