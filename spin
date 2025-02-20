#!/bin/bash
# Author: Shree Raj Shrestha
# Date: 01/28/2025
set -ueox pipefail
source "./.husk"
source "${HUSK_HOME}/rake" "${1}" "${2}"
SOIL_REQUIREMENTS="sh tar unzip"
PIP_REQUIREMENTS=""
source "$(dirname ${RAKE_PATH})/.${WHICH_SOIL}"
"$(which podman)" build -t "${WHICH_POD}" -f "./silo/soils/${WHICH_SOIL}" . \
    --build-arg SOIL_REQUIREMENTS="${SOIL_REQUIREMENTS}" \
    --build-arg PIP_REQUIREMENTS="${PIP_REQUIREMENTS}" \
    --build-arg USER="$(whoami)"
