# GNOME Configuration Role

This Ansible role configures GNOME desktop settings, specifically:

## Features

1. **Workspace Shortcuts Configuration**:
   - `Super + 1-9` → Navigate to workspace 1-9
   - `Ctrl + Super + 1-9` → Move window and navigate to workspace 1-9
   - Sets up 9 workspaces total

2. **Pop!_OS Shell Installation**:
   - Installs the Pop!_OS shell extension
   - Enables the extension in GNOME
   - Supports Ubuntu/Debian, Fedora, and Arch-based systems

## Requirements

This role requires the `community.general` Ansible collection for the `dconf` module:

```bash
ansible-galaxy collection install community.general
```

## Supported Distributions

- Ubuntu/Debian/Linux Mint
- Fedora
- Arch Linux

## Configuration

The role uses the following variables (defined in `vars/main.yml`):
- `gnome_workspace_count`: Number of workspaces to create (default: 9)
- `gnome_enable_pop_shell`: Whether to enable Pop!_OS shell (default: true)

## Notes

After running this role, you may need to log out and log back in or restart the GNOME shell (Alt+F2, type 'r', press Enter) for all changes to take effect.