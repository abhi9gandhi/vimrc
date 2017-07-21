#!/bin/bash -xe

dotfiles=".bashrc_abgandhi .vim .vimrc .tmux.conf"

echo "Downloading dependencies"
sudo apt-get install vim -y
sudo apt-get install tmux -y

echo "Creating symlink"
for file in $dotfiles; do
        ln -snvf $file ~/$file
done

# Add bash aliases.
source ~/.bashrc_abgandhi

echo "Done."


