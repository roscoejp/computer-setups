#!/usr/bin/env bash
#
# Configure vscode

REQUIREMENTS="../files/vscode/requirements.txt"
STOW_SRC="../files/vscode"
STOW_DEST=""

# Check distro, config vscode
if [[ $(command -v code) == "" ]]; then
    echo "Configuring vscode"

    # Install extensions
    while read line; do
        code --install-extension "${line}"
    done <${REQUIREMENTS}

    # Symlink config
    if test "$(uname)" = "Darwin"; then
        STOW_DEST="~/Library/Application Support/Code/User/settings.json"
    elif test "$(expr substr $(uname -s) 1 5)" = "Linux"; then
        STOW_DEST="~/.config/Code/User/settings.json"
    fi

    mkdir -p ${STOW_DEST}
    stow --dir ${STOW_SRC} --target ${STOW_DEST} dotfiles
fi
