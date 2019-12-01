#!/bin/bash

# vimrc
rm ~/.vimrc 2> /dev/null
ln -s ~/config/dotfiles/vimrc ~/.vimrc

# bashrc
rm ~/.bashrc 2> /dev/null
ln -s ~/config/dotfiles/bashrc ~/.bashrc
