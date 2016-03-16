Dotfiles enhance your computing experience, mostly by configuring the tools you already use.

These particular dotfiles were designed by [Seth Holladay](https://github.com/sholladay "dotfiles author, sholladay"). Installing them on your machine will give you a consistent, friendly environment to work with, particularly on the command line.

## Prerequisites

The dotfiles are designed to help you effortlessly install software and log into servers using secure key-based (passwordless) authentication. If you never need these things, you can remove the references to `brew` and `keychain` from the `.profile` that is provided and then you may skip this section. Otherwise, you will want to set up these programs first so that the dotfiles never fail.

1. [Homebrew](http://brew.sh/ "Homebrew, the package manager") or [Linuxbrew](http://linuxbrew.sh/ "Linuxbrew, a Linux-oriented fork of the Homebrew package manager"), for easy package management.

    For **OS X**:
    ````sh
    ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)";
    ````

    For **Linux**, use [tools/install-linuxbrew](./tools/install-linuxbrew "Helper tor carefully setting up a standalone Linuxbrew"):
    ````sh
    . /path/to/install-linuxbrew;
    ````

2. The Funtoo [Keychain](http://www.funtoo.org/Keychain "Helper for passwordless login") helper.
    ````sh
    brew install keychain
    ````

## Directories

 - `common` contains dotfiles that don't have any important cross-platform differences.
 - `ubuntu`, `centos`, and `osx` contain dotfiles that are tuned for use on those platforms, respectively.
 - `tools` contains helpers to ease the process of working with the dotfiles.

## Installation

Currently, there is no automation in place to install the dotfiles. You are expected to back up any existing files and then copy over the new ones. You may also need to tweak some to "merge" them with important behavior of any existing files, as needed. Finally, note that for now, a Unix-like environment is assumed. Because, well, conquering the world is hard.

You are expected to use a combination of the files in `common` along with one specific platform (e.g. `osx`).

1. Copy all of the files from `common`.
    ````sh
    cp -R "/path/to/common"/. "$HOME"/;
    ````

2. Copy all of the files from a sensible OS directory.
    ````sh
    cp -R "/path/to/osx"/. "$HOME"/;
    ````

3. If you chose OS X specifically, set up the audible greeting. Make sure it says your name.
    ````sh
    # Link to it from somewhere in your PATH.
    ln -s "/path/to/greet" "/usr/local/bin/greet";
    ````

4. If you plan to use SSH, modify `.profile` (e.g. `nano "$HOME/.profile";`) and point the two `keychain` commands to your actual SSH private key, instead of the `sme-key` placeholder value. If you aren't going to use these, they can be safely removed.

If you need to add environment variables, such as authentication details, you should put them in `.profile`.

## TODO

1. Bootstap / init script, for easy set up.
2. Explore using Yeoman for a more powerful, DRY, templating-based approach.
