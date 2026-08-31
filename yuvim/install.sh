#!/usr/bin/env bash

set -euo pipefail

script_dir="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd)"
sudo_cmd=""

if [[ "$(uname -s)" == "Darwin" ]]; then
  if ! command -v brew >/dev/null 2>&1; then
    echo "Homebrew is required. Install it from https://brew.sh, then run this script again." >&2
    exit 1
  fi
  brew install neovim ripgrep
elif command -v apt-get >/dev/null 2>&1; then
  source "$script_dir/../utils.sh"
  sudo_cmd=$(get_sudo_cmd)
  $sudo_cmd apt-get update -y
  $sudo_cmd apt-get -y install xclip ripgrep ninja-build gettext cmake unzip curl build-essential
else
  echo "Unsupported platform: this installer supports macOS and apt-based Linux distributions." >&2
  exit 1
fi

# Install neovim from source if nvim is not installed
if [ ! -x "$(command -v nvim)" ]; then
  VERSION="0.10.1"
  build_dir="$(mktemp -d)"
  curl -sL https://github.com/neovim/neovim/archive/refs/tags/v${VERSION}.tar.gz | tar -xzC "$build_dir" 2>&1
  cd "$build_dir/neovim-${VERSION}"
  $sudo_cmd make && $sudo_cmd make CMAKE_INSTALL_PREFIX=/usr/local/nvim install
  $sudo_cmd ln -sf /usr/local/nvim/bin/nvim /usr/local/bin/nvim
  rm -rf "$build_dir"
fi

# Download config from github -- downloads at the home directory of whichever user is running the script
mkdir -p "$HOME/.config"
git clone git@github.com:jyuvaraj03/yuvim.git "$HOME/.config/nvim"
