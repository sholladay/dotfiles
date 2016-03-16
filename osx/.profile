# ~/.profile

# This file is sourced by the command interpreter for login shells.
# If it's bash, by default this file is not read when ~/.bash_profile
# or ~/.bash_login exists. But it might be sourced in one of those.

# Blog post on startup file order:
# https://shreevatsa.wordpress.com/2008/03/30/zshbash-startup-files-loading-order-bashrc-zshrc-etc/

# Colon-separated list of where the shell should look for programs, from left to right.
# Prefer user-provided programs over system ones, but also prefer privileged ones.
PATH='/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin';
export PATH;

# Set the default text editor for shell sessions.
EDITOR='nano';
export EDITOR;

# Enable colors for the "ls" command.
CLICOLOR='1';
export CLICOLOR;
# Set the color theme for the "ls" command.
LSCOLORS='BxFxBxDxCxgxgxCeCeBhBh';
export LSCOLORS;

# Set the color theme for the "grep" command.
# For parameter meanings, see: http://www.gnu.org/software/grep/manual/html_node/Environment-Variables.html
# For parameter values, see: http://www.askapache.com/linux/zen-terminal-escape-codes.html#SGR_parameter_values
GREP_COLORS='ms=01;05;42:mc=01;05;42:sl=:cx=02:fn=01:ln=37:bn=42:se=36';
export GREP_COLORS;

# Run general shell set up commands.
. "$HOME/.shrc";

# Greet the user if someone is around to notice.
if [ -n "$PS1" ]; then
    # Speak a greeting, based on time of day, in the background.
    (greet &);
    # Display welcome message.
    echo $'\nWelcome to the Matrix.\n';
fi;
