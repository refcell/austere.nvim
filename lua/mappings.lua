-- Set space as the leader key --
vim.g.mapleader = " "

--- Check if a plugin is defined in lazy.
-- Useful with lazy loading when a plugin is not necessarily loaded yet
---@param plugin string The plugin to search for
---@return boolean available # Whether the plugin is available
function is_available(plugin)
  local lazy_config_avail, lazy_config = pcall(require, "lazy.core.config")
  return lazy_config_avail and lazy_config.spec.plugins[plugin] ~= nil
end

vim.keymap.set("n", "-", vim.cmd.Ex) -- need nvim 0.8+

-- Indentation
vim.keymap.set("v", "<S-Tab>", "<gv", { silent = true, desc = "Unindent line" })
vim.keymap.set("v", "<Tab>", ">gv", { silent = true, desc = "Indent line" })

-- Lazy Shortcuts --
vim.keymap.set("n", "<C-p>", "<cmd>Lazy profile<cr>", { silent = true, desc = "Lazy Profile" })
vim.keymap.set("n", "<leader>p", "<cmd>Lazy profile<cr>", { silent = true, desc = "Lazy Profile" })

-- Files --
vim.keymap.set("n", "<leader>e", "<cmd>Neotree<cr>", { silent = true, desc = "Neotree" })
vim.keymap.set("n", "<leader>o", "<cmd>Neotree<cr>", { silent = true, desc = "Neotree" })
vim.keymap.set("n", "<leader>w", "<cmd>w<cr>", { silent = true, desc = "Save" })
vim.keymap.set("n", "<leader>q", "<cmd>confirm q<cr>", { silent = true, desc = "Quit" })
vim.keymap.set("n", "<leader>n", "<cmd>enew<cr>", { silent = true, desc = "New File"})
vim.keymap.set("n", "<C-n>", "<cmd>enew<cr>", { silent = true, desc = "New File"})
vim.keymap.set("n", "<C-w>", "<cmd>w!<cr>", { silent = true, desc = "Force write"})
vim.keymap.set("n", "<C-q>", "<cmd>qa!<cr>", { silent = true, desc = "Force quit all"})

-- Layout --
vim.keymap.set("n", "|", "<cmd>vsplit<cr>", { silent = true, desc = "Vertical Split" })
vim.keymap.set("n", "\\", "<cmd>split<cr>", { silent = true, desc = "Horizontal Split" }) 

-- Navigate tabs
vim.keymap.set("n", "]t", function() vim.cmd.tabnext() end, { silent = true, desc = "Next Tab" })
vim.keymap.set("n", "[t", function() vim.cmd.tabprevious() end, { silent = true, desc = "Previous Tab" })

-- Comment
if is_available 'Comment.api' then
  vim.keymap.set(
    "n",
    "<leader>/",
    function() require("Comment.api").toggle.linewise.count(vim.v.count > 0 and vim.v.count or 1) end,
    { desc = "Toggle comment line" }
  )
  vim.keymap.set(
    "v",
    "<leader>/",
    "<esc><cmd>lua require('Comment.api').toggle.linewise(vim.fn.visualmode())<cr>",
    { desc = "Toggle comment line" }
  )
end

-- Smart Splits
if is_available "smart-splits.nvim" then
  vim.keymap.set("n", "<C-h>", function() require("smart-splits").move_cursor_left() end, { desc = "Move to left split" })
  vim.keymap.set("n", "<C-j>", function() require("smart-splits").move_cursor_down() end, { desc = "Move to below split" })
  vim.keymap.set("n", "<C-k>", function() require("smart-splits").move_cursor_up() end, { desc = "Move to above split" })
  vim.keymap.set("n", "<C-l>", function() require("smart-splits").move_cursor_right() end, { desc = "Move to right split" })
  vim.keymap.set("n", "<C-Up>", function() require("smart-splits").resize_up() end, { desc = "Resize split up" })
  vim.keymap.set("n", "<C-Down>", function() require("smart-splits").resize_down() end, { desc = "Resize split down" })
  vim.keymap.set("n", "<C-Left>", function() require("smart-splits").resize_left() end, { desc = "Resize split left" })
  vim.keymap.set("n", "<C-Right>", function() require("smart-splits").resize_right() end, { desc = "Resize split right" })
-- else
--   maps.n["<C-h>"] = { "<C-w>h", desc = "Move to left split" }
--   maps.n["<C-j>"] = { "<C-w>j", desc = "Move to below split" }
--   maps.n["<C-k>"] = { "<C-w>k", desc = "Move to above split" }
--   maps.n["<C-l>"] = { "<C-w>l", desc = "Move to right split" }
--   maps.n["<C-Up>"] = { "<cmd>resize -2<CR>", desc = "Resize split up" }
--   maps.n["<C-Down>"] = { "<cmd>resize +2<CR>", desc = "Resize split down" }
--   maps.n["<C-Left>"] = { "<cmd>vertical resize -2<CR>", desc = "Resize split left" }
--   maps.n["<C-Right>"] = { "<cmd>vertical resize +2<CR>", desc = "Resize split right" }
end

-- Mason Package Manager --
vim.keymap.set("n", "<C-m>", "<cmd>Mason<cr>", { desc = "Mason Installer" })
vim.keymap.set("n", "<C-U>", "<cmd>MasonUpdateAll<cr>", { desc = "Mason Update" })
vim.keymap.set("n", "<leader>m", "<cmd>Mason<cr>", { desc = "Mason Installer" })
vim.keymap.set("n", "<leader>M", "<cmd>MasonUpdateAll<cr>", { desc = "Mason Update" })

-- Folds: <leader> z + ...

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

-- Telescope Keybindings when in Insert Mode --
vim.keymap.set('i', '<C-s>', '<cmd>vsplit<cr>', { desc = "Open vertical split" })
