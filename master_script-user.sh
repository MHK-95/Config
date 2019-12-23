#!/bin/bash
#----------------------------------------------------------------------------------------------------------------------#
#                                                   master_script.sh                                                   #
#----------------------------------------------------------------------------------------------------------------------#
# This script will run the script inside of bash_scripts directory in a procedual manner. This script the bash scripts
# that don't require root privileges.

source ./bash_scripts/common.sh

test $EUID -eq 0 && fail "This script can only be run as a normal user." 1

./bash_scripts/setup_python.sh || exit $?

./bash_scripts/setup_flatpak.sh || exit $?

./bash_scripts/make_symlinks.sh || exit $?

./bash_scripts/configure_gnome.sh || exit $?

exit 0
