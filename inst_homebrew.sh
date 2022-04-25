#!/bin/sh

HOMEBREW_CMD="/usr/local/bin/brew"
if [ "${1}" = 'local' ]; then
  HOMEBREW_CMD="$HOME/homebrew/bin/brew"
fi

if [ ! -f "$HOMEBREW_CMD" ]; then
  echo " * Installing Homebrew package manager"
  if [ "${1}" = 'local' ]; then
    (cd ${HOME} \
      && mkdir homebrew \
      && curl -L https://github.com/Homebrew/brew/tarball/master \
      | tar xz --strip 1 -C homebrew )
  else
    ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
  fi
else
  echo " * Homebrew already installed"
fi
