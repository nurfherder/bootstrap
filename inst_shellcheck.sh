#!/bin/sh

dest="$HOME/code/github.com/koalaman/shellcheck"

if [ ! -f "$HOME/bin/shellcheck" ]; then
  echo " * Installing shellcheck"
  if [ ! -d "$dest" ]; then
    git clone git://github.com/koalaman/shellcheck.git "$dest"
  elif [ -d "$dest/.git" ]; then
    cd "$dest"
    git pull origin master
  fi

  cd "$dest"
  cabal update
  cabal install

  ln -s "$HOME/.cabal/bin/shellcheck" "$HOME/bin/shellcheck"
else
  echo " * Shellcheck already installed"
fi
