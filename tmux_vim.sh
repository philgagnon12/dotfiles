# TMUX_VIM=1
# export $(tmux showenv -g TMUX_VIM)
# tmux setenv -g  TMUX_VIM "$(($TMUX_VIM*-1))"
# echo $TMUX_VIM
# STATUS_RIGHT=$(tmux show-option -vg status-right)
# echo $STATUS_RIGHT
# [ $1 -eq 1 ] && tmux send-keys $(tmux showenv TMUX_VIM)

# Toggle
TMUX_VIM_TOGGLE_OPTION=$(tmux show-option -vg @TMUX_VIM_TOGGLE)
TMUX_VIM_TOGGLE=$TMUX_VIM_TOGGLE_OPTION

init() {
    # Vim/Tmux toggle state, default 1 == TMUX
    TMUX_VIM_TOGGLE=1
    tmux set-option -g @TMUX_VIM_TOGGLE 1
    tmux set-option -ag status-right "#(tmux show-option -vg @TMUX_VIM_LABEL)"
    tmux bind-key v run "~/repos/dotfiles/tmux_vim.sh toggle"
    updateLabelOption
}

toggle() {
    TMUX_VIM_TOGGLE=$(($TMUX_VIM_TOGGLE_OPTION*-1))
    tmux set-option -g @TMUX_VIM_TOGGLE $TMUX_VIM_TOGGLE
    updateLabelOption
}

updateLabelOption() {
    # Update label option
    if [ $TMUX_VIM_TOGGLE -eq 1 ]
    then tmux set-option -g @TMUX_VIM_LABEL " #[bg=yellow]TMUX"
    else tmux set-option -g @TMUX_VIM_LABEL " #[bg=red]VIM"
    fi
}

$1
# Refresh the -S status bar only
tmux refresh-client -S
# in tmux to display
