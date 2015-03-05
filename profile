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

export BASHRC_D_PROFILE_SOURCED=1
export BASHRC_D_DIR=~/.bashrc.d

# Custom startup scripts.
#
$BASHRC_D_DIR/custom/README.sh profile

# Support Nix, if present and not explicitly disabled.
#
if [ -n $BASHRC_D_NO_NIX ] && \
   [ -z "$NIX_PATH" ]      && \
   [ -e $HOME/.nix-profile/etc/profile.d/nix.sh ]
then
   . $HOME/.nix-profile/etc/profile.d/nix.sh 
fi

# Source ~/.bashrc upon login.
#
[ -f ~/.bashrc ] && . ~/.bashrc
