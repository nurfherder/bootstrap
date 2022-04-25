#!/usr/bin/env bash

#==============================================================================
# Keep Sudo creds fresh
#==============================================================================
# Ask for the administrator password upfront
sudo -v

# Keep-alive: update existing `sudo` time stamp until `.osx` has finished
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

#==============================================================================
# Install Applications from Apple App Store
#==============================================================================
# xcode
# numbers
# pages
# keynote
# microsoft remote desktop

#==============================================================================
# Install My Favorite Fonts
#==============================================================================
./inst_fonts.sh

#==============================================================================
# Install Homebrew (see http://brew.sh and http://caskroom.io)
#==============================================================================
# Install homebrew
./inst_homebrew.sh

# Make sure everything is up to date
brew update
brew upgrade

# Install Modern Dev Tools
brew bundle --file=- <<-EOF
brew "git"
brew "wget"
brew "tmux"
brew "jq"
brew "ack"
brew "python"
brew "dos2unix"
brew "pstree"
cask "visual-studio-code"
EOF

# Install Casks (non-admin)

# Utilities
brew bundle --file=- <<-EOF
brew "mas"
cask "the-unarchiver"
cask "hammerspoon"
cask "menumeters"
cask "keepassxc"
#cask "keycastr"
EOF

# More browsers
brew bundle --file=- <<-EOF
cask "firefox"
cask "google-chrome"
cask "brave-browser"
EOF

# Graphics
brew bundle --file=- <<-EOF
cask "gimp"
cask "inkscape"
cask "blender"
EOF

# Install Casks (admin)
#brew --cask install \
#virtualbox \
#xquartz \
#karabiner \
#seil


#==============================================================================
# Set system/application defaults
#==============================================================================
#. osx/set-ActivityMonitor.sh
#. osx/set-AddressBook.sh
#. osx/set-AppStore.sh
#. osx/set-Chrome.sh
#. osx/set-DiskUtility.sh
#. osx/set-Finder.sh
#. osx/set-GPGMail_2.sh
#. osx/set-Global-bluetooth_headphones.sh
#. osx/set-Global-hostname.sh
#. osx/set-Global-region.sh
#. osx/set-Global-ssd_tweaks.sh
. osx/set-Global-trackpad_keyboard_mouse.sh
. osx/set-Global-ui.sh
. osx/set-Hammerspoon.sh
#. osx/set-Mail.sh
#. osx/set-Messages.sh
#. osx/set-Opera.sh
. osx/set-Safari.sh
#. osx/set-SizeUp.sh
. osx/set-Spotlight.sh
#. osx/set-Sublime_Text.sh
. osx/set-Terminal.sh
. osx/set-TextEdit.sh
#. osx/set-TimeMachine.sh
#. osx/set-Transmission.sh
#. osx/set-Twitter.sh
#. osx/set-iCal.sh
#. osx/set-iTerm.sh
#. osx/set-iTunes.sh


#==============================================================================
# Bootstrap my home directory
#==============================================================================
./bootstrap_home.sh

#==============================================================================
# Kill affected applications                                                  #
#==============================================================================
#for app in "Activity Monitor" "Address Book" "Calendar" "Contacts" "cfprefsd" \
#	"Dock" "Finder" "Google Chrome" "Google Chrome Canary" "Mail" "Messages" \
#	"Opera" "Safari" "SizeUp" "Spectacle" "SystemUIServer" "Terminal" \
#	"Transmission" "Twitter" "iCal"; do
#	killall "${app}" > /dev/null 2>&1
#done
echo "Done. Note that some of these changes require a logout/restart to take effect."
