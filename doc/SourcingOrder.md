# Startup File Sourcing Order

## Summary: bashrc.d interactive login sourcing order

/etc/profile
 pre-login.bash
     login.bash
 pre-login.sh
     login.sh
 pre-interactive.bash
     interactive.bash
 pre-interactive.sh
     interactive.sh
     /etc/bashrc
post-interactive.sh
post-interactive.bash
post-login.sh
post-login.bash

## The Problem: complexities of bash startup file sourcing order

When the Bourne shell ('sh') starts as a login shell, it sources files in the
following order:

1. /etc/profile
2. ~/.profile

The Bash shell ('bash') emulates the Bourne shell in that way only when it is
started with the name 'sh'. (This happens because the 'bash' binary has been
renamed to 'sh' or is symbolically linked with the name 'sh'.)

When the Bash shell starts as a login shell, it sources files in the
following order:

1. /etc/profile
2. a. ~/.bash_profile
   b. ~/.bash_login (if ~/.bash_profile does not exist)
   c. ~/.profile (if neither ~/.bash_profile nor ~/.bash_login exist)

Since users typically want the same configuration settings regardless of
whether their shell is launched with 'sh' or with 'bash', it is common to
place Bash-only configuration in ~/.bash_profile, and then the majority of the
configuration in ~/.profile, which is then sourced from ~/.bash_profile.
Since ~/.bash_login is not sourced when ~/.bash_profile exists, ~/.bash_login
is not often used.

So, a typical file sourcing order for a Bash interactive login is:

1. /etc/profile
2. ~/.bash_profile
3. ~/.profile (sourced by ~/.bash_profile)

The situation becomes more complicated because of Bash's behaviour with
non-login interactive shells.  When the Bash shell starts as a non-login
interactive shell, it sources the ~/.bashrc file. A non-login interactive
shell is the kind that results from simply issuing 'bash' on the command
line, or from starting a Bash shell via 'scp' or 'sftp'.

Since users are required to store settings for interactive shells in
~/.bashrc, it makes sense to source that file from the other startup files,
in order to reduce duplication. So, users typically store interactive startup
configuration in ~/.bashrc, and then source that file from the login startup
files. With this new complication, the resulting typical file sourcing order
for an interactive login with Bash is:

1. /etc/profile
2. ~/.bash_profile (for Bash-only configuration)
3. ~/.profile (sourced by ~/.bash_profile)
4. ~/.bashrc (sourced by ~/.profile)

This works well because if a Bourne login shell is started, the same files
are sourced, with the exception of the Bash-only configuration file,
~/.bash_profile. The sourcing order for 'sh' becomes the following:

1. /etc/profile
2. ~/.profile
3. ~/.bashrc (sourced by ~/.profile)

Sadly, this is not the end of the complications.

Unix systems often include a /etc/bashrc file which is meant to enable
features installed system-wide. Users want those features, so they must
include that file in their ~/.bashrc files. So, the typical startup file
sourcing order for interactive Bash login shells becomes:

1. /etc/profile
2. ~/.bash_profile
3. ~/.profile (sourced by ~/.bash_profile)
4. ~/.bashrc (sourced by ~/.profile)
5. /etc/bashrc (sourced by ~/.bashrc)

Even mildly ophisticated users encounter situations in which the \*bashrc
files do not work correctly when invoked by a Bourne-compatible shell. For
example, issuing "shopt -s checkwinsize" in the ~/.bashrc file is an error
outside of a Bash shell. Precisely this error is found in many commercial
Linux distributions. So, it is common for sophisticated Bash users to
segregate the Bash-only configurations in the startup files. A sophisticated
user's startup file sourcing order for an interactive Bash login shell is:

1. /etc/profile
2. ~/.bash_profile
3. ~/.profile (sourced by ~/.bash_profile)
4. ~/.shrc (sourced by ~/.profile)
5. ~/.bashrc (sourced by ~/.shrc if Bash)
6. /etc/bashrc (sourced by ~/.bashrc)

This situation is difficult to manage. This framework helps.

## The Solution: bashrc.d startup file sourcing order

The bashrc.d framework prescribes the segregation of Bash versus non-Bash
code. It prescribes the segregation of startup scripts for interactive versus
non-interactive logins. It provides hooks for injecting code before and after
various stages of the startup file sourcing process. It is fully
customizable.

### Modules

In bashrc.d, functionality is decomposed into *modules*. Each module consists
of a directory of specially-named files. The files are named after the
startup file sourcing order *phases* defined by bashrc.d. The phases are
listed below. The contents of the files are the shell script code for the
corresponding phase. The bashrc.d framework arranges to source the contents
at the appropriate phase.

### Bash interactive login with bashrc.d

Here is the startup script sourcing order for an interactive login with
'bash':

1. /etc/profile
2. pre-login.bash
3. login.bash
4. pre-login.sh
5. login.sh
6. pre-interactive.bash
7. interactive.bash
8. pre-interactive.sh
9. interactive.sh
10. /etc/bashrc
11. post-interactive.sh
12. post-interactive.bash
13. post-login.sh
14. post-login.bash

## Bourne shell interactive login with bashrc.d

Here is the startup script sourcing order for an interactive login with 'sh':

1. /etc/profile
2. pre-login.sh
3. login.sh
4. pre-interactive.sh
5. interactive.sh
6. post-interactive.sh
7. post-login.sh

Note the lack of /etc/bashrc sourcing.

## Bash non-interactive login with bashrc.d

Here is the startup script sourcing order for a non-interactive login with
'bash':

1. /etc/profile
2. pre-login.bash
3. login.bash
4. pre-login.sh
5. login.sh
6. post-login.sh
7. post-login.bash
