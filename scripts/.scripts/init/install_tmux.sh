sudo apt remove tmux
git clone https://github.com/tmux/tmux.git ~/tmux
cd ~/tmux
sh autogen.sh
./configure
make && sudo make install
rm -rf ~/tmux
[ ! -d ~/.tmux/plugins/tpm ] && git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
