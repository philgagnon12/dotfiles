#!/usr/bin/env bash

echo "Installing tmux..."
echo $0
echo $1
DESTINATION=$1
DOWNLOAD_ONLY=1
INSTALL_FROM_DOWNLOAD_ONLY=1

if [[ -z $DESTINATION ]]; then
    echo "DESTINATION required"
    exit
fi

if [[ $2 = "--download-only" ]]; then
    echo "Download only"
    INSTALL_FROM_DOWNLOAD_ONLY=0
fi

if [[ $2 = "--install-from-download-only" ]]; then
    echo "Install from download only"
    DOWNLOAD_ONLY=0
fi

if [[ $DOWNLOAD_ONLY -eq 1 ]]; then
    echo "Downloading..."
    mkdir -p ${DESTINATION}
    curl -L https://github.com/tmux/tmux/releases/download/3.0a/tmux-3.0a.tar.gz > ${DESTINATION}/tmux-3.0a.tar.gz
    tar xvf ${DESTINATION}/tmux-3.0a.tar.gz -C ${DESTINATION}
fi

if [[ $INSTALL_FROM_DOWNLOAD_ONLY -eq 1 ]]; then
    echo "Installing..."
    cd ${DESTINATION}/tmux-3.0a
    ./configure --prefix=${HOME} CFLAGS="-I${HOME}/lib/libevent/include -I${HOME}/lib/ncurses/include" LDFLAGS="-L${HOME}/lib/libevent/lib -L${HOME}/lib/ncurses/lib"
    make
    make install
fi
