#!/usr/bin/env bash
#
# bootstrap installs things.

set -e
echo ''

STOW_SRC="./"
STOW_DEST="~"

# Sudo upfront
sudo -v
while true; do
    sudo -n true
    sleep 60
    kill -0 "$$" || exit
done 2>/dev/null &

# Check distro, install homebrew
if test "$(uname)" = "Darwin"; then
    if [[ $(command -v brew) == "" ]]; then
        echo "Installing Homebrew"
        ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
    fi
elif test "$(expr substr $(uname -s) 1 5)" = "Linux"; then
    if [[ $(command -v brew) == "" ]]; then
        echo "Installing Homebrew"
        ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Linuxbrew/install/master/install)"
    fi
fi

# Brewfile install
echo "Installing Brewfile-bundle"
brew update
brew upgrade
brew bundle --file ./files/homebrew/brewfile
brew cleanup

# Run Configurators
echo "Running Configs"
for config in ./configs/*; do
    echo "  Running \"${config}\""

    [ -f "${config}" ] && [ -x "${config}" ] && "${config}"
done

# Unstow dotfiles
function stow() {
    echo "Symlinking dotfiles"
    stow --dir ${STOW_SRC} --target ${STOW_DEST} dotfiles
}

if [ "$1" == "--force" -o "$1" == "-f" ]; then
    stow
else
    read -p "This may overwrite existing files in your home directory. Are you sure? (y/N): " -n 1
    if [[ ${REPLY} =~ ^[Yy]$ ]]; then
        stow
    fi
fi
