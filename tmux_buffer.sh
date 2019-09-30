#!/usr/bin/env sh

init() {
    keyBind
}

keyBind() {
    tmux bind-key -T copy-mode-vi "\\" "run-shell" "$0 promptForBufferName"
}

promptForBufferName() {
    tmux send-keys -X copy-selection-and-cancel
    tmux command-prompt -I "set-buffer -b 0 -n "
}
$1
