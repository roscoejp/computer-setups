#!/usr/bin/env bash
#
# Configure terraform

# Check for install, config terraform
if [[ $(command -v tfenv) == "" ]]; then
    echo "Configuring terraform"

    # download and set global terraform version
    tfenv install latest
    tfenv use latest
fi
