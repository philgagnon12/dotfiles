#!/usr/bin/env bash

LIBREADLINE=~/lib/libreadline
mkdir ${LIBREADLINE}
source ../lib/libreadline.sh ${LIBREADLINE}

DESTINATION=~/bin

mkdir ${DESTINATION}
mkdir ${DESTINATION}/man

cd ${DESTINATION}
git clone https://github.com/jarun/nnn.git jarun_nnn
cd jarun_nnn
git checkout v2.3

export PREFIX=${DESTINATION}/..
export MANPREFIX=${DESTINATION}/man
export LDFLAGS="-L ${LIBREADLINE}"

make
make install

