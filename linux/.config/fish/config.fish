if status is-interactive
    echo -e '\nWelcome to the Matrix.\n';
    set -gx EDITOR 'nano';
    # Make "ls" show hidden files.
    alias ls='ls -AG';
    # Make "dir" show permissions and friendly file sizes.
    alias dir='ls -hl';
end
