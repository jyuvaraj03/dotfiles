#!/usr/bin/env bash

set -euo pipefail

if [[ "$(uname -s)" == "Darwin" ]]; then
  echo "keyd is a Linux input-device daemon and is not supported on macOS; skipping."
  exit 0
fi

if ! command -v systemctl >/dev/null 2>&1; then
  echo "keyd requires a systemd-based Linux system; skipping." >&2
  exit 0
fi

script_dir="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd)"
keyd_dir="$HOME/Applications/keyd"
mkdir -p "$HOME/Applications"
git clone https://github.com/rvaiya/keyd "$keyd_dir"
cd "$keyd_dir"
make && sudo make install
sudo systemctl enable keyd && sudo systemctl start keyd
# Backup existing /etc/keyd/default.conf if present
if [ -f "/etc/keyd/default.conf" ]; then
  sudo cp /etc/keyd/default.conf /etc/keyd/default.conf.old
fi
# Install default.conf
sudo cp "$script_dir/default.conf" /etc/keyd/default.conf
