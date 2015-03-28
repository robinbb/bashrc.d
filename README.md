# bashrc.d

'bashrc.d' is an APLv2-licensed startup script framework for the Bash shell.
[Motivations](https://www.linkedin.com/pulse/bash-startup-scripts-redux-robin-bate-boerop).

## Quick-Start

1. Fork this repository (to 'your-repo').
2. Clone your forked repository into the `~/.bashrc.d` directory:
    ```
    git clone git@github.com:your-repo/bashrc.d.git ~/.bashrc.d
    ```
3. Invoke `~/.bashrc.d/install` to make the appropriate symbolic links.
4. Customize by adding scripts to `~/.bashrc.d/custom` and linking modules to
   the `~/.bashrc.d/custom/modules` directory.

## Features

- Easy-to-customize framework for
  [Bash](http://en.wikipedia.org/wiki/Bash_(Unix_shell))
  shell startup scripts
- Compatible with both the
  [Bourne shell](http://en.wikipedia.org/wiki/Bourne_shell)
  ('sh') and the
  [Debian Almquist shell](http://en.wikipedia.org/w/index.php?title=Debian_Almquist_shell)
  ('dash')
- Sane configuration using modules
- Compatible with 'sftp' and 'scp'
- Out-of-the-box modules for [Nix](http://en.wikipedia.org/wiki/Nix_package_manager)

## Contributions

Contributions are welcome. Please submit a pull request via
[Github](https://github.com/robinbb/bashrc.d).
