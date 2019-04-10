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
    curl -L https://github.com/libevent/libevent/releases/download/release-2.1.8-stable/libevent-2.1.8-stable.tar.gz > ${DESTINATION}/libevent-2.1.8.tar.gz
    tar xvf ${DESTINATION}/libevent-2.1.8.tar.gz -C ${DESTINATION}
    mv ${DESTINATION}/libevent-2.1.8-stable ${DESTINATION}/libevent
fi

if [[ $INSTALL_FROM_DOWNLOAD_ONLY -eq 1 ]]; then
    echo "Installing..."
    cd ${DESTINATION}/libevent
    ./configure --prefix=${DESTINATION}/libevent
    make
    # make install will create the structure :
    # ${DESTINATION}/libevent/lib
    # ${DESTINATION}/libevent/bin
    # ${DESTINATION}/libevent/include
    make install
fi
