#!/bin/bash
#----------------------------------------------------------------------------------------------------------------------#
#                                                  setup_flatpak.sh                                                    #
#----------------------------------------------------------------------------------------------------------------------#
# This script will install flatpak and install the flatpak apps I want from flathub.

source ./bash_scripts/common.sh

test $EUID -eq 0 || fail "This script can only be run as root" 1

apt install flatpak || fail "Couldn't install the flatpak package." 1

# Add the flathub repo
su -c "
    flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
    " $USERNAME

declare -A flathub_map
flathub_map[com.visualstudio.code.oss]=vscode


# Make a dotfile
