#!/usr/bin/env bash
#
# Setup Mac system preferences

MACOS_PATH="../files/macos/macos.sh"

if test ! "$(uname)" = "Darwin"; then
  echo "Configuring macos"

  # Check for and run setup
  bash "$MACOS_PATH" -H

  # Update Mac controlled software
  echo "› sudo softwareupdate -i -a"
  sudo softwareupdate -i -a
fi
