#/usr/bin/env bash

echo $0
echo $1
DESTINATION=$1

if [[ -z $DESTINATION ]]; then
	echo "DESTINATION required"
	exit
fi

mkdir -p ${DESTINATION}

curl https://invisible-mirror.net/archives/ncurses/ncurses-6.1.tar.gz > ${DESTINATION}/ncurses-6.1.tar.gz
tar xzf ${DESTINATION}/ncurses-6.1.tar.gz -C ${DESTINATION}
mv ${DESTINATION}/ncurses-6.1 ${DESTINATION}/ncurses
cd ${DESTINATION}/ncurses
./configure --with-normal --enable-widec
make
