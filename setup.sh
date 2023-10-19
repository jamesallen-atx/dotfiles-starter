#! /bin/bash

# This script is meant to be run from the root of the dotfiles repo.
# It will copy the dotfiles to the home directory and create symlinks
# to the dotfiles in the home directory.

# Set the dotfiles directory
DOTFILES_DIR="$(pwd)"

# Set the home directory
HOME_DIR="$HOME"

touch "$DOTFILES_DIR/.toolsrc"

for file in .bash_aliases .bash_completions .bash_functions .bash_profile .bashrc .toolsrc
do
    # symlink the dotfiles to the home directory
    ln -snf "$DOTFILES_DIR/$file" "$HOME_DIR/$file"
done

