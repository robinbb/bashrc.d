#!/bin/bash

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

set -e
dir=$(pwd)
backup_dir=$dir/backup-bashrc-files
dot_files=(bash_logout bash_profile bash_login bashrc profile)
indent() { echo "   $*" ; }

mkdir -p ${backup_dir}
for f in ${dot_files[*]} ; do
   target=$dir/$f
   if [[ -e $target ]] ; then
      echo "Handling $target : "
      d=~/.$f
      if [[ ! -h $d || $(readlink $d) != $target ]]
      then
         indent "$d is not already linked."
         b=${backup_dir}/$f
         if [ -e $b ] ; then
            indent "$b exists. Can't perform backup. Exiting."
            exit 1
         else
            if [ -e $d ] ; then
               indent "Backing up $d to $b"
               mv $d $b
            fi
            indent "Linking $target to $d ... "
            ln -s $target $d
            indent "Linked."
         fi
      else
         echo "   Already linked. Nothing to do."
      fi
   fi
done
