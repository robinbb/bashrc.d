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
if [ "$PS1" ] ; then
   # This shell is interactive.
   alias colorls='ls --color=auto'
   alias l='colorls -a'
   alias ll='colorls -la'
   export EDITOR='vi'
   if [ "$BASH" ] ; then
      # Bash-only interactive features.
      shopt -s histappend
      export PS1="\u@\h:\W[\!] "
      export HISTSIZE=9999
   fi
fi

# Source custom bashrc scripts.
#
BASHRC_D_README_ARG=bashrc
. $BASHRC_D_DIR/custom/README
unset -v BASHRC_D_README_ARG

# Source the system-wide /etc/bashrc unless otherwise directed.
#
if [ -z "$BASHRC_D_NO_ETC_BASHRC" ] && [ -r /etc/bashrc ] ; then
   . /etc/bashrc
fi

# Support 'keychain'.
#
if [ "$PS1" ] ; then
   if [ -z $BASHRC_D_NO_KEYCHAIN ] ; then
      BASHRC_D_KEYCHAIN=$(which keychain 2> /dev/null)
      [ $? ] || eval $($BASHRC_D_KEYCHAIN --eval)
      unset -v BASHRC_D_KEYCHAIN
   fi
   if [ "$BASH" ] ; then
      if [ -n $BASHRC_D_NO_NIX ] && \
         [ "$NIX_PATH" ]         && \
         [ -d $HOME/.nix-profile/etc/bash_completion.d ]
      then
         for i in $HOME/.nix-profile/etc/bash_completion.d/* ; do
            . $i
         done
      fi
   fi
fi
