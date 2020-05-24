#!/bin/bash
#----------------------------------------------------------------------------------------------------------------------#
#                                                master_script-root.sh                                                 #
#----------------------------------------------------------------------------------------------------------------------#
# This script will run the script inside of bash_scripts directory in a procedual manner. This script runs the bash
# scripts that need root privileges.

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
source $DIR/bash_scripts/common.sh

test $EUID -eq 0 || fail "This script can only be run as root." 1

$DIR/bash_scripts/install_packages.sh || exit $?

$DIR/bash_scripts/setup_docker.sh || exit $?

exit 0
