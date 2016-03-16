# ~/.bash_logout

# This file is sourced by bash when the user explicitly logs out.

# Flush the in-memory history, then persist the emptiness to disk.
history -c && history -w;
