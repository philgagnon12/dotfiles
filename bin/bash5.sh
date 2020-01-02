#!/usr/bin/env bash

echo "Installing bash5..."
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
    
    curl -L https://ftp.gnu.org/gnu/bash/bash-5.0.tar.gz > ${DESTINATION}/bash-5.0.tar.gz
    tar xvf ${DESTINATION}/bash-5.0.tar.gz -C ${DESTINATION}
fi

if [[ $INSTALL_FROM_DOWNLOAD_ONLY -eq 1 ]]; then
    echo "Installing..."
    cd ${DESTINATION}/bash-5.0
    ./configure --prefix=${HOME}
    make
    make install
fi
