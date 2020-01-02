#!/usr/bin/env bash

echo "Installing base16-shell..."
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
    git clone https://github.com/chriskempson/base16-shell.git ${DESTINATION}
fi

