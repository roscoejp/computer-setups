#!/usr/bin/env bash

# Check for Homebrew
if test ! $(which brew)
then
    echo "  Installing Homebrew."

    # Install the correct homebrew for each OS type
    if test "$(uname)" = "Darwin"
    then
        ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
    elif test "$(expr substr $(uname -s) 1 5)" = "Linux"
    then
        ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Linuxbrew/install/master/install)"
    fi

fi

# Run through installs
brew bundle
# @TODO

# Kill and restart system apps so most changes take effect
if test "$(uname)" = "Darwin"
then
    echo "Killing system apps modified by macos setup."
    
    for app in "Activity Monitor" \
        "Address Book" \
        "Calendar" \
        "cfprefsd" \
        "Contacts" \
        "Dock" \
        "Finder" \
        "Google Chrome Canary" \
        "Google Chrome" \
        "Mail" \
        "Messages" \
        "Opera" \
        "Photos" \
        "Safari" \
        "SizeUp" \
        "Spectacle" \
        "SystemUIServer" \
        "Terminal" \
        "Transmission" \
        "Tweetbot" \
        "Twitter" \
        "iCal"; do
        killall "${app}" &> /dev/null
    done

    echo "Done. Note that some of these changes require a logout/restart to take effect."

elif test "$(expr substr $(uname -s) 1 5)" = "Linux"
then
    # @TODO
    echo "Linux isn't done yet."
fi
