#!/bin/sh

repo='jimeh/git-aware-prompt'
dest="$HOME/code/github.com/${repo}"

if [ ! -f "$HOME/.bash/git-aware-prompt/main.sh" ]; then
  echo " * Installing ${repo}"
  if [ ! -d "$dest" ]; then
    git clone git@github.com:${repo}.git "$dest"
  elif [ -d "$dest/.git" ]; then
    (cd "$dest"; git pull origin master)
  fi

  mkdir -p "$HOME/.bash"
  ln -s $dest/ "$HOME/.bash/git-aware-prompt"
else
  echo " * ${repo} already installed"
fi
