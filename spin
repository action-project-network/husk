#!/bin/sh
# Author: Shree Raj Shrestha
# Date: 01/28/2025
set -ueox pipefail
source ./rake "${1}"
podman image rm --force "soil.${WHICH_POD}"
source "${HUSK_HOME}/silo/cobs/${COB_PATH}.cob"
podman build -t "soil.${WHICH_POD}" -f ./Soil . --build-arg REQUIREMENTS="${REQUIREMENTS}"
