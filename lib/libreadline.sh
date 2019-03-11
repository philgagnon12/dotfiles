#!/usr/bin/env bash
echo $0
echo $1
DESTINATION=$1
mkdir ${DESTINATION}

curl ftp://ftp.cwru.edu/pub/bash/readline-8.0.tar.gz > ${DESTINATION}/readline-8.0.tar.gz
tar zxf ${DESTINATION}/readline-8.0.tar.gz -C ${DESTINATION}
cd ${DESTINATION}/readline-8.0
./configure
make
