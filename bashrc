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

# DO NOT generate output from this script! Otherwise, 'scp' and 'sftp' will
# not work when connecting to this account.

exit_trap() {
   :
}
trap exit_trap EXIT

umask 077

if [ -n "$PS1" ] ; then
   export PS1="\u@\h:\W[\!] "
   export HISTSIZE=9999
   export EDITOR='vi'

   alias colorls='ls --color=auto'
   alias l='colorls -a'
   alias ll='colorls -la'
fi

[[ -d ~/bashrc.d ]] && . ~/.bashrc.d/bashrc.custom
