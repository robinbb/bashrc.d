if [[ -z $BASHRC_D_NO_NIX \
   && "$NIX_PATH" \
   && -d $HOME/.nix-profile/etc/bash_completion.d \
   ]]
then
   for i in $HOME/.nix-profile/etc/bash_completion.d/* ; do
      [[ -e $i ]] && . $i
   done
fi
