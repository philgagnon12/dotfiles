#!/usr/bin/env bash

echo "Installing gawk..."
echo $0
echo $1
DESTINATION=$1
DOWNLOAD_ONLY=1
INSTALL_FROM_DOWNLOAD_ONLY=1

if [[ -z $DESTINATION ]]; then
    echo "DESTINATION required"
    exit
fi

if [[ $2 == "--download-only" ]]; then
    echo "Download only"
    INSTALL_FROM_DOWNLOAD_ONLY=0
fi

if [[ $2 == "--install-from-download-only" ]]; then
    echo "Install from download only"
    DOWNLOAD_ONLY=0
fi

if [[ $DOWNLOAD_ONLY -eq 1 ]]; then
    echo "Downloading..."
    mkdir -p ${DESTINATION}
    curl -L https://github.com/tmux/tmux/releases/download/3.0a/tmux-3.0a.tar.gz > ${DESTINATION}/tmux-3.0a.tar.gz
    curl -L https://ftp.gnu.org/gnu/gawk/gawk-5.0.1.tar.gz > ${DESTINATION}/gawk-5.0.1.tar.gz
    tar xvf ${DESTINATION}/gawk-5.0.1.tar.gz -C ${DESTINATION}
fi

if [[ $INSTALL_FROM_DOWNLOAD_ONLY -eq 1 ]]; then
    echo "Installing..."
    cd ${DESTINATION}/gawk-5.0.1
    ./configure --prefix=${HOME}
    make
    make install
fi
