curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim-linux64.tar.gz
[ ! -d ~/.local/opt ] && mkdir ~/.local/opt
sudo rm -rf ~/.local/opt/nvim ~/.local/opt/nvim-linux64
sudo tar -C ~/.local/opt -xzf nvim-linux64.tar.gz
sudo rm -rf nvim-linux64.tar.gz
touch ~/.zshrc.local
[ ! -d ~/.local/bin ] && mkdir ~/.local/bin
ln -s ~/.local/opt/nvim-linux64/bin/nvim ~/.local/bin/nvim
grep -qxF 'export PATH="$PATH:~/.local/bin"' ~/.zshrc.local || echo 'export PATH="$PATH:~/.local/bin"' >> ~/.zshrc.local

