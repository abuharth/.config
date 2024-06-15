vim.g.mapleader = ' '
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

vim.keymap.set("n", "<leader>d", "\"_d")
vim.keymap.set("v", "<leader>d", "\"_d")

-- select all
vim.keymap.set("n", "<C-a>", "gg<S-v>G")

-- open terminal in vertical split
vim.keymap.set("n", "<leader>t", ":vsplit<CR><C-w>w:term<CR>a")
-- normal mode from terminal
vim.keymap.set("t", "<C-q>", "<C-\\><C-n>")
