#!/bin/bash
#----------------------------------------------------------------------------------------------------------------------#
#                                                 install_packages.sh                                                  #
#----------------------------------------------------------------------------------------------------------------------#
# This script will simply install the packages I want with apt.

source ./bash_scripts/common.sh

test $EUID -eq 0 || fail "This script can only be run as root." 1

apt update || fail "Could't apt update." 1
apt install -y neofetch vim \
    || fail "Couldn't install a package." 1
