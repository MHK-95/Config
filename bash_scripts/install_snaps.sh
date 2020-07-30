#!/bin/bash
#----------------------------------------------------------------------------------------------------------------------#
#                                                   install_snaps.sh                                                   #
#----------------------------------------------------------------------------------------------------------------------#
# This script will install all the snaps I want.

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
source $DIR/common.sh

test $EUID -eq 0 || fail "This script can only be run as root." 1

# Jetbrains IDEs
snap install pycharm-professional --classic
snap install webstorm --classic
snap install goland --classic
snap install intellij-idea-ultimate --classic

exit 0
