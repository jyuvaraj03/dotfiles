# Install dependencies
sudo apt install curl cmake pkg-config libfreetype6-dev libfontconfig1-dev libxcb-xfixes0-dev libxkbcommon-dev python3

# Install rustup
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
rustup override set stable
rustup update stable

# Install alacritty -- https://github.com/alacritty/alacritty/blob/master/INSTALL.md
mkdir -p $HOME/Applications
git clone https://github.com/alacritty/alacritty.git $HOME/Applications/alacritty
cd $HOME/Applications/alacritty
cargo build --release
sudo tic -xe alacritty,alacritty-direct extra/alacritty.info
sudo cp target/release/alacritty /usr/local/bin # or anywhere else in $PATH
sudo cp extra/logo/alacritty-term.svg /usr/share/pixmaps/Alacritty.svg
sudo desktop-file-install extra/linux/Alacritty.desktop
sudo update-desktop-database

# Copy existing alacritty.toml to alacritty.toml.old if present
if [ -f "$HOME/.alacritty.toml" ]; then
  cp $HOME/.alacritty.toml $HOME/.alacritty.toml.old
fi
# Install alacritty.toml configs
cp alacritty/.alacritty.toml $HOME/.alacritty.toml
