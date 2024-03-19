require("lualine").setup({
    options = {
        icons_enabled = false,
        theme = 'horizon',
    }
})

require("scrollbar").setup()

vim.filetype.add({
    extension = {
        vert = 'glsl',
        frag = 'glsl',
        tesc = 'glsl',
        tese = 'glsl',
        geom = 'glsl',
        comp = 'glsl',
        vs = 'glsl',
        fs = 'glsl',
    }
})

require("gitsigns").setup()
