-- Lazy Plugin System --
require 'plugins'

-- Vim Global Options --
require 'globals'

-- Add Plugins to Lazy --
local lazy = require 'lazy'
lazy.setup({
  require 'init.rust',
  require 'init.splits',
  require 'init.mason',
  require 'init.tele',
  require 'init.comment',
  require 'init.line',
  require 'init.term',
  require 'init.noice',
  require 'init.picker',
  require 'init.which',
  require 'init.tree',
  require 'init.trees',
  require 'init.scopes',
  require 'init.notes',
  require 'init.neoconf',
  require 'init.theme',
  require 'init.bufferline',
  require 'init.pilot',
  require 'init.promise',
  require 'init.alphas',
  require 'init.neodev',
  require 'init.tabs',
  require 'init.ufo',
  require 'init.harpoon',
})

-- Pretty Folds --
require('ufo').setup({
    provider_selector = function(bufnr, filetype, buftype)
        return {'treesitter', 'indent'}
    end
})

-- Neotree Setup --
-- local neotree = require 'neotree'
-- require 'neo-tree'.setup(neotree)

-- Setup Smart Splits --
require('smart-splits').setup()

 -- Set Mappings after Telescope is loaded --
require 'mappings'

-- Lualine Bubbles --
require 'bubbles'

-- Tabscope Setup --
require 'tabscope'.setup()

-- Treesitter Syntax Highlighting --
require 'nvim-treesitter.configs'.setup({
  auto_install = true,
  sync_install = false,
  ensure_installed = { "go", "rust", "yaml", "toml", "json", "make", "c", "lua", "vim", "vimdoc", "query" },
  highlight = {
    enable = true,
  },
})

-- Dashboard Setup --
local dash = require 'dash'
require 'alpha'.setup(dash)

-- Set the colorscheme --
local theme = require 'themes.mocha'
vim.cmd.colorscheme('catppuccin')
local catppuccin = require 'catppuccin'
catppuccin.setup(theme)

-- Noice: Messages, cmdline, and popupmenu --
local noicecfg = require 'noicecfg'
require 'noice'.setup(noicecfg)

-- Scope Tabs with Telescope Setup --
require 'scope'.setup()
require 'telescope'.load_extension('scope')
require 'cfg.telescopec'.setup()

-- Floating Terminal Setup --
require 'toggleterm'.setup()

require("mason").setup()

-- Setup Quick Lazygit Keybinding --
local Terminal  = require('toggleterm.terminal').Terminal
local lazygit = Terminal:new({ cmd = "lazygit", hidden = true })
function _lazygit_toggle()
  lazygit:toggle()
end
vim.keymap.set("n", "<leader>g", "<cmd>lua _lazygit_toggle()<CR>", {noremap = true, silent = true})

-- Copilot Setup --
local pilotcfg = require 'pilotcfg'
require 'copilot'.setup(pilotcfg)

-- Harpoon Setup --
-- Harpoon is a bookmarking plugin that allows you to quickly navigate between files and projects.
require 'cfg.harpoonc'.setup()

-- Notes and Associated Keybindings --
local notes = require 'notes'
require 'global-note'.setup(notes)
vim.keymap.set("n", "<C-n>", require("global-note").toggle_note, {
  desc = "Toggle global note",
})
vim.keymap.set("n", "<leader>n", require("global-note").toggle_note, {
  desc = "Toggle global note",
})
