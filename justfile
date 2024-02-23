## Justfile
## Author: refcell <https://github.com/refcell>
## Defines helper targets for managing local neovim configuration

backup-and-install: nvim-backup nvim

restore-backup:
  rm -rf ~/.config/nvim
  cp -R ~/.config/nvim.bak ~/.config/nvim

nvim:
  rm -rf ~/.config/nvim
  cp -R ./ ~/.config

nvim-backup:
  rm -rf ~/.config/nvim.bak
  cp -R ~/.config/nvim ~/.config/nvim.bak
