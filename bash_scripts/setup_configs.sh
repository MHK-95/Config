#!/bin/bash

# vimrc
rm ~/.vimrc 2> /dev/null
ln -s ~/Config/dotfiles/vimrc ~/.vimrc

# bashrc
rm ~/.bashrc 2> /dev/null
ln -s ~/Config/dotfiles/bashrc ~/.bashrc

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


