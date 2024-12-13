local Plug = vim.fn['plug#']
vim.call('plug#begin')

    Plug('nvim-treesitter/nvim-treesitter', {['do'] = ':TSUpdate'})
    Plug('nvim-lua/plenary.nvim')
    Plug('nvim-telescope/telescope.nvim', {['tag'] = '0.1.8'})
    Plug('lewis6991/gitsigns.nvim')
    -- themes
    Plug('Mofiqul/dracula.nvim')
    Plug('rose-pine/neovim')
    Plug('ellisonleao/gruvbox.nvim')
    Plug('folke/tokyonight.nvim')
    Plug('rebelot/kanagawa.nvim')
    Plug('navarasu/onedark.nvim')
    -- lsp
    Plug('neovim/nvim-lspconfig')
    Plug('hrsh7th/nvim-cmp')
    Plug('hrsh7th/cmp-nvim-lsp')
    Plug('hrsh7th/cmp-nvim-lsp-signature-help')
    Plug('onsails/lspkind.nvim')
    -- tmux-navigator
    Plug('christoomey/vim-tmux-navigator')
    -- theme selector
    Plug('zaldih/themery.nvim')
    -- colorizer
    Plug('norcalli/nvim-colorizer.lua')
    -- maybe add lualine and webdevicons

vim.call('plug#end')

