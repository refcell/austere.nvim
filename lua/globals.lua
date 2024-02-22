-- Line numbers --
vim.opt.number = true
vim.opt.relativenumber = false
vim.opt.cursorline = true

-- Insert line
vim.opt.showmode = false

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

-- Allow Scoping with Sessions --
vim.opt.sessionoptions = { "buffers", "tabpages", "globals" }
