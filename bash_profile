#  Copyright 2015 Robin Bate Boerop and the Contributors
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

# Exit trap handling, bashrc.d-style.
#
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

BASHRC_D_DISPATCHER=~/.bashrc.d/custom/README
BASHRC_D_PHASE=pre-login.bash . $BASHRC_D_DISPATCHER
BASHRC_D_PHASE=login.bash . $BASHRC_D_DISPATCHER
unset -v BASHRC_D_DISPATCHER

[ -r ~/.profile ] && . ~/.profile

BASHRC_D_DISPATCHER=~/.bashrc.d/custom/README
BASHRC_D_PHASE=post-login.bash . $BASHRC_D_DISPATCHER
unset -v BASHRC_D_DISPATCHER
