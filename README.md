# dotfiles

> Set up your computer to be awesome

Dotfiles enhance your computing experience, mostly by configuring the tools you already use.

These particular dotfiles were designed by [Seth Holladay](https://github.com/sholladay "dotfiles author, sholladay"). Installing them on your machine will give you a consistent, friendly environment to work with, particularly on the command line.

A Unix-like environment is assumed, because conquering the world is hard.

## Contents

 - [Why?](#why)
 - [Install](#install)
 - [Additional setup](#additional-setup)
 - [Easy macOS app installs](#easy-macos-app-installs)
 - [Manual install](#manual-install)
 - [Contributing](#contributing)
 - [License](#license)

## Why?

 - Installs the `brew` package manager ([Homebrew](http://brew.sh "Homebrew, the package manager") or [Linuxbrew](http://linuxbrew.sh "Linuxbrew, a Linux-oriented fork of the Homebrew package manager"), based on the platform)
 - Uses `brew` to install other common tools such as [Git](https://git-scm.com) and [Node.js](https://nodejs.org)
 - Easy and secure SSH key management with the [Funtoo Keychain](https://www.funtoo.org/Keychain "Helper for key-based login")
 - Keeps SSH connections alive

## Install

1. Back up any existing files you care about, especially any dotfiles in your home directory. If you need to preserve functionality from existing dotfiles, that is left up to you.

2. If you are planning to [change your account name](https://support.apple.com/en-us/HT201548), do so now, before any other software is installed. Not all software is capable of gracefully handling changes to your home directory path.

3. Run the installer. *See [install.sh](https://github.com/sholladay/dotfiles/blob/master/install.sh) to learn what it does.*

    ```sh
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/sholladay/dotfiles/master/install.sh)";
    ```

4. If you are on macOS, the shell will speak a greeting to you. Modify `/usr/local/bin/greet` and make sure it says your name.

5. Set up SSH keys.

    Modify `.shrc` and `.profile` (e.g. `nano "$HOME/.profile";`), replace `my-key` with the name of your SSH private key so that `keychain` can load it. If you are not going to use `keychain`, these commands can be safely removed.

## Additional setup

These extra steps are recommended for an optimal experience.

Replace `My-Laptop` with your own value in the commands below.

 - `sudo scutil --set ComputerName 'My Laptop'`
 - `sudo scutil --set LocalHostName 'My-Laptop'`
 - Add environment variables, such as service credentials, to `~/.config/fish/config.fish`
 - Set up [fish](https://fishshell.com/) as the [default shell](https://stackoverflow.com/a/20506404) and use the [Pure](https://github.com/rafaelrinaldi/pure) theme.
 - Put SSH keys in `~/.ssh`. Make new keys with `ssh-keygen -t ed25519` to use [ED25519](https://en.wikipedia.org/wiki/EdDSA) encryption.

## Easy macOS app installs

If you are on macOS, you can install apps from the command line with Homebrew [brew cask](https://caskroom.github.io), which can install GUI apps, such as [Firefox](https://en.wikipedia.org/wiki/Firefox). Try it out!

```sh
brew cask install discord sonos tower visual-studio-code
```

That is all you have to do. No more searching the web, finding a download link, clicking the download link, going to your downloads folder, extracting the app from an archive, and moving the app to where it belongs; that is _so old school_.

If you do need to search for a package, `brew search` and `brew info` are your friends, but usually you can just guess the package name.

## Manual install

You can easily download the files and manually install them yourself.

```sh
mkdir dotfiles && curl -fsSL https://github.com/sholladay/dotfiles/archive/master.tar.gz | tar -x -C dotfiles --strip-components=1;
```

Note the directories within the project:

 - `common` contains files that don't have any important cross-platform differences.
 - `ubuntu`, `centos`, and `macos` contain files that are tuned for use on those platforms, respectively.

The installer copies files from `common` along with those for your platform (e.g. `macos`).

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
