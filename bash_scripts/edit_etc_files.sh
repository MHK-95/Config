#!/bin/bash
#----------------------------------------------------------------------------------------------------------------------#
#                                                  edit_etc_files.sh                                                   #
#----------------------------------------------------------------------------------------------------------------------#
# This script will edit the etc files like how I want them.

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
source $DIR/common.sh

test $EUID -eq 0 || fail "This script can only be run as root." 1

# Disable update notifications
cat > /etc/apt/apt.conf.d/20auto-upgrades <<EOF
  APT::Periodic::Update-Package-Lists "0";
  APT::Periodic::Download-Upgradeable-Packages "0";
  APT::Periodic::AutocleanInterval "0";
  APT::Periodic::Unattended-Upgrade "1";
EOF

exit 0
