#!/bin/bash

SUBL_PATH=~/Library/Application\ Support/Sublime\ Text\ 3
SUBL_USER_PATH=~/Library/Application\ Support/Sublime\ Text\ 3/Packages/User

# Check for Homebrew,
# Install if we don't have it
if test ! $(which brew); then
  echo "Installing homebrew..."
  ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

# Update homebrew recipes
brew update

# Install Sublime Text
brew cask install --force sublime-text

# Create Sublime Text directories
mkdir -p "$SUBL_PATH"
mkdir -p "$SUBL_PATH/Installed Packages"
mkdir -p "$SUBL_PATH/Packages"
mkdir -p "$SUBL_USER_PATH"

# Backup current settings
if [ -f "$SUBL_USER_PATH" ]; then
  mv "$SUBL_PATH/Packages" "$SUBL_PATH/Packages_old"
  mv "$SUBL_PATH/Installed Packages" "$SUBL_PATH/Installed Packages_old"
fi

# Install Package Control
curl http://sublime.wbond.net/Package\ Control.sublime-package -o \
  "$SUBL_PATH/Installed Packages/Package Control.sublime-package"

# Link ST files to this directory
ln -sf $PWD/Preferences.sublime-settings "$SUBL_USER_PATH/Preferences.sublime-settings"
ln -sf $PWD/Package\ Control.sublime-settings "$SUBL_USER_PATH/Package Control.sublime-settings"

# Install Material Theme
 git clone git@github.com:ahmedjafri/material-theme.git "$SUBL_PATH/Packages/Material Theme"
