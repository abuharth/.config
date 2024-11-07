require("vim-plug")
require("lsp-config")

-- telescope
local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = 'Telescope find files' })
vim.keymap.set('n', '<leader>fg', builtin.live_grep, { desc = 'Telescope live grep' })

-- treesitter
require'nvim-treesitter.configs'.setup {
    ensure_installed = { "c", "python", "lua", "vim", "vimdoc", "javascript" },

    highlight = {
        enable = true,

        additional_vim_regex_highlighting = { 'markdown' },
    }
}

-- gitsigns
require('gitsigns').setup()

