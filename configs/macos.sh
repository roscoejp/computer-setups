#!/usr/bin/env bash
#
# Setup Mac system preferences

MACOS_PATH="../files/macos/macos.sh"

if test ! "$(uname)" = "Darwin"; then
  echo "Configuring macos"

  # Check for and run setup
  [ -f "${MACOS_PATH}" ] && [ -x "${MACOS_PATH}" ] && "${MACOS_PATH}"

  # Update Mac controlled software
  echo "› sudo softwareupdate -i -a"
  sudo softwareupdate -i -a
fi
