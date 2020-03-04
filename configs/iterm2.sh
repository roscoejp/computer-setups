#!/usr/bin/env bash
#
# Configure iTerm2

# Check distro, config iterm2
if test "$(uname)" = "Darwin"; then
    if [[ $(command -v iterm2) == "" ]]; then
        echo "Configuring iterm2"
        # Configs stored in "defaults delete com.googlecode.iterm2"

    fi
fi
