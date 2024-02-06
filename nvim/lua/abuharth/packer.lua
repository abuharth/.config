-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
    -- Packer can manage itself
    use 'wbthomason/packer.nvim'

    -- Themes
    use { 'rebelot/kanagawa.nvim', as = 'kanagawa' }
    use { 'rose-pine/neovim', as = 'rose-pine' }
    use { 'ellisonleao/gruvbox.nvim', as = 'gruvbox' }

    -- Telescope
    use {
        'nvim-telescope/telescope.nvim', tag = '0.1.5',
        -- or                            , branch = '0.1.x',
        requires = { {'nvim-lua/plenary.nvim'} }
    }

    -- Treesitter
    use('nvim-treesitter/nvim-treesitter', {run = ':TSUpdate'})

    -- LSP
    use {
        'VonHeikemen/lsp-zero.nvim',
        branch = 'v3.x',
        requires = {
            -- LSP Support
            {'williamboman/mason.nvim'},
            {'williamboman/mason-lspconfig.nvim'},
            {'neovim/nvim-lspconfig'},

            -- Autocompletion
            {'hrsh7th/nvim-cmp'},
            {'hrsh7th/cmp-nvim-lsp'},
            {'L3MON4D3/LuaSnip'},
        }
    }

    -- Autoclose
    use 'm4xshen/autoclose.nvim'

    -- Lualine
    use {
        'nvim-lualine/lualine.nvim',
        requires = { 'nvim-tree/nvim-web-devicons', opt = true }
    }

    -- Scrollbar
    use 'folke/nvim-scrollbar'

end)
