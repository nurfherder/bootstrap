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
  version='keychain-2.7.1'
  archive="${version}.tar.bz2"
  file="${version}/keychain"
  cd /tmp
  eval wget http://www.funtoo.org/archive/keychain/${archive}
  eval tar -jxf ${archive} ${file}
  eval mv ${file} ~/bin/keychain
  eval rm -rf ${version}*
else
  echo " * Keychain already installed"
fi
