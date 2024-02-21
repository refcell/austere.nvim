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
  {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
      "MunifTanjim/nui.nvim",
    },
    -- keys = { { "<leader>E", "<leader>fE", desc = "Explorer NeoTree (cwd)", remap = true } },
    opts = {
	filesystem = {
        bind_to_cwd = false,
        follow_current_file = { enabled = true },
        filtered_items = {
            visible = true,
            hide_dotfiles = false,
            hide_gitignored = false,
            hide_hidden = false,
        },
      },
      window = { position = "right" },
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
