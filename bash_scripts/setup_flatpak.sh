#!/bin/bash
#----------------------------------------------------------------------------------------------------------------------#
#                                                  setup_flatpak.sh                                                    #
#----------------------------------------------------------------------------------------------------------------------#
# This script will install flatpak and install the flatpak apps I want from flathub.

source ./bash_scripts/common.sh

test $EUID -eq 0 && fail "This script can only be run as a normal user." 1

# Add the flathub repo
flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo \
    || fail "Couldn't add the flathub repo." 1

aliases_file="dotfiles/.flatpak_bash_aliases"
echo '' > "$aliases_file"

declare -A flathub_map
flathub_map[com.visualstudio.code.oss]=vscode
flathub_map[com.spotify.Client]=spotify
flathub_map[com.discordapp.Discord]=discord
flathub_map[com.jetbrains.PyCharm-Community]=pycharm

for app in "${!flathub_map[@]}"
do
    flatpak install -y flathub $app || Fail "Couldn't install flatpak app, $app." 1
    echo "alias ${flathub_map[$app]}='flatpak run $app'" >> "$aliases_file"
done

# Extra things to do.
# Have vscode install the sync extension.
flatpak run com.visualstudio.code.oss --install-extension Shan.code-settings-sync

exit 0
