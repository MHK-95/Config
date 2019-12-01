#!/bin/bash


apt update
apt upgrade

# vim
apt -y install vim

# flathub
apt -y install flatpak
apt -y install gnome-software-plugin-flatpak
flatpak -y remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo

# flathub apps
flatpak -y install com.visualstudio.code.oss

