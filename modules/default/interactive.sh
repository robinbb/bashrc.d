case $(ls --version 2> /dev/null) in
   *GNU*) alias colorls='ls --color=auto' ;;
   *)     alias colorls='ls -G' ;;
esac
alias l='colorls -a'
alias ll='colorls -la'
export EDITOR='vi'
