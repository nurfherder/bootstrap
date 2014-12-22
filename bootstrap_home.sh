#!/bin/sh
#
# Bootstrap my home directory
#
git_user='nurfherder'
git_origin='github.com'
iws=$(pwd -P)
myrepo="git://${git_origin}/${git_user}"
code_path="code/${git_origin}/${git_user}"

#---------------------------------------
# slink
#
# Set this up first so we can use it to
# create all the symlinks into the git
# projects.
#---------------------------------------
if [ ! -d "$HOME/${code_path}/slink" ]; then
  git clone "$myrepo/slink.git" "$HOME/${code_path}/slink"
  cd "$HOME/${code_path}/slink"
else
  cd "$HOME/${code_path}/slink"
  if [ -d "$HOME/code/github/slink.git" ]; then
    git pull origin master
  fi
fi
./slink

#---------------------------------------
# Setup code from github
#
# Requires: git, slink
#---------------------------------------
projects='dotshell dottmux dotvim dotruby newbourne'
for prj in $projects; do
  if [ ! -d "$HOME/${code_path}/$prj" ]; then
    git clone "$myrepo/${prj}.git" "$HOME/${code_path}/$prj"
    cd "$HOME/${code_path}/$prj"
    if [ -s ./.gitmodules ]; then
      git submodule update --init
    fi
  else
    cd "$HOME/${code_path}/$prj"
    if [ -d "$HOME/${code_path}/$prj/.git" ]; then
      git submodule foreach git pull origin master
    fi
  fi
  ~/bin/slink
done

#---------------------------------------
# Run additional install scripts
#---------------------------------------
"$iws/inst_checkbashisms.sh"
"$iws/inst_shellcheck.sh"
"$iws/inst_keychain.sh"
