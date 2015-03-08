[ "$PS1" ] || return

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
# Contributors:
#    Robin Bate Boerop <me@robinbb.com>
#

if [ "$BASH" ] ; then
   BASHRC_D_PHASE=pre-interactive.bash . ~/.bashrc.d/dispatch
   BASHRC_D_PHASE=interactive.bash . ~/.bashrc.d/dispatch
fi
BASHRC_D_PHASE=pre-interactive.sh . ~/.bashrc.d/dispatch
BASHRC_D_PHASE=interactive.sh . ~/.bashrc.d/dispatch

if [ "$BASH" ] \
   && [ -z "$BASHRC_D_NO_ETC_BASHRC" ] \
   && [ -r /etc/bashrc ]
then
   . /etc/bashrc
fi
BASHRC_D_PHASE=post-interactive.sh . ~/.bashrc.d/dispatch
[ "$BASH" ] && BASHRC_D_PHASE=post-interactive.bash . ~/.bashrc.d/dispatch
