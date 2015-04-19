
###############################################################################
# SSD-specific tweaks                                                         #
###############################################################################

#..Disable local Time Machine snapshots........................................
#sudo tmutil disablelocal

#..Disable hibernation (speeds up entering sleep mode).........................
#sudo pmset -a hibernatemode 0

#..Remove the sleep image file to save disk space..............................
#sudo rm /Private/var/vm/sleepimage
#..Create a zero-byte file instead… ...........................................
#sudo touch /Private/var/vm/sleepimage
#.. …and make sure it can’t be rewritten.......................................
#sudo chflags uchg /Private/var/vm/sleepimage

#.. Disable the sudden motion sensor as it’s not useful for SSDs...............
#sudo pmset -a sms 0
