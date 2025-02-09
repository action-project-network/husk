#!/bin/sh
# Author: Shree Raj Shrestha
# Date: 01/28/2025
set -ueox pipefail
source ./rake "${1}"
SOIL_REQUIREMENTS="sh tar unzip"

if [[ $WHICH_SOIL =~ .*cob$ ]]; then
    source "${HUSK_HOME}/silo/cobs/${RAKE_PATH///cob/}.cob"
elif [[ $WHICH_SOIL =~ .*farm$ ]]; then
    source "${HUSK_HOME}/garden/farms/${RAKE_PATH///farm/}.farm"
elif [[ $WHICH_SOIL =~ .*empty$ ]]; then
    continue
else
    echo "cannot spin unsupported soil" && exit 1
fi
podman build -t "${WHICH_SOIL}" -f ./Soil . --build-arg SOIL_REQUIREMENTS="${SOIL_REQUIREMENTS}"
