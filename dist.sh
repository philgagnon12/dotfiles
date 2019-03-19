#! /usr/bin/env bash

# Simple script to archive and deploy to offline machine, until I make a --download-only && --install-from-download-only
echo "Archiving ..."

tar cvfh dotfiles.tar.gz ${HOME}/.dotfiles \
                         ${HOME}/.bash_profile \
                         ${HOME}/.tmux.conf \
                         ${HOME}/.vimrc \
                         ${HOME}/.vim

