#!/bin/bash
set -euo pipefail

CHANNEL="stable"

if [[ "${1:-}" == "-nightly" ]]; then
    CHANNEL="nightly"
fi

if [[ "$CHANNEL" == "nightly" ]]; then
    NVIM_URL="https://github.com/neovim/neovim/releases/download/nightly/nvim-linux-x86_64.tar.gz"
    NVIM_DIR="nvim-linux-x86_64"
else
    NVIM_URL="https://github.com/neovim/neovim/releases/latest/download/nvim-linux-x86_64.tar.gz"
    NVIM_DIR="nvim-linux-x86_64"
fi

curl -LO "$NVIM_URL"

mkdir -p ~/.local/opt ~/.local/bin

rm -rf ~/.local/opt/nvim ~/.local/bin/nvim ~/.local/opt/$NVIM_DIR

tar -C ~/.local/opt -xf "$NVIM_DIR.tar.gz"
rm -f "$NVIM_DIR.tar.gz"

ln -sf ~/.local/opt/$NVIM_DIR/bin/nvim ~/.local/bin/nvim

if ! grep -qxF 'export PATH="$PATH:$HOME/.local/bin"' ~/.zshrc.local 2>/dev/null; then
    echo 'export PATH="$PATH:$HOME/.local/bin"' >>~/.zshrc.local
    echo "Updated .zshrc.local with the new PATH."
else
    echo ".zshrc.local already has the correct PATH."
fi

source ~/.zshrc.local

echo "Neovim ($CHANNEL) installed successfully."
