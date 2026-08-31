#!/usr/bin/env bash

set -euo pipefail

if [[ "$(uname -s)" == "Darwin" ]]; then
  if ! command -v brew >/dev/null 2>&1; then
    echo "Homebrew is required. Install it from https://brew.sh, then run this script again." >&2
    exit 1
  fi
  brew install rbenv ruby-build
elif command -v apt-get >/dev/null 2>&1; then
  sudo apt-get update
  sudo apt-get install -y curl
  curl -fsSL https://github.com/rbenv/rbenv-installer/raw/HEAD/bin/rbenv-installer | bash
else
  echo "Unsupported platform: this installer supports macOS and apt-based Linux distributions." >&2
  exit 1
fi

rbenv install --skip-existing 3.3.5
rbenv global 3.3.5

echo "Ruby 3.3.5 installed through rbenv. Add 'eval \"\$(rbenv init - zsh)\"' to ~/.zshrc (or use your shell's equivalent) if it is not already configured."
