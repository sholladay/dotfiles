set -eu;

DIR="$(mktemp -d)";

echo "Downloading dotfiles to $DIR";
curl -fsSL https://api.github.com/repos/sholladay/dotfiles/tarball | tar -xz -C "$DIR" --strip-components=1;

OS="$(uname | tr '[:upper:]' '[:lower:]')";
if test "$OS" = 'darwin'; then
    echo 'Installing Homebrew';
    ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)";
    echo "Installing dotfiles in $HOME";
    chmod +x "$DIR/macos/greet";
    mv "$DIR/macos/greet" '/usr/local/bin/greet';
    cp -R "$DIR/common/." "$HOME/";
    cp -R "$DIR/macos/." "$HOME/";
elif test "$OS" = 'linux'; then
    echo 'Installing Linuxbrew';
    PATH="/home/linuxbrew/.linuxbrew/sbin:/home/linuxbrew/.linuxbrew/bin:$HOME/.linuxbrew/sbin:$HOME/.linuxbrew/bin:$PATH";
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/Linuxbrew/install/master/install.sh)";
    echo "Installing dotfiles in $HOME";
    cp -R "$DIR/common/." "$HOME/";
    cp -R "$DIR/centos/." "$HOME/";
else
    echo 'Your operating system is not supported yet';
    rm -r "$DIR";
    exit 1;
fi;

brew install git fish node keychain;

if test ! -e "$HOME/.ssh/config"; then
    mkdir -p "$HOME/.ssh";
    cat > "$HOME/.ssh/config" << 'EOL'
Host *
  ServerAliveInterval 30
  ServerAliveCountMax 1000
EOL
fi;
