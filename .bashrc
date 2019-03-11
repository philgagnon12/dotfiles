#PATH
PATH=~/bin:$PATH

#Enable colors
source ~/.dotfiles/bash_colors.sh
export CLI_COLORS=1
export MYPS1="$(clr_red \\u):$(clr_cyan \\W)"

#export LS_COLORS
dircolors > /dev/null

# VIM as default editor
export EDITOR=vim

# GIT powerline
source ~/.dotfiles/bash-powerline.sh

#include aliases
source ~/.dotfiles/aliases.sh
