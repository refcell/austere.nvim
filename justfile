## Justfile
## Author: refcell <https://github.com/refcell>
## Defines helper targets for managing local neovim configuration

# List available targets
default:
  @just --list

# Backup the current neovim config and install austere
backup-and-install: nvim-backup nvim

# Restores the previous neovim config backup if it exists
restore-backup:
  if [ -d ~/.config/nvim.bak ]; then \
    just nvim-restore; \
  else \
    echo "No backup found"; \
  fi

# Removes the current neovim config and restores the neovim backup
nvim-restore:
  rm -rf ~/.config/nvim
  cp -R ~/.config/nvim.bak ~/.config/nvim

# Removes the current neovim config and installs the austere config
nvim:
  rm -rf ~/.config/nvim
  cp -R ./ ~/.config

# Backup the current neovim config
nvim-backup:
  rm -rf ~/.config/nvim.bak
  cp -R ~/.config/nvim ~/.config/nvim.bak
