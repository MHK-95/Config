#!/bin/bash
#----------------------------------------------------------------------------------------------------------------------#
#                                                 install_packages.sh                                                  #
#----------------------------------------------------------------------------------------------------------------------#
# This script will simply install the packages I want with apt. However, other scripts like setup_flatpack. will install their dependencies.

source ./bash_scripts/common.sh

test $EUID -eq 0 || fail "This script can only be run as root" 1

apt install -y neofetch vim \
    || fail "Couldn't install a package." 1
