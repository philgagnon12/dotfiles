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
ln -s ${DIR}/script/base16-shell.sh ${DOTFILES}
ln -s ${DIR}/script/base16-shell.vim ${DOTFILES}

# Move to not overwrite
mv ~/.bash_profile ~/._bash_profile
mv ~/.tmux.conf ~/._tmux.conf
mv ~/.vimrc ~/._vimrc

ln -s ${DIR}/.bash_profile ~
ln -s ${DIR}/.tmux.conf ~
ln -s ${DIR}/.vimrc ~

# Install base16-shell
source ${DIR}/script/base16-shell_install.sh ${DOTFILES}/base16-shell
source ${DIR}/script/base16-vim_install.sh ${DOTFILES}/base16-vim
