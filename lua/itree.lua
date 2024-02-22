return {
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
  }
}
