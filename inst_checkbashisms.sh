#!/bin/sh
#---------------------------------------
# Install checkbashisms
#
# Basically grabs src tarball and extracts
# the one file we want.
# (Currently grabbing from Wheezy)
#
# Requires: wget, gnu tar, mv, rm
#---------------------------------------
if [ ! -f "$HOME/bin/checkbashisms" ]; then
  echo " * Checkbashisms installing"
  version='devscripts_2.12.6+deb7u2'
  version_ALT='devscripts-2.12.6+deb7u2' #CUTE: change _ to -
  archive="${version}.tar.gz"
  file="${version_ALT}/scripts/checkbashisms.pl"
  cd /tmp
  eval wget http://ftp.de.debian.org/debian/pool/main/d/devscripts/${archive}
  eval tar -zxf ${archive} ${file}
  eval mv ${file} ~/bin/checkbashisms  #strip '.pl' for syntastic
  eval rm -f ${archive}
  eval rm -rf ${version_ALT}
else
  echo " * Checkbashisms already installed"
fi
