#!/bin/bash
# Author: Shree Raj Shrestha
# Date: 02/09/2025
set -ueox pipefail
source ./home
WHICH_SILO="${1}"
RAKE_PATH="${1//.//}"
if [[ "${WHICH_SILO}" =~ .*cob$ ]]; then
    RAKE_PATH="silo/cobs/${RAKE_PATH///cob/}.cob"
elif [[ "${WHICH_SILO}" =~ .*farm$ ]]; then
    RAKE_PATH="silo/farms/${RAKE_PATH///farm/}.farm"
elif [[ "${WHICH_SILO}" =~ .*harvest$ ]]; then
    RAKE_PATH="silo/harvests/${RAKE_PATH///harvest/}.harvest"
else
    echo "can only rake cobs, farms, and harvests" && exit 1
fi
WHICH_SOIL="${2}"
if [[ ! "${WHICH_SOIL}" =~ .*soil$ ]]; then
    echo "usage: ./gather some.cob some.soil" && exit 1
fi
WHICH_POD="${WHICH_SILO}.${WHICH_SOIL}"
WHICH_FARM="${HUSK_HOME}/.farm/${WHICH_SILO}"
