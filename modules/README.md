# bashrc.d Modules Directory

Directories inside this directory are bashrc.d modules. A bashrc.d module
provides a single unit of functionality via scripts. The scripts must be
named according to the startup phase at which they are to be invoked
(pre-login, login, post-login, pre-interactive, interactive,
post-interactive) and the kind of shell invoking them (sh, bash). See [the
sourcing order document](../doc/SourcingOrder.md) to learn more.
