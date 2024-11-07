vim.g.mapleader = ' '
-- n: normal, i: insert, v: visual
-- netrw
vim.keymap.set('n', '<leader>pv', '<cmd>Explore<cr>', {noremap = true, silent = false})
-- cursor movement
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

