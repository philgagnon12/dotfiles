#!/usr/bin/env bash
echo $0
echo $1
DESTINATION=$1

if [[ -z $DESTINATION ]]; then
	echo "Need a destination"
	exit
fi


mkdir -p ${DESTINATION}

curl ftp://ftp.cwru.edu/pub/bash/readline-8.0.tar.gz > ${DESTINATION}/readline-8.0.tar.gz
tar zxf ${DESTINATION}/readline-8.0.tar.gz -C ${DESTINATION}
mv ${DESTINATION}/readline-8.0 ${DESTINATION}/readline
cd ${DESTINATION}/readline
./configure
make
