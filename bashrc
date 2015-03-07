[ "$PS1" ] || return

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

BASHRC_D_DIR=~/.bashrc.d

# Source custom bashrc scripts.
#
if [ "$BASH" ] ; then
   BASHRC_D_README_ARG=pre-interactive.bash
   . $BASHRC_D_DIR/custom/README
   BASHRC_D_README_ARG=interactive.bash
   . $BASHRC_D_DIR/custom/README
fi
BASHRC_D_README_ARG=pre-interactive.sh
. $BASHRC_D_DIR/custom/README
BASHRC_D_README_ARG=interactive.sh
. $BASHRC_D_DIR/custom/README
unset -v BASHRC_D_README_ARG

if [ "$BASH" ] ; then
   if [ -z "$BASHRC_D_NO_ETC_BASHRC" ] && \
      [ -r /etc/bashrc ] ; then
      . /etc/bashrc
   fi
   BASHRC_D_README_ARG=post-interactive.bash
   . $BASHRC_D_DIR/custom/README
fi
BASHRC_D_README_ARG=post-interactive.sh
. $BASHRC_D_DIR/custom/README
unset -v BASHRC_D_README_ARG

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
