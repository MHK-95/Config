#!/bin/bash
#----------------------------------------------------------------------------------------------------------------------#
#                                               copy_bin_scripts.sh                                                    #
#----------------------------------------------------------------------------------------------------------------------#
# This script will copy all the bash scripts from the ../bin_scripts/ dir and put them in the $HOME/bin/ dir.


DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
source $DIR/common.sh
PARENT_DIR="$(dirname "$DIR")"

test $EUID -eq 0 && fail "This script can only be run as a normal user." 1

# Make a $HOME/bin dir if it doesn't exit.
test -d "$HOME/bin" || mkdir "$HOME/bin"

cp $PARENT_DIR/bin_scripts/* $HOME/bin/

exit 0
