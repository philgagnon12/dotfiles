source .dotfiles/bash_colors.sh
export CLI_COLORS=1
export PS1="$(clr_red \\u):$(clr_cyan \\W)\$ "

#export LS_COLORS
dircolors > /dev/null

#include aliases
source .dotfiles/aliases.sh
