git clone git@github.com:alacritty/alacritty.git
cd alacritty
rustup override set stable
rustup update stable
sudo apt install cmake g++ pkg-config libfreetype6-dev libfontconfig1-dev libxcb-xfixes0-dev libxkbcommon-dev python3
sudo apt install pkg-config libfreetype6-dev libfontconfig1-dev
cargo build --release
sudo tic -xe alacritty,alacritty-direct extra/alacritty.info
sudo cp target/release/alacritty /usr/local/bin
sudo cp extra/logo/alacritty-term.svg /usr/share/pixmaps/Alacritty.svg
sudo desktop-file-install extra/linux/Alacritty.desktop
sudo update-desktop-database
cd ..
rm -rf alacritty
