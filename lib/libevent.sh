#! /usr/bin/env bash
echo $0
echo $1
DESTINATION=$1

if [[ -z $DESTINATION ]]; then
    echo "DESTINATION required"
    exit
fi

# Dont clone if folder already exists
if [[ -d ${DESTINATION} ]]; then
    echo "${DESTINATION} exists"
    exit 0
fi

mkdir -p ${DESTINATION}

curl -L https://github.com/libevent/libevent/releases/download/release-2.1.8-stable/libevent-2.1.8-stable.tar.gz > ${DESTINATION}/libevent-2.1.8.tar.gz
tar xvf ${DESTINATION}/libevent-2.1.8.tar.gz -C ${DESTINATION}
mv ${DESTINATION}/libevent-2.1.8-stable ${DESTINATION}/libevent
cd ${DESTINATION}/libevent
./configure --prefix=${DESTINATION}
make
# make install will create the structure :
# ${DESTINATION}/lib
# ${DESTINATION}/bin
# ${DESTINATION}/include
make install
