cd $HOME/dotfiles
mkdir -p ~/.vim/undodir
stow vim
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
	https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
