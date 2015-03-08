if [ -z $BASHRC_D_NO_KEYCHAIN ] ; then
   BASHRC_D_KEYCHAIN=$(which keychain 2> /dev/null)
   [ $? ] || eval $($BASHRC_D_KEYCHAIN --eval)
   unset -v BASHRC_D_KEYCHAIN
fi
