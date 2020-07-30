#!/bin/bash
#----------------------------------------------------------------------------------------------------------------------#
#                                                  make_symlinks.sh                                                    #
#----------------------------------------------------------------------------------------------------------------------#
# This script will create symlinks in the user's home directory and point them to the files the dotfiles directory.
#
# For example, this script will delete the existing /home/user/.vimrc file and make the symlink,
# /home/user/.vimrc ->  ../dotfiles/.vimrc.
#
# If the dotfiles directory contains directories, this script will those directories if they don't exist in the home
# directory.

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
source $DIR/common.sh
PARENT_DIR="$(dirname "$DIR")"

# Make sure this script is run a normal user, since we want the normal user to be the owner of the directories and the
# symlinks.
test $EUID -eq 0 && fail "This script can only be run as a normal user." 1

# Make directories in home.
find dotfiles -type d | sed s^dotfiles^"$USERHOME"^ | xargs mkdir -p \
    || fail "Could not make directories in home." 1

# Map the home directory to symlink to the dofiles directory.
for file in $(find dotfiles -type f); do
    home_file=$(echo $file | sed s^dotfiles^$USERHOME^)
    config_file="$PARENT_DIR/$file"

    rm $home_file 2> /dev/null
    ln -s $config_file $home_file || fail "Could not make symlink, $home_file, in home." 1
done

exit 0
