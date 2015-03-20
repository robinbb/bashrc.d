add2path() {
   [[ ":$PATH:" =~ ":$1:" ]] || PATH=$1:${PATH#:}
}
removeFromPath() {
   local p t
   t=$IFS
   IFS=':'
   p=($PATH)
   unset IFS
   p=(${p[@]%%$1})
   IFS=':'
   PATH="${p[*]}"
   IFS=$t
}
prepend2path() {
   removeFromPath $1
   PATH=$1${PATH:+:}$PATH
}
