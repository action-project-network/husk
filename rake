#!/bin/bash
# Author: Shree Raj Shrestha
# Date: 02/09/2025
set -ueox pipefail
source "${HUSK_HOME}/home"
WHICH_SILO="${1}"
THIS_SEED="$(echo "${WHICH_SILO}" | cut -d "_" -f 1)"
THIS_VERSION="$(echo "${WHICH_SILO}" | cut -d "_" -f 2)"
THIS_RECIPE="$(echo "${WHICH_SILO}" | cut -d "_" -f 3 | cut -d "." -f 1)"
RAKE_PATH="silo/cobs/${THIS_SEED}/${THIS_VERSION}/${THIS_RECIPE}"
WHICH_SOIL="${2}"
if [[ ! "${WHICH_SOIL}" =~ .*soil$ ]] && [[ ! "${WHICH_SOIL}" =~ .*.soil.revived$ ]]; then
    echo "usage: ./rake some.cob some.soil" && exit 1
fi

WHICH_POD="${WHICH_SILO}.${WHICH_SOIL}"
WHICH_FIELD=""
if [[ "${WHICH_SILO}" =~ .*farm$ ]]; then
    WHICH_FIELD="${HUSK_HOME}/${FARM_HOME}/${WHICH_SILO}.${WHICH_SOIL}"
elif [[ "${WHICH_SILO}" =~ .*harvest$ ]]; then
    WHICH_FIELD="${HUSK_HOME}/${HARVEST_HOME}/${WHICH_SILO}.${WHICH_SOIL}"
fi
