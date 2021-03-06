#!/bin/bash -xe

dotfiles=".bashrc_abgandhi .vim .vimrc .tmux.conf .tmux"

echo "Installing submodules"
git submodule update

echo "Downloading dependencies"
#sudo apt-get install vim -y
#sudo apt-get install tmux -y
#sudo at-get install curl -y

pdir=$(pwd)
echo $pdir

echo "Creating symlink"
for file in $dotfiles; do
        ln -snvf $pdir/$file ~/$file
done

# Add bash aliases.
source ~/.bashrc_abgandhi

echo "Done."


