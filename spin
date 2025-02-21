#!/bin/bash
# Author: Shree Raj Shrestha
# Date: 01/28/2025
set -ueox pipefail
source "./.husk"
source "${HUSK_HOME}/rake" "${1}" "${2}"
SOIL_REQUIREMENTS=""
TAP_REQUIREMENTS=""
PIP_REQUIREMENTS=""
source "$(dirname ${RAKE_PATH})/.${WHICH_SOIL}"
"$(which podman)" build --no-cache -t "${WHICH_POD}" -f "./silo/soils/${WHICH_SOIL}" . \
    --build-arg SOIL_REQUIREMENTS="${SOIL_REQUIREMENTS}" \
    --build-arg TAP_REQUIREMENTS="${TAP_REQUIREMENTS}" \
    --build-arg PIP_REQUIREMENTS="${PIP_REQUIREMENTS}" \
    --build-arg WHICH_FARMER="$(whoami)"
