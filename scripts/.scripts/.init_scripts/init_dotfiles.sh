if [-d "~/dotfiles" ]; then
	git clone git@github.com:tonadr1022/dotfiles.git ~/dotfiles
fi
cd ~/dotfiles
stow zsh
stow nvim
stow tmux
stow clang
stow bin
stow alacritty
