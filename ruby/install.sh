# Install dependencies
sudo apt-get install -y curl
curl -fsSL https://github.com/rbenv/rbenv-installer/raw/HEAD/bin/rbenv-installer | bash
echo 'export PATH="$HOME/.rbenv/bin:$PATH"' >> $HOME/.bashrc
echo 'eval "$(rbenv init -)"' >> $HOME/.bashrc
source $HOME/.bashrc
rbenv install 3.3.5
rbenv global 3.3.5
