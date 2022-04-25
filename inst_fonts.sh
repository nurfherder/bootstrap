#!/bin/sh
#---------------------------------------
# Install Fonts into ~/bin
#
# Basically grabs tarball and extracts
#
# Requires: wget, gnu tar, mv, rm
#---------------------------------------

font_name='DejaVu_Sans_Mono_for_Powerline.ttf'
font_loc="$HOME/Library/Fonts/${font_name}"

if [ ! -f "${font_loc}" ]; then
  echo " * Installing ${font_name}"
  cp ./files/${font_name} ${font_loc}
else
  echo " * ${font_name} is already installed"
fi
