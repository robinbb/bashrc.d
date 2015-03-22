which_ssh_agent=$(which ssh-agent)
if [ -n "$which_ssh_agent" ] ; then
   eval $($which_ssh_agent -s -t 3600) > /dev/null
fi
unset -v which_ssh_agent
