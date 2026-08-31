#!/usr/bin/env bash

set -euo pipefail

script_dir="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd)"

if [[ "$(uname -s)" == "Darwin" ]]; then
  if ! command -v brew >/dev/null 2>&1; then
    echo "Homebrew is required. Install it from https://brew.sh, then run this script again." >&2
    exit 1
  fi
  brew install tmux
elif command -v apt-get >/dev/null 2>&1; then
  source "$script_dir/../utils.sh"
  sudo_cmd=$(get_sudo_cmd)
  $sudo_cmd apt-get update
  $sudo_cmd apt-get -y install tmux
else
  echo "Unsupported platform: this installer supports macOS and apt-based Linux distributions." >&2
  exit 1
fi

target_config="$HOME/.tmux.conf"
if [[ -e "$target_config" && ! -L "$target_config" ]]; then
  mv "$target_config" "$target_config.old"
fi
ln -sfn "$script_dir/.tmux.conf" "$target_config"
