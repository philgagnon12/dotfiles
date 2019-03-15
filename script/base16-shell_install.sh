#!/usr/bin/env bash

echo "Installing base16-shell..."
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
else
    git clone https://github.com/chriskempson/base16-shell.git ${DESTINATION}
fi

