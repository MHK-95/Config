#!/bin/bash
#----------------------------------------------------------------------------------------------------------------------#
#                                                   setup_docker.sh                                                    #
#----------------------------------------------------------------------------------------------------------------------#
# This script will install docker and give the user the ability to run docker with root privileges.

source ./bash_scripts/common.sh

test $EUID -eq 0 || fail "This script can only be run as root" 1

# Install the dependencies.
apt install -y apt-transport-https ca-certificates curl gnupg-agent software-properties-common \
    || fail "Couldn't install a package." 1

# Add the GPG key.
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | apt-key add - || fail "Could not download the GPG key." 1
apt-key fingerprint 0EBFCD88

# Add the Docker repo.
add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" \
    || fail "Couldn't add the docker repository." 1

apt update || fail "Couldn't apt update." 1

# Install Docker community version.
apt install -y docker-ce docker-ce-cli containerd.io || fail "Couldn't install the Docker package." 1

# Enable the normal user to run docker with sudo privileges.
groupadd docker
usermod -aG docker $USERNAME
newgrp docker

exit 0
