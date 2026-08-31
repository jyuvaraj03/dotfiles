# Dotfiles managed by chezmoi

This repository is a [chezmoi](https://www.chezmoi.io/) source-state repository for macOS and Debian-based Linux systems.

## Bootstrap a new machine

Run the following command. It installs Homebrew and chezmoi when needed, initializes this source state, and applies it:

```sh
curl -fsSL https://raw.githubusercontent.com/jyuvaraj03/dotfiles/chezmoi/bootstrap.sh | bash
```

`chezmoi apply` installs the configured packages and deploys the managed files. On a systemd Linux host it also installs and enables `keyd`, so it may prompt for `sudo`.

If you previously initialized chezmoi from this repository's `main` branch, run the bootstrap command again after the `chezmoi` branch is pushed. It switches the existing source checkout to the migration branch before applying it.

## Daily workflow

```sh
chezmoi apply                 # apply source state to this machine
chezmoi edit ~/.tmux.conf     # edit a managed file
chezmoi add ~/.tmux.conf      # add a new file to source state
chezmoi update                # pull source state and apply updates
```

Managed application settings include AeroSpace, Alacritty, Karabiner-Elements, tmux, tmuxinator, and Zed. Neovim's configuration is cloned separately from `git@github.com:jyuvaraj03/yuvim.git` into `~/.config/nvim`.

Kanata is intentionally not managed. keyd is configured automatically only when Linux is running systemd; other hosts skip it without error.
