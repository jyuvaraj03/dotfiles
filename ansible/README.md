# Ansible playbook

This converts the bash-based dotfiles setup into an Ansible-driven bootstrap.

## What it does
- Installs Homebrew and common packages on macOS.
- Installs tmux, neovim, lazygit, tmuxinator.
- Sets up config files by linking/copying from this repo.
- Optionally installs keyd on Debian-based Linux (skipped on macOS).
- Installs Alacritty and places `alacritty.toml`.

## Layout
- `ansible/site.yml` — main playbook
- `ansible/roles/*` — role per tool
- `ansible/inventory/hosts` — default localhost inventory
- `ansible/ansible.cfg` — local settings

## Run
Requires Ansible and the community.general collection.

Install collection (one-time):
```
ansible-galaxy collection install community.general
```
Run the playbook:
```
ansible-playbook ansible/site.yml
```

Tip: If SSH cloning `yuvim` fails, set `yuvim_repo` var to https in `site.yml` or pass `-e yuvim_repo=https://github.com/jyuvaraj03/yuvim.git`.
