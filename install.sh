#!/bin/bash -xe

dotfiles=".bashrc_abgandhi .vim .vimrc .tmux.conf"

echo "Creating symlink"
for file in $dotfiles; do
        ln -snvf $file ~/.$file
done

# Add bash aliases.
if [ -f ~/.bashrc_abgandhi ]; then
    source ~/.bashrc_abgandhi
else

fi

echo "Done."


