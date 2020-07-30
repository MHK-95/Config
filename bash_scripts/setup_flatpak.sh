#!/bin/bash
#----------------------------------------------------------------------------------------------------------------------#
#                                                  setup_flatpak.sh                                                    #
#----------------------------------------------------------------------------------------------------------------------#
# This script will install flatpak and install the flatpak apps I want from flathub.

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
source $DIR/common.sh

test $EUID -eq 0 && fail "This script can only be run as a normal user." 1

flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo \
    || fail "Couldn't add the flathub repo." 1

declare -A flathub_map
flathub_map[com.spotify.Client]=spotify
flathub_map[org.gimp.GIMP]=gimp

for app in "${!flathub_map[@]}"
do
    flatpak install -y flathub $app || fail "Couldn't install flatpak app, $app." 1

    cat > $HOME/bin/${flathub_map[$app]} <<EOF
#!/bin/bash
flatpak run $app
EOF

    chmod +x $HOME/bin/${flathub_map[$app]}
done

exit 0
