#!/bin/sh


###############################################################################
# Hammerspoon                                                                 #
###############################################################################

#..Enable Accessiblity API for Hammerspoon.....................................
# (NOTE: Maybe use https://github.com/jacobsalmela/tccutil/releases)
# (SEE: http://forums.macrumors.com/showthread.php?t=1613755)
sudo sqlite3 /Library/Application\ Support/com.apple.TCC/TCC.db "INSERT INTO access VALUES('kTCCServiceAccessibility','org.hammerspoon.Hammerspoon',0,1,1,NULL);"

#..Enable Karabiner to remap CapsLock to 'Hyper' key
sudo sqlite3 /Library/Application\ Support/com.apple.TCC/TCC.db "INSERT INTO access VALUES('kTCCServiceAccessibility','org.pqrs.Karabiner-AXNotifier',0,1,1,NULL);"
