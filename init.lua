-- Locals --
require "mappings"
require "plugins"

-- Load External Plugins --
local lazy = require "lazy"
lazy.setup({
  {
    "folke/noice.nvim",
    after = "nui.nvim",
    event = "VimEnter",
    opts = {
    	-- add any options here
    },
    dependencies = {
    -- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
    "MunifTanjim/nui.nvim",
    -- OPTIONAL:
    --   `nvim-notify` is only needed, if you want to use the notification view.
    --   If not available, we use `mini` as the fallback
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

-- Setup Noice --
require("noice").setup({
        presets = {
            command_palette = true,
            lsp_doc_border = true,
        },
        notify = {
            enabled = false,
            background_colour = "#000000",
        },
        messages = { enabled = false },
        -- cmdline = {
        --     enabled = true, -- enables the Noice cmdline UI
        --     view = "cmdline_popup", -- view for rendering the cmdline. Change to `cmdline` to get a classic cmdline at the bottom
        --     opts = {},
        --     format = {
        --       cmdline = { pattern = "^:", icon = "", lang = "vim" },
        --       search_down = { kind = "search", pattern = "^/", icon = " ", lang = "regex" },
        --       search_up = { kind = "search", pattern = "^%?", icon = " ", lang = "regex" },
        --       filter = { pattern = "^:%s!", icon = "$", lang = "bash" },
        --       lua = { pattern = { "^:%slua%s+", "^:%slua%s=%s", "^:%s=%s" }, icon = "", lang = "lua" },
        --       help = { pattern = "^:%she?l?p?%s+", icon = "" },
        --       input = {},
        --     },
        --   },
        -- messages = {
        --     -- NOTE: If you enable messages, then the cmdline is enabled automatically.
        --     -- This is a current Neovim limitation.
        --     enabled = true, -- enables the Noice messages UI
        --     view = "notify", -- default view for messages
        --     view_error = "notify", -- view for errors
        --     view_warn = "notify", -- view for warnings
        --     view_history = "messages", -- view for :messages
        --     view_search = "virtualtext", -- view for search count messages. Set to `false` to disable
        -- },
        -- popupmenu = {
        --     enabled = true, -- enables the Noice popupmenu UI
        --     ---@type 'nui'|'cmp'
        --     backend = "nui", -- backend to use to show regular cmdline completions
        --     ---@type NoicePopupmenuItemKind|false
        --     -- Icons for completion item kinds (see defaults at noice.config.icons.kinds)
        --     kind_icons = {}, -- set to `false` to disable icons
        -- },
        lsp = {
            -- override = {
            --   ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
            --   ["vim.lsp.util.stylize_markdown"] = true,
            --   ["cmp.entry.get_documentation"] = true,
            -- },
            hover = {
                enabled = false,
            },
            signature = {
                enabled = false,
            },
        },
    })

