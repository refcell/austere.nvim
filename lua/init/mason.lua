-- Mason Package Manager --
-- Lsps, linters, formatters --
return {
  {
    "williamboman/mason.nvim",
    cmd = {
      "Mason",
      "MasonInstall",
      "MasonUninstall",
      "MasonUninstallAll",
      "MasonLog",
      "MasonUpdate", -- AstroNvim extension here as well
      "MasonUpdateAll", -- AstroNvim specific
    },
    opts = {
      ui = {
        icons = {
          package_installed = "✓",
          package_uninstalled = "✗",
          package_pending = "⟳",
        },
      },
    },
    build = ":MasonUpdate",
  },
  -- {
  --   "williamboman/mason-lspconfig.nvim",
  -- },
  -- {
  --   "neovim/nvim-lspconfig",
  -- }
}
