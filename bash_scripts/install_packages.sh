#!/bin/bash
#----------------------------------------------------------------------------------------------------------------------#
#                                                 install_packages.sh                                                  #
#----------------------------------------------------------------------------------------------------------------------#
# This script will simply install the packages I want with apt.

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
source $DIR/common.sh

test $EUID -eq 0 || fail "This script can only be run as root." 1

apt update || fail "Could't apt update." 1

# Install some proprietary packages
sudo apt install -y ubuntu-restricted-extras ubuntu-restricted-addons || fail "Couldn't install a package." 1

apt install -y neofetch vim youtube-dl openssh-server htop tree apt-transport-https \
    || fail "Couldn't install a package." 1

# These are the dependencies for pyenv. I'm installing them here since the setup_python.sh script needs to be run
# as a normal user.
apt install -y make build-essential libssl-dev zlib1g-dev libbz2-dev libreadline-dev libsqlite3-dev wget curl llvm \
    libncurses5-dev libncursesw5-dev xz-utils tk-dev libffi-dev liblzma-dev python-openssl \
    || fail "Couldn't install a package." 1

# install flatpak
apt install -y flatpak || fail "Couldn't install the flatpak package." 1

# install brave
curl -s https://brave-browser-apt-release.s3.brave.com/brave-core.asc | apt-key --keyring /etc/apt/trusted.gpg.d/brave-browser-release.gpg add - \
    || fail "Could't add the brave browser key" 1
echo "deb [arch=amd64] https://brave-browser-apt-release.s3.brave.com/ stable main" | tee /etc/apt/sources.list.d/brave-browser-release.list \
    || fail "Could't add the brave browser repository to the /etc/ file." 1

apt update || fail "Couldn't apt update." 1
apt install -y brave-browser "Couldn't install the brave browser." 1

exit 0
