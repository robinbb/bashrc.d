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

BASHRC_D_README_ARG=pre-login.sh
. $BASHRC_D_DIR/custom/README
BASHRC_D_README_ARG=login.sh
. $BASHRC_D_DIR/custom/README
unset -v BASHRC_D_README_ARG

[ "$PS1" ] && [ -r ~/.bashrc ] && . ~/.bashrc

BASHRC_D_README_ARG=post-login.sh
. $BASHRC_D_DIR/custom/README
unset -v BASHRC_D_README_ARG
