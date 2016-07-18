#!/bin/bash

# Check for Homebrew,
# Install if we don't have it
if test ! $(which brew); then
  echo "Installing homebrew..."
  ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

# Update homebrew recipes
brew update

brew cask install --force sublime-text

rm -r ~/.sublime-settings
mkdir ~/.sublime-settings

if [ -f ~/Library/Application\ Support/Sublime\ Text\ 3/Packages/User ]; then
  mv ~/Library/Application\ Support/Sublime\ Text\ 3/Packages ~/.sublime-text/Packages_old
fi

mkdir -p ~/Library/Application\ Support/Sublime\ Text\ 3
mkdir -p ~/Library/Application\ Support/Sublime\ Text\ 3/Installed\ Packages
mkdir -p ~/Library/Application\ Support/Sublime\ Text\ 3/Packages
mkdir -p ~/Library/Application\ Support/Sublime\ Text\ 3/Packages/User

curl http://sublime.wbond.net/Package\ Control.sublime-package -o ./Package\ Control.sublime-package

cp Preferences.sublime-settings ~/.sublime-settings/
cp Package\ Control.sublime-settings ~/.sublime-settings/
cp Package\ Control.sublime-package ~/.sublime-settings/

ln -s ~/.sublime-settings/Preferences.sublime-settings      ~/Library/Application\ Support/Sublime\ Text\ 3/Packages/User/Preferences.sublime-settings
ln -s ~/.sublime-settings/Package\ Control.sublime-settings ~/Library/Application\ Support/Sublime\ Text\ 3/Packages/User/Package\ Control.sublime-settings

ln -s ~/.sublime-settings/Package\ Control.sublime-package ~/Library/Application\ Support/Sublime\ Text\ 3/Installed\ Packages/Package\ Control.sublime-package

# instal material theme
git clone git@github.com:ahmedjafri/material-theme.git ~/Library/Application\ Support/Sublime\ Text\ 3/Packages/Material\ Theme
