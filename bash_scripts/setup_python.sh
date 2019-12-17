#!/bin/bash
#----------------------------------------------------------------------------------------------------------------------#
#                                                   setup_python.sh                                                    #
#----------------------------------------------------------------------------------------------------------------------#
# This script will setup python in the user space with pyenv, and setup the global environment with the latest python
# version. This script can only be run a normal user, since pyenv is installed in the userspace instead of the
# system.

source ./bash_scripts/common.sh

test $EUID -eq 0 && fail "This script can only be run as a normal user." 1

curl https://pyenv.run | bash

# We want to install the latest python3 stable version with pyenv and make the version global.
latest_python_version=$($USERHOME/.pyenv/bin/pyenv install -list | awk '{$1=$1};1' | grep '^[0-9].[0-9].[0-9]\+$' | \
    tail -n 1)
$USERHOME/.pyenv/bin/pyenv install -v $latest_python_version
$USERHOME/.pyenv/bin/pyenv global $latest_python_version

exit 0
