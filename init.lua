-- Locals --
require "mappings"
require "plugins"

-- Line numbers --
vim.opt.number = true
vim.opt.relativenumber = false
vim.opt.cursorline = true

-- Folds --
vim.o.foldcolumn = '1' -- '0' is not bad
vim.o.foldlevel = 99 -- Using ufo provider need a large value, feel free to decrease the value
vim.o.foldlevelstart = 99
vim.o.foldenable = true

-- Vim Spacing --
vim.o.expandtab = true
vim.o.smartindent = true
vim.o.tabstop = 2
vim.o.shiftwidth = 2

-- Load External Plugins --
local lazy = require "lazy"
lazy.setup({
  { "tiagovla/scope.nvim" },
  {
    'nvim-telescope/telescope.nvim',
    tag = '0.1.5',
    dependencies = { 'nvim-lua/plenary.nvim' }
  },
  {
    "akinsho/toggleterm.nvim",
    cmd = { "ToggleTerm", "TermExec" },
    opts = {
      highlights = {
        -- Normal = { link = "Normal" },
        NormalNC = { link = "NormalNC" },
        -- NormalFloat = { link = "NormalFloat" },
        -- FloatBorder = { link = "FloatBorder" },
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
      -- shade_terminals = false,
      -- shading_factor = 100,
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

-- Set Telescope Keybindings --
local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = "Find files" })
vim.keymap.set('n', '<leader>fb', builtin.buffers, { desc = "Find buffers" })
vim.keymap.set('n', '<leader>fs', builtin.grep_string, { desc = "Find word under cursor" })
vim.keymap.set('n', '<leader>fc', builtin.commands, { desc = "Find commands" })
vim.keymap.set('n', '<leader>fg', builtin.live_grep, { desc = "Live grep" })
vim.keymap.set('n', '<leader>fb', builtin.buffers, { desc = "Find buffers" })
vim.keymap.set('n', '<leader>fh', builtin.help_tags, { desc = "Find help tags" })
vim.keymap.set('n', '<leader>fm', builtin.man_pages, { desc = "Find man pages" })
vim.keymap.set('n', '<leader>fr', builtin.registers, { desc = "Find registers" })
vim.keymap.set('n', '<leader>fw', builtin.live_grep, { desc = "Find words" })
vim.keymap.set('n', '<leader>fW', function()
  builtin.live_grep {
    additional_args = function(args) return vim.list_extend(args, { "--hidden", "--no-ignore" }) end,
  }
end, { desc = "Find words in all files" })

-- Set the colorscheme --
local theme = require "theme"
vim.cmd.colorscheme 'catppuccin'
require("catppuccin").setup(theme)

require("scope").setup({})
require("toggleterm").setup{}
require("noicecfg")()

require 'bubbles'
