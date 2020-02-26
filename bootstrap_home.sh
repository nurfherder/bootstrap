#!/bin/sh
#
# Bootstrap my home directory
#

# Use 'git' or 'https'
git_proto='git'

git_user='nurfherder'
git_origin='github.com'
iws=$(pwd -P)

if [ "${git_proto}" -eq 'git' ]; then
  myrepo="git://git@${git_origin}/${git_user}"
else
  myrepo="https://${git_origin}/${git_user}"
fi

code_path="${HOME}/code/${git_origin}/${git_user}"

#---------------------------------------
# slink
#
# Set this up first so we can use it to
# create all the symlinks into the git
# projects.
#---------------------------------------
if [ ! -d "${code_path}/slink" ]; then
  git clone "$myrepo/slink.git" "${code_path}/slink"
  cd "${code_path}/slink"
else
  cd "${code_path}/slink"
  if [ -d "${code_path}/slink/.git" ]; then
    git pull origin master
  fi
fi
./slink

#---------------------------------------
# Setup other projects from github
#
# Requires: git, slink
#---------------------------------------
projects='code dotshell dottmux dotvim dotruby dothammerspoon newbourne'
for prj in $projects; do
  if [ ! -d "${code_path}/$prj" ]; then
    git clone "$myrepo/${prj}.git" "${code_path}/$prj"
    cd "${code_path}/$prj"
    if [ -s ./.gitmodules ]; then
      git submodule update --init
    fi
  else
    cd "${code_path}/$prj"
    if [ -d "${code_path}/$prj/.git" ]; then
      git pull origin master
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
