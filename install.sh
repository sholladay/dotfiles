set -eu;

DIR="$(mktemp -d)";

echo "Downloading dotfiles to $DIR";
curl -fsSL https://github.com/sholladay/dotfiles/archive/master.tar.gz | tar -x -C "$DIR" --strip-components=1;

echo 'Installing Homebrew';
bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)";

echo "Installing dotfiles in $HOME";

OS="$(uname | tr '[:upper:]' '[:lower:]')";
if test "$OS" = 'darwin'; then
    mkdir -p "$HOME/Code/sh";
    chmod +x "$DIR/macos/greet";
    mv "$DIR/macos/greet" "$HOME/Code/sh/";
    cp -R "$DIR/macos/." "$HOME/";
elif test "$OS" = 'linux'; then
    cp -R "$DIR/linux/." "$HOME/";
fi;

rm -r "$DIR";

brew install deno fish git node;
if test "$OS" = 'darwin'; then
    brew install discord pandora sonos tower visual-studio-code;
fi;

if test ! -e "$HOME/.ssh/config"; then
    mkdir -p "$HOME/.ssh";
    cat > "$HOME/.ssh/config" << 'EOL'
Host *
  ServerAliveInterval 30
  ServerAliveCountMax 1000
EOL
fi;
