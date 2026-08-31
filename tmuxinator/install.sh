#!/usr/bin/env bash

set -euo pipefail

script_dir="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd)"

# Check dependencies -- gem command should be installed
if ! command -v gem >/dev/null 2>&1; then
  echo "gem command could not be found. You may need to install gem/ruby first."
  exit 1
fi

# Install tmuxinator
gem install tmuxinator

# Backup old tmuxinator config
if [ -f "$HOME/.tmuxinator/sample.yml" ]; then
  cp "$HOME/.tmuxinator/sample.yml" "$HOME/.tmuxinator/sample.yml.old"
fi

# Install sample config
mkdir -p "$HOME/.tmuxinator"
cp "$script_dir/.sample.yml" "$HOME/.tmuxinator/sample.yml"
