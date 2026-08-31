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

source_dir="$(chezmoi source-path)"

if [[ -d "$source_dir/.git" ]]; then
  git -C "$source_dir" fetch origin "$branch"
  git -C "$source_dir" checkout --track "origin/$branch" 2>/dev/null \
    || git -C "$source_dir" checkout "$branch"
  git -C "$source_dir" pull --ff-only origin "$branch"
  chezmoi apply
else
  chezmoi init --apply --branch "$branch" "$repository"
fi
