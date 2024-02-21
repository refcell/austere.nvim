-- Locals --
require "mappings"
require "plugins"

-- Load External Plugins --
local lazy = require "lazy"
lazy.setup({
  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    init = function()
      vim.o.timeout = true
      vim.o.timeoutlen = 300
    end,
    opts = {
      -- your configuration comes here
      -- or leave it empty to use the default settings
      -- refer to the configuration section below
    }
  },
  { "catppuccin/nvim", name = "catppuccin", priority = 1000 },
  {
    "folke/neoconf.nvim",
    cmd = "Neoconf",
  },
  {
    'nvim-lualine/lualine.nvim',
    options = { theme = 'catppuccin' },
    dependencies = { 'nvim-tree/nvim-web-devicons' }
  },
  "folke/neodev.nvim",
})

-- Set the colorscheme --
local theme = require "theme"
vim.cmd.colorscheme 'catppuccin'
require("catppuccin").setup(theme)
