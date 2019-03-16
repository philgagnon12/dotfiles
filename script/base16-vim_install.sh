#! /usr/bin/env bash

echo "Installing base16-vim..."
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

git clone https://github.com/chriskempson/base16-vim.git ${DESTINATION}
VIMCOLORS=${HOME}/.vim/colors
mkdir -p ${VIMCOLORS}
cp ${DESTINATION}/colors/*.vim ${VIMCOLORS}


