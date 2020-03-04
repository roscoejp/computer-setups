#!/usr/bin/env bash
#
# Configure zsh

# Check distro, config zsh
if test "$(uname)" = "Darwin"; then
    if [[ $(command -v zsh) == "" ]]; then
        echo "Configuring zsh"

        # Install oh-my-zsh
        if [[ -f "~/.oh-my-zsh" ]]; then
            sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
        fi

        # Configure stuff we can't
        # Not sure if the theme can be stowed
    fi
fi
