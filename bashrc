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
# Contributors:
#    Robin Bate Boerop <me@robinbb.com>
#

export BASHRC_D_BASHRC_SOURCED=1
export BASHRC_D_DIR=~/.bashrc.d

# DO NOT generate output from this script! Otherwise, 'scp' and 'sftp' will
# not work properly.

# Facilities that can be overridden by the user:
#
exit_trap() {
   :
}
trap exit_trap EXIT
umask 077
if [ -n "$PS1" ] ; then
   # This shell is interactive.
   #
   alias colorls='ls --color=auto'
   alias l='colorls -a'
   alias ll='colorls -la'
   export EDITOR='vi'

   # Bash-only interactive features.
   #
   if [ -n "$BASH" ] ; then
      export PS1="\u@\h:\W[\!] "
      export HISTSIZE=9999
   fi
fi

BASHRC_D_README_ARG=bashrc
. $BASHRC_D_DIR/custom/README
unset -v BASHRC_D_README_ARG
