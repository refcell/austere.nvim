-- Section Buttons --

local Terminal  = require('toggleterm.terminal').Terminal
local lazygit = Terminal:new({ cmd = "lazygit", hidden = true })
function _lazygit_toggle()
  lazygit:toggle()
end

function btns()
  local keybind_opts = { silent = true, noremap = true }
  vim.api.nvim_create_autocmd({ "User" }, {
    pattern = { "AlphaReady" },
    callback = function(_)
      vim.api.nvim_buf_set_keymap(0, "n", "z", ":Lazy<CR>", keybind_opts)
      vim.api.nvim_buf_set_keymap(0, "n", "n", ":ene<CR>", keybind_opts)
      vim.api.nvim_buf_set_keymap(0, "n", "c", ":cd ~/.config/nvim<CR>", keybind_opts)

      -- Toggleterm / telescope
      vim.api.nvim_buf_set_keymap(0, "n", "g", "<cmd>lua _lazygit_toggle()<CR>", keybind_opts)
      vim.api.nvim_buf_set_keymap(0, "n", "t", ":ToggleTerm<CR>", keybind_opts)
      vim.api.nvim_buf_set_keymap(0, "n", "s", ":Telescope live_grep<CR>", keybind_opts)
      vim.api.nvim_buf_set_keymap(0, "n", "f", ":Telescope find_files<CR>", keybind_opts)

      -- Neovim Sessions
      vim.api.nvim_buf_set_keymap(0, "n", "l", ":SessionManager! load_session<CR>", keybind_opts)
      vim.api.nvim_buf_set_keymap(0, "n", "d", ":SessionManager! load_current_dir_session<CR>", keybind_opts)

      -- Quit
      vim.api.nvim_buf_set_keymap(0, "n", "q", "<cmd>q<CR>", keybind_opts)
    end,
  })

  -- "Function" is light blue - replaced with white
  local button_hl = {
    { "Constant", 1,  4 },
    { "white",   5,  18 },
    { "String", 19, 25 },
    { "Comment", 25, 32 },
    { "Constant", 32, 38 },
    { "white",   38, 50 },
    { "String", 51, 55 },
  }
  return {
    {
      type = "text",
      val = {
        "   new file       n    │       config        c",
        "   find file      f    │       terminal      t",
        "   lazygit        g    │       quit          q",
        "鈴  lazy           z    │       search        s",
        "   load session   l    │       dir session   d",
      },
      opts = {
        shrink_margin = false,
        position = "center",
        hl = {
          button_hl, button_hl, button_hl, button_hl, button_hl,
        }
      },
    },
  }
end

return { type = "group", val = btns };
