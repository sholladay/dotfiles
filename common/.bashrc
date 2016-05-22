# ~/.bashrc

# This file is sourced by bash when launching an interactive, non-login shell.
# It may be read manually by setup files for other shell types, namely
# login shells regardless of whether they are interactive or not, and
# thus it can often be treated as the "common" environment setup.

# Run global bash set up. CentOS likes this, but it may not be necessary.
#if [ -f /etc/bashrc ]; then
#   . /etc/bashrc;
#fi;

# Run shell-agnostic set up.
. "$HOME/.shrc";
