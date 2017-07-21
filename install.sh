#!/bin/bash -xe

dotfiles=".bashrc_abgandhi .vim .vimrc .tmux.conf"

echo "Creating symlink"
for file in $dotfiles; do
        ln -snvf $file ~/$file
done

# Add bash aliases.
source ~/.bashrc_abgandhi

echo "Done."


