#!/bin/bash
#----------------------------------------------------------------------------------------------------------------------#
#                                                  configure_gnome.sh                                                  #
#----------------------------------------------------------------------------------------------------------------------#
# This script will configure GNOME with the settings I want using gsettings.

source ./bash_scripts/common.sh

test $EUID -eq 0 && fail "This script can only be run as normal user." 1

# Disable Animations
gsettings set org.gnome.desktop.interface enable-animations false

# Setup my Dash with my favorite apps
gsettings set org.gnome.shell favorite-apps "['firefox.desktop', 'gnome-terminal.desktop', \
    'org.gnome.Nautilus.desktop']"

# Terminal

gsettings set org.gnome.Terminal.Legacy.Settings confirm-close false

# KeyBindings for Teminal
gsettings_schema=org.gnome.Terminal.Legacy.Keybindings
gsettings_path=/org/gnome/terminal/legacy/keybindings/
schema_path=$gsettings_schema:$gsettings_path

gsettings set $schema_path zoom-in '<Ctrl>j'
gsettings set $schema_path zoom-out '<Ctrl>k'


