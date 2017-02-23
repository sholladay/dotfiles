Dotfiles enhance your computing experience, mostly by configuring the tools you already use.

These particular dotfiles were designed by [Seth Holladay](https://github.com/sholladay "dotfiles author, sholladay"). Installing them on your machine will give you a consistent, friendly environment to work with, particularly on the command line.

## Directories

 - `common` contains dotfiles that don't have any important cross-platform differences.
 - `ubuntu`, `centos`, and `osx` contain dotfiles that are tuned for use on those platforms, respectively.
 - `tools` contains helpers to ease the process of working with the dotfiles.

## Install

This process is currently pretty manual. You are expected to back up any existing files and then copy over the new ones. You may also want to tweak some to "merge" them with important behavior of any existing files, as needed. Finally, note that for now, a Unix-like environment is assumed. Because, well, conquering the world is hard.

The basic concept is to use a combination of the files in `common` along with one specific platform (e.g. `osx`).

1. Get the dotfiles.

    ```sh
    mkdir dotfiles && curl -fsSL https://api.github.com/repos/sholladay/dotfiles/tarball | tar -xz -C dotfiles --strip-components=1;
    ```

2. Copy all of the files from `common`.

    ```sh
    cp -R dotfiles/common/. "$HOME"/;
    ```

3. Copy all of the files from the relevant platform directory.

    ```sh
    cp -R dotfiles/osx/. "$HOME"/;
    ```

4. If you chose OS X specifically, set up the audible greeting. Make sure it says your name.

    ```sh
    # Link to it from somewhere in your PATH.
    ln -s "$PWD"/dotfiles/osx/greet '/usr/local/bin/greet';
    ```

5. Install `brew` via [Homebrew](http://brew.sh/ "Homebrew, the package manager") or [Linuxbrew](http://linuxbrew.sh/ "Linuxbrew, a Linux-oriented fork of the Homebrew package manager"), for easy package management.

    For **OS X**:
    ```sh
    ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)";
    ```

    For **Linux**, use [tools/install-linuxbrew](./tools/install-linuxbrew "Helper tor carefully setting up a standalone Linuxbrew"):
    ```sh
    . dotfiles/tools/install-linuxbrew;
    ```

6. Set up SSH.

    Modify `.shrc` and `.profile` (e.g. `nano "$HOME/.profile";`) to point the `keychain` commands at your actual SSH private key, instead of the `some-key` placeholder value. If you are not going to use these, they can be safely removed.

    Finally, install the Funtoo [Keychain](http://www.funtoo.org/Keychain "Helper for key-based login") helper.
    ```sh
    brew install keychain
    ```

If you need to add environment variables, such as service credentials, you should put them in `.shrc`.

You may also want to do (replace `foo`):

 - `sudo scutil --set HostName 'foo.local'`
 - `sudo scutil --set LocalHostName 'foo'`
 - `sudo scutil --set ComputerName 'foo'`
 - Change the [account name and home foler](https://support.apple.com/en-us/HT201548).
 - Open Terminal and import the profile in `osx/Terminal-profile.terminal`.
 - Put SSH keys in `~/.ssh`.
 - Put this in `~/.ssh/config` to keep connections alive.
    ```
    Host *
      ServerAliveInterval 30
      ServerAliveCountMax 1000
    ```
 - If using [Sublime Text](https://www.sublimetext.com), install Package Control(https://packagecontrol.io).

## TODO

1. Bootstap / init script, for easy set up.
2. Explore using Yeoman for a more powerful, DRY, templating-based approach.
3. Automatically `brew install git node`, etc.
4. Automatically set up `brew cask` for easy GUI app installs.
