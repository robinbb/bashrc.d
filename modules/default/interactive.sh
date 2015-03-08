case $(uname -s) of
   Darwin) alias colorls='ls -G' ;;
   *)      alias colorls='ls --color=auto' ;;
esac
alias l='colorls -a'
alias ll='colorls -la'
export PS1="\u@\h:\W \$ "
export EDITOR='vi'
