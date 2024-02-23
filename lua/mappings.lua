-- Set space as the leader key --
vim.g.mapleader = " "

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
