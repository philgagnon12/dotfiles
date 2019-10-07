#PATH
PATH=~/bin:$PATH

export CLI_COLORS=1
SHORTPS=""
export MYPS1=${SHORTPS}

RED=$(tput setaf 9)
BLUE=$(tput setaf 12)
# Exit Attributes / turnoff
EA=$(tput sgr0)

# Define longps
longps() {
    MYPS1="${RED}\\u${EA}:${BLUE}\\w${EA}"
}

#define shortps
shortps() {
    MYPS1=${SHORTPS}
}
# default is longps
longps

#export LS_COLORS
if ! [[ -z $(command -v dircolors) ]]; then
	dircolors > /dev/null
fi

# VIM as default editor
export EDITOR=vim

# Set vi mode for bash
set -o vi

# GIT powerline
source ~/.dotfiles/bash-powerline.sh

#include aliases
source ~/.dotfiles/aliases.sh

#Enable base16 color themes
source ~/.dotfiles/base16-shell.sh ~/.dotfiles/base16-shell

#Shell color
base16_unikitty-dark
