# TMUX_VIM=1
# export $(tmux showenv -g TMUX_VIM)
# tmux setenv -g  TMUX_VIM "$(($TMUX_VIM*-1))"
# echo $TMUX_VIM
# STATUS_RIGHT=$(tmux show-option -vg status-right)
# echo $STATUS_RIGHT
# [ $1 -eq 1 ] && tmux send-keys $(tmux showenv TMUX_VIM)

# Constants
TMUX_ON=1

# Toggle
TMUX_VIM_TOGGLE_OPTION=$(tmux show-option -vg @TMUX_VIM_TOGGLE)
TMUX_VIM_TOGGLE=$TMUX_VIM_TOGGLE_OPTION

init() {
    keybind
    # Vim/Tmux toggle state, default 1 == TMUX
    TMUX_VIM_TOGGLE=1
    tmux set-option -g @TMUX_VIM_TOGGLE 1
    tmux set-option -ag status-right "#(tmux show-option -vg @TMUX_VIM_LABEL)"
    tmux bind-key v run "~/repos/dotfiles/tmux_vim.sh toggle"
    updateLabelOption
}
keybind() {
    tmux unbind-key -n C-h
    tmux unbind-key h
    tmux bind-key    h run-shell "$0 selectPaneLeft"
    tmux bind-key   -n C-h run-shell "$0 selectPaneLeft"

    tmux unbind-key -n C-j
    tmux unbind-key j
    tmux bind-key   j  run-shell "$0 selectPaneDown"
    tmux bind-key   -n C-j run-shell "$0 selectPaneDown"

    tmux unbind-key -n C-k
    tmux unbind-key k
    tmux bind-key   k  run-shell "$0 selectPaneUp"
    tmux bind-key   -n C-k run-shell "$0 selectPaneUp"

    tmux unbind-key -n C-l
    tmux unbind-key l
    tmux bind-key   l  run-shell "$0 selectPaneRight"
    tmux bind-key   -n C-l run-shell "$0 selectPaneRight"
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

selectPaneLeft() {
    if [ $TMUX_VIM_TOGGLE -eq $TMUX_ON ]
    then tmux select-pane -L
    else tmux send-keys C-w h
    fi
}
selectPaneDown() {
    if [ $TMUX_VIM_TOGGLE -eq $TMUX_ON ]
    then tmux select-pane -D
    else tmux send-keys C-w j
    fi
}
selectPaneUp() {
    if [ $TMUX_VIM_TOGGLE -eq $TMUX_ON ]
    then tmux select-pane -U
    else tmux send-keys C-w k
    fi
}
selectPaneRight() {
    if [ $TMUX_VIM_TOGGLE -eq $TMUX_ON ]
    then tmux select-pane -R
    else tmux send-keys C-w l
    fi
}
$1
# Refresh the -S status bar only
tmux refresh-client -S
# in tmux to display