#!/bin/sh
#---------------------------------------
# Install FunToo keychain into ~/bin
#
# Basically grabs tarball and extracts
# the one file we want.
#
# Requires: wget, gnu tar, mv, rm
#---------------------------------------


if [ ! -f "$HOME/bin/keychain" ]; then
  echo " * Keychain installing"
  # Grab tarball of latest keychain
  repo='funtoo/keychain'
  #Get URL
  url=$(curl -s "https://api.github.com/repos/${repo}/releases/latest" \
  | grep "tarball_url" \
  | awk '{for(i=1;i<=NF;i++){ if($i ~ "https.*"){print $i} } }' \
  | sed -e 's/^"//'  -e 's/",$//')

  echo "** Downloading ${url}"
  curl -L ${url} \
  | tar xOzf -  */keychain > ~/bin/keychain

  # Make it executable
  chmod a+x ~/bin/keychain
else
  echo " * Keychain already installed"
fi
