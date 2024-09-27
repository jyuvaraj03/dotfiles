mkdir -p $HOME/Applications
git clone https://github.com/rvaiya/keyd $HOME/Applications/keyd
cd keyd
make && sudo make install
sudo systemctl enable keyd && sudo systemctl start keyd
# Backup existing /etc/keyd/default.conf if present
if [ -f "/etc/keyd/default.conf" ]; then
  cp /etc/keyd/default.conf /etc/keyd/default.conf.old
fi
# Install default.conf
cp keyd/default.conf /etc/keyd/default.conf
