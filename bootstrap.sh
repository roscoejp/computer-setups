#!/usr/bin/env bash
#
# bootstrap installs things.

set -e
echo ''

# Check distro, install homebrew, xcode
if test "$(uname)" = "Darwin"; then
    if test ! $(xcode-select -p); then
        echo "Installing Xcode"
        xcode-select --install
    fi
    if [[ $(command -v brew) == "" ]]; then
        echo "Installing Homebrew"
        ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
    fi
elif test "$(expr substr $(uname -s) 1 5)" = "Linux"; then
    if if [[ $(command -v brew) == "" ]]; then
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
    [ -f "$config" ] && [ -x "$config" ] && "$config"
done

# Unstow dotfiles
function stow() {
    echo "Symlinking dotfiles"
    stow dotfiles
}

if [ "$1" == "--force" -o "$1" == "-f" ]; then
    stow
else
    read -p "This may overwrite existing files in your home directory. Are you sure? (y/N): " -n 1
    if [[ $REPLY =~ ^[Yy]$ ]]; then
        stow
    fi
fi
