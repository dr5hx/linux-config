#!/usr/bin/env bash
set -e

REPO_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

echo "==> Detecting package manager..."

if command -q apt; then
    echo "==> Installing fish and starship via apt..."
    sudo apt update && sudo apt install -y fish starship
elif command -q pacman; then
    echo "==> Installing fish and starship via pacman..."
    sudo pacman -S fish starship
elif command -q dnf; then
    echo "==> Installing fish and starship via dnf..."
    sudo dnf install -y fish starship
elif command -q apk; then
    echo "==> Installing fish and starship via apk..."
    sudo apk add fish starship
else
    echo "==> Unsupported package manager. Please install fish and starship manually."
    echo "    Visit: https://fishshell.com/ | https://starship.rs/"
    exit 1
fi

echo "==> Installing vfox..."
if [ ! -d "$REPO_DIR/vfox" ]; then
    echo "    Cloning vfox repo..."
    git clone https://github.com/version-fox/vfox.git "$REPO_DIR/vfox"
fi
if [ ! -f "$REPO_DIR/vfox/install.sh" ]; then
    echo "    ERROR: install.sh not found. Remove vfox directory and retry."
    exit 1
fi
echo "    Running vfox install.sh..."
bash "$REPO_DIR/vfox/install.sh"

echo "==> Linking fish config..."
mkdir -p ~/.config/fish
ln -sf "$REPO_DIR/fish/config.fish" ~/.config/fish/config.fish
if [ -L ~/.config/fish/config.fish ]; then
    echo "    ~/.config/fish/config.fish -> $REPO_DIR/fish/config.fish"
    grep -q 'set -g fish_greeting' ~/.config/fish/config.fish && echo "    fish_greeting: disabled" || echo "    WARN: fish_greeting not set"
else
    echo "    ERROR: failed to create symlink"
fi

echo "==> Linking starship config..."
ln -sf "$REPO_DIR/starship.toml" ~/.config/starship.toml
if [ -L ~/.config/starship.toml ]; then
    echo "    ~/.config/starship.toml -> $REPO_DIR/starship.toml"
else
    echo "    ERROR: failed to create symlink"
fi

echo ""
echo "==> Installation complete!"
echo "    Restart your shell or run: fish"
echo "    To set fish as your default shell: chsh -s /usr/bin/fish"
echo ""
echo "    Note: To update vfox later, run: cd $REPO_DIR/vfox && git pull"
