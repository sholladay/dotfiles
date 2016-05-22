# ~/.profile

# This file is sourced by the command interpreter for login shells.
# If it's bash, by default this file is not read when ~/.bash_profile
# or ~/.bash_login exists. But it might be sourced in one of those.

# Blog post on startup file order:
# https://shreevatsa.wordpress.com/2008/03/30/zshbash-startup-files-loading-order-bashrc-zshrc-etc/

# Run general shell set up commands.
. "$HOME/.shrc";

# Greet the user if someone is around to notice.
if [ -n "$PS1" ]; then
    # Speak a greeting, based on time of day, in the background.
    (greet &);
    # Display welcome message.
    echo $'\nWelcome to the Matrix.\n';
fi;
