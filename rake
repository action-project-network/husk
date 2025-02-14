#!/bin/bash
# Author: Shree Raj Shrestha
# Date: 02/09/2025
set -ueox pipefail
WHICH_SILO="${1}"
RAKE_PATH="${1//.//}"
if [[ "${WHICH_SILO}" =~ .*cob$ ]]; then
    RAKE_PATH="silo/cobs/${RAKE_PATH///cob/}.cob"
elif [[ "${WHICH_SILO}" =~ .*farm$ ]]; then
    RAKE_PATH="silo/farms/${RAKE_PATH///farm/}.farm"
    source "${HUSK_HOME}/$(dirname "${RAKE_PATH}")/.plough"
elif [[ "${WHICH_SILO}" =~ .*harvest$ ]]; then
    RAKE_PATH="silo/harvests/${RAKE_PATH///harvest/}.harvest"
    source "${HUSK_HOME}/$(dirname "${RAKE_PATH}")/.plough"
else
    echo "can only rake cobs, farms, and harvests" && exit 1
fi
WHICH_SOIL="${2}"
if [[ ! "${WHICH_SOIL}" =~ .*soil$ ]]; then
    echo "usage: ./gather some.cob some.soil" && exit 1
fi
WHICH_POD="${WHICH_SILO}.${WHICH_SOIL}"
WHICH_FARM="${HUSK_HOME}/${FARM_HOME}/${WHICH_SILO}.${WHICH_SOIL}"
WHICH_HARVEST="${HUSK_HOME}/${FARM_HOME}/${WHICH_SILO}.${WHICH_SOIL}"
