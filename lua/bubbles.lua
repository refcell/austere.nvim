local mocha = require("catppuccin.palettes").get_palette "mocha"

local bubbles_theme = {
  normal = {
    a = { fg = mocha.text, bg = mocha.surface0 },
    b = { fg = mocha.text, bg = mocha.surface1 },
    c = { fg = mocha.text, bg = mocha.base },
  },

  insert = { a = { fg = mocha.surface0, bg = mocha.blue } },
  visual = { a = { fg = mocha.surface0, bg = mocha.peach } },
  replace = { a = { fg = mocha.surface0, bg = mocha.red } },

  inactive = {
    a = { fg = mocha.text, bg = mocha.surface0 },
    b = { fg = mocha.text, bg = mocha.surface0 },
    c = { fg = mocha.surface0, bg = mocha.surface0 },
  },
}

require('lualine').setup {
  options = {
    theme = bubbles_theme,
    component_separators = '|',
    section_separators = { left = '', right = '' },
  },
  sections = {
    lualine_a = {
      { 'mode', separator = { left = '' }, right_padding = 2 },
    },
    lualine_b = {
      { 'filename', color = { fg = mocha.teal } },
      { 'branch', color = { fg = mocha.maroon } },
      { "os.date('%m/%d/%y')", color = { fg = mocha.sky } },
      "require'lsp-status'.status()",
      {
        'diff',
        symbols = { added = ' ', modified = '󰝤 ', removed = ' ' },
        diff_color = {
          added = { fg = mocha.green },
          modified = { fg = mocha.peach },
          removed = { fg = mocha.red },
        },
      },
    },
    lualine_c = { { 'fileformat', color = { fg = mocha.yellow } } },
    lualine_x = {},
    lualine_y = {
      'filetype',
      {
        'o:encoding',
        fmt = string.upper,
        color = { fg = mocha.green, gui = 'bold' },
      },
      'filesize',
      'progress',
      'diagnostics',
    },
    lualine_z = {
      { 'location', separator = { right = '' }, left_padding = 2 },
    },
  },
  inactive_sections = {
    lualine_a = { 'filename' },
    lualine_b = {},
    lualine_c = {},
    lualine_x = {},
    lualine_y = {},
    lualine_z = { 'location' },
  },
  tabline = {},
  extensions = {},
}
