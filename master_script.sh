#!/bin/bash
#----------------------------------------------------------------------------------------------------------------------#
#                                                   master_script.sh                                                   #
#----------------------------------------------------------------------------------------------------------------------#
# This script will run the script inside of bash_scripts directory in a procedual manner. This script is run a root.
# However, this script will run some of the bash scripts as root, but some of the bash scripts a normal user. The
# common.sh file finds the normal user of the machine with the "who" command. Then, you can run scripts as a normal
# user with the "su -c" command.

source ./bash_scripts/common.sh

test $EUID -eq 0 || fail "This script can only be run as root." 1

./bash_scripts/install_packages.sh || exit $?

./bash_scripts/setup_docker.sh || exit $?

su -c "./bash_scripts/setup_python.sh" $USERNAME || exit $?

su -c "./bash_scripts/setup_flatpak.sh" $USERNAME || exit $?

su -c "./bash_scripts/make_symlinks.sh" $USERNAME || exit $?

su -c "./bash_scripts/configure_gnome.sh" $USERNAME || exit $?

exit 0
