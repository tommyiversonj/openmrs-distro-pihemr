#!/usr/bin/env sh

# This script expects a file named .pihemr-debian-env in the users home directory, which contains the credentials for the debian repository
# DEBIAN_REPO_USER=user
# DEBIAN_REPO_PASSWORD='password'

DEBIAN_REPO_BASE_URL="https://openmrs.jfrog.io/artifactory/deb-pih/pool"
DEBIAN_REPO_DISTRIBUTION=unstable
DEBIAN_FILENAME="$(ls ${project.build.directory}/debian/*.deb)"
source ~/.pihemr-debian-env

curl -u${DEBIAN_REPO_USER}:${DEBIAN_REPO_PASSWORD} -X PUT "${DEBIAN_REPO_BASE_URL}/${DEBIAN_FILENAME};deb.distribution=${DEBIAN_REPO_DISTRIBUTION};deb.component=main;deb.architecture=amd64" -T ./target/${DEBIAN_FILENAME}