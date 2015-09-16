[ -z "$BASHRC_D_NO_NIX" ] \
   && [ -z "$NIX_PATH" ] \
   && [ "$HOME" ] \
   && [ -e "$HOME/.nix-profile/etc/profile.d/nix.sh" ] \
   && . $HOME/.nix-profile/etc/profile.d/nix.sh 
