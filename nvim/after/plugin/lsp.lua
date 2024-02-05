local lsp_zero = require("lsp-zero")
lsp_zero.preset("recommended")

lsp_zero.on_attach(function(client, bufnr)
    lsp_zero.default_keymaps({buffer = bufnr})
end)

lsp_zero.set_sign_icons({
  error = '',
  warn = '',
  hint = '',
  info = ''
})

lsp_zero.set_server_config({
    on_init = function(client)
        client.server_capabilities.semanticTokensProvider = nil
    end,
})

local cmp = require('cmp')
local cmp_select = {behavior = cmp.SelectBehavior.Select}
local cmp_action = require('lsp-zero').cmp_action()
cmp.setup({
    mapping = cmp.mapping.preset.insert({
        ['<Tab>'] = cmp.mapping.select_next_item(cmp_select),
        ['<CR>'] = cmp.mapping.confirm({select = true}),
    })
})

require("mason").setup()
require("mason-lspconfig").setup {
    ensure_installed = {
        "lua_ls",
        "pylsp",
        "clangd",
    },
    handlers = {
        lsp_zero.default_setup,
    },
}

lsp_zero.setup()
