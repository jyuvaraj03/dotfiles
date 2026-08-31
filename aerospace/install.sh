#!/usr/bin/env bash

set -euo pipefail

if [[ "$(uname -s)" != "Darwin" ]]; then
  echo "AeroSpace is supported only on macOS." >&2
  exit 1
fi

if ! command -v brew >/dev/null 2>&1; then
  echo "Homebrew is required. Install it from https://brew.sh, then run this script again." >&2
  exit 1
fi

script_dir="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd)"
source_config="$script_dir/.aerospace.toml"
target_config="$HOME/.aerospace.toml"

brew install --cask nikitabobko/tap/aerospace

if [[ ! -e "$target_config" ]]; then
  cp "$source_config" "$target_config"
  echo "Installed AeroSpace configuration at $target_config"
elif cmp -s "$source_config" "$target_config"; then
  echo "AeroSpace configuration is already up to date at $target_config"
else
  echo "Leaving existing AeroSpace configuration unchanged: $target_config"
  echo "Compare it with $source_config to apply this repository's settings."
fi

echo "AeroSpace is installed. Open AeroSpace once to grant Accessibility permissions."
