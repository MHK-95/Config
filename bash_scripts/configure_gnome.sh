#!/bin/bash
#----------------------------------------------------------------------------------------------------------------------#
#                                                  configure_gnome.sh                                                  #
#----------------------------------------------------------------------------------------------------------------------#
# This script will configure GNOME with the settings I want using gsettings.

source ./bash_scripts/common.sh

test $EUID -eq 0 && fail "This script can only be run as normal user." 1

# Disable Animations
gsettings set org.gnome.desktop.interface enable-animations false

# Disable blinking cursor on everything
gsettings set org.gnome.desktop.interface cursor-blink false

# Disable all bell sounds
gsettings set org.gnome.desktop.sound event-sounds false

# Setup my Dash with my favorite apps
gsettings set org.gnome.shell favorite-apps "['firefox.desktop', 'org.gnome.Nautilus.desktop', \
    'org.gnome.Terminal.desktop', 'com.visualstudio.code.oss.desktop', 'com.jetbrains.PyCharm-Community.desktop', \
    'com.spotify.Client.desktop', 'com.discordapp.Discord.desktop']"

# Terminal
gsettings set org.gnome.Terminal.Legacy.Settings confirm-close false

# Get the terminal id and set up the schema_path for gnome-terminal.
gnome_terminal_profile=`gsettings get org.gnome.Terminal.ProfilesList default | awk -F \' '{print $2}'`
schema_path=org.gnome.Terminal.Legacy.Profile:/org/gnome/terminal/legacy/profiles:/:$gnome_terminal_profile/

# I like the default font for gnome.
#gsettings set $schema_path font 'Monospace 10'
#gsettings set $schema_path use-system-font false

gsettings set $schema_path audible-bell false
gsettings set $schema_path use-theme-colors false
gsettings set $schema_path background-color '#000000'

# Set the opacity of the terminal
gsettings set $schema_path use-transparent-background true
gsettings set $schema_path background-transparency-percent 40

# KeyBindings for Teminal
gsettings_schema=org.gnome.Terminal.Legacy.Keybindings
gsettings_path=/org/gnome/terminal/legacy/keybindings/
schema_path=$gsettings_schema:$gsettings_path

gsettings set $schema_path zoom-in '<Ctrl>j'
gsettings set $schema_path zoom-out '<Ctrl>k'

gsettings set org.gnome.desktop.background picture-uri "file://$PWD/wallpapers/background"
gsettings set org.gnome.desktop.screensaver picture-uri "file://$PWD/wallpapers/screensaver"

exit 0
