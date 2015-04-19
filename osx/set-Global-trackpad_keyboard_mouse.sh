
###############################################################################
# Trackpad, mouse, keyboard, Bluetooth accessories, and input                 #
###############################################################################

#..Trackpad: enable tap to click for this user and for the login screen........
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad Clicking -bool true
defaults -currentHost write NSGlobalDomain com.apple.mouse.tapBehavior -int 1
defaults write NSGlobalDomain com.apple.mouse.tapBehavior -int 1

#..Trackpad: Enable tap to click...............................................
# ##FIXME - maybe this is handled able (is -bool true equivalent to -int 1?)

#..Trackpad: Enable Three Finger drag..........................................
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad TrackpadThreeFingerDrag -int 1

#..Trackpad: Add 'App Expose' gesture..........................................
# ##FIXME

#..Trackpad: map bottom right corner to right-click............................
#defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad TrackpadCornerSecondaryClick -int 2
#defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad TrackpadRightClick -bool true
#defaults -currentHost write NSGlobalDomain com.apple.trackpad.trackpadCornerClickBehavior -int 1
#defaults -currentHost write NSGlobalDomain com.apple.trackpad.enableSecondaryClick -bool true


###############################################################################
# Mouse
###############################################################################
#..Mouse: Disable “natural” (Lion-style) scrolling.............................
#defaults write NSGlobalDomain com.apple.swipescrolldirection -bool false

#..Mouse: Use scroll gesture with the Ctrl (^) modifier key to zoom............
#defaults write com.apple.universalaccess closeViewScrollWheelToggle -bool true
#defaults write com.apple.universalaccess HIDScrollZoomModifierMask -int 262144


###############################################################################
# Keyboard
###############################################################################
#..Keyboard: Follow the keyboard focus while zoomed in.........................
#defaults write com.apple.universalaccess closeViewZoomFollowsFocus -bool true

#..Keyboard: Disable press-and-hold for keys in favor of key repeat............
#defaults write NSGlobalDomain ApplePressAndHoldEnabled -bool false

#..Keyboard: Set a blazingly fast keyboard repeat rate.........................
#defaults write NSGlobalDomain KeyRepeat -int 0

#..Keyboard: Enable full keyboard access for all controls......................
## (e.g. enable Tab in modal dialogs)....
defaults write NSGlobalDomain AppleKeyboardUIMode -int 3
