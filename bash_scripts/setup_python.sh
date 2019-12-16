#!/bin/bash
#----------------------------------------------------------------------------------------------------------------------#
#                                                   setup_python.sh                                                    #
#----------------------------------------------------------------------------------------------------------------------#
# This script will setup python in the user space with pyenv, and setup the global environment with the latest python
# version.

source ./bash_scripts/common.sh

test $EUID -eq 0 || fail "This script can only be run as root" 1

# Get the dependencies for the script.
apt install -y make build-essential libssl-dev zlib1g-dev libbz2-dev libreadline-dev libsqlite3-dev wget curl llvm \
    libncurses5-dev libncursesw5-dev xz-utils tk-dev libffi-dev liblzma-dev python-openssl \
    || fail "Couldn't install a package." 1

# We want to install the latest python3 stable version with pyenv and make the version global.
# Run the commands as the normal user.
su -c "
    curl https://pyenv.run | bash
    latest_python_version=$(pyenv install -list | awk '{$1=$1};1' | grep '^[0-9].[0-9].[0-9]\+$' | tail -n 1)
    $USERHOME/.pyenv/bin/pyenv install -list
    $USERHOME/.pyenv/bin/pyenv install -v $latest_python_version
    $USERHOME/.pyenv/bin/pyenv global $latest_python_version
    " $USERNAME

exit 0
