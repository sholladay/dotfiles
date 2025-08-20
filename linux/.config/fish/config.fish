if status is-interactive
    echo -e '\nWelcome to the Matrix.\n';
    # Update PATH and other env vars to include brew and its installed packages
    eval (/home/linuxbrew/.linuxbrew/bin/brew shellenv);
    set -gx EDITOR 'nano';
    # Make "ls" show hidden files.
    alias ls='ls -AG';
    # Make "dir" show permissions and friendly file sizes.
    alias dir='ls -hl';
end
