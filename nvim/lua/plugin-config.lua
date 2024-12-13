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

-- themery
require("themery").setup({
    themes = {
        -- dark themes -------------------------------------------------
        {
          name = "Gruvbox",       colorscheme = "gruvbox",
          before = [[ vim.opt.background = "dark" ]]
        },
        { name = "Dracula",             colorscheme = "dracula" },
        { name = "Dracula Soft",        colorscheme = "dracula-soft" },
        { name = "Rose Pine Main",      colorscheme = "rose-pine-main" },
        { name = "Rose Pine Moon",      colorscheme = "rose-pine-moon" },
        { name = "Tokyonight Moon",     colorscheme = "tokyonight-moon" },
        { name = "Tokyonight Storm",    colorscheme = "tokyonight-storm" },
        { name = "Tokyonight Night",    colorscheme = "tokyonight-night" },
        { name = "Kanagawa Wave",       colorscheme = "kanagawa-wave" },
        { name = "Kanagawa Dragon",     colorscheme = "kanagawa-dragon" },
        {
          name = "Onedark Darker",      colorscheme = "onedark",
          before = [[ require('onedark').setup { style = 'darker' } ]]
        },
        {
          name = "Onedark Warmer",      colorscheme = "onedark",
          before = [[
            vim.opt.background = "dark"
            require('onedark').setup { style = 'warmer' }
          ]]
        },
        -- light themes ------------------------------------------------
        {
          name = "Gruvbox Light",       colorscheme = "gruvbox",
          before = [[ vim.opt.background = "light" ]]
        },
        { name = "Tokyonight Day",      colorscheme = "tokyonight-day" },
        { name = "Rose Pine Dawn",      colorscheme = "rose-pine-dawn" },
        { name = "Kanagawa Lotus",      colorscheme = "kanagawa-lotus" },
    },
    livePreview = true,
})

-- colorizer
require("colorizer").setup {
    '*',
    css = { css = true },
}

