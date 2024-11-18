vim.g.mapleader = ' '
-- n: normal, i: insert, v: visual
-- netrw
vim.keymap.set('n', '<leader>pv', '<cmd>Explore<cr>')
-- cursor movement
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")
-- shorcuts
vim.keymap.set("n", "<C-a>", "gg<S-v>G")
vim.keymap.set("n", "<C-t>", "<cmd>lua ThemesWindow()<cr>")
-- html boilerplate
vim.keymap.set("n", "!<Tab>", "i<!DOCTYPE html>\n<html lang=\"en\">\n<head>\n<meta charset=\"UTF-8\">\n<meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\">\n<title>Document</title>\n</head>\n<body>\n</body>\n</html><Esc>")
