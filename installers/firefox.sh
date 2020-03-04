#!/usr/bin/env bash
#
# Configure firefox

# Check distro, config firefox
if test "$(uname)" = "Darwin"; then
    if [[ $(command -v firefox) == "" ]]; then
        echo "Configuring firefox"
        # If profile ID's are globally unique we may be able to move things into the place they belong easily....

        # copy the userChrome to the right directory.
        # Will need to check OS and make sure we're on the FF path (as long as it's an env variable)... can use stow -t to change target dir.

        # enable the ability to use userchrome

        #==================
        # create profile in a dir? Does it get a random ID or what? Can we just select the 'default' profile dir in the normal folder maybe and not have to mess with IDs?
        firefox -CreateProfile "rpyell ~/.firefox/profiles/"
        # and then copy userchrome into dir?
    fi
fi
