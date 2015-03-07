#  Copyright 2015 Robin Bate Boerop <me@robinbb.com>
#
#  Licensed under the Apache License, Version 2.0 (the "License");
#  you may not use this file except in compliance with the License.
#  You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
#  Unless required by applicable law or agreed to in writing, software
#  distributed under the License is distributed on an "AS IS" BASIS,
#  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
#  See the License for the specific language governing permissions and
#  limitations under the License.
#
#  Contributors:
#     Robin Bate Boerop <me@robinbb.com>
#

export BASHRC_D_BASH_PROFILE_SOURCED=1
export BASHRC_D_DIR=~/.bashrc.d

bashrc_d_on_exit_commands=()
bashrc_d_invoke_on_exit_commands() {
   local i
   for i in "${bashrc_d_on_exit_commands[@]}" ; do
      eval $i
   done
}
bashrc_d_on_exit() {
   bashrc_d_on_exit_commands=("$*" "${bashrc_d_on_exit_commands[@]}")
   trap bashrc_d_invoke_on_exit_commands EXIT
}

# Bash utility functions upon which the custom scripts can rely, but which
# can be overridden if desired.
#
add2path() {
   [[ ":$PATH:" =~ ":$1:" ]] || PATH=$1:${PATH#:}
}

# Custom bash_profile startup scripts.
#
BASHRC_D_README_ARG=bash_profile
. $BASHRC_D_DIR/custom/README
unset -v BASHRC_D_README_ARG

[ -f ~/.profile ] && . ~/.profile
