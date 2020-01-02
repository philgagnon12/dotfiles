#! /usr/bin/env bash
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
    curl https://invisible-mirror.net/archives/ncurses/ncurses-6.1.tar.gz > ${DESTINATION}/ncurses-6.1.tar.gz
fi

if [[ $INSTALL_FROM_DOWNLOAD_ONLY -eq 1 ]]; then
    echo "Installing..."

    tar xzf ${DESTINATION}/ncurses-6.1.tar.gz -C ${DESTINATION}
mv ${DESTINATION}/ncurses-6.1 ${DESTINATION}/ncurses
    cd ${DESTINATION}/ncurses
    ./configure --with-normal --enable-widec
    make
    make install.data

    ./configure --with-normal
    make
    make install.data
fi
