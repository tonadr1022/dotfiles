#!/bin/bash

curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim-linux-x86_64.tar.gz


[ ! -d ~/.local/opt ] && mkdir -p ~/.local/opt
[ ! -d ~/.local/bin ] && mkdir -p ~/.local/bin

rm -rf ~/.local/opt/nvim ~/.local/bin/nvim ~/.local/opt/nvim-linux-x86_64.tar.gz

tar -C ~/.local/opt -xf nvim-linux-x86_64.tar.gz

rm -f nvim-linux-x86_64.tar.gz
ln -s ~/.local/opt/nvim-linux-x86_64/bin/nvim ~/.local/bin/nvim

if ! grep -qxF 'export PATH="$PATH:~/.local/bin"' ~/.zshrc.local; then
  echo 'export PATH="$PATH:~/.local/bin"' >> ~/.zshrc.local
  echo "Updated .zshrc.local with the new PATH."
else
  echo ".zshrc.local already has the correct PATH."
fi
source ~/.zshrc.local

