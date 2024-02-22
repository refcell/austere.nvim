-- Locals --
require "mappings"
require "plugins"

-- Vim Spacing --
vim.o.expandtab = true
vim.o.smartindent = true
vim.o.tabstop = 2
vim.o.shiftwidth = 2

-- Load External Plugins --
local lazy = require "lazy"
lazy.setup({
  {
    "akinsho/toggleterm.nvim",
    cmd = { "ToggleTerm", "TermExec" },
    opts = {
      highlights = {
        Normal = { link = "Normal" },
        NormalNC = { link = "NormalNC" },
        NormalFloat = { link = "NormalFloat" },
        FloatBorder = { link = "FloatBorder" },
        StatusLine = { link = "StatusLine" },
        StatusLineNC = { link = "StatusLineNC" },
        WinBar = { link = "WinBar" },
        WinBarNC = { link = "WinBarNC" },
      },
      size = 10,
      on_create = function()
        vim.opt.foldcolumn = "0"
        vim.opt.signcolumn = "no"
      end,
      open_mapping = [[<C-\>]],
      shading_factor = 2,
      direction = "float",
      float_opts = { border = "rounded" },
    },
  },
  {
    'numToStr/Comment.nvim',
    keys = {
      { "gc", mode = { "n", "v" }, desc = "Comment toggle linewise" },
      { "gb", mode = { "n", "v" }, desc = "Comment toggle blockwise" },
    },
    lazy = false,
  },
  {
    "folke/noice.nvim",
    after = "nui.nvim",
    event = "VimEnter",
    opts = {},
    dependencies = {
    "MunifTanjim/nui.nvim",
    "rcarriga/nvim-notify",
    }
  },
  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    init = function()
      vim.o.timeout = true
      vim.o.timeoutlen = 300
    end,
    opts = {}
  },
  {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
      "MunifTanjim/nui.nvim",
    },
    opts = {
  	  close_if_last_window = true,
  	  popup_border_style = "rounded",
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
      window = { position = "float" }
    }
  },
  {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,
  },
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

require("toggleterm").setup{}

require("noicecfg")()
