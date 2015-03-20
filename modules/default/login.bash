add2path() {
   [[ ":$PATH:" =~ ":$1:" ]] || PATH=$1${PATH:+:}$PATH
}
removeFromPath() {
   local p d
   p=":$1:"
   d=":$PATH:"
   d=${d//$p/:}
   d=${d/#:/}
   PATH=${d/%:/}
}
prepend2path() {
   removeFromPath $1
   PATH=$1${PATH:+:}$PATH
}
