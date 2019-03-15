#PATH
PATH=~/bin:$PATH

#Enable colors
source ~/.dotfiles/bash_colors.sh
export CLI_COLORS=1
export MYPS1="$(clr_red \\u):$(clr_blue \\w)"

#export LS_COLORS
if ! [[ -z $(command -v dircolors) ]]; then
	dircolors > /dev/null
fi

# VIM as default editor
export EDITOR=vim

# GIT powerline
source ~/.dotfiles/bash-powerline.sh

#include aliases
source ~/.dotfiles/aliases.sh

#Enable base16 color themes
source ~/.dotfiles/base16-shell.sh ~/.dotfiles/base16-shell

#Shell color
base16_atlas
