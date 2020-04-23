#PATH
PATH=~/bin:$PATH

export CLI_COLORS=1
SHORTPS=""
export MYPS1=${SHORTPS}

GREEN=$(tput setaf 2)
RED=$(tput setaf 1)
BLUE=$(tput setaf 12)
# Exit Attributes / turnoff
EA=$(tput sgr0)

term_char()
{

    if [ $? -eq 0 ]; then
        TERM_CHAR="${GREEN}\$${EA}"
    else
        TERM_CHAR="${RED}\$${EA}"
    fi

    printf ${TERM_CHAR}
}

# Define longps
longps() {
    TERM_CHAR='$(term_char)'
    PS1="${RED}\\u${EA}:${BLUE}\\w${EA}"
    gitstatus='$(${HOME}/repos/dotfiles/gitstatus.py)'
    PS1="${PS1} \[${gitstatus}\]${TERM_CHAR} "
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

#include aliases
source ~/.dotfiles/aliases.sh

#Enable base16 color themes
source ~/.dotfiles/base16-shell.sh ~/.dotfiles/base16-shell

#Shell color
base16_unikitty-dark
