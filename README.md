bootstrap
=========

This project contains the tools I need to rebuild my workstation from a fresh OS install.


Deploy:
-------

**Prereqs:**

 * git
 * A POSIX shell

Still need to install AppStore requirements manually (maybe https://github.com/argon/mas is the solution):
 * Install Xcode

**Procedure:**

Clone repo to your home directory:

    git clone git://github.com/nurfherder/bootstrap.git ~/code/github.com/nurfherder/bootstrap
    cd ~/code/github.com/nurfherder/bootstrap

If recreating a Apple OS X system:

    ./bootstrap_osx.sh
