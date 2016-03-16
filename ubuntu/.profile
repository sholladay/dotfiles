# ~/.profile

# This file is sourced by the command interpreter for login shells.
# If it's bash, by default this file is not read when ~/.bash_profile
# or ~/.bash_login exists. But it might be sourced in one of those.

# Blog post on startup file order:
# https://shreevatsa.wordpress.com/2008/03/30/zshbash-startup-files-loading-order-bashrc-zshrc-etc/

# Colon-separated list of where the shell should look for programs, from left to right.
# Prefer user-provided programs over system ones, but also prefer privileged ones.
PATH="$HOME/.linuxbrew/sbin:$HOME/.linuxbrew/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin";
export PATH;
# Make sure "man" and "info" find the most up-to-date and relevant docs.
MANPATH="$HOME/.linuxbrew/share/man";
export MANPATH;
INFOPATH="$HOME/.linuxbrew/share/info";
export INFOPATH;

# Set the default text editor for shell sessions.
EDITOR='nano';
export EDITOR;

# Set the color theme for the "ls" command when using --color
LS_COLORS='di=01;31:ln=01;35:so=01;31:pi=01;33:ex=01;32:bd=36;40:cd=36;40:su=01;32;44:sg=01;32;44:tw=01;31;47:ow=01;31;47:';
export LS_COLORS;

# Set the color theme for the "grep" command.
# For parameter meanings, see: http://www.gnu.org/software/grep/manual/html_node/Environment-Variables.html
# For parameter values, see: http://www.askapache.com/linux/zen-terminal-escape-codes.html#SGR_parameter_values
GREP_COLORS='ms=01;05;42:mc=01;05;42:sl=:cx=02:fn=01:ln=37:bn=42:se=36';
export GREP_COLORS;

# Run general shell set up commands.
. "$HOME/.shrc";

# Use the funtoo SSH key manager, for password convenience, and finally
# greet the user if someone is around to notice.
# Is this an interactive shell?
if [ -n "$PS1" ]; then
    # Print helpful info about the keychain state to the terminal.
    eval "$(keychain --eval --agents ssh some-key)";
    # Display welcome message.
    echo $'Welcome to the Matrix.\n';
else
    # Be quiet to be friendly to scripts.
    eval "$(keychain --quiet --eval --agents ssh some-key)";
fi;
