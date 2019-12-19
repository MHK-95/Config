#!/bin/bash
#----------------------------------------------------------------------------------------------------------------------#
#                                                 install_packages.sh                                                  #
#----------------------------------------------------------------------------------------------------------------------#
# This script will simply install the packages I want with apt.

source ./bash_scripts/common.sh

test $EUID -eq 0 || fail "This script can only be run as root." 1

apt update || fail "Could't apt update." 1

apt install -y neofetch vim youtube-dl\
    || fail "Couldn't install a package." 1

# These are the dependencies for pyenv. I'm installing them here since the setup_python.sh script needs to be run
# as a normal user.
apt install -y make build-essential libssl-dev zlib1g-dev libbz2-dev libreadline-dev libsqlite3-dev wget curl llvm \
    libncurses5-dev libncursesw5-dev xz-utils tk-dev libffi-dev liblzma-dev python-openssl \
    || fail "Couldn't install a package." 1

# install flatpak
apt install flatpak || fail "Couldn't install the flatpak package." 1

exit 0
