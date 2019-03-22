#! /usr/bin/env bash

# Simple script to archive and deploy to offline machine, until I make a --download-only && --install-from-download-only
echo "Archiving ..."

# Directory of this script
DIR=$(cd `dirname $0` && pwd)
DIRNAME=$( basename $DIR )

tar czvfh dotfiles.tar.gz --exclude .git --exclude .DS_Store \
    -C ${DIR}/.. \
    ${DIRNAME} \
    -C ${HOME} \
    .dotfiles \
    .bash_profile \
    .tmux.conf \
    .vimrc
