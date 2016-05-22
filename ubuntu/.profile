# ~/.profile

# This file is sourced by the command interpreter for login shells.
# If it's bash, by default this file is not read when ~/.bash_profile
# or ~/.bash_login exists. But it might be sourced in one of those.

# Blog post on startup file order:
# https://shreevatsa.wordpress.com/2008/03/30/zshbash-startup-files-loading-order-bashrc-zshrc-etc/

LOGIN_SHELL='true';

# Run general shell set up commands.
. "$HOME/.shrc";

# Use the funtoo SSH key manager for password convenience, and finally
# greet the user if someone is around to notice.
if [ -n "$PS1" ]; then
    # Print helpful info about the keychain state to the terminal.
    eval "$(keychain --eval --agents ssh some-key)";
    echo $'Welcome to the Matrix.\n';
else
    # Be quiet and fail if a password is needed, to be friendly to scripts.
    eval "$(keychain --eval --quiet --noask --agents ssh some-key)";
fi;
