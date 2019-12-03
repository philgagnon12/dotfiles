#!/bin/bash

# $1 can either be "--download-only" or "--install-from-download-only"

# Directory of this script
DIR=$(cd `dirname $0` && pwd)

# Create destination
DOTFILES=~/.dotfiles
mkdir ${DOTFILES}

# Symbolic links
ln -s ${DIR}/aliases.sh ${DOTFILES}
ln -s ${DIR}/bash-powerline.sh ${DOTFILES}
ln -s ${DIR}/pain_control.tmux ${DOTFILES}
ln -s ${DIR}/sensible.tmux ${DOTFILES}
ln -s ${DIR}/sensible.vim ${DOTFILES}
ln -s ${DIR}/script/base16-shell.sh ${DOTFILES}
ln -s ${DIR}/script/base16-shell.vim ${DOTFILES}
ln -s ${DIR}/tmux_vim.sh ${DOTFILES}
ln -s ${DIR}/tmux_buffer.sh ${DOTFILES}

# Move to not overwrite
mv ~/.bash_profile ~/._bash_profile
mv ~/.tmux.conf ~/._tmux.conf
mv ~/.vimrc ~/._vimrc

ln -s ${DIR}/.bash_profile ~
ln -s ${DIR}/.tmux.conf ~
ln -s ${DIR}/.vimrc ~
ln -s ${DIR}/.inputrc ~

# Install base16-shell
source ${DIR}/script/base16-shell_install.sh ${DOTFILES}/base16-shell $1
source ${DIR}/script/base16-vim_install.sh ${DOTFILES}/base16-vim $1

# Install tmux-fingers
source ${DIR}/script/tmux-fingers_install.sh ${DOTFILES}/tmux-fingers $1

