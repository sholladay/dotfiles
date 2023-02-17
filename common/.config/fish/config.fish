if status is-interactive
    "$HOME/Code/sh/greet" &;
    echo -e '\nWelcome to the Matrix.\n';
    # Make "ls" show hidden files.
    alias ls='ls -AG';
    # Make "dir" show permissions and friendly file sizes.
    alias dir='ls -hl';
end
