# dotfiles

> Set up your computer to be awesome

Dotfiles enhance your computing experience, mostly by configuring the tools you already use.

These particular dotfiles were designed by [Seth Holladay](https://github.com/sholladay "dotfiles author, sholladay"). Installing them on your machine will give you a consistent, friendly environment to work with, particularly on the command line.

## Directories

 - `common` contains files that don't have any important cross-platform differences.
 - `ubuntu`, `centos`, and `macos` contain files that are tuned for use on those platforms, respectively.

## Install

This process is currently pretty manual. You are expected to back up any existing files and then copy over the new ones. You may also want to tweak some to "merge" them with important behavior of any existing files, as needed. Finally, note that for now, a Unix-like environment is assumed. Because, well, conquering the world is hard.

The basic concept is to use the files in `common` along with those for your platform (e.g. `macos`).

1. Get the dotfiles.

    ```sh
    mkdir dotfiles && curl -fsSL https://api.github.com/repos/sholladay/dotfiles/tarball | tar -xz -C dotfiles --strip-components=1;
    ```

2. Copy the files from `common`.

    ```sh
    cp -R dotfiles/common/. "$HOME"/;
    ```

3. Copy the files from the relevant platform directory.

    ```sh
    cp -R dotfiles/macos/. "$HOME"/;
    ```

4. If you chose the macOS platform, set up the audible greeting. Make sure it says your name.

    ```sh
    # Link to it from somewhere in your PATH.
    ln -s "$PWD"/dotfiles/macos/greet '/usr/local/bin/greet';
    ```

5. Install `brew` via [Homebrew](http://brew.sh/ "Homebrew, the package manager") or [Linuxbrew](http://linuxbrew.sh/ "Linuxbrew, a Linux-oriented fork of the Homebrew package manager"), for easy package management.

    For **OS X**:
    ```sh
    ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)";
    ```

    For **Linux**:
    ```sh
    PATH="/home/linuxbrew/.linuxbrew/sbin:/home/linuxbrew/.linuxbrew/bin:$HOME/.linuxbrew/sbin:$HOME/.linuxbrew/bin:$PATH";
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/Linuxbrew/install/master/install.sh)";
    ```

6. Set up SSH.

    Modify `.shrc` and `.profile` (e.g. `nano "$HOME/.profile";`) to point the `keychain` commands at your actual SSH private key, instead of the `some-key` placeholder value. If you are not going to use these, they can be safely removed.

    Finally, install the Funtoo [Keychain](http://www.funtoo.org/Keychain "Helper for key-based login") helper.
    ```sh
    brew install keychain
    ```

If you need to add environment variables, such as service credentials, you should put them in `.shrc`.

You may also want to (replace `foo`):

 - `sudo scutil --set HostName 'foo.local'`
 - `sudo scutil --set LocalHostName 'foo'`
 - `sudo scutil --set ComputerName 'foo'`
 - Change the [account name and home foler](https://support.apple.com/en-us/HT201548).
 - Open Terminal and import the profile in `macos/Terminal-profile.terminal`.
 - `brew install git node`
 - If using macOS, run `brew tap caskroom/cask` to set up [`brew cask`](https://caskroom.github.io/) for easy GUI app installs.
 - If using [Sublime Text](https://www.sublimetext.com), install [Package Control](https://packagecontrol.io).
 - Put SSH keys in `~/.ssh`.
 - Put this in `~/.ssh/config` to keep connections alive.
    ```
    Host *
      ServerAliveInterval 30
      ServerAliveCountMax 1000
    ```

## TODO

1. Create an install script to automate set up.
2. Explore using Yeoman for a more powerful, DRY, templating-based approach.

## Contributing

See our [contributing guidelines](https://github.com/sholladay/dotfiles/blob/master/CONTRIBUTING.md "Guidelines for participating in this project") for more details.

1. [Fork it](https://github.com/sholladay/dotfiles/fork).
2. Make a feature branch: `git checkout -b my-new-feature`
3. Commit your changes: `git commit -am 'Add some feature'`
4. Push to the branch: `git push origin my-new-feature`
5. [Submit a pull request](https://github.com/sholladay/dotfiles/compare "Submit code to this project for review").

## License

[MPL-2.0](https://github.com/sholladay/dotfiles/blob/master/LICENSE "License for dotfiles") © [Seth Holladay](http://seth-holladay.com "Author of dotfiles")

Go make something, dang it.
