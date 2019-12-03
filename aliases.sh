#Colored ls
ls --color=auto 2>/dev/null
if [[ $? == 1 ]]; then alias ls='ls -G'; else alias ls='ls --color=auto'; fi
alias grep="grep --color=auto"
alias egrep="egrep --color=auto"

alias pe="printenv | grep "

