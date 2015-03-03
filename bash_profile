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

if [ -f ~/.bashrc ]; then
   . ~/.bashrc
fi

# Support Nix, if present.
#
if [ -e /home/robin/.nix-profile/etc/profile.d/nix.sh ]
then
   . /home/robin/.nix-profile/etc/profile.d/nix.sh
fi

# User-specific environment and startup programs.
#
. bash_profile.custom
