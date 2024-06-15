-- miscellaneous plugins setup
require("lualine").setup({
    options = {
        icons_enabled = true,
    }
})

require("scrollbar").setup()

require("gitsigns").setup()

require("netrw").setup{
    -- Put your configuration here, or leave the object empty to take the default
    -- configuration.
    use_devicons = true, -- Uses nvim-web-devicons if true, otherwise use the file icon specified above
    mappings = {}, -- Custom key mappings
}

require("nvim-web-devicons").setup{}
