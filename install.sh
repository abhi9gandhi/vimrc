#!/bin/bash -xe

dotfiles=".bashrc_abgandhi .vim .vimrc .tmux.conf"

echo "Creating symlink"
for file in $dotfiles; do
        ln -snvf $file ~/.$file
done

echo "Done."


