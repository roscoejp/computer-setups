#!/usr/bin/env bash
#
# Install Xcode

# Check distro, install xcode
if test "$(uname)" = "Darwin"; then
    if test ! $(xcode-select -p); then
        echo "Installing Xcode"

        xcode-select --install
    fi
fi
