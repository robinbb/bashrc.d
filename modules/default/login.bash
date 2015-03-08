add2path() {
   [[ ":$PATH:" =~ ":$1:" ]] || PATH=$1:${PATH#:}
}
