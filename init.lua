-- Lazy Plugin System --
require 'plugins'

-- Vim Global Options --
require 'globals'

-- Get Plugin Configs --
local imason = require 'imason'
local itele = require 'itele'
local icomment = require 'icomment'
local iline = require 'iline'
local iterm = require 'iterm'
local inoice = require 'inoice'
local iwhich = require 'iwhich'
local itree = require 'itree'
local itreesitter = require 'itreesitter'
local itabs = { 'backdround/tabscope.nvim' }
local ineodev = { 'folke/neodev.nvim' }
local ialpha = { 'goolord/alpha-nvim' }
local iscope = { "tiagovla/scope.nvim" }
local inotes = { "backdround/global-note.nvim" }
local ineoconf = { 'folke/neoconf.nvim', cmd = 'Neoconf' }
local itheme = { 'catppuccin/nvim', name = 'catppuccin', priority = 1000 }
local ipilot = { 'zbirenbaum/copilot.lua', lazy = true, event = 'VimEnter' }
local ipromise = { 'kevinhwang91/promise-async' }
local iufo = {'kevinhwang91/nvim-ufo', requires = 'kevinhwang91/promise-async'}

-- Add Plugins to Lazy --
local lazy = require 'lazy'
lazy.setup({
  imason,
  itreesitter,
  ineodev,
  ialpha,
  iscope,
  inotes,
  ineoconf,
  itheme,
  ipilot,
  itele,
  icomment,
  iline,
  iterm,
  inoice,
  iwhich,
  itree,
  itabs,
  ipromise,
  iufo,
})

-- Pretty Folds --
require('ufo').setup({
    provider_selector = function(bufnr, filetype, buftype)
        return {'treesitter', 'indent'}
    end
})

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
local theme = require 'theme'
vim.cmd.colorscheme('catppuccin')
local catppuccin = require 'catppuccin'
catppuccin.setup(theme)

-- Noice: Messages, cmdline, and popupmenu --
local noicecfg = require 'noicecfg'
require 'noice'.setup(noicecfg)

-- Scope Tabs with Telescope Setup --
require 'scope'.setup()
require 'telescope'.load_extension('scope')

-- Floating Terminal Setup --
require 'toggleterm'.setup()

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

-- Notes and Associated Keybindings --
local notes = require 'notes'
require 'global-note'.setup(notes)
vim.keymap.set("n", "<C-n>", require("global-note").toggle_note, {
  desc = "Toggle global note",
})
vim.keymap.set("n", "<leader>n", require("global-note").toggle_note, {
  desc = "Toggle global note",
})
