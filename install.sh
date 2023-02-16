set -eu;

DIR="$(mktemp -d)";

echo "Downloading dotfiles to $DIR";
curl -fsSL https://github.com/sholladay/dotfiles/archive/master.tar.gz | tar -x -C "$DIR" --strip-components=1;

echo 'Installing Homebrew';
bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)";

echo "Installing dotfiles in $HOME";
cp -R "$DIR/common/." "$HOME/";

OS="$(uname | tr '[:upper:]' '[:lower:]')";
if test "$OS" = 'darwin'; then
    chmod +x "$DIR/macos/greet";
    mv "$DIR/macos/greet" '/usr/local/bin/';
    cp -R "$DIR/macos/." "$HOME/";
elif test "$OS" = 'linux'; then
    cp -R "$DIR/centos/." "$HOME/";
else
    echo 'Your operating system is not supported yet';
    rm -r "$DIR";
    exit 1;
fi;

brew install deno fish git node;
brew install discord sonos tower visual-studio-code;

if test ! -e "$HOME/.ssh/config"; then
    mkdir -p "$HOME/.ssh";
    cat > "$HOME/.ssh/config" << 'EOL'
Host *
  ServerAliveInterval 30
  ServerAliveCountMax 1000
EOL
fi;
