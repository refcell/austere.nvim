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

-- Exits to file explorer --
vim.keymap.set("n", "-", vim.cmd.Ex)

-- Indentation --
vim.keymap.set("v", "<S-Tab>", "<gv", { silent = true, desc = "Unindent line" })
vim.keymap.set("v", "<Tab>", ">gv", { silent = true, desc = "Indent line" })

-- Lazy Shortcuts --
vim.keymap.set("n", "<C-p>", "<cmd>Lazy profile<cr>", { silent = true, desc = "Lazy Profile" })
vim.keymap.set("n", "<leader>p", "<cmd>Lazy profile<cr>", { silent = true, desc = "Lazy Profile" })

-- Switch Colorschemes --
vim.keymap.set("n", "<leader>t", ':exec &bg=="light"? "set bg=dark" : "set bg=light"<CR>', {noremap = true, silent = true, desc = "Light/dark theme toggle" })

-- Toggleterm --
vim.keymap.set("n", "<leader>tt", "<cmd>ToggleTerm<cr>", { silent = true, desc = "Toggle Terminal" })
vim.keymap.set("n", "\\", "<cmd>ToggleTerm<cr>", { silent = true, desc = "Toggle Terminal" })

-- Neotree --
vim.keymap.set("n", "<leader>e", "<cmd>Neotree toggle<cr>", { silent = true, desc = "Toggle Neotree" })
local focusFn = function()
  if vim.bo.filetype == "neo-tree" then
    vim.cmd.wincmd "p"
  else
    vim.cmd.Neotree "focus"
  end
end
vim.keymap.set("n", "<leader>o", focusFn, { silent = true, desc = "Focus Neotree" })

vim.keymap.set("n", "<C-l>", function() require("toggleterm.terminal").Terminal:new({ cmd = 'lazygit', hidden = true }):toggle() end, { silent = true, desc = "Lazygit terminal"})

-- Files --
vim.keymap.set("n", "<leader>w", "<cmd>w<cr>", { silent = true, desc = "Save" })
vim.keymap.set("n", "<leader>q", "<cmd>confirm q<cr>", { silent = true, desc = "Quit" })
vim.keymap.set("n", "<leader>n", "<cmd>enew<cr>", { silent = true, desc = "New File"})
vim.keymap.set("n", "<C-n>", "<cmd>enew<cr>", { silent = true, desc = "New File"})
vim.keymap.set("n", "<C-W>", "<cmd>w!<cr>", { silent = true, desc = "Force write"})
vim.keymap.set("n", "<C-q>", "<cmd>qa!<cr>", { silent = true, desc = "Force quit all"})

-- Layout --
vim.keymap.set("n", "C-|", "<cmd>vsplit<cr>", { silent = true, desc = "Vertical Split" })
vim.keymap.set("n", "C-\\", "<cmd>split<cr>", { silent = true, desc = "Horizontal Split" }) 

-- Navigate tabs
vim.keymap.set("n", "]t", function() vim.cmd.tabnext() end, { silent = true, desc = "Next Tab" })
vim.keymap.set("n", "[t", function() vim.cmd.tabprevious() end, { silent = true, desc = "Previous Tab" })

-- Comments --
local comment = function() require("Comment.api").toggle.linewise.count(vim.v.count > 0 and vim.v.count or 1) end
vim.keymap.set("n", "<leader>/", comment, { desc = "Toggle comment line" })
local commentVisual = "<esc><cmd>lua require('Comment.api').toggle.linewise(vim.fn.visualmode())<cr>"
vim.keymap.set("v", "<leader>/", commentVisual, { desc = "Toggle comment line" })

-- Grep in file --
local fuzzyFind = function() require("telescope.builtin").current_buffer_fuzzy_find() end
vim.keymap.set("n", "<leader>fv", fuzzyFind, { desc = "Search words in file" })

-- Smart Splits --
local moveLeft = function() require("smart-splits").move_cursor_left() end
local moveRight = function() require("smart-splits").move_cursor_right() end
local moveUp = function() require("smart-splits").move_cursor_up() end
local moveDown = function() require("smart-splits").move_cursor_down() end
vim.keymap.set("n", "<C-h>", moveLeft, { desc = "Move to left split" })
vim.keymap.set("n", "<C-j>", moveDown, { desc = "Move to below split" })
vim.keymap.set("n", "<C-k>", moveUp, { desc = "Move to above split" })
vim.keymap.set("n", "<C-l>", moveRight, { desc = "Move to right split" })
vim.keymap.set("n", "<leader><Left>", moveLeft, { desc = "Move to left split" })
vim.keymap.set("n", "<leader><Right>", moveRight, { desc = "Move to right split" })
vim.keymap.set("n", "<leader><Up>", moveUp, { desc = "Move to above split" })
vim.keymap.set("n", "<leader><Down>", moveDown, { desc = "Move to below split" })

-- Mason Package Manager --
vim.keymap.set("n", "<C-m>", "<cmd>Mason<cr>", { desc = "Mason Installer" })
vim.keymap.set("n", "<C-U>", "<cmd>MasonUpdateAll<cr>", { desc = "Mason Update" })
vim.keymap.set("n", "<leader>m", "<cmd>Mason<cr>", { desc = "Mason Installer" })
vim.keymap.set("n", "<leader>M", "<cmd>MasonUpdateAll<cr>", { desc = "Mason Update" })

-- Folds: <leader> z + ...

-- Set Telescope Keybindings --
local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', "<cmd>lua require'telescope.builtin'.find_files({ find_command = {'rg', '--files', '--hidden', '-g', '!.git' }})<cr>", {noremap = true, desc = "Find files" })
vim.keymap.set('n', '<leader>fb', "<cmd>lua require'telescope.builtin'.buffers({ show_all_buffers = true })<cr>", { noremap = true, desc = "Find buffers" })
vim.keymap.set('n', '<leader>fs', builtin.grep_string, { desc = "Find word under cursor" })
vim.keymap.set('n', '<leader>fc', builtin.commands, { desc = "Find commands" })
vim.keymap.set('n', '<leader>fg', builtin.live_grep, { desc = "Live grep" })
vim.keymap.set('n', '<leader>fh', builtin.help_tags, { desc = "Find help tags" })
vim.keymap.set('n', '<leader>fm', builtin.man_pages, { desc = "Find man pages" })
vim.keymap.set('n', '<leader>fr', builtin.registers, { desc = "Find registers" })
vim.keymap.set('n', '<leader>fw', builtin.live_grep, { desc = "Find words" })
local findWords = function()
  builtin.live_grep {
    additional_args = function(args) return vim.list_extend(args, { "--hidden", "--no-ignore" }) end,
  }
end
vim.keymap.set('n', '<leader>fW', findWords, { desc = "Find words in all files" })

-- Telescope Keybindings when in Insert Mode --
vim.keymap.set('i', '<C-s>', '<cmd>vsplit<cr>', { desc = "Open vertical split" })
