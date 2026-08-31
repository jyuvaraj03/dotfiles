#!/usr/bin/env bash

set -euo pipefail

repository="https://github.com/jyuvaraj03/dotfiles.git"
branch="chezmoi"

case "$(uname -s)" in
  Darwin)
    if ! command -v brew >/dev/null 2>&1; then
      /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    fi
    if ! command -v chezmoi >/dev/null 2>&1; then
      brew install chezmoi
    fi
    ;;
  Linux)
    if [[ ! -f /etc/debian_version ]]; then
      echo "Unsupported Linux distribution: only Debian-based systems are supported." >&2
      exit 1
    fi
    if ! command -v chezmoi >/dev/null 2>&1; then
      bin_dir="$HOME/.local/bin"
      mkdir -p "$bin_dir"
      sh -c "$(curl -fsLS get.chezmoi.io)" -- -b "$bin_dir"
      export PATH="$bin_dir:$PATH"
    fi
    ;;
  *)
    echo "Unsupported operating system: $(uname -s)" >&2
    exit 1
    ;;
esac

chezmoi init --apply --branch "$branch" "$repository"
