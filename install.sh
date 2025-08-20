#!/usr/bin/env bash

set -eu;

DIR="$(mktemp -d)";
OS="$(uname | tr '[:upper:]' '[:lower:]')";

echo "Downloading dotfiles to temporary directory: $DIR";
curl -fsSL https://github.com/sholladay/dotfiles/archive/master.tar.gz | tar -xz -C "$DIR" --strip-components=1;

echo "Copying dotfiles to home: $HOME";
cp -R "$DIR/$OS/." "$HOME/";

echo "Deleting temporary directory: $DIR";
rm -r "$DIR";

echo 'Installing Homebrew';
bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)";

if test "$OS" = 'darwin'; then
    PATH="/opt/homebrew/bin:$PATH";
else
    PATH="/home/linuxbrew/.linuxbrew/bin:$PATH";
    sudo apt-get install build-essential
fi;

# Export HOMEBREW_PREFIX and other env vars for current shell session
eval "$(brew shellenv)";

paths=(
    "$(brew --prefix)/bin"
    /usr/local/bin
    /usr/bin
    /bin
    "$(brew --prefix)/sbin"
    /usr/local/sbin
    /usr/sbin
    /sbin
);

echo 'Writing recommended paths to /etc/paths';
printf '%s\n' "${paths[@]}" | uniq | sudo tee /etc/paths > /dev/null;

echo 'Installing fish shell';
brew install fish;

echo 'Adding fish to the allow list in /etc/shells';
printf '%s\n' "$(cat /etc/shells)" "$(which fish)" | uniq | sudo tee /etc/shells > /dev/null;

echo "Making fish the default shell for user: $USER";
chsh -s "$(which fish)";

echo 'Installing tools and apps';
SHELL="$(which fish)";
FISH_VERSION="$(fish -c 'echo $FISH_VERSION')";
brew install deno git node;
if test "$OS" = 'darwin'; then
    brew install discord pandora sonos tower visual-studio-code;
fi;

echo 'Configuring git to use rebase on pull (no merge commits)';
git config --global pull.rebase true

echo 'Installing shell theme: pure-fish/pure';
curl -sL https://raw.githubusercontent.com/jorgebucaran/fisher/main/functions/fisher.fish | source && fisher install jorgebucaran/fisher;
fisher install pure-fish/pure;

if test -e "$HOME/.ssh/config"; then
    echo 'Skipping ~/.ssh/config because it already exists';
else
    echo 'Creating ~/.ssh/config with settings for improved SSH reliability'
    mkdir -p "$HOME/.ssh";
    cat > "$HOME/.ssh/config" << 'EOF'
Host *
  ServerAliveInterval 30
  ServerAliveCountMax 1000
EOF
    chmod 600 "$HOME/.ssh/config";
fi;

echo '✅ All done! You must log out for all changes to take effect.';
