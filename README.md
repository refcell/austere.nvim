# austere.nvim ☠️

[![Luacheck]][actions]
[![Release]][actions]
[![Tag]][actions]
[![Lanuage]][lang]
[![License]][mit-license]

[Luacheck]: https://img.shields.io/github/actions/workflow/status/refcell/austere.nvim/ci.yml?branch=main&label=build
[Tag]: https://img.shields.io/github/actions/workflow/status/refcell/austere.nvim/tag.yml?branch=main&label=tag
[Release]: https://img.shields.io/github/actions/workflow/status/refcell/austere.nvim/release.yml?branch=main&label=release
[actions]: https://github.com/refcell/austere.nvim/actions?query=branch%3Amain

[License]: https://img.shields.io/badge/license-MIT-7795AF.svg
[mit-license]: https://github.com/ethereum-optimism/axos/blob/main/LICENSE.md

[Language]: https://img.shields.io/badge/language-lua-blue
[lang]: https://img.shields.io/badge/language-lua-blue

**Austere is a minimally constructed neovim config built from the ground up.** https://github.com/refcell/austere.nvim/labels/beta

![](./etc/banner.png)

**[Install](#📦-usage)**
| [Usage](#📦-usage)
| [Requirements](#⚡️-requirements)
| [Features](#✨-features-&-keybindings)
| [Architecture](#⚙️-architecture)
| [Plugins](#🔌-plugins)
| [Contributing](#🐛-contributing)
| [License](#🔒-license)

## 📄 Overview

At its core, Austere is an opinionated [neovim][neovim] configuration with
remote usage as a core design tennant. Austere is **not** meant to be a
framework and provides an implementation rich codebase that should be modified
directly to extend components and add features.

Non-extensibility is intentional. Not supporting extensible usage acts as a
forcing function to upstream modifications _directly_ to [Austere][a]. This
way, [Austere][a] is maintained and constantly improved by its users.

Finally, performance is a priority without sacrificing aesthetic. If you
see a way to improve [Austere][a] while following this requirement,
[contribute!](#contributing).

## 📦 Usage

To use [Austere][a], clone the repo and then install the configuration.

> [!NOTE]
>
> [`just`][just] must be installed to use the convenience bash Justfile target commands.

```bash
git clone https://github.com/refcell/austere.nvim
cd austere.nvim
just backup-and-install
```

This will copy the [Austere][a] config into the `~/.config/nvim/` directory.
If a neovim config already exists in this directory, it will be copied in a
backup directory `~/.config/nvim.bak`. If you need to revert the [Austere][a]
installation, you can simply run `just restore-backup`.

[a]: https://github.com/refcell/austere.nvim
[just]: https://github.com/casey/just

## ⚡️ Requirements

- [Neovim][neovim] >= 0.8.0 (needs to be built with LuaJIT)
- [Git][git] >= 2.19.0 (for partial clones support)
- [ripgrep][ripgrep] is used for fast, efficient live word greps.
- [lazygit][lazygit] for a clean git ui
- A Nerd Font (_optional_)

[git]: https://git-scm.com/downloads
[lazygit]: https://github.com/jesseduffield/lazygit
[ripgrep]: https://github.com/BurntSushi/ripgrep
[neovim]: https://github.com/neovim/neovim

## ✨ Features & Keybindings

> [!NOTE]
>
> The `leader` key is configured in [mappings.lua](./lua/mappings.lua) to
> the space key.

### lazy.nvim

The [lazy plugin manager][lazy] provides a robust, standardized way to manage
neovim plugins. It provides profiling metrics, lazy loading and cache
optimizations for plugin loading, a clean ui, and [much more][lzfeats].

**Keybindings**

- `ctrl + p` (or `leader + p`): Pull up Lazy profiling.
- 

[lzfeats]: https://github.com/folke/lazy.nvim?tab=readme-ov-file#-features

### Lazy Git



### Bufferline



### Verbose Status Line

Austere uses [lualine][lualine] to 

### Hot Theme Toggling

`<leader>t` toggles inverse light or dark background, causing the colorscheme to alternate
between the `mocha` and slightly modified `latte` [catppuccin][catppuccin] themes. 

## ⚙️ Architecture

[init.lua](./init.lua) acts as the entrypoint for the neovim config. It performs a few key
operations that is responsible for loading neovim. 

## 🔌 Plugins

- [`folke/lazy.nvim`][lazy]: Lazy Plugin Manager
- [`goolord/alpha-nvim`][alpha]: Startup dashboard
- [`nvim-neo-tree/neo-tree`][neotree]: File system browser
- [`akinsho/bufferline.nvim`][bufferline]: Top buffer line
- [`numToStr/Comment.nvim`][comments]: Comment lines with keybindings
- [`nvim-lualine/lualine.nvim`][lualine]: Bottom status line
- [`williamboman/mason.nvim`][mason]: Mason package manager
- [`folke/neoconf.nvim`][neoconf]: Neovim config manager
- [`folke/neodev.nvim`][neodev]: Convenience methods for neovim development 
- [`folke/noice.nvim`][noice]: Messages, cmdline, popup ui
- [`backdround/global-note.nvim`][notes]: Simple Global notepad
- [`zbirenbaum/copilot.lua`][copilot]: Github Copilot plugin
- [`kevinhwang91/promise-async`][promise]: Dependency
- [`tiagovla/scope.nvim`][scope]: Scopes block codes for collapse and expansion
- [`mrjones2014/smart-splits.nvim`][splits]: Manage buffer and tab splits
- [`backdround/tabscope.nvim`][tabscope]: Tab scoping
- [`nvim-telescope/telescope.nvim`][telescope]: Ergonomic search menu
- [`akinsho/toggleterm.nvim`][term]: Popup terminal 
- [`catppuccin/nvim`][catppuccin]: Catppuccin theme
- [`nvim-treesitter/nvim-treesitter`][tree]: Neovim treesitter syntax highlighting
- [`kevinhwang91/nvim-ufo`][ufo]: Modern neovim folding
- [`folke/which-key.nvim`][which]: Available keybinding popup menu

[lazy]: https://github.com/folke/lazy.nvim
[which]: https://github.com/folke/which-key.nvim
[ufo]: https://github.com/kevinhwang91/nvim-ufo
[tree]: https://github.com/nvim-treesitter/nvim-treesitter
[catppuccin]: https://github.com/catppucin/nvim
[term]: https://github.com/akinsho/toggleterm.nvim
[telescope]: https://github.com/nvim-telescope/telescope.nvim
[tabscope]: https://github.com/backdround/tabscope.nvim
[noice]: https://github.com/folke/noice.nvim
[notes]: https://github.com/backdround/global-note.nvim
[copilot]: https://github.com/zbirenbaum/copilot.lua
[promise]: https://github.com/kevinhwang91/promise-async
[scope]: https://github.com/tiagovla/scope.nvim
[splits]: https://github.com/mrjones2014/smart-splits.nvim
[neodev]: https://github.com/folke/neodev.nvim
[neoconf]: https://github.com/folke/neoconf.nvim
[mason]: https://github.com/williamboman/mason.nvim
[lualine]: https://github.com/nvim-lualine/lualine.nvim
[comments]: https://github.com/numToStr/Comment.nvim
[bufferline]: https://github.com/akinsho/bufferline.nvim
[neotree]: https://github.com/nvim-neo-tree/neo-tree.nvim
[alpha]: https://github.com/goolord/alpha-nvim

## 🐛 Contributing

All contributions are welcome!

When contributing please provide a concise description of the issue, feature
request, or your changes.

## 🔒 License

Open sourced under the [MIT License][license].

[license]: ./LICENSE.md

## ❤️ Acknowledgements

- [@clabby][c]'s [dots][cd]
- [Astronvim][avim]
- [Neovim][neovim]

[avim]: https://github.com/AstroNvim/AstroNvim
[c]: https://github.com/clabby
[cd]: https://github.com/clabby/dots
[neovim]: https://github.com/neovim/neovim
