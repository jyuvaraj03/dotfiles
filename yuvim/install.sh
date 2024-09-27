sudo_cmd=""
if [ ! -x "$(command -v sudo)" ]; then
  sudo_cmd="sudo"
fi
# Install dependencies
$sudo_cmd apt install cmake curl xclip ripgrep

# Install neovim from source if nvim is not installed
if [ ! -x "$(command -v nvim)" ]; then
  VERSION="v0.10.1"
  curl -sL https://github.com/neovim/neovim/archive/refs/tags/${VERSION}.tar.gz | tar -xzC /tmp 2>&1
  cd /tmp/neovim-${VERSION}
  make && make CMAKE_INSTALL_PREFIX=/usr/local/nvim install
  ln -sf /usr/local/nvim/bin/nvim /usr/local/bin/nvim
  rm -rf /tmp/neovim-${VERSION}
fi

# Backup existing config
if [ -d $HOME/.config/nvim ]; then
  mv $HOME/.config/nvim $HOME/.config/nvim.old
fi

# Download config from github
git clone https://github.com/jyuvaraj03/yuvim.git $HOME/.config/nvim
