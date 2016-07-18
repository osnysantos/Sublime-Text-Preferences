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

rm -r ~/.sublime-settings
mkdir ~/.sublime-settings

if [ -f "$SUBL_USER_PATH" ]; then
  mv "$SUBL_PATH/Packages" ~/.sublime-text/Packages_old
fi

mkdir -p "$SUBL_PATH"
mkdir -p "$SUBL_PATH/Installed Packages"
mkdir -p "$SUBL_PATH/Packages"
mkdir -p "$SUBL_USER_PATH"

curl http://sublime.wbond.net/Package\ Control.sublime-package -o ./Package\ Control.sublime-package

cp ./* ~/.sublime-settings/

ln -sf ~/.sublime-settings/Preferences.sublime-settings "$SUBL_USER_PATH/Preferences.sublime-settings"
ln -sf ~/.sublime-settings/Package\ Control.sublime-settings "$SUBL_USER_PATH/Package Control.sublime-settings"

ln -s ~/.sublime-settings/Package\ Control.sublime-package "$SUBL_PATH/Installed Packages/Package Control.sublime-package"

# Install Material Theme
 git clone git@github.com:ahmedjafri/material-theme.git "$SUBL_PATH/Packages/Material Theme"
