source utils.sh
sudo_cmd=get_sudo_cmd
# Install dependencies
$sudo_cmd apt-get update -y
$sudo_cmd apt-get -y install xclip ripgrep
$sudo_cmd apt-get -y install ninja-build gettext cmake unzip curl build-essential

# Install neovim from source if nvim is not installed
if [ ! -x "$(command -v nvim)" ]; then
  VERSION="0.10.1"
  mkdir -p downloadtmp
  curl -sL https://github.com/neovim/neovim/archive/refs/tags/v${VERSION}.tar.gz | tar -xzC downloadtmp 2>&1
  cd downloadtmp/neovim-${VERSION}
  $sudo_cmd make && $sudo_cmd make CMAKE_INSTALL_PREFIX=/usr/local/nvim install
  $sudo_cmd ln -sf /usr/local/nvim/bin/nvim /usr/local/bin/nvim
  rm -rf downloadtmp
fi

# Download config from github -- downloads at the home directory of whichever user is running the script
git clone https://github.com/jyuvaraj03/yuvim.git $HOME/.config/nvim
