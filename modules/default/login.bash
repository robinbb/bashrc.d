add2path() {
   [[ ":$PATH:" =~ ":$1:" ]] || PATH=$1:${PATH#:}
}
prepend2path() {
   PATH="$1${PATH:+:}$PATH"
   local end=${PATH##*:$1}
   local start=${PATH%:$1*}
   [[ $start != $end ]] && end="$start$end"
   PATH="$end"
}
