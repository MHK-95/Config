#!/bin/bash
#----------------------------------------------------------------------------------------------------------------------#
#                                                master_script-user.sh                                                 #
#----------------------------------------------------------------------------------------------------------------------#
# This script will run the script inside of bash_scripts directory in a procedual manner. This script runs the bash 
# scripts that don't require root privileges.

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
source $DIR/bash_scripts/common.sh

test $EUID -eq 0 && fail "This script can only be run as a normal user." 1

# Make private home directory bin. Ubuntu 20.04 will automatically add it to path in ~/.profile.
mkdir -p $HOME/bin

$DIR/bash_scripts/setup_flatpak.sh || exit $?

$DIR/bash_scripts/setup_python.sh || exit $?

$DIR/bash_scripts/make_symlinks.sh || exit $?

$DIR/bash_scripts/configure_gnome.sh || exit $?

exit 0
