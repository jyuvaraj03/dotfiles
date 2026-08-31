#!/usr/bin/env bash

set -euo pipefail

if [[ "$(uname -s)" != "Darwin" ]]; then
  echo "Karabiner-Elements is supported only on macOS; skipping."
  exit 0
fi

if ! command -v brew >/dev/null 2>&1; then
  echo "Homebrew is required. Install it from https://brew.sh, then run this script again." >&2
  exit 1
fi

script_dir="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd)"
target_config="$HOME/.config/karabiner/karabiner.json"

brew install --cask karabiner-elements
mkdir -p "$(dirname -- "$target_config")"
if [[ -e "$target_config" && ! -L "$target_config" ]]; then
  mv "$target_config" "$target_config.old"
fi
ln -sfn "$script_dir/karabiner.json" "$target_config"
