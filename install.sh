#!/bin/bash

# Directory of this script
DIR=dirname $0

# Create destination
DOTFILES=~/.dotfiles
mkdir ${DOTFILES}

# Symbolic links
ln -s ${DIR}/aliases.sh ${DOTFILES}
ln -s ${DIR}/bash_colors.sh ${DOTFILES}
ln -s ${DIR}/bash-powerline.sh ${DOTFILES}
ln -s ${DIR}/pain_control.tmux ${DOTFILES}
ln -s ${DIR}/sensible.tmux ${DOTFILES}

# Move to not overwrite
mv ~/.bashrc ~/._bashrc
cp ~/.tmux.conf ~/._tmux.conf

ln -s ${DIR}/.bashrc ~
ln -s ${DIR}/.tmux.conf ~
