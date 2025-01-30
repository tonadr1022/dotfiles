#/bin/bash
mkdir $HOME/dep
git clone git@github.com:pop-os/launcher.git $HOME/dep/launcher
cd $HOME/dep/launcher
just build-release
just install
cd

cargo install just
npm install typescript -g
git clone git@github.com:pop-os/shell.git $HOME/dep/shell
cd $HOME/dep/shell
git checkout master_noble
make local-install

sudo ln -s $HOME/.local/bin/pop-launcher /usr/local/bin/pop-launcher
