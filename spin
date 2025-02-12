#!/bin/sh
# Author: Shree Raj Shrestha
# Date: 01/28/2025
set -ueox pipefail
source ./home
source ./rake "${1}" "${2}"
SOIL_REQUIREMENTS="sh tar unzip"
source "$(dirname ${RAKE_PATH})/${WHICH_SOIL}"
podman build -t "${WHICH_POD}" -f "./silo/soils/${WHICH_SOIL}" . --build-arg SOIL_REQUIREMENTS="${SOIL_REQUIREMENTS}"
