[ -z "$BASHRC_D_NO_NIX" ] \
   && [ "$NIX_PATH" ] \
   && [ -d "$HOME"/.nix-profile/share/man ] \
   && export MANPATH=~/.nix-profile/share/man${MANPATH:+:}"$MANPATH"
