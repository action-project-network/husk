#!/bin/sh
# Author: Shree Raj Shrestha
# Date: 02/09/2025
set -ueox pipefail

HUSK_HOME="${PWD}"
SOIL_HOME="/soil"
WHICH="${1}"
RAKE_PATH="${1//.//}"
WHICH_NURSERY=".nursery/${RAKE_PATH}"
WHICH_FARM=".farm/${RAKE_PATH}"
EPHEMERAL="${HOME}/ephemeral/${RANDOM}"