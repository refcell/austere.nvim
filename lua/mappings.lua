
-- Set space as the leader key --
vim.g.mapleader = " "

vim.keymap.set("n", "-", vim.cmd.Ex) -- need nvim 0.8+

-- Lazy Shortcuts --
vim.keymap.set("n", "<C-p>", "<cmd>Lazy profile<cr>", { silent = true, desc = "Lazy Profile" })

-- Files --
vim.keymap.set("n", "<leader>e", "<cmd>Neotree<cr>", { silent = true, desc = "Neotree" })
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
