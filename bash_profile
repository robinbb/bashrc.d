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

BASHRC_D_DIR=~/.bashrc.d

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

add2path() {
   [[ ":$PATH:" =~ ":$1:" ]] || PATH=$1:${PATH#:}
}

BASHRC_D_README_ARG=pre-login.bash
. $BASHRC_D_DIR/custom/README
BASHRC_D_README_ARG=login.bash
. $BASHRC_D_DIR/custom/README
unset -v BASHRC_D_README_ARG

[ -f ~/.profile ] && . ~/.profile

BASHRC_D_README_ARG=post-login.bash
. $BASHRC_D_DIR/custom/README
unset -v BASHRC_D_README_ARG
