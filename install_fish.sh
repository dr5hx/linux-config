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

echo "==> Linking fish config..."
mkdir -p ~/.config/fish
ln -sf "$REPO_DIR/fish/config.fish" ~/.config/fish/config.fish

echo "==> Linking starship config..."
ln -sf "$REPO_DIR/starship.toml" ~/.config/starship.toml

echo ""
echo "==> Installation complete!"
echo "    Restart your shell or run: fish"
echo "    To set fish as your default shell: chsh -s /usr/bin/fish"
