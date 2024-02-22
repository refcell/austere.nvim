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
local ineodev = { 'folke/neodev.nvim' }
local ialpha = { 'goolord/alpha-nvim' }
local iscope = { "tiagovla/scope.nvim" }
local inotes = { "backdround/global-note.nvim" }
local ineoconf = { 'folke/neoconf.nvim', cmd = 'Neoconf' }
local itheme = { 'catppuccin/nvim', name = 'catppuccin', priority = 1000 }
local ipilot = { 'zbirenbaum/copilot.lua', lazy = true, event = 'VimEnter' }

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
  
  -- {
  --   "kevinhwang91/nvim-ufo",
  --   event = { "User AstroFile", "InsertEnter" },
  --   dependencies = { "kevinhwang91/promise-async" },
  --   opts = {
  --     preview = {
  --       mappings = {
  --         scrollB = "<C-b>",
  --         scrollF = "<C-f>",
  --         scrollU = "<C-u>",
  --         scrollD = "<C-d>",
  --       },
  --     },
  --     provider_selector = function(_, filetype, buftype)
  --       local function handleFallbackException(bufnr, err, providerName)
  --         if type(err) == "string" and err:match "UfoFallbackException" then
  --           return require("ufo").getFolds(bufnr, providerName)
  --         else
  --           return require("promise").reject(err)
  --         end
  --       end
  --
  --       return (filetype == "" or buftype == "nofile") and "indent" -- only use indent until a file is opened
  --         or function(bufnr)
  --           return require("ufo")
  --             .getFolds(bufnr, "lsp")
  --             :catch(function(err) return handleFallbackException(bufnr, err, "treesitter") end)
  --             :catch(function(err) return handleFallbackException(bufnr, err, "indent") end)
  --         end
  --     end,
  --   },
  -- },
})

-- require('ufo').setup({})

 -- Set Mappings after Telescope is loaded --
require 'mappings'

-- Lualine Bubbles --
require 'bubbles'

-- Treesitter Syntax Highlighting --
require 'nvim-treesitter.configs'.setup({
  auto_install = true,
  sync_install = false,
  ensure_installed = { "golang", "rust", "yaml", "toml", "json", "make", "c", "lua", "vim", "vimdoc", "query" },
  highlight = {
    enable = true,
  },
})

-- Dashboard Setup --
local dash = require 'alpha.themes.theta'.config
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
