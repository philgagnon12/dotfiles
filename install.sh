#!/bin/bash

# Directory of this script
DIR=$(cd `dirname $0` && pwd)

# Create destination
DOTFILES=~/.dotfiles
mkdir ${DOTFILES}

# Symbolic links
ln -s ${DIR}/aliases.sh ${DOTFILES}
ln -s ${DIR}/bash_colors.sh ${DOTFILES}
ln -s ${DIR}/bash-powerline.sh ${DOTFILES}
ln -s ${DIR}/pain_control.tmux ${DOTFILES}
ln -s ${DIR}/sensible.tmux ${DOTFILES}
ln -s ${DIR}/sensible.vim ${DOTFILES}

# Move to not overwrite
mv ~/.bash_profile ~/._bash_profile
mv ~/.tmux.conf ~/._tmux.conf
mv ~/.vimrc ~/._vimrc

ln -s ${DIR}/.bash_profile ~
ln -s ${DIR}/.tmux.conf ~
ln -s ${DIR}/.vimrc ~
