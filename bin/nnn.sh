#!/usr/bin/env bash

LIBREADLINE=~/lib/libreadline
#Dont source libreadline.sh if already done
if [[ -d $LIBREADLINE ]]; then
	echo "${LIBREADLINE} exists"
else
	source ../lib/libreadline.sh ${LIBREADLINE}
fi

LIBNCURSES=~/lib/libncurses
#Dont source libncurses.sh if already done
if [[ -d $LIBNCURSES ]]; then
	echo "${LIBNCURSES} exists"
else
	source ../lib/libncurses.sh ${LIBNCURSES}
fi

DESTINATION=~/bin

mkdir -p ${DESTINATION}
mkdir -p ${DESTINATION}/man

cd ${DESTINATION}
git clone https://github.com/jarun/nnn.git jarun_nnn
cd jarun_nnn
git checkout v2.3

export PREFIX=${DESTINATION}/..
export MANPREFIX=${DESTINATION}/man
export LDFLAGS="-I ${LIBREADLINE} -L ${LIBREADLINE}/readline"
LDFLAGS+=" -I ${LIBNCURSES}/ncurses/include -L ${LIBNCURSES}/ncurses/lib"
export LDLIBS_CURSES="-lncursesw"
make
make install

